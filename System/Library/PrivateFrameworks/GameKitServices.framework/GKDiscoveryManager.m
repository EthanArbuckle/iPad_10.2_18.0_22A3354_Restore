@implementation GKDiscoveryManager

- (GKDiscoveryManager)init
{
  return -[GKDiscoveryManager initWithDomain:type:](self, "initWithDomain:type:", CFSTR("local."), CFSTR("_gamecenter._tcp"));
}

- (GKDiscoveryManager)initWithDomain:(id)a3 type:(id)a4
{
  GKDiscoveryManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDiscoveryManager;
  v6 = -[GKDiscoveryManager init](&v8, sel_init);
  if (v6)
  {
    v6->_bonjour = -[GKDiscoveryBonjour initWithDomain:type:]([GKDiscoveryBonjour alloc], "initWithDomain:type:", a3, a4);
    v6->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->_peersQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.GKDiscoveryManager.peersQueue", 0);
    v6->_deviceID = (NSString *)-[GKDiscoveryManager generateDeviceID](v6, "generateDeviceID");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_peersQueue);
  v3.receiver = self;
  v3.super_class = (Class)GKDiscoveryManager;
  -[GKDiscoveryManager dealloc](&v3, sel_dealloc);
}

- (id)generateDeviceID
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  __CFString *v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  memset(md, 170, sizeof(md));
  CC_MD5((const void *)-[__CFString UTF8String](v4, "UTF8String"), -[__CFString length](v4, "length"), md);

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 16);
  for (i = 0; i != 8; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02X"), md[i]);
  return v5;
}

- (void)resolveForPeer:(id)a3
{
  void *v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  GKDiscoveryBonjour *bonjour;
  NSObject *peersQueue;
  _QWORD block[6];
  _QWORD v17[7];
  _QWORD v18[6];
  _BYTE buf[24];
  __int128 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "nextInterfaceIndex");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(a3, "serviceName"))
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        else
          v9 = "<nil>";
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKDiscoveryManager resolveForPeer:]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v20) = 163;
        WORD2(v20) = 2080;
        *(_QWORD *)((char *)&v20 + 6) = v9;
        HIWORD(v20) = 1024;
        LODWORD(v21) = objc_msgSend(v5, "intValue");
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] attempting to resolve on interface [%d]", buf, 0x2Cu);
      }
    }
    objc_msgSend(a3, "setChosenInterface:", v5);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)&v20 = __Block_byref_object_copy_;
    *((_QWORD *)&v20 + 1) = __Block_byref_object_dispose_;
    v21 = a3;
    v13 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke;
    v18[3] = &unk_24D4667C8;
    v18[4] = self;
    v18[5] = buf;
    objc_msgSend(a3, "startResolveTimerWithHandler:", v18);
    bonjour = self->_bonjour;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_3;
    v17[3] = &unk_24D4667F0;
    v17[4] = a3;
    v17[5] = self;
    v17[6] = v5;
    -[GKDiscoveryBonjour resolveName:onIndex:withCompletionHandler:](bonjour, "resolveName:onIndex:withCompletionHandler:", objc_msgSend(a3, "serviceName"), objc_msgSend(v5, "intValue"), v17);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(a3, "serviceName"))
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        else
          v12 = "<nil>";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKDiscoveryManager resolveForPeer:]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v20) = 227;
        WORD2(v20) = 2080;
        *(_QWORD *)((char *)&v20 + 6) = v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] no more interfaces available to resolve on", buf, 0x26u);
      }
    }
    peersQueue = self->_peersQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_24;
    block[3] = &unk_24D4661B8;
    block[4] = self;
    block[5] = a3;
    dispatch_async(peersQueue, block);
  }
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke(uint64_t a1)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_2;
  v3[3] = &unk_24D4667C8;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_async(*(dispatch_queue_t *)(v4 + 64), v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stopResolve:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "serviceName"));
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1002, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD v29[7];
  _QWORD block[6];
  _QWORD v31[6];
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stopResolveTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "stopResolve:", objc_msgSend(*(id *)(a1 + 32), "serviceName"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a5)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
          v28 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        else
          v28 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v35 = v11;
        v36 = 2080;
        v37 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke_3";
        v38 = 1024;
        v39 = 190;
        v40 = 2080;
        v41 = v28;
        v42 = 1024;
        v43 = a5;
        _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer [%s] resolve callback errorCode = %d.", buf, 0x2Cu);
      }
    }
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = *(NSObject **)(v13 + 64);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_13;
    v31[3] = &unk_24D4661B8;
    v31[4] = v13;
    v31[5] = v14;
    v16 = v31;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
          v19 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        else
          v19 = "<nil>";
        v20 = objc_msgSend(*(id *)(a1 + 48), "intValue");
        *(_DWORD *)buf = 136316418;
        v35 = v17;
        v36 = 2080;
        v37 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke_2";
        v38 = 1024;
        v39 = 201;
        v40 = 2080;
        v41 = v19;
        v42 = 1024;
        v43 = v20;
        v44 = 1024;
        v45 = a2;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolved successfully on interface [%d] (interface returned [%d])", buf, 0x32u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setChosenInterface:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2));
    v21 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSockAddr:", a3);
    if (v21)
    {
      v33[0] = v21;
      v32[0] = CFSTR("GKDiscoveryManagerUserInfoSocketAddressKey");
      v32[1] = CFSTR("GKDiscoveryManagerUserInfoPortKey");
      v33[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a4);
      v22 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v24 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      v25 = *(NSObject **)(v23 + 64);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_22;
      v29[3] = &unk_24D4661E0;
      v29[4] = v23;
      v29[5] = v24;
      v29[6] = v22;
      v16 = v29;
      v15 = v25;
    }
    else
    {
      v27 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      v15 = *(NSObject **)(v26 + 64);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__GKDiscoveryManager_resolveForPeer___block_invoke_16;
      block[3] = &unk_24D4661B8;
      block[4] = v27;
      block[5] = v26;
      v16 = block;
    }
  }
  dispatch_async(v15, v16);
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1002, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_16(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __37__GKDiscoveryManager_resolveForPeer___block_invoke_16_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 40), "processEvent:forPeer:withUserInfo:", 1002, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __37__GKDiscoveryManager_resolveForPeer___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1003, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID")))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "interfaces"), "count"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "state") != 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1006, *(_QWORD *)(a1 + 40), 0);
        objc_msgSend(*(id *)(a1 + 40), "flushDataBuffer");
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "didLosePeer:", *(_QWORD *)(a1 + 40));
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "serviceName"))
        v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
      else
        v4 = "<nil>";
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[GKDiscoveryManager resolveForPeer:]_block_invoke";
      v9 = 1024;
      v10 = 232;
      v11 = 2080;
      v12 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] not in dictionary anymore.", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)connectToSockAddr:(sockaddr *)a3 port:(unsigned __int16)a4 forPeer:(id)a5
{
  uint64_t v6;
  GKDiscoveryPeerConnection *v9;
  int ErrorLogLevelForModule;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  _QWORD v19[7];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v9 = -[GKDiscoveryPeerConnection initWithLocalServiceName:]([GKDiscoveryPeerConnection alloc], "initWithLocalServiceName:", -[GKDiscoveryManager localServiceName](self, "localServiceName"));
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke;
  v19[3] = &unk_24D466840;
  v19[4] = a5;
  v19[5] = self;
  v19[6] = v9;
  -[GKDiscoveryPeerConnection setConnectedHandler:](v9, "setConnectedHandler:", v19);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v11 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(a5, "serviceName"))
        v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "serviceName"), "description"), "UTF8String");
      else
        v14 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v21 = v12;
      v22 = 2080;
      v23 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]";
      v24 = 1024;
      v25 = 362;
      v26 = 2080;
      v27 = v14;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] attempting to connect", buf, 0x26u);
    }
  }
  -[GKDiscoveryPeerConnection connectToSockAddr:port:](v9, "connectToSockAddr:port:", a3, v6);
  objc_msgSend(a5, "setTrialConnection:", v9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(a5, "serviceName"))
        v17 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "serviceName"), "description"), "UTF8String");
      else
        v17 = "<nil>";
      v18 = -[GKDiscoveryPeerConnection retainCount](v9, "retainCount");
      *(_DWORD *)buf = 136316162;
      v21 = v15;
      v22 = 2080;
      v23 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]";
      v24 = 1024;
      v25 = 366;
      v26 = 2080;
      v27 = v17;
      v28 = 1024;
      v29 = v18;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] peerConnection retain count [%d]", buf, 0x2Cu);
    }
  }

}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  int8x16_t v36;
  uint64_t v37;
  NSObject *v38;
  _QWORD v39[5];
  int8x16_t v40;
  _QWORD *v41;
  void (**v42)(id, _QWORD);
  _QWORD v43[7];
  _QWORD v44[4];
  int8x16_t v45;
  _QWORD block[6];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      else
        v12 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v48 = v10;
      v49 = 2080;
      v50 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      v51 = 1024;
      v52 = 255;
      v53 = 2080;
      v54 = v12;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection connectedHandler (browser side), remote serviceName [%s]", buf, 0x26u);
    }
  }
  v13 = (void (**)(id, _QWORD))(id)objc_msgSend(a4, "copy");
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
          v27 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        else
          v27 = "<nil>";
        if (objc_msgSend(a5, "localizedDescription"))
          v28 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "localizedDescription"), "description"), "UTF8String");
        else
          v28 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v48 = v14;
        v49 = 2080;
        v50 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        v51 = 1024;
        v52 = 261;
        v53 = 2080;
        v54 = v27;
        v55 = 2080;
        v56 = v28;
        _os_log_error_impl(&dword_215C5C000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer [%s] error in connectedHandler [%s]", buf, 0x30u);
      }
    }
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v18 = *(NSObject **)(v16 + 64);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_26;
    block[3] = &unk_24D4661B8;
    block[4] = v17;
    block[5] = v16;
    dispatch_async(v18, block);
