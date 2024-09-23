@implementation GKDiscoveryPeerConnection

- (GKDiscoveryPeerConnection)initWithLocalServiceName:(id)a3
{
  GKDiscoveryPeerConnection *v4;
  NSMutableData *v5;
  NSMutableData *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  GKSimpleTimer *v10;
  GKSimpleTimer *v11;
  GKSimpleTimer *v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKDiscoveryPeerConnection;
  v4 = -[GKDiscoveryPeerConnection init](&v16, sel_init);
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v4->_dataReceived = v5;
    if (!v5)
      goto LABEL_11;
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v4->_dataToSendHoldingQueue = v6;
    if (!v6)
      goto LABEL_11;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->_receivedDataHoldingQueue = v7;
    if (v7
      && (v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]), (v4->_messageReceiptHandlerList = v8) != 0)
      && (v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]),
          (v4->_messageReceiptHandlerHoldingQueue = v9) != 0))
    {
      -[GKDiscoveryPeerConnection setLocalServiceName:](v4, "setLocalServiceName:", a3);
      v10 = objc_alloc_init(GKSimpleTimer);
      v4->_heartbeatTimer = v10;
      -[GKSimpleTimer setDelegate:](v10, "setDelegate:", v4);
      v11 = objc_alloc_init(GKSimpleTimer);
      v4->_heartbeatTimeoutTimer = v11;
      -[GKSimpleTimer setDelegate:](v11, "setDelegate:", v4);
      v12 = objc_alloc_init(GKSimpleTimer);
      v4->_timeoutTimer = v12;
      -[GKSimpleTimer setDelegate:](v12, "setDelegate:", v4);
      objc_msgSend((id)objc_msgSend(off_24D465868, "getClientOption:", *(_QWORD *)off_24D4656B8), "doubleValue");
      if (v13 == 0.0)
        v13 = 60.0;
      v4->_connectionTimeoutInSeconds = v13;
      objc_msgSend((id)objc_msgSend(off_24D465868, "getClientOption:", *(_QWORD *)off_24D4656B0), "doubleValue");
      v4->_heartbeatIntervalInSeconds = v14;
      if (v14 == 0.0)
        v4->_heartbeatIntervalInSeconds = 20.0;
    }
    else
    {
LABEL_11:

      return 0;
    }
  }
  return v4;
}

- (void)setSyncQueue:(id)a3
{
  NSObject *syncQueue;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);
  self->_syncQueue = (OS_dispatch_queue *)a3;
  -[GKAsyncSocket setTargetQueue:](self->_connectionSocket, "setTargetQueue:", a3);
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

- (void)syncConnected:(id)a3
{
  id connectedHandler;
  NSObject *targetQueue;
  _QWORD v7[6];

  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryPeerConnection syncConnected:].cold.1();
    }
    connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      self->_connectedHandler = 0;
      if (self->_targetQueue)
        targetQueue = self->_targetQueue;
      else
        targetQueue = MEMORY[0x24BDAC9B8];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __43__GKDiscoveryPeerConnection_syncConnected___block_invoke;
      v7[3] = &unk_24D466B38;
      v7[4] = a3;
      v7[5] = connectedHandler;
      dispatch_async(targetQueue, v7);

    }
  }
  else
  {
    -[GKDiscoveryPeerConnection syncSendHello](self, "syncSendHello");
  }
}

uint64_t __43__GKDiscoveryPeerConnection_syncConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

- (BOOL)syncSetupNewSocket
{
  uint64_t v3;
  NSObject *v4;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v7;
  GKAsyncSocket *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  GKAsyncSocket *v13;
  NSString *v14;
  const char *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  GKDiscoveryPeerConnection *v26;
  __int16 v27;
  GKAsyncSocket *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_connectionSocket)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName)
          v7 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
        else
          v7 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v20 = v3;
        v21 = 2080;
        v22 = "-[GKDiscoveryPeerConnection syncSetupNewSocket]";
        v23 = 1024;
        v24 = 266;
        v25 = 2048;
        v26 = self;
        v27 = 2048;
        v28 = connectionSocket;
        v29 = 2080;
        v30 = v7;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] _connectionSocket already up", buf, 0x3Au);
      }
    }
    goto LABEL_14;
  }
  v8 = objc_alloc_init(GKAsyncSocket);
  self->_connectionSocket = v8;
  if (v8)
  {
    -[GKAsyncSocket setTargetQueue:](v8, "setTargetQueue:", self->_syncQueue);
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke;
    v18[3] = &unk_24D466B60;
    v18[4] = self;
    -[GKAsyncSocket setReceiveDataHandler:](self->_connectionSocket, "setReceiveDataHandler:", v18);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke_2;
    v17[3] = &unk_24D466B88;
    v17[4] = self;
    -[GKAsyncSocket setConnectedHandler:](self->_connectionSocket, "setConnectedHandler:", v17);
LABEL_14:
    LOBYTE(v12) = 1;
    return v12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
    if (!v12)
      return v12;
    v13 = self->_connectionSocket;
    v14 = self->_remoteServiceName;
    if (v14)
      v15 = -[NSString UTF8String](-[NSString description](v14, "description"), "UTF8String");
    else
      v15 = "<nil>";
    *(_DWORD *)buf = 136316418;
    v20 = v10;
    v21 = 2080;
    v22 = "-[GKDiscoveryPeerConnection syncSetupNewSocket]";
    v23 = 1024;
    v24 = 272;
    v25 = 2048;
    v26 = self;
    v27 = 2048;
    v28 = v13;
    v29 = 2080;
    v30 = v15;
    _os_log_error_impl(&dword_215C5C000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] GKAsyncSocket alloc failed", buf, 0x3Au);
  }
  LOBYTE(v12) = 0;
  return v12;
}

uint64_t __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncReceivedData:error:", a2, a3);
}

uint64_t __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncConnected:", a2);
}

- (void)connectToSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4
{
  void *v7;
  NSObject *syncQueue;
  _QWORD v9[7];
  unsigned __int16 v10;

  v7 = copysockaddr(&a3->sa_len);
  syncQueue = self->_syncQueue;
  if (!syncQueue)
    syncQueue = MEMORY[0x24BDAC9B8];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke;
  v9[3] = &unk_24D466BB0;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a2;
  v10 = a4;
  dispatch_async(syncQueue, v9);
}

void __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *Name;
  void *v14;
  const char *v15;
  char v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(const char **)(v4 + 32);
      v6 = *(void **)(v4 + 8);
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1);
      *(_DWORD *)buf = 136316674;
      v22 = v2;
      v23 = 2080;
      v24 = "-[GKDiscoveryPeerConnection connectToSockAddr:port:]_block_invoke";
      v25 = 1024;
      v26 = 314;
      v27 = 2048;
      v28 = v4;
      v29 = 2048;
      v30 = v5;
      v31 = 2080;
      v32 = v7;
      v33 = 1024;
      v34 = v8;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] ************ requesting connection sequence (sa_family = %d)", buf, 0x40u);
    }
  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        Name = sel_getName(*(SEL *)(a1 + 48));
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        if (v14)
          v15 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
        else
          v15 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v22 = v10;
        v23 = 2080;
        v24 = "-[GKDiscoveryPeerConnection connectToSockAddr:port:]_block_invoke";
        v25 = 1024;
        v26 = 317;
        v27 = 2048;
        v28 = v12;
        v29 = 2080;
        v30 = Name;
        v31 = 2080;
        v32 = v15;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p %s (%s): already connected!", buf, 0x3Au);
      }
    }
  }
  else
  {
    v16 = objc_msgSend(v9, "syncSetupNewSocket");
    v17 = *(_QWORD *)(a1 + 32);
    if ((v16 & 1) != 0)
    {
      *(_BYTE *)(v17 + 24) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tcpConnectSockAddr:port:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 56));
      free(*(void **)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "fireIn:fromNow:", *(double *)(*(_QWORD *)(a1 + 32) + 144), micro());
      return;
    }
    v18 = *(void **)(v17 + 96);
    if (v18)
    {
      *(_QWORD *)(v17 + 96) = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
      else
        v19 = MEMORY[0x24BDAC9B8];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke_9;
      block[3] = &unk_24D466AC0;
      block[4] = v18;
      dispatch_async(v19, block);

    }
  }
  free(*(void **)(a1 + 40));
}

