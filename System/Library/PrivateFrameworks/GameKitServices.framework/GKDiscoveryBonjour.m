@implementation GKDiscoveryBonjour

- (GKDiscoveryBonjour)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDiscoveryBonjour;
  -[GKDiscoveryBonjour doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (GKDiscoveryBonjour)initWithDomain:(id)a3 type:(id)a4
{
  GKDiscoveryBonjour *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDiscoveryBonjour;
  v6 = -[GKDiscoveryBonjour init](&v8, sel_init);
  if (v6)
  {
    v6->_serviceDomain = (NSString *)objc_msgSend(a3, "copy");
    v6->_serviceType = (NSString *)objc_msgSend(a4, "copy");
    v6->_launchdSources = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6->_resolveContainers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->_resolveContainersSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamed.GKDiscoveryBonjour.resolveContanersSyncQueue", 0);
  }
  return v6;
}

- (BOOL)isAppleTV
{
  if (isAppleTV_predicate != -1)
    dispatch_once(&isAppleTV_predicate, &__block_literal_global_1);
  return isAppleTV_deviceClass == 4;
}

void __31__GKDiscoveryBonjour_isAppleTV__block_invoke()
{
  void *v0;

  v0 = (void *)MGCopyAnswer();
  isAppleTV_deviceClass = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
}

- (void)dealloc
{
  _DNSServiceRef_t *browseRef;
  _DNSServiceRef_t *advertiseRef;
  NSObject *resolveContainersSyncQueue;
  objc_super v6;

  browseRef = self->_browseRef;
  if (browseRef)
    DNSServiceRefDeallocate(browseRef);
  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);

  }
  -[GKDiscoveryBonjour closeListeningSockets](self, "closeListeningSockets");

  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  if (resolveContainersSyncQueue)
    dispatch_release(resolveContainersSyncQueue);
  v6.receiver = self;
  v6.super_class = (Class)GKDiscoveryBonjour;
  -[GKDiscoveryBonjour dealloc](&v6, sel_dealloc);
}

- (int)startBrowsing:(id)a3
{
  _DNSServiceRef_t **p_browseRef;
  DNSServiceErrorType v6;
  DNSServiceErrorType v7;

  p_browseRef = &self->_browseRef;
  if (self->_browseRef)
    -[GKDiscoveryBonjour stopBrowsing](self, "stopBrowsing");
  -[GKDiscoveryBonjour setBrowseCallback:](self, "setBrowseCallback:", a3);
  v6 = DNSServiceBrowse(p_browseRef, 0x20000u, 0, -[NSString UTF8String](self->_serviceType, "UTF8String"), -[NSString UTF8String](self->_serviceDomain, "UTF8String"), (DNSServiceBrowseReply)gkDiscoveryBrowseCallback, self);
  if (v6)
  {
    v7 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour startBrowsing:].cold.2();
    }
  }
  else
  {
    v7 = DNSServiceSetDispatchQueue(*p_browseRef, MEMORY[0x24BDAC9B8]);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKDiscoveryBonjour startBrowsing:].cold.1();
      }
    }
  }
  return v7;
}

- (void)stopBrowsing
{
  _DNSServiceRef_t *browseRef;

  browseRef = self->_browseRef;
  if (browseRef)
  {
    DNSServiceRefDeallocate(browseRef);
    self->_browseRef = 0;
  }
  -[GKDiscoveryBonjour setBrowseCallback:](self, "setBrowseCallback:", 0);
}

- (int)resolveName:(id)a3 onIndex:(unsigned int)a4 withCompletionHandler:(id)a5
{
  NSObject *resolveContainersSyncQueue;
  int v6;
  _QWORD block[8];
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1431655766;
  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke;
  block[3] = &unk_24D4669F8;
  block[4] = self;
  block[5] = a3;
  block[6] = a5;
  block[7] = &v10;
  v9 = a4;
  dispatch_sync(resolveContainersSyncQueue, block);
  v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  GKDiscoveryBonjourResolveContainer *v2;
  NSMutableArray *v3;
  DNSServiceRef sdRef;

  v2 = objc_alloc_init(GKDiscoveryBonjourResolveContainer);
  -[GKDiscoveryBonjourResolveContainer setResolveCompletionHandler:](v2, "setResolveCompletionHandler:", *(_QWORD *)(a1 + 48));
  -[GKDiscoveryBonjourResolveContainer setContext:](v2, "setContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolveContainers"), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  sdRef = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = DNSServiceResolve(&sdRef, 0x20000u, *(_DWORD *)(a1 + 64), (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String"), (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "UTF8String"), (DNSServiceResolveReply)gkDiscoveryResolveCallback, v2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_2();
    }
    goto LABEL_11;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = DNSServiceSetDispatchQueue(sdRef, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 96));
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
LABEL_11:
    if (sdRef)
    {
      v3 = -[GKDiscoveryBonjourResolveContainer serviceRefList](v2, "serviceRefList");
      -[NSMutableArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sdRef));
    }
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_1();
  }
  if (sdRef)
  {
    DNSServiceRefDeallocate(sdRef);
    sdRef = 0;
  }
