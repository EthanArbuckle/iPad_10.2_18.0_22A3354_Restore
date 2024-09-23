@implementation BLTBBObserver

- (BLTBBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6 isGateway:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  BLTBBObserver *v16;
  BLTBBObserver *v17;
  uint64_t v18;
  NSString *name;
  NSLock *v20;
  NSLock *actualObserverLock;
  BLTBBObserverDelegate *v22;
  BLTBBObserverDelegate *delegateSurrogate;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BLTBBObserver;
  v16 = -[BLTBBObserver init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_queue, a3);
    objc_storeStrong((id *)&v17->_calloutQueue, a4);
    v18 = objc_msgSend(v15, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_priority = a6;
    v17->_isGateway = a7;
    v20 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    actualObserverLock = v17->_actualObserverLock;
    v17->_actualObserverLock = v20;

    v22 = objc_alloc_init(BLTBBObserverDelegate);
    delegateSurrogate = v17->_delegateSurrogate;
    v17->_delegateSurrogate = v22;

    -[BLTBBObserverDelegate setDelegate:](v17->_delegateSurrogate, "setDelegate:", v17);
    -[BLTBBObserver _reconnectObserver](v17, "_reconnectObserver");
  }

  return v17;
}

+ (id)surrogateWithQueue:(id)a3 calloutQueue:(id)a4
{
  id v5;
  id v6;
  BLTBBObserver *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BLTBBObserver initWithQueue:calloutQueue:name:priority:isGateway:]([BLTBBObserver alloc], "initWithQueue:calloutQueue:name:priority:isGateway:", v6, v5, 0, 0, 0);

  return v7;
}

+ (id)surrogateGatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  BLTBBObserver *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[BLTBBObserver initWithQueue:calloutQueue:name:priority:isGateway:]([BLTBBObserver alloc], "initWithQueue:calloutQueue:name:priority:isGateway:", v11, v10, v9, a6, 1);

  return v12;
}

- (void)setDelegate:(id)a3
{
  -[BLTBBObserverDelegate setActualDelegate:](self->_delegateSurrogate, "setActualDelegate:", a3);
  -[NSLock lock](self->_actualObserverLock, "lock");
  -[BBObserver setDelegate:](self->_actualObserver, "setDelegate:", self->_delegateSurrogate);
  -[NSLock unlock](self->_actualObserverLock, "unlock");
}

- (void)_reconnectObserver
{
  BBObserver *v3;
  BBObserver *actualObserver;
  void *v5;

  -[NSLock lock](self->_actualObserverLock, "lock");
  -[BBObserver invalidate](self->_actualObserver, "invalidate");
  if (self->_isGateway)
  {
    objc_msgSend(MEMORY[0x24BE0FE68], "gatewayWithQueue:calloutQueue:name:priority:", self->_queue, self->_calloutQueue, self->_name, self->_priority);
    v3 = (BBObserver *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (BBObserver *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FE68]), "initWithQueue:calloutQueue:", self->_queue, self->_calloutQueue);
  }
  actualObserver = self->_actualObserver;
  self->_actualObserver = v3;

  -[BLTBBObserverDelegate actualDelegate](self->_delegateSurrogate, "actualDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[BBObserver setDelegate:](self->_actualObserver, "setDelegate:", self->_delegateSurrogate);
  if (self->_hasFeed)
    -[BBObserver setObserverFeed:](self->_actualObserver, "setObserverFeed:", self->_observerFeed);
  -[NSLock unlock](self->_actualObserverLock, "unlock");
}

- (void)noteServerConnectionStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  BBObserver *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "BLTBulletinDistributor noteServerConnectionStateChanged connected: %{BOOL}u", (uint8_t *)v8, 8u);
  }

  if (!v3)
    -[BLTBBObserver _reconnectObserver](self, "_reconnectObserver");
  -[NSLock lock](self->_actualObserverLock, "lock");
  v6 = self->_actualObserver;
  -[NSLock unlock](self->_actualObserverLock, "unlock");
  -[BLTBBObserverDelegate actualDelegate](self->_delegateSurrogate, "actualDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "observer:noteServerConnectionStateChanged:", v6, v3);

}

- (void)setObserverFeed:(unint64_t)a3
{
  -[NSLock lock](self->_actualObserverLock, "lock");
  self->_observerFeed = a3;
  self->_hasFeed = 1;
  -[BBObserver setObserverFeed:](self->_actualObserver, "setObserverFeed:", a3);
  -[NSLock unlock](self->_actualObserverLock, "unlock");
}

- (void)dealloc
{
  BBObserver *actualObserver;
  objc_super v4;

  -[BBObserver invalidate](self->_actualObserver, "invalidate");
  actualObserver = self->_actualObserver;
  self->_actualObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTBBObserver;
  -[BLTBBObserver dealloc](&v4, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  NSLock *actualObserverLock;
  id v5;
  NSLock *v6;
  BBObserver *v7;
  objc_super v8;

  actualObserverLock = self->_actualObserverLock;
  v5 = a3;
  -[NSLock lock](actualObserverLock, "lock");
  v6 = self->_actualObserverLock;
  v7 = self->_actualObserver;
  -[NSLock unlock](v6, "unlock");
  objc_msgSend(v5, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "invokeWithTarget:", v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BLTBBObserver;
    -[BLTBBObserver forwardInvocation:](&v8, sel_forwardInvocation_, v5);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  BBObserver *actualObserver;
  NSLock *actualObserverLock;
  BBObserver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLTBBObserver;
  if (-[BLTBBObserver respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[NSLock lock](self->_actualObserverLock, "lock");
    actualObserver = self->_actualObserver;
    actualObserverLock = self->_actualObserverLock;
    v7 = actualObserver;
    -[NSLock unlock](actualObserverLock, "unlock");
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  BBObserver *actualObserver;
  NSLock *actualObserverLock;
  BBObserver *v6;
  char isKindOfClass;

  if ((Class)objc_opt_class() == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[NSLock lock](self->_actualObserverLock, "lock");
    actualObserver = self->_actualObserver;
    actualObserverLock = self->_actualObserverLock;
    v6 = actualObserver;
    -[NSLock unlock](actualObserverLock, "unlock");
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___BLTBBObserver;
  if ((objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x24BE0FE68], "instancesRespondToSelector:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  BBObserver *actualObserver;
  NSLock *actualObserverLock;
  BBObserver *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLTBBObserver;
  -[BLTBBObserver methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSLock lock](self->_actualObserverLock, "lock");
    actualObserver = self->_actualObserver;
    actualObserverLock = self->_actualObserverLock;
    v8 = actualObserver;
    -[NSLock unlock](actualObserverLock, "unlock");
    -[BBObserver methodSignatureForSelector:](v8, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateSurrogate, 0);
  objc_storeStrong((id *)&self->_actualObserverLock, 0);
  objc_storeStrong((id *)&self->_actualObserver, 0);
}

@end