uint64_t __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke_9(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Setup new socket failed (browser side)");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attachSocketDescriptor:(int)a3
{
  NSObject *syncQueue;
  _QWORD block[6];
  int v5;

  syncQueue = MEMORY[0x24BDAC9B8];
  if (self->_syncQueue)
    syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke;
  block[3] = &unk_24D466BD8;
  block[4] = self;
  block[5] = a2;
  v5 = a3;
  dispatch_async(syncQueue, block);
}

void __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *Name;
  void *v6;
  const char *v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  char v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
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
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      Name = sel_getName(*(SEL *)(a1 + 40));
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v21 = v2;
      v22 = 2080;
      v23 = "-[GKDiscoveryPeerConnection attachSocketDescriptor:]_block_invoke";
      v24 = 1024;
      v25 = 347;
      v26 = 2048;
      v27 = v4;
      v28 = 2080;
      v29 = Name;
      v30 = 2080;
      v31 = v7;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p %s (%s): ************ responding connection sequence", buf, 0x3Au);
    }
  }
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(const char **)(v11 + 32);
        v13 = *(void **)(v11 + 8);
        if (v13)
          v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        else
          v14 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v21 = v9;
        v22 = 2080;
        v23 = "-[GKDiscoveryPeerConnection attachSocketDescriptor:]_block_invoke";
        v24 = 1024;
        v25 = 349;
        v26 = 2048;
        v27 = v11;
        v28 = 2048;
        v29 = v12;
        v30 = 2080;
        v31 = v14;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] already connected!", buf, 0x3Au);
      }
    }
  }
  else
  {
    v15 = objc_msgSend(v8, "syncSetupNewSocket");
    v16 = *(_QWORD *)(a1 + 32);
    if ((v15 & 1) != 0)
    {
      *(_BYTE *)(v16 + 24) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "tcpAttachSocketDescriptor:", *(unsigned int *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "fireIn:fromNow:", *(double *)(*(_QWORD *)(a1 + 32) + 144), micro());
    }
    else
    {
      v17 = *(void **)(v16 + 96);
      if (v17)
      {
        *(_QWORD *)(v16 + 96) = 0;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
          v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
        else
          v18 = MEMORY[0x24BDAC9B8];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke_15;
        block[3] = &unk_24D466AC0;
        block[4] = v17;
        dispatch_async(v18, block);

      }
    }
  }
}

uint64_t __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke_15(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Setup new socket failed (advertiser-side)");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldDecideAboutConnection
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned __int8 v10[16];
  unsigned __int8 md[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[GKDiscoveryPeerConnection localServiceName](self, "localServiceName")
    && -[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"))
  {
    if (-[NSString isEqualToString:](-[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"), "isEqualToString:", -[GKDiscoveryPeerConnection localServiceName](self, "localServiceName")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
LABEL_10:
        LOBYTE(v3) = 0;
        return v3;
      }
      VRTraceErrorLogLevelToCSTR();
      v3 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (v3)
      {
        -[GKDiscoveryPeerConnection shouldDecideAboutConnection].cold.2();
        goto LABEL_10;
      }
    }
    else
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), -[GKDiscoveryPeerConnection localServiceName](self, "localServiceName"));
      v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), -[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"));
      memset(md, 170, sizeof(md));
      memset(v10, 170, sizeof(v10));
      do
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("+%@"), -[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"));
        objc_msgSend(v5, "appendFormat:", CFSTR("+%@"), -[GKDiscoveryPeerConnection localServiceName](self, "localServiceName"));
        CC_MD5((const void *)objc_msgSend(v4, "UTF8String"), objc_msgSend(v4, "length"), md);
        CC_MD5((const void *)objc_msgSend(v5, "UTF8String"), objc_msgSend(v5, "length"), v10);
        v6 = bswap64(*(unint64_t *)md);
        v7 = bswap64(*(unint64_t *)v10);
        if (v6 != v7)
          break;
        v6 = bswap64(*(unint64_t *)&md[8]);
        v7 = bswap64(*(unint64_t *)&v10[8]);
      }
      while (v6 == v7);
      if (v6 < v7)
        v8 = -1;
      else
        v8 = 1;
      return v8 >> 31;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_10;
    VRTraceErrorLogLevelToCSTR();
    v3 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[GKDiscoveryPeerConnection shouldDecideAboutConnection].cold.1();
      goto LABEL_10;
    }
  }
  return v3;
}

- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v15;
  GKAsyncSocket *v16;
  NSString *v17;
  const char *v18;
  id v19;
  int v20;
  unsigned int currentSequenceNumber;
  uLong v22;
  uint64_t v23;
  id v24;
  void *v25;
  GKAsyncSocket *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  GKAsyncSocket *v32;
  NSString *v33;
  const char *v34;
  GKAsyncSocket *v35;
  NSString *v36;
  const char *v37;
  int v38;
  GKAsyncSocket *v39;
  NSString *v40;
  const char *v41;
  int v42;
  _QWORD v43[5];
  _QWORD v44[5];
  unsigned int v45;
  Bytef v46[2];
  __int16 v47;
  char v48;
  char v49;
  char v50;
  char v51;
  unsigned int v52;
  char v53;
  char v54;
  char v55;
  char v56;
  uint64_t v57;
  const __CFString *v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  GKDiscoveryPeerConnection *v66;
  __int16 v67;
  GKAsyncSocket *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x2199EF8CC](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    v12 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName)
          v15 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
        else
          v15 = "<nil>";
        *(_DWORD *)buf = 136316930;
        v60 = v10;
        v61 = 2080;
        v62 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        v63 = 1024;
        v64 = 411;
        v65 = 2048;
        v66 = self;
        v67 = 2048;
        v68 = connectionSocket;
        v69 = 2080;
        v70 = v15;
        v71 = 1024;
        v72 = a3;
        v73 = 1024;
        v74 = objc_msgSend(a4, "length");
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] send type [%u] data [%u]", buf, 0x46u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = self->_connectionSocket;
      v17 = self->_remoteServiceName;
      if (v17)
        v18 = -[NSString UTF8String](-[NSString description](v17, "description"), "UTF8String");
      else
        v18 = "<nil>";
      *(_DWORD *)buf = 136316930;
      v60 = v10;
      v61 = 2080;
      v62 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
      v63 = 1024;
      v64 = 411;
      v65 = 2048;
      v66 = self;
      v67 = 2048;
      v68 = v16;
      v69 = 2080;
      v70 = v18;
      v71 = 1024;
      v72 = a3;
      v73 = 1024;
      v74 = objc_msgSend(a4, "length");
      _os_log_debug_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] send type [%u] data [%u]", buf, 0x46u);
    }
  }
  if (a3 > 2199)
  {
    if (a3 != 2200 && a3 != 2300)
      goto LABEL_22;
  }
  else if (a3 != 2000 && a3 != 2100)
  {
LABEL_22:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v39 = self->_connectionSocket;
        v40 = self->_remoteServiceName;
        if (v40)
          v41 = -[NSString UTF8String](-[NSString description](v40, "description"), "UTF8String");
        else
          v41 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v60 = v27;
        v61 = 2080;
        v62 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        v63 = 1024;
        v64 = 426;
        v65 = 2048;
        v66 = self;
        v67 = 2048;
        v68 = v39;
        v69 = 2080;
        v70 = v41;
        v71 = 1024;
        v72 = a3;
        _os_log_error_impl(&dword_215C5C000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] can't send bad message type [%u]", buf, 0x40u);
      }
    }
    v57 = *MEMORY[0x24BDD0FC8];
    v58 = CFSTR("Unable to send unknown message type");
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1)));
    goto LABEL_36;
  }
  v19 = (id)objc_msgSend(a5, "copy");
  v20 = objc_msgSend(a4, "length");
  currentSequenceNumber = self->_currentSequenceNumber;
  self->_currentSequenceNumber = (currentSequenceNumber + 1) & 0x7FFFFFFF;
  v46[0] = BYTE1(a3);
  v46[1] = a3;
  v47 = 0;
  v48 = HIBYTE(v20);
  v49 = BYTE2(v20);
  v50 = BYTE1(v20);
  v51 = v20;
  v52 = 0;
  v53 = HIBYTE(currentSequenceNumber);
  v54 = BYTE2(currentSequenceNumber);
  v55 = BYTE1(currentSequenceNumber);
  v56 = currentSequenceNumber;
  v22 = crc32(0, v46, 0x10u);
  if (objc_msgSend(a4, "length"))
    LODWORD(v22) = crc32(v22, (const Bytef *)objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
  v52 = bswap32(v22);
  v23 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke;
  v44[3] = &unk_24D466C00;
  v45 = currentSequenceNumber;
  v44[4] = v19;
  v24 = (id)objc_msgSend(v44, "copy");
  if (a3 == 2100 && !self->_connected)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x24BDFDC28];
      v31 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = self->_connectionSocket;
          v33 = self->_remoteServiceName;
          if (v33)
            v34 = -[NSString UTF8String](-[NSString description](v33, "description"), "UTF8String");
          else
            v34 = "<nil>";
          v38 = objc_msgSend(a4, "length");
          *(_DWORD *)buf = 136316674;
          v60 = v29;
          v61 = 2080;
          v62 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
          v63 = 1024;
          v64 = 493;
          v65 = 2048;
          v66 = self;
          v67 = 2048;
          v68 = v32;
          v69 = 2080;
          v70 = v34;
          v71 = 1024;
          v72 = v38;
          _os_log_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] still connecting - queueing data (%u) *", buf, 0x40u);
        }
      }
      else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v35 = self->_connectionSocket;
        v36 = self->_remoteServiceName;
        if (v36)
          v37 = -[NSString UTF8String](-[NSString description](v36, "description"), "UTF8String");
        else
          v37 = "<nil>";
        v42 = objc_msgSend(a4, "length");
        *(_DWORD *)buf = 136316674;
        v60 = v29;
        v61 = 2080;
        v62 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        v63 = 1024;
        v64 = 493;
        v65 = 2048;
        v66 = self;
        v67 = 2048;
        v68 = v35;
        v69 = 2080;
        v70 = v37;
        v71 = 1024;
        v72 = v42;
        _os_log_debug_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] still connecting - queueing data (%u) *", buf, 0x40u);
      }
    }
    -[NSMutableArray addObject:](self->_messageReceiptHandlerHoldingQueue, "addObject:", v24);
    -[NSMutableData appendBytes:length:](self->_dataToSendHoldingQueue, "appendBytes:length:", v46, 16);
    -[NSMutableData appendData:](self->_dataToSendHoldingQueue, "appendData:", a4);
  }
  else
  {
    -[NSMutableArray addObject:](self->_messageReceiptHandlerList, "addObject:", v24);
    v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v46, 16);
    objc_msgSend(v25, "appendData:", a4);
    v26 = self->_connectionSocket;
    v43[0] = v23;
    v43[1] = 3221225472;
    v43[2] = __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke_28;
    v43[3] = &unk_24D466B88;
    v43[4] = self;
    -[GKAsyncSocket sendData:withCompletionHandler:](v26, "sendData:withCompletionHandler:", v25, v43);
  }