LABEL_11:
    if (v13)
      v13[2](v13, 0);
    return;
  }
  v19 = (id *)(a1 + 32);
  if ((objc_msgSend(+[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:", a2), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "deviceID")) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  v20 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_29;
  v44[3] = &unk_24D4665D8;
  v45 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "setReceiveDataHandler:", v44);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*v19, "serviceName"))
          v23 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v19, "serviceName"), "description"), "UTF8String");
        else
          v23 = "<nil>";
        v29 = *(const char **)(a1 + 48);
        if (objc_msgSend(*(id *)(a1 + 32), "stringForState:", objc_msgSend(*(id *)(a1 + 32), "state")))
          v30 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v19, "stringForState:", objc_msgSend(*v19, "state")), "description"), "UTF8String");
        else
          v30 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v48 = v21;
        v49 = 2080;
        v50 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        v51 = 1024;
        v52 = 321;
        v53 = 2080;
        v54 = v23;
        v55 = 2048;
        v56 = v29;
        v57 = 2080;
        v58 = v30;
        _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionHandler [%s] (browser side) shouldForceConnect == YES; peer.connection [%p] state [%s]",
          buf,
          0x3Au);
      }
    }
    v34 = *(_QWORD *)(a1 + 32);
    v33 = *(_QWORD *)(a1 + 40);
    v35 = *(NSObject **)(v33 + 64);
    v43[0] = v20;
    v43[1] = 3221225472;
    v43[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_32;
    v43[3] = &unk_24D4661E0;
    v43[4] = v33;
    v43[5] = v34;
    v43[6] = *(_QWORD *)(a1 + 48);
    dispatch_async(v35, v43);
    if (v13)
      v13[2](v13, 1);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*v19, "serviceName"))
          v26 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v19, "serviceName"), "description"), "UTF8String");
        else
          v26 = "<nil>";
        v31 = *(const char **)(a1 + 48);
        if (objc_msgSend(*(id *)(a1 + 32), "stringForState:", objc_msgSend(*(id *)(a1 + 32), "state")))
          v32 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v19, "stringForState:", objc_msgSend(*v19, "state")), "description"), "UTF8String");
        else
          v32 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v48 = v24;
        v49 = 2080;
        v50 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke_2";
        v51 = 1024;
        v52 = 333;
        v53 = 2080;
        v54 = v26;
        v55 = 2048;
        v56 = v31;
        v57 = 2080;
        v58 = v32;
        _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectionHandler [%s] (browser side) shouldForceConnect == NO; peer.connection [%p] state [%s]",
          buf,
          0x3Au);
      }
    }
    v39[1] = 3221225472;
    v36 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v37 = *(_QWORD *)(a1 + 40);
    v39[0] = v20;
    v39[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_35;
    v39[3] = &unk_24D466818;
    v39[4] = *(_QWORD *)(a1 + 32);
    v38 = *(NSObject **)(v37 + 64);
    v40 = v36;
    v41 = v44;
    v42 = v13;
    dispatch_async(v38, v39);
  }
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_26(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trialConnection"), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "setTrialConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "processEvent:forPeer:withUserInfo:", 1004, *(_QWORD *)(a1 + 32), 0);
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int8x16_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  _QWORD v14[4];
  int8x16_t v15;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(v4 + 64);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2;
    block[3] = &unk_24D4661E0;
    block[4] = v5;
    block[5] = a3;
    block[6] = v4;
    dispatch_async(v6, block);
  }
  else
  {
    if (!a2)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_30;
      v14[3] = &unk_24D4661B8;
      v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      v15 = v8;
      dispatch_async(v9, v14);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "serviceName"))
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
        else
          v12 = "<nil>";
        v13 = objc_msgSend(a2, "length");
        *(_DWORD *)buf = 136316162;
        v18 = v10;
        v19 = 2080;
        v20 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        v21 = 1024;
        v22 = 312;
        v23 = 2080;
        v24 = v12;
        v25 = 1024;
        v26 = v13;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] passing data (length=%u) to GK", buf, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "passDataToGKLayer:fromPeer:", a2, *(_QWORD *)(a1 + 40));
  }
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2_cold_1(v2, a1);
  }
  return objc_msgSend(*(id *)(a1 + 48), "processEvent:forPeer:withUserInfo:", 1006, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
        v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      else
        v4 = "<nil>";
      v8 = 136315906;
      v9 = v2;
      v10 = 2080;
      v11 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      v12 = 1024;
      v13 = 302;
      v14 = 2080;
      v15 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] connection closed. Setting peer.connection to nil", (uint8_t *)&v8, 0x26u);
    }
  }
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interfaces"), "count");
  v6 = *(void **)(a1 + 40);
  if (v5)
    return objc_msgSend(v6, "processEvent:forPeer:withUserInfo:", 1006, *(_QWORD *)(a1 + 32), 0);
  else
    return objc_msgSend(v6, "didLosePeer:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_32(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v5 = CFSTR("GKDiscoveryManagerUserInfoConnectionKey");
  v6[0] = v3;
  return objc_msgSend(v1, "processEvent:forPeer:withUserInfo:", 1005, v2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

uint64_t __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_35(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  _BOOL4 v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2 == 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        else
          v9 = "<nil>";
        v15 = 136315906;
        v16 = v8;
        v17 = 2080;
        v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        v19 = 1024;
        v20 = 350;
        v21 = 2080;
        v22 = v9;
        v10 = " [%s] %s:%d peer [%s] (browser side) decision == NO.";
        goto LABEL_14;
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setReceiveDataHandler:", *(_QWORD *)(a1 + 56));
    v25 = CFSTR("GKDiscoveryManagerUserInfoConnectionKey");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 48);
    v26[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "processEvent:forPeer:withUserInfo:", 1005, v3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
          v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
        else
          v7 = "<nil>";
        v15 = 136315906;
        v16 = v5;
        v17 = 2080;
        v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
        v19 = 1024;
        v20 = 347;
        v21 = 2080;
        v22 = v7;
        v10 = " [%s] %s:%d peer [%s] (browser side) connected successfully.";
LABEL_14:
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0x26u);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
        v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      else
        v13 = "<nil>";
      v15 = 136316162;
      v16 = v11;
      v17 = 2080;
      v18 = "-[GKDiscoveryManager connectToSockAddr:port:forPeer:]_block_invoke";
      v19 = 1024;
      v20 = 352;
      v21 = 2080;
      v22 = v13;
      v23 = 1024;
      v24 = v2 != 3;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (browser side) about to return decision == %d", (uint8_t *)&v15, 0x2Cu);
    }
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 != 3);
  return result;
}