LABEL_13:

}

- (void)stopResolve:(id)a3
{
  NSObject *resolveContainersSyncQueue;
  _QWORD v4[6];

  resolveContainersSyncQueue = self->_resolveContainersSyncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__GKDiscoveryBonjour_stopResolve___block_invoke;
  v4[3] = &unk_24D4661B8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(resolveContainersSyncQueue, v4);
}

uint64_t __34__GKDiscoveryBonjour_stopResolve___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolveContainers"), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)createDispatchEventWithSocket:(int)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSMutableArray *v8;
  _QWORD v9[4];
  int v10;
  _QWORD handler[5];
  int v12;

  v5 = dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, MEMORY[0x24BDAC9B8]);
  v6 = -[GKDiscoveryBonjour connectionCallback](self, "connectionCallback");
  v7 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke;
  handler[3] = &unk_24D466A20;
  v12 = a3;
  handler[4] = v6;
  dispatch_source_set_event_handler(v5, handler);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke_2;
  v9[3] = &__block_descriptor_36_e5_v8__0l;
  v10 = a3;
  dispatch_source_set_cancel_handler(v5, v9);
  dispatch_resume(v5);
  v8 = -[GKDiscoveryBonjour launchdSources](self, "launchdSources");
  -[NSMutableArray addObject:](v8, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v5));
}

uint64_t __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke(uint64_t a1)
{
  sockaddr v2;
  uint64_t result;
  socklen_t v4;
  sockaddr v5;
  sockaddr v6;
  sockaddr v7;
  sockaddr v8;
  sockaddr v9;
  sockaddr v10;
  sockaddr v11;
  sockaddr v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v11 = v2;
  v12 = v2;
  v9 = v2;
  v10 = v2;
  v7 = v2;
  v8 = v2;
  v5 = v2;
  v6 = v2;
  v4 = -1431655766;
  result = accept(*(_DWORD *)(a1 + 40), &v5, &v4);
  if ((_DWORD)result != -1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __52__GKDiscoveryBonjour_createDispatchEventWithSocket___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (int)ipV4Socket
{
  int v2;
  int v3;
  int v5;

  v5 = 1;
  v2 = socket(2, 1, 0);
  if (v2 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour ipV4Socket].cold.1();
    }
    return -1;
  }
  v3 = v2;
  if (setsockopt(v2, 0xFFFF, 4, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour ipV4Socket].cold.2();
    }
    close(v3);
    return -1;
  }
  return v3;
}

- (int)ipV6Socket
{
  int v2;
  int v3;
  int v5;

  v5 = 1;
  v2 = socket(30, 1, 0);
  if (v2 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour ipV6Socket].cold.1();
    }
    return -1;
  }
  v3 = v2;
  if (setsockopt(v2, 0xFFFF, 4, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour ipV6Socket].cold.2();
    }
    goto LABEL_13;
  }
  if (setsockopt(v3, 41, 27, &v5, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour ipV6Socket].cold.3();
    }
LABEL_13:
    close(v3);
    return -1;
  }
  return v3;
}

- (void)setupBothListeningSockets
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, v1, " [%s] %s:%d listen() failed for ipV6 local gaming advertising (%d)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)setupListeningSockets
{
  -[GKDiscoveryBonjour closeListeningSockets](self, "closeListeningSockets");
  -[GKDiscoveryBonjour setupBothListeningSockets](self, "setupBothListeningSockets");
}

- (void)closeListeningSockets
{
  NSMutableArray *launchdSources;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  launchdSources = self->_launchdSources;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](launchdSources, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(launchdSources);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "pointerValue");
        dispatch_source_cancel(v8);
        if (v8)
          dispatch_release(v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](launchdSources, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_launchdSources, "removeAllObjects");
}