LABEL_36:
  objc_autoreleasePoolPop(v9);
}

BOOL __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (v3 == a2)
    {
      (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      v6 = *MEMORY[0x24BDD0FC8];
      v7[0] = CFSTR("Receipt does not match");
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
    }
  }
  return v3 == a2;
}

void __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(v6 + 32);
        v8 = *(void **)(v6 + 8);
        if (v8)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        else
          v9 = "<nil>";
        v10 = 136316674;
        v11 = v4;
        v12 = 2080;
        v13 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]_block_invoke";
        v14 = 1024;
        v15 = 511;
        v16 = 2048;
        v17 = v6;
        v18 = 2048;
        v19 = v7;
        v20 = 2080;
        v21 = v9;
        v22 = 2080;
        v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        _os_log_error_impl(&dword_215C5C000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] sendData completed with error [%s]", (uint8_t *)&v10, 0x44u);
      }
    }
  }
}

- (void)syncSendHello
{
  const char *v3;
  const char *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  GKDiscoveryPeerConnection *v20;
  __int16 v21;
  GKAsyncSocket *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSString UTF8String](self->_localServiceName, "UTF8String");
  if (v3)
  {
    v4 = v3;
    v5 = strlen(v3);
    v6 = v5 + 1;
    if (v5 < 0xFFFF)
    {
      v13 = 100663296;
      LOBYTE(v14) = (unsigned __int16)(v5 + 1) >> 8;
      BYTE1(v14) = v5 + 1;
      v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v13, 6);
      objc_msgSend(v7, "appendBytes:length:", v4, v6);
      -[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:](self, "syncSendMessage:data:withCompletionHandler:", 2000, v7, 0);
      return;
    }
  }
  else
  {
    LODWORD(v6) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      connectionSocket = self->_connectionSocket;
      remoteServiceName = self->_remoteServiceName;
      if (remoteServiceName)
        v12 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
      else
        v12 = "<nil>";
      v13 = 136316674;
      v14 = v8;
      v15 = 2080;
      v16 = "-[GKDiscoveryPeerConnection syncSendHello]";
      v17 = 1024;
      v18 = 525;
      v19 = 2048;
      v20 = self;
      v21 = 2048;
      v22 = connectionSocket;
      v23 = 2080;
      v24 = v12;
      v25 = 1024;
      v26 = v6;
      _os_log_error_impl(&dword_215C5C000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] bad serviceName [%d] ??", (uint8_t *)&v13, 0x40u);
    }
  }
  -[GKDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
}

- (void)syncSendAccept
{
  -[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:](self, "syncSendMessage:data:withCompletionHandler:", 2200, 0, 0);
}

- (void)syncAcceptedConnection
{
  GKAsyncSocket *connectionSocket;
  uint64_t v4;
  NSMutableData *dataToSendHoldingQueue;
  id receiveDataHandler;
  NSMutableArray *receivedDataHoldingQueue;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  uint64_t v13;
  NSObject *targetQueue;
  uint64_t v15;
  NSObject *v16;
  GKAsyncSocket *v17;
  NSString *remoteServiceName;
  const char *v19;
  double v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  GKDiscoveryPeerConnection *v34;
  __int16 v35;
  GKAsyncSocket *v36;
  __int16 v37;
  const char *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  connectionSocket = self->_connectionSocket;
  v4 = MEMORY[0x24BDAC760];
  dataToSendHoldingQueue = self->_dataToSendHoldingQueue;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke;
  v26[3] = &unk_24D466B88;
  v26[4] = self;
  -[GKAsyncSocket sendData:withCompletionHandler:](connectionSocket, "sendData:withCompletionHandler:", dataToSendHoldingQueue, v26);
  -[NSMutableArray addObjectsFromArray:](self->_messageReceiptHandlerList, "addObjectsFromArray:", self->_messageReceiptHandlerHoldingQueue);
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerHoldingQueue, "removeAllObjects");
  if (-[NSMutableArray count](self->_receivedDataHoldingQueue, "count"))
  {
    receiveDataHandler = self->_receiveDataHandler;
    if (receiveDataHandler)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      receivedDataHoldingQueue = self->_receivedDataHoldingQueue;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](receivedDataHoldingQueue, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        v11 = MEMORY[0x24BDAC9B8];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(receivedDataHoldingQueue);
            v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (self->_targetQueue)
              targetQueue = self->_targetQueue;
            else
              targetQueue = v11;
            v21[0] = v4;
            v21[1] = 3221225472;
            v21[2] = __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_29;
            v21[3] = &unk_24D466C28;
            v21[4] = v13;
            v21[5] = receiveDataHandler;
            dispatch_async(targetQueue, v21);
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](receivedDataHoldingQueue, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
        }
        while (v9);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName)
          v19 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v28 = v15;
        v29 = 2080;
        v30 = "-[GKDiscoveryPeerConnection syncAcceptedConnection]";
        v31 = 1024;
        v32 = 569;
        v33 = 2048;
        v34 = self;
        v35 = 2048;
        v36 = v17;
        v37 = 2080;
        v38 = v19;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiveDataHandler is nil", buf, 0x3Au);
      }
    }
  }
  self->_connected = 1;
  v20 = micro();
  -[GKSimpleTimer fireIn:fromNow:](self->_heartbeatTimer, "fireIn:fromNow:", self->_heartbeatIntervalInSeconds, v20);
  -[GKSimpleTimer fireIn:fromNow:](self->_heartbeatTimeoutTimer, "fireIn:fromNow:", self->_heartbeatIntervalInSeconds + self->_heartbeatIntervalInSeconds, v20);
}