- (void)processEvent:(int)a3 forPeer:(id)a4 withUserInfo:(id)a5
{
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  dispatch_time_t v30;
  NSObject *peersQueue;
  _QWORD v32[6];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", objc_msgSend(a4, "deviceID"));
  if (v9)
  {
    if (v9 == a4)
    {
      switch(a3)
      {
        case 1000:
          objc_msgSend(a4, "setDiscoveryTimeStamp:", micro());
          return;
        case 1001:
          v18 = micro();
          objc_msgSend(a4, "discoveryTimeStamp");
          v20 = v19 - v18 + 3.0;
          if (v20 >= 0.0)
            v21 = v20;
          else
            v21 = 0.0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (objc_msgSend(a4, "serviceName"))
                v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
              else
                v24 = "<nil>";
              *(_DWORD *)buf = 136316162;
              v34 = v22;
              v35 = 2080;
              v36 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
              v37 = 1024;
              v38 = 404;
              v39 = 2080;
              v40 = v24;
              v41 = 2048;
              v42 = v21;
              _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] time to wait before resolve [%f]", buf, 0x30u);
            }
          }
          v30 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
          peersQueue = self->_peersQueue;
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke;
          v32[3] = &unk_24D4661B8;
          v32[4] = a4;
          v32[5] = self;
          dispatch_after(v30, peersQueue, v32);
          v16 = a4;
          v17 = 1;
          goto LABEL_17;
        case 1002:
          objc_msgSend(a4, "stopResolveTimer");
          if (objc_msgSend(a4, "state") != 3)
            goto LABEL_34;
          return;
        case 1003:
          if (objc_msgSend(a4, "state") == 1)
          {
            -[GKDiscoveryManager connectToSockAddr:port:forPeer:](self, "connectToSockAddr:port:forPeer:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKDiscoveryManagerUserInfoSocketAddressKey")), "sockAddr"), (unsigned __int16)objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKDiscoveryManagerUserInfoPortKey")), "unsignedIntValue"), a4);
            objc_msgSend(a4, "setState:", 2);
          }
          return;
        case 1004:
          if (objc_msgSend(a4, "state") == 3)
            return;
          objc_msgSend(a4, "setState:", 1);
LABEL_34:
          -[GKDiscoveryManager resolveForPeer:](self, "resolveForPeer:", a4);
          break;
        case 1005:
          v25 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKDiscoveryManagerUserInfoConnectionKey"));
          if (v25)
          {
            v26 = v25;
            objc_msgSend(a4, "setConnection:", v25);
            if (objc_msgSend(a4, "trialConnection") != v26)
              objc_msgSend((id)objc_msgSend(a4, "trialConnection"), "invalidate");
            objc_msgSend(a4, "setTrialConnection:", 0);
          }
          objc_msgSend(a4, "setState:", 3);
          objc_msgSend(a4, "flushDataBuffer");
          return;
        case 1006:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (objc_msgSend(a4, "serviceName"))
                v29 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
              else
                v29 = "<nil>";
              *(_DWORD *)buf = 136316162;
              v34 = v27;
              v35 = 2080;
              v36 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
              v37 = 1024;
              v38 = 471;
              v39 = 2080;
              v40 = v29;
              v41 = 1024;
              LODWORD(v42) = objc_msgSend((id)objc_msgSend(a4, "connection"), "retainCount");
              _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] PeerDisconnected event! peerConnection retain count [%d]", buf, 0x2Cu);
            }
          }
          goto LABEL_16;
        default:
          return;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(a4, "serviceName"))
            v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
          else
            v12 = "<nil>";
          *(_DWORD *)buf = 136315906;
          v34 = v10;
          v35 = 2080;
          v36 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
          v37 = 1024;
          v38 = 381;
          v39 = 2080;
          v40 = v12;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] zombie object - this should never happen!.", buf, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(a4, "sendDataBuffer"), "removeAllObjects");
LABEL_16:
      objc_msgSend((id)objc_msgSend(a4, "connection"), "invalidate");
      objc_msgSend(a4, "setConnection:", 0);
      v16 = a4;
      v17 = 0;
LABEL_17:
      objc_msgSend(v16, "setState:", v17);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(a4, "serviceName"))
        v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "serviceName"), "description"), "UTF8String");
      else
        v15 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v34 = v13;
      v35 = 2080;
      v36 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]";
      v37 = 1024;
      v38 = 375;
      v39 = 2080;
      v40 = v15;
      v41 = 1024;
      LODWORD(v42) = a3;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] event [%d] not in dictionary anymore.", buf, 0x2Cu);
    }
  }
}

void __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "serviceName"))
        v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "serviceName"), "description"), "UTF8String");
      else
        v4 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v10 = v2;
      v11 = 2080;
      v12 = "-[GKDiscoveryManager processEvent:forPeer:withUserInfo:]_block_invoke";
      v13 = 1024;
      v14 = 409;
      v15 = 2080;
      v16 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] ready to start interface selection", buf, 0x26u);
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v5 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke_37;
  v8[3] = &unk_24D4661B8;
  v8[4] = v6;
  v8[5] = v5;
  dispatch_async(v7, v8);
}