- (void)sendBonjourRegistrationEvent:(id)a3 discoveryInfo:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint8_t v13;
  DNSServiceErrorType v14;
  uint64_t v15;
  NSObject *v16;
  _DNSServiceRef_t *advertiseRef;
  _DNSServiceRef_t **p_advertiseRef;
  const char *v19;
  const char *v20;
  unsigned int listeningPort_low;
  uint16_t txtLen;
  const void *BytesPtr;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE buf[24];
  __int128 v32;
  GKDiscoveryBonjour *v33;
  _BYTE v34[128];
  TXTRecordRef txtRecord;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  txtRecord.ForceNaturalAlignment = (char *)0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&txtRecord.ForceNaturalAlignment + 1) = 0xAAAAAAAAAAAAAAAALL;
  TXTRecordCreate(&txtRecord, 0, 0);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_msgSend(a4, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(a4, "valueForKey:", v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (const char *)objc_msgSend(v10, "UTF8String");
          v12 = (const char *)objc_msgSend(v9, "UTF8String");
          v13 = strlen(v11);
          v14 = TXTRecordSetValue(&txtRecord, v12, v13, v11);
          if (v14)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v15 = VRTraceErrorLogLevelToCSTR();
              v16 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v15;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:]";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v32) = 762;
                WORD2(v32) = 1024;
                *(_DWORD *)((char *)&v32 + 6) = v14;
                _os_log_error_impl(&dword_215C5C000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d txt record set value failed with error [%d]", buf, 0x22u);
              }
            }
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v6);
  }
  p_advertiseRef = &self->_advertiseRef;
  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);
    *p_advertiseRef = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  *(_QWORD *)&v32 = __Block_byref_object_copy__0;
  *((_QWORD *)&v32 + 1) = __Block_byref_object_dispose__0;
  v33 = self;

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __65__GKDiscoveryBonjour_sendBonjourRegistrationEvent_discoveryInfo___block_invoke;
  v26[3] = &unk_24D466A48;
  v26[4] = a4;
  v26[5] = buf;
  self->_collisionCallback = (id)objc_msgSend(v26, "copy");
  v19 = (const char *)objc_msgSend(a3, "UTF8String");
  v20 = -[NSString UTF8String](self->_serviceType, "UTF8String");
  listeningPort_low = LOWORD(self->_listeningPort);
  txtLen = TXTRecordGetLength(&txtRecord);
  BytesPtr = TXTRecordGetBytesPtr(&txtRecord);
  if (DNSServiceRegister(p_advertiseRef, 0x20008u, 0, v19, v20, 0, 0, bswap32(listeningPort_low) >> 16, txtLen, BytesPtr, (DNSServiceRegisterReply)gkDiscoveryRegisterCallback, self->_collisionCallback))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:].cold.2();
    }
  }
  else if (DNSServiceSetDispatchQueue(*p_advertiseRef, MEMORY[0x24BDAC9B8]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:].cold.1();
    }
  }
  TXTRecordDeallocate(&txtRecord);
  _Block_object_dispose(buf, 8);
}

uint64_t __65__GKDiscoveryBonjour_sendBonjourRegistrationEvent_discoveryInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "serviceNameCollisionCallback");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sendBonjourRegistrationEvent:discoveryInfo:", (*(uint64_t (**)(void))(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "serviceNameCollisionCallback")+ 16))(), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)startAdvertisingServiceName:(id)a3 discoveryInfo:(id)a4
{
  -[GKDiscoveryBonjour setupListeningSockets](self, "setupListeningSockets");
  -[GKDiscoveryBonjour sendBonjourRegistrationEvent:discoveryInfo:](self, "sendBonjourRegistrationEvent:discoveryInfo:", a3, a4);
}

- (void)stopAdvertising
{
  _DNSServiceRef_t *advertiseRef;

  advertiseRef = self->_advertiseRef;
  if (advertiseRef)
  {
    DNSServiceRefDeallocate(advertiseRef);

    self->_collisionCallback = 0;
    self->_advertiseRef = 0;
    -[GKDiscoveryBonjour closeListeningSockets](self, "closeListeningSockets");
  }
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serviceDomain
{
  return self->_serviceDomain;
}

- (void)setServiceDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_DNSServiceRef_t)browseRef
{
  return self->_browseRef;
}

- (void)setBrowseRef:(_DNSServiceRef_t *)a3
{
  self->_browseRef = a3;
}

- (_DNSServiceRef_t)advertiseRef
{
  return self->_advertiseRef;
}

- (void)setAdvertiseRef:(_DNSServiceRef_t *)a3
{
  self->_advertiseRef = a3;
}

- (NSMutableArray)launchdSources
{
  return self->_launchdSources;
}

- (void)setLaunchdSources:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableDictionary)resolveContainers
{
  return self->_resolveContainers;
}

- (void)setResolveContainers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (id)browseCallback
{
  return self->_browseCallback;
}

- (void)setBrowseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)connectionCallback
{
  return self->_connectionCallback;
}

- (void)setConnectionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)resolveContainersSyncQueue
{
  return self->_resolveContainersSyncQueue;
}

- (void)setResolveContainersSyncQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (id)serviceNameCollisionCallback
{
  return self->_serviceNameCollisionCallback;
}

- (void)setServiceNameCollisionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)startBrowsing:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

- (void)startBrowsing:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d service browse failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_16_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void __64__GKDiscoveryBonjour_resolveName_onIndex_withCompletionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_16_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d DNS service resolve failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

- (void)ipV4Socket
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, v1, " [%s] %s:%d setsockopt() failed for ipV4 local gaming advertising (%d)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)ipV6Socket
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, v1, " [%s] %s:%d setsockopt(IPV6_V6ONLY) failed for ipV6 local gaming advertising (%d)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)sendBonjourRegistrationEvent:discoveryInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

- (void)sendBonjourRegistrationEvent:discoveryInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d service registration failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

@end