void __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_cold_1(v3, a1);
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4
{
  uint64_t v7;
  GKAsyncSocket *connectionSocket;
  _QWORD v9[5];
  int v10;
  unsigned int v11;
  Bytef buf[2];
  __int16 v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  buf[0] = BYTE1(a3);
  buf[1] = a3;
  v13 = 256;
  v14 = 0;
  v15 = HIBYTE(a4);
  v16 = BYTE2(a4);
  v17 = BYTE1(a4);
  v18 = a4;
  HIDWORD(v14) = bswap32(crc32(0, buf, 0x10u));
  v7 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 16);
  connectionSocket = self->_connectionSocket;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke;
  v9[3] = &unk_24D466C50;
  v9[4] = self;
  v10 = a3;
  v11 = a4;
  -[GKAsyncSocket sendData:withCompletionHandler:](connectionSocket, "sendData:withCompletionHandler:", v7, v9);
}

void __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;

  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke_cold_1(v3, a1, v4);
  }
}

- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  double v10;
  id receiveDataHandler;
  NSObject *targetQueue;
  uint64_t v13;
  NSObject *v14;
  GKAsyncSocket *v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  GKAsyncSocket *v20;
  NSString *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  GKAsyncSocket *v25;
  NSString *v26;
  const char *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  GKAsyncSocket *v34;
  NSString *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v41;
  uint64_t v42;
  id v43;
  id connectedHandler;
  NSObject *v45;
  _QWORD *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  GKAsyncSocket *v50;
  NSString *v51;
  const char *v52;
  unsigned int v53;
  uint64_t v54;
  NSObject *v55;
  GKAsyncSocket *v56;
  NSString *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  GKAsyncSocket *v62;
  NSString *v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  _QWORD v77[7];
  _QWORD v78[5];
  _QWORD block[6];
  _QWORD v80[6];
  _QWORD v81[7];
  _QWORD v82[5];
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  GKDiscoveryPeerConnection *v90;
  __int16 v91;
  GKAsyncSocket *v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  int v102;
  __int16 v103;
  int v104;
  __int16 v105;
  int v106;
  __int16 v107;
  unsigned int v108;
  uint64_t v109;

  v5 = *(_QWORD *)&a5;
  v109 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x2199EF8CC](self, a2);
  if (a3 <= 2199)
  {
    if (a3 != 2000)
    {
      if (a3 == 2100)
      {
        v10 = micro();
        -[GKSimpleTimer fireIn:fromNow:](self->_timeoutTimer, "fireIn:fromNow:", self->_connectionTimeoutInSeconds, v10);
        -[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2100, v5);
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4;
        v80[3] = &unk_24D466CC8;
        v80[4] = a4;
        *(double *)&v80[5] = v10;
        if (!self->_connected)
        {
          -[NSMutableArray addObject:](self->_receivedDataHoldingQueue, "addObject:", (id)objc_msgSend(v80, "copy"));
          goto LABEL_78;
        }
        receiveDataHandler = self->_receiveDataHandler;
        if (receiveDataHandler)
        {
          if (self->_targetQueue)
            targetQueue = self->_targetQueue;
          else
            targetQueue = MEMORY[0x24BDAC9B8];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_5;
          block[3] = &unk_24D466C28;
          block[4] = v80;
          block[5] = receiveDataHandler;
          dispatch_async(targetQueue, block);
          goto LABEL_78;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_78;
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName)
          v41 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
        else
          v41 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v84 = v37;
        v85 = 2080;
        v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
        v87 = 1024;
        v88 = 725;
        v89 = 2048;
        v90 = self;
        v91 = 2048;
        v92 = connectionSocket;
        v93 = 2080;
        v94 = v41;
        v47 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiveDataHandler is nil";
        v48 = v38;
        v49 = 58;
LABEL_45:
        _os_log_impl(&dword_215C5C000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
        goto LABEL_78;
      }
LABEL_22:
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_78;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_78;
      v25 = self->_connectionSocket;
      v26 = self->_remoteServiceName;
      if (v26)
        v27 = -[NSString UTF8String](-[NSString description](v26, "description"), "UTF8String");
      else
        v27 = "<nil>";
      *(_DWORD *)buf = 136316930;
      v84 = v23;
      v85 = 2080;
      v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      v87 = 1024;
      v88 = 773;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      v92 = v25;
      v93 = 2080;
      v94 = v27;
      v95 = 1024;
      v96 = a3;
      v97 = 1024;
      v98 = objc_msgSend(a4, "length");
      v47 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unrecognized message %u (body size=%u)";
      v48 = v24;
      v49 = 70;
      goto LABEL_45;
    }
    if ((unint64_t)objc_msgSend(a4, "length") <= 5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_77;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        goto LABEL_77;
      v15 = self->_connectionSocket;
      v16 = self->_remoteServiceName;
      if (v16)
        v17 = -[NSString UTF8String](-[NSString description](v16, "description"), "UTF8String");
      else
        v17 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v84 = v13;
      v85 = 2080;
      v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      v87 = 1024;
      v88 = 629;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      v92 = v15;
      v93 = 2080;
      v94 = v17;
      v95 = 1024;
      v96 = objc_msgSend(a4, "length");
      v67 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] hello body too short: %u";
      v68 = v14;
      v69 = 64;
LABEL_76:
      _os_log_error_impl(&dword_215C5C000, v68, OS_LOG_TYPE_ERROR, v67, buf, v69);
LABEL_77:
      -[GKDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
      goto LABEL_78;
    }
    v28 = objc_msgSend(a4, "bytes");
    v29 = *(_DWORD *)v28;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v30 = bswap32(v29);
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x24BDFDC28];
      v33 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = self->_connectionSocket;
          v35 = self->_remoteServiceName;
          if (v35)
            v36 = -[NSString UTF8String](-[NSString description](v35, "description"), "UTF8String");
          else
            v36 = "<nil>";
          *(_DWORD *)buf = 136316674;
          v84 = v31;
          v85 = 2080;
          v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
          v87 = 1024;
          v88 = 637;
          v89 = 2048;
          v90 = self;
          v91 = 2048;
          v92 = v34;
          v93 = 2080;
          v94 = v36;
          v95 = 1024;
          v96 = v30;
          _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] \t got Hello (flags = %08x)", buf, 0x40u);
        }
      }
      else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v50 = self->_connectionSocket;
        v51 = self->_remoteServiceName;
        if (v51)
          v52 = -[NSString UTF8String](-[NSString description](v51, "description"), "UTF8String");
        else
          v52 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v84 = v31;
        v85 = 2080;
        v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
        v87 = 1024;
        v88 = 637;
        v89 = 2048;
        v90 = self;
        v91 = 2048;
        v92 = v50;
        v93 = 2080;
        v94 = v52;
        v95 = 1024;
        v96 = v30;
        _os_log_debug_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] \t got Hello (flags = %08x)", buf, 0x40u);
      }
    }
    v53 = __rev16(*(unsigned __int16 *)(v28 + 4));
    if (objc_msgSend(a4, "length") < (unint64_t)(v53 + 6))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_77;
      v54 = VRTraceErrorLogLevelToCSTR();
      v55 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        goto LABEL_77;
      v56 = self->_connectionSocket;
      v57 = self->_remoteServiceName;
      if (v57)
        v58 = -[NSString UTF8String](-[NSString description](v57, "description"), "UTF8String");
      else
        v58 = "<nil>";
      v70 = objc_msgSend(a4, "length");
      *(_DWORD *)buf = 136316930;
      v84 = v54;
      v85 = 2080;
      v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      v87 = 1024;
      v88 = 641;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      v92 = v56;
      v93 = 2080;
      v94 = v58;
      v95 = 1024;
      v96 = v53;
      v97 = 1024;
      v98 = v70;
      v67 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] hello body not enough for service name: %u+6 > %u";
      v68 = v55;
      v69 = 70;
      goto LABEL_76;
    }
    v59 = v28 + 6;
    if (*(_BYTE *)(objc_msgSend(a4, "length") + v28 + 6 - 7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_77;
      v60 = VRTraceErrorLogLevelToCSTR();
      v61 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        goto LABEL_77;
      v62 = self->_connectionSocket;
      v63 = self->_remoteServiceName;
      if (v63)
        v64 = -[NSString UTF8String](-[NSString description](v63, "description"), "UTF8String");
      else
        v64 = "<nil>";
      v71 = *(char *)(v28 + 6);
      v72 = *(char *)(v28 + 7);
      v73 = *(char *)(v28 + 8);
      v74 = *(char *)(v59 + v53 - 3);
      v75 = *(char *)(v59 + v53 - 2);
      v76 = *(char *)(v59 + v53 - 1);
      *(_DWORD *)buf = 136318210;
      v84 = v60;
      v85 = 2080;
      v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      v87 = 1024;
      v88 = 651;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      v92 = v62;
      v93 = 2080;
      v94 = v64;
      v95 = 1024;
      v96 = v71;
      v97 = 1024;
      v98 = v72;
      v99 = 1024;
      v100 = v73;
      v101 = 1024;
      v102 = v74;
      v103 = 1024;
      v104 = v75;
      v105 = 1024;
      v106 = v76;
      v107 = 1024;
      v108 = v53;
      v67 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] remote name [%c%c%c..%c%c%c] not properly terminated at length=%u";
      v68 = v61;
      v69 = 100;
      goto LABEL_76;
    }
    -[GKDiscoveryPeerConnection setRemoteServiceName:](self, "setRemoteServiceName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28 + 6));
    -[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2000, v5);
    if (!-[GKDiscoveryPeerConnection shouldDecideAboutConnection](self, "shouldDecideAboutConnection"))
      goto LABEL_78;
    v65 = MEMORY[0x24BDAC760];
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke;
    v82[3] = &unk_24D466C78;
    v82[4] = self;
    v66 = (id)objc_msgSend(v82, "copy");
    connectedHandler = self->_connectedHandler;
    if (!connectedHandler)
      goto LABEL_78;
    self->_connectedHandler = 0;
    v45 = self->_targetQueue;
    if (!v45)
      v45 = MEMORY[0x24BDAC9B8];
    v81[0] = v65;
    v81[1] = 3221225472;
    v81[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3;
    v81[3] = &unk_24D466CA0;
    v81[4] = self;
    v81[5] = connectedHandler;
    v81[6] = v66;
    v46 = v81;
LABEL_42:
    dispatch_async(v45, v46);

    goto LABEL_78;
  }
  if (a3 != 2200)
  {
    if (a3 == 2300)
    {
      -[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2300, v5);
      goto LABEL_78;
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_connectionSocket;
      v21 = self->_remoteServiceName;
      if (v21)
        v22 = -[NSString UTF8String](-[NSString description](v21, "description"), "UTF8String");
      else
        v22 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v84 = v18;
      v85 = 2080;
      v86 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      v87 = 1024;
      v88 = 732;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      v92 = v20;
      v93 = 2080;
      v94 = v22;
      _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] got Accept", buf, 0x3Au);
    }
  }
  -[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2200, v5);
  v42 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_39;
  v78[3] = &unk_24D466C78;
  v78[4] = self;
  v43 = (id)objc_msgSend(v78, "copy");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_connectedHandler = 0;
    v45 = self->_targetQueue;
    if (!v45)
      v45 = MEMORY[0x24BDAC9B8];
    v77[0] = v42;
    v77[1] = 3221225472;
    v77[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4_42;
    v77[3] = &unk_24D466CA0;
    v77[4] = self;
    v77[5] = connectedHandler;
    v77[6] = v43;
    v46 = v77;
    goto LABEL_42;
  }