uint64_t __56__GKDiscoveryManager_processEvent_forPeer_withUserInfo___block_invoke_37(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOrderedInterfaces:", objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", +[GKInterfacePrioritizer prioritizeLocalInterfaces:](GKInterfacePrioritizer, "prioritizeLocalInterfaces:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interfaces"), "allObjects"))));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attemptedInterfaces"), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 40), "resolveForPeer:", *(_QWORD *)(a1 + 32));
}

- (void)passDataToGKLayer:(id)a3 fromPeer:(id)a4
{
  NSObject *peersQueue;
  _QWORD block[7];

  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__GKDiscoveryManager_passDataToGKLayer_fromPeer___block_invoke;
  block[3] = &unk_24D4661E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __49__GKDiscoveryManager_passDataToGKLayer_fromPeer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "serviceNameforDeviceID:playerID:", objc_msgSend(*(id *)(a1 + 40), "deviceID"), objc_msgSend(*(id *)(a1 + 40), "playerID"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID")))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    if (v3)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, objc_msgSend(*(id *)(a1 + 40), "playerID"), objc_msgSend(*(id *)(a1 + 40), "deviceID"), *(_QWORD *)(a1 + 48));
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v7;
        v14 = 2080;
        v15 = "-[GKDiscoveryManager passDataToGKLayer:fromPeer:]_block_invoke";
        v16 = 1024;
        v17 = 495;
        v9 = " [%s] %s:%d receiveDataHandler is not set, cannot pass data to the GameKit layer.";
        v10 = v8;
        v11 = 28;
LABEL_13:
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v2)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v12 = 136315906;
      v13 = v4;
      v14 = 2080;
      v15 = "-[GKDiscoveryManager passDataToGKLayer:fromPeer:]_block_invoke";
      v16 = 1024;
      v17 = 489;
      v18 = 2080;
      v19 = v6;
      v9 = " [%s] %s:%d received data from [%s], but peer not in dictionary anymore.";
      v10 = v5;
      v11 = 38;
      goto LABEL_13;
    }
  }
}

- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4
{
  int ErrorLogLevelForModule;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  GKDiscoveryBonjour *bonjour;
  GKDiscoveryBonjour *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[GKDiscoveryManager setPlayerID:](self, "setPlayerID:");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v8 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v11 = "<nil>";
      if (-[GKDiscoveryManager localServiceName](self, "localServiceName"))
      {
        v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager localServiceName](self, "localServiceName"), "description"), "UTF8String");
        if (a4)
        {
LABEL_8:
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_11:
          *(_DWORD *)buf = 136316418;
          v24 = v9;
          v25 = 2080;
          v26 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]";
          v27 = 1024;
          v28 = 505;
          v29 = 2080;
          v30 = v11;
          v31 = 2080;
          v32 = v12;
          v33 = 2080;
          v34 = v13;
          _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am [%s] [%s] discoveryInfo [%s]", buf, 0x3Au);
          goto LABEL_12;
        }
      }
      else
      {
        v12 = "<nil>";
        if (a4)
          goto LABEL_8;
      }
      v13 = "<nil>";
      goto LABEL_11;
    }
  }
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryManager peersList](self, "peersList"))
        v16 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      else
        v16 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v24 = v14;
      v25 = 2080;
      v26 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]";
      v27 = 1024;
      v28 = 506;
      v29 = 2080;
      v30 = v16;
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startAdvertising peers=[%s]", buf, 0x26u);
    }
  }
  v17 = MEMORY[0x24BDAC760];
  bonjour = self->_bonjour;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke;
  v22[3] = &unk_24D4668B8;
  v22[4] = self;
  -[GKDiscoveryBonjour setConnectionCallback:](bonjour, "setConnectionCallback:", v22);
  v19 = self->_bonjour;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_46;
  v21[3] = &unk_24D4668E0;
  v21[4] = self;
  -[GKDiscoveryBonjour setServiceNameCollisionCallback:](v19, "setServiceNameCollisionCallback:", v21);
  -[GKDiscoveryBonjour startAdvertisingServiceName:discoveryInfo:](self->_bonjour, "startAdvertisingServiceName:discoveryInfo:", -[GKDiscoveryManager localServiceName](self, "localServiceName"), a4);
  return 0;
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  GKDiscoveryPeerConnection *v9;
  int LocalIFIndexForBoundSocket;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _WORD v22[17];

  *(_QWORD *)&v22[13] = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v5 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule > 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "localServiceName"))
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "localServiceName"), "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v16 = v6;
      v17 = 2080;
      v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      v19 = 1024;
      v20 = 510;
      v21 = 1024;
      *(_DWORD *)v22 = a2;
      v22[2] = 2080;
      *(_QWORD *)&v22[3] = v8;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d advertising connection callback, socket [%d] localServiceName [%s]", buf, 0x2Cu);
    }
  }
  v9 = -[GKDiscoveryPeerConnection initWithLocalServiceName:]([GKDiscoveryPeerConnection alloc], "initWithLocalServiceName:", objc_msgSend(*(id *)(a1 + 32), "localServiceName"));
  LocalIFIndexForBoundSocket = GetLocalIFIndexForBoundSocket();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_40;
  v13[3] = &unk_24D466890;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = v9;
  v14 = LocalIFIndexForBoundSocket;
  -[GKDiscoveryPeerConnection setConnectedHandler:](v9, "setConnectedHandler:", v13);
  -[GKDiscoveryPeerConnection attachSocketDescriptor:](v9, "attachSocketDescriptor:", a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      v19 = 1024;
      v20 = 627;
      v21 = 2048;
      *(_QWORD *)v22 = v9;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection (advertiser side) created (%p)", buf, 0x26u);
    }
  }

}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_40(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  _QWORD block[5];
  __int128 v15;
  void (**v16)(id, _QWORD);
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      else
        v11 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v19 = v9;
      v20 = 2080;
      v21 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      v22 = 1024;
      v23 = 518;
      v24 = 2080;
      v25 = v11;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerConnection connectedHandler (advertiser side), remote ServiceName [%s]", buf, 0x26u);
    }
  }
  v12 = (void (**)(id, _QWORD))(id)objc_msgSend(a4, "copy");
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
    {
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_40_cold_1();
      if (v12)
        goto LABEL_11;
    }
    else if (v12)
    {
LABEL_11:
      v12[2](v12, 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_41;
    block[3] = &unk_24D466868;
    block[4] = a2;
    v15 = *(_OWORD *)(a1 + 32);
    v13 = *(NSObject **)(v15 + 64);
    v17 = *(_DWORD *)(a1 + 48);
    v16 = v12;
    dispatch_async(v13, block);
  }
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_41(uint64_t a1)
{
  id *v2;
  id v3;
  GKDiscoveryPeer *v4;
  GKDiscoveryPeer *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  GKDiscoveryPeer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  int v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, uint64_t);
  void *v33;
  uint64_t v34;
  GKDiscoveryPeer *v35;
  const __CFString *v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = +[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:", *(_QWORD *)(a1 + 32));
  v4 = (GKDiscoveryPeer *)(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v3);
  if (v4)
  {
    v5 = v4;
    v6 = -[GKDiscoveryPeer state](v4, "state");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (*v2)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(*v2, "description"), "UTF8String");
        else
          v9 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v39 = v7;
        v40 = 2080;
        v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        v42 = 1024;
        v43 = 553;
        v44 = 2080;
        v45 = v9;
        v46 = 1024;
        v47 = -[GKDiscoveryPeer state](v5, "state");
        v48 = 1024;
        v49 = v6 != 3;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (advertiser side) peer already in dictionary [state = %d], decision = %d.", buf, 0x32u);
      }
    }
    if (v6 != 3)
    {
      objc_msgSend(*(id *)(a1 + 40), "processEvent:forPeer:withUserInfo:", 1006, v5, 0);
LABEL_18:
      v14 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (*v2)
          v12 = (const char *)objc_msgSend((id)objc_msgSend(*v2, "description"), "UTF8String");
        else
          v12 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v39 = v10;
        v40 = 2080;
        v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        v42 = 1024;
        v43 = 540;
        v44 = 2080;
        v45 = v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] (advertiser side) peer not in dictionary, creating one, decision = YES.", buf, 0x26u);
      }
    }
    v13 = -[GKDiscoveryPeer initWithServiceName:]([GKDiscoveryPeer alloc], "initWithServiceName:", *v2);
    if (v13)
    {
      v5 = v13;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", v13, v3);
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_41_cold_1(v15, (id *)(a1 + 32));
    }
    v5 = 0;
  }
  v14 = 0;
