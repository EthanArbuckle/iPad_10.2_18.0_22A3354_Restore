@implementation CDPDNetworkObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_12);
  return (id)sharedInstance_instance_1;
}

void __37__CDPDNetworkObserver_sharedInstance__block_invoke()
{
  CDPDNetworkObserver *v0;
  void *v1;

  v0 = objc_alloc_init(CDPDNetworkObserver);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (CDPDNetworkObserver)init
{
  CDPDNetworkObserver *v2;
  NSLock *v3;
  NSLock *clientsLock;
  uint64_t v5;
  NSMutableDictionary *clientsByUUID;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *eventQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CDPDNetworkObserver;
  v2 = -[CDPDNetworkObserver init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    clientsLock = v2->_clientsLock;
    v2->_clientsLock = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    clientsByUUID = v2->_clientsByUUID;
    v2->_clientsByUUID = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("CDPDNetworkObserver Event Queue", v7);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)startObservingNetwork
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CDPDNetworkObserver_startObservingNetwork__block_invoke;
  block[3] = &unk_24C81C420;
  block[4] = self;
  dispatch_sync(eventQueue, block);
}

uint64_t __44__CDPDNetworkObserver_startObservingNetwork__block_invoke(uint64_t a1)
{
  SCNetworkReachabilityContext v3;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  address = (sockaddr)xmmword_20DBA4300;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
  flags = 0;
  SCNetworkReachabilityGetFlags(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 32), &flags);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = (flags & 2) != 0;
  memset(&v3, 0, sizeof(v3));
  v3.info = *(void **)(a1 + 32);
  SCNetworkReachabilitySetCallback(*((SCNetworkReachabilityRef *)v3.info + 4), (SCNetworkReachabilityCallBack)_networkReachabilityCallBack, &v3);
  return SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 32), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_networkReachabilityDidChangeWithFlags:(unsigned int)a3
{
  NSObject *eventQueue;
  _QWORD v4[5];
  unsigned int v5;

  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke;
  v4[3] = &unk_24C81DE68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = (*(_BYTE *)(a1 + 40) & 2) != 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke_2;
  v5[3] = &unk_24C81DE40;
  v5[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

void __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  objc_msgSend(a3, "eventHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2](v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (id)addNetworkObserverWithEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CDPDNetworkObserverClient *v7;
  NSObject *eventQueue;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(CDPDNetworkObserverClient);
  -[CDPDNetworkObserverClient setEventHandler:](v7, "setEventHandler:", v4);
  -[NSLock lock](self->_clientsLock, "lock");
  -[NSMutableDictionary setObject:forKey:](self->_clientsByUUID, "setObject:forKey:", v7, v6);
  -[NSLock unlock](self->_clientsLock, "unlock");
  eventQueue = self->_eventQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CDPDNetworkObserver_addNetworkObserverWithEventHandler___block_invoke;
  v11[3] = &unk_24C81DE90;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  dispatch_async(eventQueue, v11);

  return v6;
}

uint64_t __58__CDPDNetworkObserver_addNetworkObserverWithEventHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  return result;
}

- (void)removeObserverWithToken:(id)a3
{
  NSLock *clientsLock;
  id v5;

  clientsLock = self->_clientsLock;
  v5 = a3;
  -[NSLock lock](clientsLock, "lock");
  -[NSMutableDictionary removeObjectForKey:](self->_clientsByUUID, "removeObjectForKey:", v5);

  -[NSLock unlock](self->_clientsLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_clientsByUUID, 0);
  objc_storeStrong((id *)&self->_clientsLock, 0);
}

@end