LABEL_78:
  objc_autoreleasePoolPop(v9);
}

void __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(void **)(v6 + 8);
      if (v8)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      else
        v9 = "<nil>";
      v10 = "declines";
      *(_DWORD *)buf = 136316930;
      v20 = v4;
      v22 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]_block_invoke";
      v23 = 1024;
      v11 = "close connection";
      v24 = 672;
      v26 = v6;
      v21 = 2080;
      if (a2)
        v10 = "approves";
      v25 = 2048;
      if (a2)
        v11 = "accept connection";
      v27 = 2048;
      v28 = v7;
      v29 = 2080;
      v30 = v9;
      v31 = 2080;
      v32 = v10;
      v33 = 2080;
      v34 = v11;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] peer %s. Will %s", buf, 0x4Eu);
    }
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 104);
  if (a2)
  {
    v18 = MEMORY[0x24BDAC760];
    v14 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_36;
    v15 = &v18;
  }
  else
  {
    v17 = MEMORY[0x24BDAC760];
    v14 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2;
    v15 = &v17;
  }
  if (v13)
    v16 = v13;
  else
    v16 = MEMORY[0x24BDAC9B8];
  v15[1] = 3221225472;
  v15[2] = (uint64_t)v14;
  v15[3] = (uint64_t)&unk_24D466170;
  v15[4] = v12;
  dispatch_async(v16, v15);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_36(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncSendAccept");
  return objc_msgSend(*(id *)(a1 + 32), "syncAcceptedConnection");
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(a1[4] + 8), 0, a1[6], 0);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, double))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 40));
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_39(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 104);
  if (a2)
  {
    v8 = MEMORY[0x24BDAC760];
    v4 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_40;
    v5 = &v8;
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v4 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_41;
    v5 = &v7;
  }
  if (v3)
    v6 = v3;
  else
    v6 = MEMORY[0x24BDAC9B8];
  v5[1] = 3221225472;
  v5[2] = (uint64_t)v4;
  v5[3] = (uint64_t)&unk_24D466170;
  v5[4] = v2;
  dispatch_async(v6, v5);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncAcceptedConnection");
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4_42(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(a1[4] + 8), 1, a1[6], 0);
}

- (void)timeout:(id)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  if (!syncQueue)
    syncQueue = MEMORY[0x24BDAC9B8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__GKDiscoveryPeerConnection_timeout___block_invoke;
  v4[3] = &unk_24D4661B8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(syncQueue, v4);
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  _BYTE v30[24];
  __int128 v31;
  uint64_t v32;
  _BYTE v33[20];
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 40);
  v2 = *(_QWORD **)(a1 + 40);
  v4 = (uint64_t)*(v3 - 1);
  if (v4 == v2[15])
  {
    objc_msgSend(v2, "syncSendMessage:data:withCompletionHandler:", 2300, 0, 0);
    return;
  }
  if (v4 == v2[16])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      v15 = *MEMORY[0x24BDFDC28];
      if (!*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_1(v13, (uint64_t)v3);
        goto LABEL_30;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v3;
        v17 = *((_QWORD *)*v3 + 4);
        v18 = (void *)*((_QWORD *)*v3 + 1);
        if (v18)
          v19 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)v30 = 136316418;
        *(_QWORD *)&v30[4] = v13;
        *(_WORD *)&v30[12] = 2080;
        *(_QWORD *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 787;
        WORD2(v31) = 2048;
        *(_QWORD *)((char *)&v31 + 6) = v16;
        HIWORD(v31) = 2048;
        v32 = v17;
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = v19;
        v29 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] heartbeat timeout timer hit";
        goto LABEL_29;
      }
    }
LABEL_30:
    objc_msgSend(*v3, "syncCloseConnectionNow", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31, v32, *(_OWORD *)v33);
    return;
  }
  v5 = v2[17];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 == v5)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      v21 = *MEMORY[0x24BDFDC28];
      if (!*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_2(v20, (uint64_t)v3);
        goto LABEL_30;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *v3;
        v23 = *((_QWORD *)*v3 + 4);
        v24 = (void *)*((_QWORD *)*v3 + 1);
        if (v24)
          v25 = (const char *)objc_msgSend((id)objc_msgSend(v24, "description"), "UTF8String");
        else
          v25 = "<nil>";
        *(_DWORD *)v30 = 136316418;
        *(_QWORD *)&v30[4] = v20;
        *(_WORD *)&v30[12] = 2080;
        *(_QWORD *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 790;
        WORD2(v31) = 2048;
        *(_QWORD *)((char *)&v31 + 6) = v22;
        HIWORD(v31) = 2048;
        v32 = v23;
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = v25;
        v29 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] timeout timer hit";
LABEL_29:
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, v29, v30, 0x3Au);
        goto LABEL_30;
      }
    }
    goto LABEL_30;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v3;
      v10 = *((_QWORD *)*v3 + 4);
      v11 = (void *)*((_QWORD *)*v3 + 1);
      if (v11)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      else
        v12 = "<nil>";
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *((_QWORD *)*v3 + 15);
      v28 = *((_QWORD *)*v3 + 17);
      *(_DWORD *)v30 = 136317186;
      *(_QWORD *)&v30[4] = v7;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 793;
      WORD2(v31) = 2048;
      *(_QWORD *)((char *)&v31 + 6) = v9;
      HIWORD(v31) = 2048;
      v32 = v10;
      *(_WORD *)v33 = 2080;
      *(_QWORD *)&v33[2] = v12;
      *(_WORD *)&v33[10] = 2048;
      *(_QWORD *)&v33[12] = v26;
      v34 = 2048;
      v35 = v27;
      v36 = 2048;
      v37 = v28;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unknown timer[%p] hit (heartbeat[%p] timerout[%p]) ?", v30, 0x58u);
    }
  }
}