LABEL_24:
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43;
  v33 = &unk_24D4665D8;
  v34 = *(_QWORD *)(a1 + 40);
  v35 = v5;
  if ((_DWORD)v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "setReceiveDataHandler:", &v30);
    v17 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v36 = CFSTR("GKDiscoveryManagerUserInfoConnectionKey");
    v37 = v16;
    objc_msgSend(v17, "processEvent:forPeer:withUserInfo:", 1005, v5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v30, v31, v32, v33, v34, v35));
    if (*(_DWORD *)(a1 + 64))
    {
      v18 = -[GKDiscoveryPeer interfaces](v5, "interfaces");
      -[NSMutableSet addObject:](v18, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64)));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (-[GKDiscoveryPeer serviceName](v5, "serviceName"))
          v21 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](v5, "serviceName"), "description"), "UTF8String");
        else
          v21 = "<nil>";
        v25 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        v39 = v19;
        v40 = 2080;
        v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        v42 = 1024;
        v43 = 615;
        v44 = 2080;
        v45 = v21;
        v46 = 1024;
        v47 = v25;
        v26 = " [%s] %s:%d peer [%s] connected (advertiser side, interface index [%d]) successfully.";
        v27 = v20;
        v28 = 44;
LABEL_39:
        _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryPeer serviceName](v5, "serviceName", v30, v31, v32, v33, v34, v35))
        v24 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](v5, "serviceName"), "description"), "UTF8String");
      else
        v24 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v39 = v22;
      v40 = 2080;
      v41 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
      v42 = 1024;
      v43 = 617;
      v44 = 2080;
      v45 = v24;
      v26 = " [%s] %s:%d peer [%s] (advertiser side) decision == NO.";
      v27 = v23;
      v28 = 38;
      goto LABEL_39;
    }
  }
  v29 = *(_QWORD *)(a1 + 56);
  if (v29)
    (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, v14);

}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_43(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD block[4];
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2;
    block[3] = &unk_24D4661E0;
    v13 = *(_OWORD *)(a1 + 32);
    v4 = *(NSObject **)(v13 + 64);
    v14 = a3;
    dispatch_async(v4, block);
  }
  else
  {
    if (!a2)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44;
      v10[3] = &unk_24D4661B8;
      v11 = *(_OWORD *)(a1 + 32);
      dispatch_async(*(dispatch_queue_t *)(v11 + 64), v10);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "serviceName"))
          v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "serviceName"), "description"), "UTF8String");
        else
          v8 = "<nil>";
        v9 = objc_msgSend(a2, "length");
        *(_DWORD *)buf = 136316162;
        v16 = v6;
        v17 = 2080;
        v18 = "-[GKDiscoveryManager startAdvertisingLocalPlayer:discoveryInfo:]_block_invoke";
        v19 = 1024;
        v20 = 589;
        v21 = 2080;
        v22 = v8;
        v23 = 1024;
        v24 = v9;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] passing received data (length=%u) to GK", buf, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "passDataToGKLayer:fromPeer:", a2, *(_QWORD *)(a1 + 40));
  }
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1006, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1006, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_46(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDeviceID:", objc_msgSend(*(id *)(a1 + 32), "generateDeviceID"));
  return objc_msgSend(*(id *)(a1 + 32), "localServiceName");
}

- (id)serviceNameforDeviceID:(id)a3 playerID:(id)a4
{
  uint64_t v5;

  if (a3 && a4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@+%@"), a3, a4);
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), a3, v5);
  return 0;
}

- (id)localServiceName
{
  return -[GKDiscoveryManager serviceNameforDeviceID:playerID:](self, "serviceNameforDeviceID:playerID:", self->_deviceID, self->_playerID);
}

+ (id)parseDeviceIDFromServiceName:(id)a3
{
  void *v4;

  v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a3), "scanUpToString:intoString:", CFSTR("+"), &v4);
  return v4;
}

- (void)stopAdvertising
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryManager peersList](self, "peersList"))
        v5 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      else
        v5 = "<nil>";
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[GKDiscoveryManager stopAdvertising]";
      v10 = 1024;
      v11 = 664;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop advertising - peers=[\n%s]", (uint8_t *)&v6, 0x26u);
    }
  }
  -[GKDiscoveryBonjour stopAdvertising](self->_bonjour, "stopAdvertising");
}

- (void)cleanUpPeersForBrowse
{
  NSObject *peersQueue;
  _QWORD block[5];

  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__GKDiscoveryManager_cleanUpPeersForBrowse__block_invoke;
  block[3] = &unk_24D466170;
  block[4] = self;
  dispatch_async(peersQueue, block);
}

uint64_t __43__GKDiscoveryManager_cleanUpPeersForBrowse__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  const char *v6;
  os_log_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  os_log_t *v15;
  const char *v16;
  const char *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
  if (result)
  {
    v5 = result;
    v6 = "";
    v7 = (os_log_t *)MEMORY[0x24BDFDC28];
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v4 = 136316162;
    v18 = v4;
    v19 = v1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v2);
        v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9), v18);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v6;
            v14 = v2;
            v15 = v7;
            if (objc_msgSend(v10, "playerID"))
              v16 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "playerID"), "description"), "UTF8String");
            else
              v16 = "<nil>";
            if (objc_msgSend(v10, "deviceID"))
              v17 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "deviceID"), "description"), "UTF8String");
            else
              v17 = "<nil>";
            *(_DWORD *)buf = v18;
            v25 = v11;
            v26 = 2080;
            v27 = "-[GKDiscoveryManager cleanUpPeersForBrowse]_block_invoke";
            v28 = 1024;
            v29 = 672;
            v30 = 2080;
            v31 = v16;
            v32 = 2080;
            v33 = v17;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d invalidating peer: %s device: %s", buf, 0x30u);
            v7 = v15;
            v2 = v14;
            v6 = v13;
            v1 = v19;
          }
        }
        objc_msgSend(v10, "cleanUpForBrowse");
        objc_msgSend(v10, "setShouldSignalDiscovery:", 1);
        ++v9;
      }
      while (v5 != v9);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)startBrowsingLocalPlayer:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  GKDiscoveryBonjour *bonjour;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryManager peersList](self, "peersList"))
        v7 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v11 = v5;
      v12 = 2080;
      v13 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]";
      v14 = 1024;
      v15 = 680;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start browsing - peers=[\n%s]", buf, 0x26u);
    }
  }
  -[GKDiscoveryManager cleanUpPeersForBrowse](self, "cleanUpPeersForBrowse");
  -[GKDiscoveryManager setPlayerID:](self, "setPlayerID:", a3);
  bonjour = self->_bonjour;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke;
  v9[3] = &unk_24D466958;
  v9[4] = self;
  -[GKDiscoveryBonjour startBrowsing:](bonjour, "startBrowsing:", v9);
}