- (void)syncReceivedData:(id)a3 error:(id)a4
{
  GKDiscoveryPeerConnection *v6;
  uint64_t v7;
  void *v8;
  double v9;
  unsigned __int16 *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v17;
  const char *v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSString *v34;
  NSString *v35;
  const char *v36;
  int v37;
  int v38;
  uint64_t v39;
  id *v40;
  uint64_t (**v41)(id, _QWORD);
  char v42;
  uint64_t v43;
  NSObject *v44;
  GKAsyncSocket *v45;
  NSString *v46;
  const char *v47;
  GKDiscoveryPeerConnection *v48;
  uint64_t v49;
  NSObject *v50;
  GKAsyncSocket *v51;
  NSString *v52;
  const char *v53;
  uint64_t v54;
  GKAsyncSocket *v55;
  NSString *v56;
  const char *v57;
  GKDiscoveryPeerConnection *v58;
  uint64_t v59;
  NSObject *v60;
  GKAsyncSocket *v61;
  NSString *v62;
  const char *v63;
  GKDiscoveryPeerConnection *v64;
  uint64_t v65;
  int ErrorLogLevelForModule;
  uint64_t v67;
  GKAsyncSocket *v68;
  NSString *v69;
  const char *v70;
  GKAsyncSocket *v71;
  NSString *v72;
  const char *v73;
  int v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  int v80;
  int v81;
  GKAsyncSocket *v82;
  GKAsyncSocket *v83;
  id *p_messageReceiptHandlerHoldingQueue;
  id *p_messageReceiptHandlerList;
  uint64_t v86;
  void *context;
  GKDiscoveryPeerConnection *v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  GKDiscoveryPeerConnection *v96;
  __int16 v97;
  GKAsyncSocket *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  _BYTE v102[10];
  __int16 v103;
  int v104;
  __int16 v105;
  unsigned int v106;
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  uint64_t v113;

  v6 = self;
  v113 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x2199EF8CC](self, a2);
  v8 = (void *)v7;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_57;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_57;
    connectionSocket = v6->_connectionSocket;
    remoteServiceName = v6->_remoteServiceName;
    if (remoteServiceName)
    {
      v17 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
      if (a4)
      {
LABEL_9:
        v18 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_56:
        *(_DWORD *)buf = 136316674;
        v90 = v13;
        v91 = 2080;
        v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
        v93 = 1024;
        v94 = 938;
        v95 = 2048;
        v96 = v6;
        v97 = 2048;
        v98 = connectionSocket;
        v99 = 2080;
        v100 = v17;
        v101 = 2080;
        *(_QWORD *)v102 = v18;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] end of stream: %s", buf, 0x44u);
LABEL_57:
        v64 = v6;
LABEL_82:
        -[GKDiscoveryPeerConnection syncCloseConnectionNow](v64, "syncCloseConnectionNow");
        goto LABEL_83;
      }
    }
    else
    {
      v17 = "<nil>";
      if (a4)
        goto LABEL_9;
    }
    v18 = "<nil>";
    goto LABEL_56;
  }
  context = (void *)v7;
  v9 = micro();
  -[GKSimpleTimer fireIn:fromNow:](v6->_heartbeatTimer, "fireIn:fromNow:", v6->_heartbeatIntervalInSeconds, v9);
  -[GKSimpleTimer fireIn:fromNow:](v6->_heartbeatTimeoutTimer, "fireIn:fromNow:", v6->_heartbeatIntervalInSeconds + v6->_heartbeatIntervalInSeconds, v9);
  -[NSMutableData appendData:](v6->_dataReceived, "appendData:", a3);
  v10 = (unsigned __int16 *)-[NSMutableData bytes](v6->_dataReceived, "bytes");
  v11 = -[NSMutableData length](v6->_dataReceived, "length");
  v88 = v6;
  if (v11 >= 0x10)
  {
    p_messageReceiptHandlerHoldingQueue = (id *)&v6->_messageReceiptHandlerHoldingQueue;
    p_messageReceiptHandlerList = (id *)&v6->_messageReceiptHandlerList;
    while (1)
    {
      v19 = *v10;
      v20 = *((_BYTE *)v10 + 3);
      v21 = *((_DWORD *)v10 + 2);
      v22 = bswap32(*((_DWORD *)v10 + 1));
      v23 = *((unsigned __int8 *)v10 + 12);
      v24 = *((unsigned __int8 *)v10 + 13);
      v25 = *((unsigned __int8 *)v10 + 14);
      v26 = *((unsigned __int8 *)v10 + 15);
      if (+[GKDiscoveryPeerConnection receiveDataLimit](GKDiscoveryPeerConnection, "receiveDataLimit") < v22)
      {
        v8 = context;
        v6 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v45 = v88->_connectionSocket;
            v46 = v88->_remoteServiceName;
            if (v46)
              v47 = -[NSString UTF8String](-[NSString description](v46, "description"), "UTF8String");
            else
              v47 = "<nil>";
            v74 = +[GKDiscoveryPeerConnection receiveDataLimit](GKDiscoveryPeerConnection, "receiveDataLimit");
            *(_DWORD *)buf = 136316930;
            v90 = v43;
            v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            v93 = 1024;
            v94 = 851;
            v95 = 2048;
            v96 = v88;
            v97 = 2048;
            v98 = v45;
            v99 = 2080;
            v100 = v47;
            v101 = 1024;
            *(_DWORD *)v102 = v22;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v74;
            _os_log_error_impl(&dword_215C5C000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message too big %u > %u", buf, 0x46u);
          }
        }
        goto LABEL_57;
      }
      if (v22 > v11 - 16)
        goto LABEL_3;
      v27 = (v26 | (v24 << 16) | (v25 << 8)) & 0xFFFFFF | (v23 << 24);
      if (v23 << 24 < 0)
        break;
      v28 = v20 & 1;
      if (v28 && (_DWORD)v22)
      {
        v8 = context;
        v48 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v54 = VRTraceErrorLogLevelToCSTR();
          v50 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v55 = v88->_connectionSocket;
            v56 = v88->_remoteServiceName;
            if (v56)
              v57 = -[NSString UTF8String](-[NSString description](v56, "description"), "UTF8String");
            else
              v57 = "<nil>";
            *(_DWORD *)buf = 136316674;
            v90 = v54;
            v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            v93 = 1024;
            v94 = 867;
            v95 = 2048;
            v96 = v88;
            v97 = 2048;
            v98 = v55;
            v99 = 2080;
            v100 = v57;
            v101 = 1024;
            *(_DWORD *)v102 = v22;
            v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receipt has body size %u";
            goto LABEL_80;
          }
        }
        goto LABEL_81;
      }
      v29 = bswap32(v21);
      *((_DWORD *)v10 + 2) = 0;
      v30 = v22 + 16;
      v31 = crc32(0, (const Bytef *)v10, (int)v22 + 16);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v86 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x24BDFDC28];
        v33 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v82 = v88->_connectionSocket;
            v34 = v88->_remoteServiceName;
            if (v34)
              v77 = -[NSString UTF8String](-[NSString description](v34, "description"), "UTF8String");
            else
              v77 = "<nil>";
            v81 = -[NSMutableArray count](v88->_messageReceiptHandlerHoldingQueue, "count", v77);
            v38 = -[NSMutableArray count](v88->_messageReceiptHandlerList, "count");
            *(_DWORD *)buf = 136318210;
            v90 = v86;
            v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            v93 = 1024;
            v94 = 875;
            v95 = 2048;
            v96 = v88;
            v97 = 2048;
            v98 = v82;
            v99 = 2080;
            v100 = v79;
            v101 = 1024;
            *(_DWORD *)v102 = v27;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v22;
            v103 = 1024;
            v104 = v31;
            v105 = 1024;
            v106 = v29;
            v107 = 1024;
            v108 = v28;
            v109 = 1024;
            v110 = v81;
            v111 = 1024;
            v112 = v38;
            _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receivedData got message #%u (bodylen=%u) crc==given[%08X==%08X]? (receipt(%u) Q[%u] L[%u])", buf, 0x64u);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v83 = v88->_connectionSocket;
          v35 = v88->_remoteServiceName;
          v36 = "<nil>";
          if (v35)
            v36 = -[NSString UTF8String](-[NSString description](v35, "description"), "UTF8String");
          v80 = -[NSMutableArray count](v88->_messageReceiptHandlerHoldingQueue, "count", v36);
          v37 = -[NSMutableArray count](v88->_messageReceiptHandlerList, "count");
          *(_DWORD *)buf = 136318210;
          v90 = v86;
          v91 = 2080;
          v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
          v93 = 1024;
          v94 = 875;
          v95 = 2048;
          v96 = v88;
          v97 = 2048;
          v98 = v83;
          v99 = 2080;
          v100 = v78;
          v101 = 1024;
          *(_DWORD *)v102 = v27;
          *(_WORD *)&v102[4] = 1024;
          *(_DWORD *)&v102[6] = v22;
          v103 = 1024;
          v104 = v31;
          v105 = 1024;
          v106 = v29;
          v107 = 1024;
          v108 = v28;
          v109 = 1024;
          v110 = v80;
          v111 = 1024;
          v112 = v37;
          _os_log_debug_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receivedData got message #%u (bodylen=%u) crc==given[%08X==%08X]? (receipt(%u) Q[%u] L[%u])", buf, 0x64u);
        }
      }
      if (v29 != v31)
      {
        v8 = context;
        v58 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v59 = VRTraceErrorLogLevelToCSTR();
          v60 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v61 = v88->_connectionSocket;
            v62 = v88->_remoteServiceName;
            if (v62)
              v63 = -[NSString UTF8String](-[NSString description](v62, "description"), "UTF8String");
            else
              v63 = "<nil>";
            *(_DWORD *)buf = 136316418;
            v90 = v59;
            v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            v93 = 1024;
            v94 = 877;
            v95 = 2048;
            v96 = v88;
            v97 = 2048;
            v98 = v61;
            v99 = 2080;
            v100 = v63;
            v76 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] invalid checksum";