void __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, void *a5, int a6)
{
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  _QWORD block[6];
  int v24;
  _QWORD v25[7];
  int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = +[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:");
  if (a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_cold_1(v13, a6, v14);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "isEqualToString:", v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v15;
        v29 = 2080;
        v30 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
        v31 = 1024;
        v32 = 695;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ignoring self for now.", buf, 0x1Cu);
      }
    }
  }
  else if (a3)
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 64);
    if (a2)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_56;
      v25[3] = &unk_24D466908;
      v26 = a4;
      v25[4] = v17;
      v25[5] = a5;
      v25[6] = a3;
      v19 = v25;
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_2;
      block[3] = &unk_24D466930;
      v24 = a4;
      block[4] = v17;
      block[5] = a3;
      v19 = block;
    }
    dispatch_async(v18, v19);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v22 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v22 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v28 = v20;
      v29 = 2080;
      v30 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
      v31 = 1024;
      v32 = 698;
      v33 = 1024;
      v34 = a4;
      v35 = 2080;
      v36 = v22;
      _os_log_error_impl(&dword_215C5C000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d serviceName is nil - ignoring peer - interface [%d] discoveryInfo [%s]", buf, 0x2Cu);
    }
  }
}

uint64_t __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInterface:withDiscoveryInfo:forPeerWithServiceName:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeInterface:forPeerWithServiceName:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)stopBrowsing
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryManager peersList](self, "peersList"))
        v5 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
      else
        v5 = "<nil>";
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[GKDiscoveryManager stopBrowsing]";
      v10 = 1024;
      v11 = 718;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop browsing - peers=[\n%s]", (uint8_t *)&v6, 0x26u);
    }
  }
  -[GKDiscoveryBonjour stopBrowsing](self->_bonjour, "stopBrowsing");
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  id v15;
  NSObject *peersQueue;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        if (a4)
        {
LABEL_5:
          v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316418;
          v19 = v11;
          v20 = 2080;
          v21 = "-[GKDiscoveryManager sendDataToParticipant:deviceID:data:withCompletionHandler:]";
          v22 = 1024;
          v23 = 723;
          v24 = 2080;
          v25 = v13;
          v26 = 2080;
          v27 = v14;
          v28 = 2048;
          v29 = objc_msgSend(a5, "length");
          _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d to playerID [%s] deviceID [%s] dataSize [%lu]", buf, 0x3Au);
          goto LABEL_9;
        }
      }
      else
      {
        v13 = "<nil>";
        if (a4)
          goto LABEL_5;
      }
      v14 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  v15 = (id)objc_msgSend(a6, "copy");
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke;
  block[3] = &unk_24D466980;
  block[4] = self;
  block[5] = a4;
  block[7] = a5;
  block[8] = v15;
  block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    if (!objc_msgSend(v2, "state"))
      objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1001, v3, 0);
    objc_msgSend(v3, "sendData:withCompletionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke_cold_1(v4, a1);
    }
    if (*(_QWORD *)(a1 + 64))
    {
      v5 = *MEMORY[0x24BDD0FC8];
      v6[0] = CFSTR("Peer does not exist");
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryManager"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *peersQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = -[GKDiscoveryManager serviceNameforDeviceID:playerID:](self, "serviceNameforDeviceID:playerID:", a4, a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      else
        v10 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v14 = v8;
      v15 = 2080;
      v16 = "-[GKDiscoveryManager forgetParticipant:deviceID:]";
      v17 = 1024;
      v18 = 754;
      v19 = 2080;
      v20 = v10;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forget peer [%s]", buf, 0x26u);
    }
  }
  peersQueue = self->_peersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__GKDiscoveryManager_forgetParticipant_deviceID___block_invoke;
  block[3] = &unk_24D4661E0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(peersQueue, block);
}

void __49__GKDiscoveryManager_forgetParticipant_deviceID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "processEvent:forPeer:withUserInfo:", 1006, v3, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 48);
      if (v6)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      else
        v7 = "<nil>";
      v8 = *(void **)(a1 + 40);
      if (v8)
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      else
        v9 = "<nil>";
      v10 = 136316162;
      v11 = v4;
      v12 = 2080;
      v13 = "-[GKDiscoveryManager forgetParticipant:deviceID:]_block_invoke";
      v14 = 1024;
      v15 = 759;
      v16 = 2080;
      v17 = v7;
      v18 = 2080;
      v19 = v9;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d can't remove peer with %s with device id %s, no such peer exists", (uint8_t *)&v10, 0x30u);
    }
  }
}