LABEL_77:
            _os_log_error_impl(&dword_215C5C000, v60, OS_LOG_TYPE_ERROR, v76, buf, 0x3Au);
          }
        }
LABEL_60:
        v64 = v58;
        goto LABEL_82;
      }
      v39 = __rev16(v19);
      if (v28)
      {
        if (((_DWORD)v39 != 2100
           || (v40 = p_messageReceiptHandlerHoldingQueue, !objc_msgSend(*p_messageReceiptHandlerHoldingQueue, "count")))
          && (v40 = p_messageReceiptHandlerList, !objc_msgSend(*p_messageReceiptHandlerList, "count"))
          || (v41 = (uint64_t (**)(id, _QWORD))(id)objc_msgSend(*v40, "objectAtIndexedSubscript:", 0), objc_msgSend(*v40, "removeObjectAtIndex:", 0), !v41))
        {
          v8 = context;
          v58 = v88;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v65 = VRTraceErrorLogLevelToCSTR();
            v60 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v71 = v88->_connectionSocket;
              v72 = v88->_remoteServiceName;
              if (v72)
                v73 = -[NSString UTF8String](-[NSString description](v72, "description"), "UTF8String");
              else
                v73 = "<nil>";
              *(_DWORD *)buf = 136316418;
              v90 = v65;
              v91 = 2080;
              v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
              v93 = 1024;
              v94 = 894;
              v95 = 2048;
              v96 = v88;
              v97 = 2048;
              v98 = v71;
              v99 = 2080;
              v100 = v73;
              v76 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message receipt has no matching handler";
              goto LABEL_77;
            }
          }
          goto LABEL_60;
        }
        v42 = v41[2](v41, v27);

        if ((v42 & 1) == 0)
        {
          ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          v8 = context;
          v48 = v88;
          if (ErrorLogLevelForModule >= 3)
          {
            v67 = VRTraceErrorLogLevelToCSTR();
            v50 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v68 = v88->_connectionSocket;
              v69 = v88->_remoteServiceName;
              if (v69)
                v70 = -[NSString UTF8String](-[NSString description](v69, "description"), "UTF8String");
              else
                v70 = "<nil>";
              *(_DWORD *)buf = 136316674;
              v90 = v67;
              v91 = 2080;
              v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
              v93 = 1024;
              v94 = 902;
              v95 = 2048;
              v96 = v88;
              v97 = 2048;
              v98 = v68;
              v99 = 2080;
              v100 = v70;
              v101 = 1024;
              *(_DWORD *)v102 = v27;
              v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unexpected sequence number [%d]";
              goto LABEL_80;
            }
          }
          goto LABEL_81;
        }
      }
      else
      {
        -[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:](v88, "syncProcessMessage:data:sequenceNumber:", v39, objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10 + 8, v22), v27);
      }
      v10 = (unsigned __int16 *)((char *)v10 + v30);
      v11 -= v30;
      if (v11 <= 0xF)
        goto LABEL_3;
    }
    v8 = context;
    v48 = v88;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v51 = v88->_connectionSocket;
        v52 = v88->_remoteServiceName;
        if (v52)
          v53 = -[NSString UTF8String](-[NSString description](v52, "description"), "UTF8String");
        else
          v53 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v90 = v49;
        v91 = 2080;
        v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
        v93 = 1024;
        v94 = 861;
        v95 = 2048;
        v96 = v88;
        v97 = 2048;
        v98 = v51;
        v99 = 2080;
        v100 = v53;
        v101 = 1024;
        *(_DWORD *)v102 = v27;
        v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] invalidSequenceNumber [%u]";
LABEL_80:
        _os_log_error_impl(&dword_215C5C000, v50, OS_LOG_TYPE_ERROR, v75, buf, 0x40u);
      }
    }
LABEL_81:
    v64 = v48;
    goto LABEL_82;
  }
LABEL_3:
  v12 = -[NSMutableData length](v88->_dataReceived, "length");
  v8 = context;
  if (v12 != v11)
    -[NSMutableData replaceBytesInRange:withBytes:length:](v88->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, v12 - v11, 0, 0);
LABEL_83:
  objc_autoreleasePoolPop(v8);
}

- (void)syncCloseConnectionNow
{
  uint64_t v3;
  NSMutableArray *messageReceiptHandlerList;
  NSMutableArray *messageReceiptHandlerHoldingQueue;
  id connectedHandler;
  NSObject *targetQueue;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  self->_connected = 0;
  -[GKAsyncSocket invalidate](self->_connectionSocket, "invalidate");

  self->_connectionSocket = 0;
  self->_remoteServiceName = 0;
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, -[NSMutableData length](self->_dataReceived, "length"), 0, 0);
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSendHoldingQueue, "replaceBytesInRange:withBytes:length:", 0, -[NSMutableData length](self->_dataToSendHoldingQueue, "length"), 0, 0);
  -[GKSimpleTimer invalidate](self->_heartbeatTimer, "invalidate");

  self->_heartbeatTimer = 0;
  -[GKSimpleTimer invalidate](self->_heartbeatTimeoutTimer, "invalidate");

  self->_heartbeatTimeoutTimer = 0;
  -[GKSimpleTimer invalidate](self->_timeoutTimer, "invalidate");

  self->_timeoutTimer = 0;
  v3 = MEMORY[0x24BDAC760];
  messageReceiptHandlerList = self->_messageReceiptHandlerList;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke;
  v10[3] = &unk_24D466CF0;
  v10[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](messageReceiptHandlerList, "enumerateObjectsUsingBlock:", v10);
  messageReceiptHandlerHoldingQueue = self->_messageReceiptHandlerHoldingQueue;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_45;
  v9[3] = &unk_24D466CF0;
  v9[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](messageReceiptHandlerHoldingQueue, "enumerateObjectsUsingBlock:", v9);
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerHoldingQueue, "removeAllObjects");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_connectedHandler = 0;
    if (self->_targetQueue)
      targetQueue = self->_targetQueue;
    else
      targetQueue = MEMORY[0x24BDAC9B8];
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_47;
    v8[3] = &unk_24D466AC0;
    v8[4] = connectedHandler;
    dispatch_async(targetQueue, v8);

  }
  else if (self->_receiveDataHandler)
  {
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = CFSTR("Connection closed");
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
    (*((void (**)(double))self->_receiveDataHandler + 2))(0.0);
  }
}