- (void)addInterface:(unsigned int)a3 withDiscoveryInfo:(id)a4 forPeerWithServiceName:(id)a5
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;
  id v21;
  void *v22;
  GKDiscoveryPeer *v23;
  GKDiscoveryPeer *v24;
  NSString *v25;
  NSString *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  int v46;
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryManager peersList](self, "peersList"))
      {
        v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryManager peersList](self, "peersList"), "description"), "UTF8String");
        if (a5)
        {
LABEL_5:
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
LABEL_8:
          v46 = 136316418;
          v47 = v10;
          v48 = 2080;
          v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          v50 = 1024;
          v51 = 774;
          v52 = 2080;
          *(_QWORD *)v53 = v12;
          *(_WORD *)&v53[8] = 1024;
          *(_DWORD *)&v53[10] = a3;
          *(_WORD *)&v53[14] = 2080;
          *(_QWORD *)&v53[16] = v13;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peers=[\n%s] add interface [%d] for serviceName [%s]", (uint8_t *)&v46, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        v12 = "<nil>";
        if (a5)
          goto LABEL_5;
      }
      v13 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  v14 = +[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:", a5);
  v15 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", v14);
  if (v15)
  {
    v16 = v15;
    if (objc_msgSend((id)objc_msgSend(v15, "interfaces"), "containsObject:", v9))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(v9, "intValue");
          if (a5)
            v20 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
          else
            v20 = "<nil>";
          v46 = 136316162;
          v47 = v17;
          v48 = 2080;
          v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          v50 = 1024;
          v51 = 812;
          v52 = 1024;
          *(_DWORD *)v53 = v19;
          *(_WORD *)&v53[4] = 2080;
          *(_QWORD *)&v53[6] = v20;
          v35 = " [%s] %s:%d asked to add already existing interface (%d) for service name %s";
          v36 = v18;
          v37 = 44;
          goto LABEL_46;
        }
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v16, "interfaces"), "addObject:", v9);
      if (objc_msgSend((id)objc_msgSend(v16, "orderedInterfaces"), "count")
        || objc_msgSend((id)objc_msgSend(v16, "attemptedInterfaces"), "count"))
      {
        objc_msgSend((id)objc_msgSend(v16, "orderedInterfaces"), "addObject:", v9);
        objc_msgSend(v16, "setOrderedInterfaces:", objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", +[GKInterfacePrioritizer prioritizeLocalInterfaces:](GKInterfacePrioritizer, "prioritizeLocalInterfaces:", objc_msgSend(v16, "orderedInterfaces"))));
      }
      if (objc_msgSend(v16, "shouldSignalDiscovery") && self->_playerFoundHandler)
      {
        if (!objc_msgSend(v16, "state"))
          -[GKDiscoveryManager processEvent:forPeer:withUserInfo:](self, "processEvent:forPeer:withUserInfo:", 1000, v16, 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            if (a5)
              v32 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
            else
              v32 = "<nil>";
            v46 = 136315906;
            v47 = v30;
            v48 = 2080;
            v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
            v50 = 1024;
            v51 = 832;
            v52 = 2080;
            *(_QWORD *)v53 = v32;
            _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d signaling discovery of an existing peer [%s] to GK", (uint8_t *)&v46, 0x26u);
          }
        }
        (*((void (**)(id, uint64_t, uint64_t, id))self->_playerFoundHandler + 2))(self->_playerFoundHandler, objc_msgSend(v16, "playerID"), objc_msgSend(v16, "deviceID"), a4);
        objc_msgSend(v16, "setShouldSignalDiscovery:", 0);
      }
    }
  }
  else
  {
    v21 = -[GKDiscoveryManager localServiceName](self, "localServiceName");
    if (v21)
    {
      v22 = v21;
      v23 = -[GKDiscoveryPeer initWithServiceName:]([GKDiscoveryPeer alloc], "initWithServiceName:", a5);
      if (v23)
      {
        v24 = v23;
        -[NSMutableSet addObject:](-[GKDiscoveryPeer interfaces](v23, "interfaces"), "addObject:", v9);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peers, "setObject:forKeyedSubscript:", v24, v14);
        v25 = -[GKDiscoveryPeer playerID](v24, "playerID");
        v26 = -[GKDiscoveryPeer deviceID](v24, "deviceID");
        if (self->_playerFoundHandler)
        {
          -[GKDiscoveryManager processEvent:forPeer:withUserInfo:](self, "processEvent:forPeer:withUserInfo:", 1000, v24, 0);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (a5)
                v29 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
              else
                v29 = "<nil>";
              v46 = 136315906;
              v47 = v27;
              v48 = 2080;
              v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
              v50 = 1024;
              v51 = 802;
              v52 = 2080;
              *(_QWORD *)v53 = v29;
              _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d signaling discovery of a new peer [%s] to GK", (uint8_t *)&v46, 0x26u);
            }
          }
          (*((void (**)(void))self->_playerFoundHandler + 2))();
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v41 = VRTraceErrorLogLevelToCSTR();
          v42 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            if (v25)
              v43 = -[NSString UTF8String](-[NSString description](v25, "description"), "UTF8String");
            else
              v43 = "<nil>";
            if (v26)
              v45 = -[NSString UTF8String](-[NSString description](v26, "description"), "UTF8String");
            else
              v45 = "<nil>";
            v46 = 136316162;
            v47 = v41;
            v48 = 2080;
            v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
            v50 = 1024;
            v51 = 805;
            v52 = 2080;
            *(_QWORD *)v53 = v43;
            *(_WORD *)&v53[8] = 2080;
            *(_QWORD *)&v53[10] = v45;
            _os_log_error_impl(&dword_215C5C000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d playerFoundHandler is not set, found %s with device id %s, but cannot inform the GameKit layer.", (uint8_t *)&v46, 0x30u);
          }
        }
        -[GKDiscoveryPeer setShouldSignalDiscovery:](v24, "setShouldSignalDiscovery:", 0);

      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          if (a5)
            v40 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
          else
            v40 = "<nil>";
          v44 = objc_msgSend((id)objc_msgSend(v22, "description"), "UTF8String");
          v46 = 136316162;
          v47 = v38;
          v48 = 2080;
          v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
          v50 = 1024;
          v51 = 790;
          v52 = 2080;
          *(_QWORD *)v53 = v40;
          *(_WORD *)&v53[8] = 2080;
          *(_QWORD *)&v53[10] = v44;
          _os_log_error_impl(&dword_215C5C000, v39, OS_LOG_TYPE_ERROR, " [%s] %s:%d peer initialization for serviceName: %s and localServiceName: %s failed", (uint8_t *)&v46, 0x30u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v46 = 136315650;
        v47 = v33;
        v48 = 2080;
        v49 = "-[GKDiscoveryManager addInterface:withDiscoveryInfo:forPeerWithServiceName:]";
        v50 = 1024;
        v51 = 785;
        v35 = " [%s] %s:%d localServiceName is nil; ignoring browseCallback";
        v36 = v34;
        v37 = 28;
LABEL_46:
        _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v46, v37);
      }
    }
  }
}

- (id)peersList
{
  void *v3;
  NSMutableDictionary *peers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  peers = self->_peers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(peers);
        objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\" - %@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)), "description"));
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](peers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)didLosePeer:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id playerLostHandler;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(a3, "serviceName"))
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
      else
        v7 = "<nil>";
      v14 = 136315906;
      v15 = v5;
      v16 = 2080;
      v17 = "-[GKDiscoveryManager didLosePeer:]";
      v18 = 1024;
      v19 = 850;
      v20 = 2080;
      v21 = v7;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] peer lost!", (uint8_t *)&v14, 0x26u);
    }
  }
  -[GKDiscoveryManager processEvent:forPeer:withUserInfo:](self, "processEvent:forPeer:withUserInfo:", 1006, a3, 0);
  objc_msgSend(a3, "flushDataBuffer");
  playerLostHandler = self->_playerLostHandler;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (playerLostHandler)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(a3, "serviceName"))
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "serviceName"), "description"), "UTF8String");
        else
          v12 = "<nil>";
        v14 = 136315906;
        v15 = v10;
        v16 = 2080;
        v17 = "-[GKDiscoveryManager didLosePeer:]";
        v18 = 1024;
        v19 = 861;
        v20 = 2080;
        v21 = v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] about to notify GK that the peer was lost", (uint8_t *)&v14, 0x26u);
      }
    }
    (*((void (**)(id, uint64_t, uint64_t))self->_playerLostHandler + 2))(self->_playerLostHandler, objc_msgSend(a3, "playerID"), objc_msgSend(a3, "deviceID"));
    objc_msgSend(a3, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_peers, "removeObjectForKey:", objc_msgSend(a3, "deviceID"));
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKDiscoveryManager didLosePeer:].cold.1(v13, a3);
  }
}