void __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    else
      v3 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2;
    block[3] = &unk_24D466AC0;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(void **)(v6 + 8);
      if (v8)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      else
        v9 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v12 = v4;
      v13 = 2080;
      v14 = "-[GKDiscoveryPeerConnection syncCloseConnectionNow]_block_invoke";
      v15 = 1024;
      v16 = 973;
      v17 = 2048;
      v18 = v6;
      v19 = 2048;
      v20 = v7;
      v21 = 2080;
      v22 = v9;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiptHander should not be nil", buf, 0x3Au);
    }
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_45(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    else
      v3 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_46;
    block[3] = &unk_24D466AC0;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(void **)(v6 + 8);
      if (v8)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      else
        v9 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v12 = v4;
      v13 = 2080;
      v14 = "-[GKDiscoveryPeerConnection syncCloseConnectionNow]_block_invoke";
      v15 = 1024;
      v16 = 983;
      v17 = 2048;
      v18 = v6;
      v19 = 2048;
      v20 = v7;
      v21 = 2080;
      v22 = v9;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiptHandler should not be nil", buf, 0x3Au);
    }
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_47(uint64_t a1)
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v4[0] = CFSTR("Unable to connect");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  if (!syncQueue)
    syncQueue = MEMORY[0x24BDAC9B8];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__GKDiscoveryPeerConnection_invalidate__block_invoke;
  block[3] = &unk_24D466170;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __39__GKDiscoveryPeerConnection_invalidate__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v7;
  id connectedHandler;
  id receiveDataHandler;
  NSObject *syncQueue;
  NSObject *targetQueue;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  GKDiscoveryPeerConnection *v20;
  __int16 v21;
  GKAsyncSocket *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      remoteServiceName = self->_remoteServiceName;
      if (remoteServiceName)
        v7 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v14 = v3;
      v15 = 2080;
      v16 = "-[GKDiscoveryPeerConnection dealloc]";
      v17 = 1024;
      v18 = 1020;
      v19 = 2048;
      v20 = self;
      v21 = 2048;
      v22 = connectionSocket;
      v23 = 2080;
      v24 = v7;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] deallocating peerConnection object", buf, 0x3Au);
    }
  }
  -[GKDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)

  receiveDataHandler = self->_receiveDataHandler;
  if (receiveDataHandler)

  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_release(targetQueue);
  v12.receiver = self;
  v12.super_class = (Class)GKDiscoveryPeerConnection;
  -[GKDiscoveryPeerConnection dealloc](&v12, sel_dealloc);
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *syncQueue;
  GKAsyncSocket *connectionSocket;
  NSString *remoteServiceName;
  const char *v14;
  _QWORD block[7];
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  GKDiscoveryPeerConnection *v25;
  __int16 v26;
  GKAsyncSocket *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = objc_msgSend(a3, "length");
    if (+[GKDiscoveryPeerConnection sendDataLimit](GKDiscoveryPeerConnection, "sendDataLimit") >= v7)
    {
      v10 = (id)objc_msgSend(a4, "copy");
      syncQueue = MEMORY[0x24BDAC9B8];
      if (self->_syncQueue)
        syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__GKDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke;
      block[3] = &unk_24D466AE8;
      block[4] = self;
      block[5] = a3;
      block[6] = v10;
      dispatch_async(syncQueue, block);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          connectionSocket = self->_connectionSocket;
          remoteServiceName = self->_remoteServiceName;
          if (remoteServiceName)
            v14 = -[NSString UTF8String](-[NSString description](remoteServiceName, "description"), "UTF8String");
          else
            v14 = "<nil>";
          *(_DWORD *)buf = 136316674;
          v19 = v8;
          v20 = 2080;
          v21 = "-[GKDiscoveryPeerConnection sendData:withCompletionHandler:]";
          v22 = 1024;
          v23 = 1055;
          v24 = 2048;
          v25 = self;
          v26 = 2048;
          v27 = connectionSocket;
          v28 = 2080;
          v29 = v14;
          v30 = 1024;
          v31 = v7;
          _os_log_error_impl(&dword_215C5C000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message too big to send (length=%u)", buf, 0x40u);
        }
      }
      v16 = *MEMORY[0x24BDD0FC8];
      v17 = CFSTR("Message is too big to send");
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeerConnection"), -6, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __60__GKDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "fireIn:fromNow:", *(double *)(*(_QWORD *)(a1 + 32) + 144), micro());
  return objc_msgSend(*(id *)(a1 + 32), "syncSendMessage:data:withCompletionHandler:", 2100, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)checkConstants
{
  double v2;
  CFIndex AppIntegerValue;
  BOOL v5;
  uint64_t v6;
  CFIndex v7;
  BOOL v8;
  uint64_t v9;
  Boolean keyExistsAndHasValidFormat;

  v2 = micro();
  if (*(double *)&gkdpc_constantsUpdateTime == 0.0 || v2 - *(double *)&gkdpc_constantsUpdateTime > 10.0)
  {
    gkdpc_constantsUpdateTime = *(_QWORD *)&v2;
    CFPreferencesAppSynchronize(CFSTR("com.apple.gamed"));
    keyExistsAndHasValidFormat = -86;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("GKDiscoverySendDataLimit"), CFSTR("com.apple.gamed"), &keyExistsAndHasValidFormat);
    v5 = AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0;
    v6 = 20971520;
    if (!v5)
      v6 = AppIntegerValue;
    gkdpc_sendDataLimit = v6;
    v7 = CFPreferencesGetAppIntegerValue(CFSTR("GKDiscoveryReceiveDataLimit"), CFSTR("com.apple.gamed"), &keyExistsAndHasValidFormat);
    v8 = v7 <= 0 || keyExistsAndHasValidFormat == 0;
    v9 = 83886080;
    if (!v8)
      v9 = v7;
    gkdpc_receiveDataLimit = v9;
  }
}

+ (unint64_t)sendDataLimit
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  +[GKDiscoveryPeerConnection checkConstants](GKDiscoveryPeerConnection, "checkConstants");
  v3 = gkdpc_sendDataLimit;
  objc_sync_exit(v2);
  return v3;
}

+ (unint64_t)receiveDataLimit
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  +[GKDiscoveryPeerConnection checkConstants](GKDiscoveryPeerConnection, "checkConstants");
  v3 = gkdpc_receiveDataLimit;
  objc_sync_exit(v2);
  return v3;
}

- (NSString)remoteServiceName
{
  return self->_remoteServiceName;
}

- (void)setRemoteServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localServiceName
{
  return self->_localServiceName;
}

- (void)setLocalServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (id)connectedHandler
{
  return self->_connectedHandler;
}

- (void)setConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)syncConnected:.cold.1()
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
  v1 = *(void **)(v0 + 8);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_2(&dword_215C5C000, v2, v3, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] socket connect failed", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_4();
}

- (void)shouldDecideAboutConnection
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9_0();
  v2 = *(void **)(v1 + 8);
  if (v2)
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  v3 = *(void **)(v0 + 16);
  if (v3)
    objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
  v4 = *(void **)(v0 + 8);
  if (v4)
    objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_9_1(&dword_215C5C000, v5, v6, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] local [%s] and remote [%s] service name are equal - this should NOT happen", v7, v8, v9, v10, v11);
  OUTLINED_FUNCTION_6_2();
}

void __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = *(void **)(*(_QWORD *)(a2 + 32) + 8);
  if (v2)
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_8_2(&dword_215C5C000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] failed to send queued messages", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_3_4();
}

void __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(v6 + 32);
  v8 = *(void **)(v6 + 8);
  if (v8)
    v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
  else
    v9 = "<nil>";
  v10 = *(_DWORD *)(a2 + 40);
  v11 = *(_DWORD *)(a2 + 44);
  v12 = 136316930;
  v13 = a1;
  v14 = 2080;
  v15 = "-[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:]_block_invoke";
  v16 = 1024;
  v17 = 608;
  v18 = 2048;
  v19 = v6;
  v20 = 2048;
  v21 = v7;
  v22 = 2080;
  v23 = v9;
  v24 = 1024;
  v25 = v10;
  v26 = 1024;
  v27 = v11;
  _os_log_error_impl(&dword_215C5C000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] failed to send receipt %d:%08X", (uint8_t *)&v12, 0x46u);
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)OUTLINED_FUNCTION_11_1(a2, *MEMORY[0x24BDAC8D0]);
  if (v2)
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_7_4(&dword_215C5C000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] heartbeat timeout timer hit", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_3_4();
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)OUTLINED_FUNCTION_11_1(a2, *MEMORY[0x24BDAC8D0]);
  if (v2)
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_7_4(&dword_215C5C000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] timeout timer hit", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_3_4();
}

@end