- (void)removeInterface:(unsigned int)a3 forPeerWithServiceName:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peers, "objectForKeyedSubscript:", +[GKDiscoveryManager parseDeviceIDFromServiceName:](GKDiscoveryManager, "parseDeviceIDFromServiceName:", a4));
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return;
    v15 = objc_msgSend(v7, "intValue");
    if (a4)
      v16 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    else
      v16 = "<nil>";
    v24 = 136316162;
    v25 = v13;
    v26 = 2080;
    v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
    v28 = 1024;
    v29 = 874;
    v30 = 1024;
    *(_DWORD *)v31 = v15;
    *(_WORD *)&v31[4] = 2080;
    *(_QWORD *)&v31[6] = v16;
    v20 = " [%s] %s:%d cannot remove interface (%d) because service name %s does not exist";
LABEL_22:
    _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, 0x2Cu);
    return;
  }
  v9 = v8;
  if ((objc_msgSend((id)objc_msgSend(v8, "interfaces"), "containsObject:", v7) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v17 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return;
    v18 = objc_msgSend(v7, "intValue");
    if (a4)
      v19 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    else
      v19 = "<nil>";
    v24 = 136316162;
    v25 = v17;
    v26 = 2080;
    v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
    v28 = 1024;
    v29 = 879;
    v30 = 1024;
    *(_DWORD *)v31 = v18;
    *(_WORD *)&v31[4] = 2080;
    *(_QWORD *)&v31[6] = v19;
    v20 = " [%s] %s:%d cannot remove interface (%d) for service name %s because it is not in the interfaces set";
    goto LABEL_22;
  }
  objc_msgSend(v9, "didLoseInterface:", v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v12 = "<nil>";
      if (objc_msgSend(v9, "stringForState:", objc_msgSend(v9, "state")))
        v21 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stringForState:", objc_msgSend(v9, "state")), "description"), "UTF8String");
      else
        v21 = "<nil>";
      v22 = objc_msgSend(v9, "connection");
      if (objc_msgSend((id)objc_msgSend(v9, "interfaces"), "description"))
        v23 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "interfaces"), "description"), "description"), "UTF8String");
      else
        v23 = "<nil>";
      v24 = 136316930;
      v25 = v10;
      v26 = 2080;
      v27 = "-[GKDiscoveryManager removeInterface:forPeerWithServiceName:]";
      v28 = 1024;
      v29 = 886;
      v30 = 2080;
      *(_QWORD *)v31 = v12;
      *(_WORD *)&v31[8] = 2080;
      *(_QWORD *)&v31[10] = v21;
      v32 = 1024;
      v33 = a3;
      v34 = 2048;
      v35 = v22;
      v36 = 2080;
      v37 = v23;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] state [%s] removed interface [%d] peerConnection [%p] remaining interfaces [%s]", (uint8_t *)&v24, 0x4Au);
    }
  }
  if (objc_msgSend((id)objc_msgSend(v9, "chosenInterface"), "isEqualToNumber:", v7)
    && objc_msgSend(v9, "state") == 3)
  {
    -[GKDiscoveryManager processEvent:forPeer:withUserInfo:](self, "processEvent:forPeer:withUserInfo:", 1006, v9, 0);
  }
  if (!objc_msgSend((id)objc_msgSend(v9, "interfaces"), "count") && !objc_msgSend(v9, "state"))
    -[GKDiscoveryManager didLosePeer:](self, "didLosePeer:", v9);
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (id)playerFoundHandler
{
  return self->_playerFoundHandler;
}

- (void)setPlayerFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)playerLostHandler
{
  return self->_playerLostHandler;
}

- (void)setPlayerLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GKDiscoveryBonjour)bonjour
{
  return self->_bonjour;
}

- (void)setBonjour:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

void __37__GKDiscoveryManager_resolveForPeer___block_invoke_16_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_1();
  if (objc_msgSend(*(id *)(v1 + 32), "serviceName"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v0 + 32), "serviceName"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v2, v3, " [%s] %s:%d peer [%s] invalid sockaddr", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7_3();
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_cold_1()
{
  id *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_1();
  if (objc_msgSend(*v1, "serviceName"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*v0, "serviceName"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v2, v3, " [%s] %s:%d stale service name [%s] advertised - closing connection", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7_3();
}

void __53__GKDiscoveryManager_connectToSockAddr_port_forPeer___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  if (objc_msgSend(*(id *)(a2 + 32), "serviceName"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 32), "serviceName"), "description"), "UTF8String");
  if (objc_msgSend(*(id *)(a2 + 40), "localizedDescription"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 40), "localizedDescription"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5_0(&dword_215C5C000, v3, v4, " [%s] %s:%d peer [%s] data received with error %s", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_20();
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_40_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_1();
  if (objc_msgSend(v1, "localizedDescription"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v0, "localizedDescription"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v2, v3, " [%s] %s:%d peerConnection connectedHandler (advertiser side) - error [%s]", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7_3();
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_41_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v2, v3, " [%s] %s:%d unrecognized remoteServiceName [%s] - peer init failed", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(*(id *)(v1 + 40), "deviceID");
  v2 = OUTLINED_FUNCTION_8_1();
  if (OUTLINED_FUNCTION_3_3(v2))
  {
    objc_msgSend(*(id *)(v0 + 40), "deviceID");
    v3 = OUTLINED_FUNCTION_8_1();
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_3_3(v3), "description"), "UTF8String");
  }
  if (objc_msgSend(*(id *)(v0 + 48), "localizedDescription"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v0 + 48), "localizedDescription"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_0(&dword_215C5C000, v4, v5, " [%s] %s:%d data from peer [%s] received with error %s", v6, v7, v8, v9, v10);
}

void __64__GKDiscoveryManager_startAdvertisingLocalPlayer_discoveryInfo___block_invoke_44_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(*(id *)(v1 + 40), "deviceID");
  v2 = OUTLINED_FUNCTION_8_1();
  if (OUTLINED_FUNCTION_3_3(v2))
  {
    objc_msgSend(*(id *)(v0 + 40), "deviceID");
    v3 = OUTLINED_FUNCTION_8_1();
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_3_3(v3), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v4, v5, " [%s] %s:%d nil data from peer [%s] received -- should not happen", v6, v7, v8, v9, v10);
}

void __47__GKDiscoveryManager_startBrowsingLocalPlayer___block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[GKDiscoveryManager startBrowsingLocalPlayer:]_block_invoke";
  v7 = 1024;
  v8 = 690;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_215C5C000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d browsing callback returned an error (%d) - currently not handled.", (uint8_t *)&v3, 0x22u);
}

void __80__GKDiscoveryManager_sendDataToParticipant_deviceID_data_withCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = *(void **)(a2 + 48);
  if (v2)
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v3, v4, " [%s] %s:%d can't send data to participant %s: peer does not exist", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_2();
}

- (void)didLosePeer:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  if (objc_msgSend(a2, "playerID"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "playerID"), "description"), "UTF8String");
  if (objc_msgSend(a2, "deviceID"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "deviceID"), "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5_0(&dword_215C5C000, v3, v4, " [%s] %s:%d playerLostHandler is not set, removed %s with device id %s, but cannot inform the GameKit layer.", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_20();
}

@end
