@implementation BBObserver

void __51__BBObserver_updateSectionParameters_forSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BBObserver_updateSectionParameters_forSectionID___block_invoke_2;
  block[3] = &unk_24C563438;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(v3 + 48);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_4;
    v6[3] = &unk_24C563258;
    v6[4] = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "getSectionParametersForSectionID:withHandler:", v7, v6);

  }
}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_2;
    v6[3] = &unk_24C5631E0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteBulletinsLoadedForSectionID:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke_2;
  v4[3] = &unk_24C562E50;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __32__BBObserver_updateSectionInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:updateSectionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_queue_noteBulletinsLoadedForSectionID:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__BBObserver__queue_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

void __53__BBObserver__queue_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (id *)(*(_QWORD *)(a1 + 32) + 64);
      v6 = v4;
      v7 = objc_loadWeakRetained(v5);
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v10 = v8;
      _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering noteBulletinsLoadedForSectionID: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v11, "observer:noteBulletinsLoadedForSectionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__BBObserver_updateSectionParameters_forSectionID___block_invoke;
    block[3] = &unk_24C563438;
    block[4] = self;
    v11 = v6;
    v12 = v8;
    dispatch_async(queue, block);

  }
}

- (void)updateSectionInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *calloutQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__BBObserver_updateSectionInfo___block_invoke;
    v7[3] = &unk_24C562E50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(calloutQueue, v7);

  }
}

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__BBObserver_noteBulletinsLoadedForSectionID___block_invoke;
  v6[3] = &unk_24C563460;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BBObserver getParametersForSectionID:withCompletion:](self, "getParametersForSectionID:withCompletion:", v5, v6);

}

- (void)getParametersForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *queue;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke;
  v15[3] = &unk_24C563208;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x212B949C0](v15);
  if (objc_msgSend(v6, "length"))
  {
    queue = self->_queue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_3;
    block[3] = &unk_24C563280;
    block[4] = self;
    v13 = v6;
    v14 = v10;
    dispatch_async(queue, block);

  }
  else
  {
    v10[2](v10, 0);
  }

}

void __51__BBObserver_updateSectionParameters_forSectionID___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 64));
    objc_msgSend(v4, "observer:noteSectionParametersChanged:forSectionID:", a1[4], a1[5], a1[6]);

  }
}

+ (id)gatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:", v12, v11, v10, a6, 1);

  return v13;
}

+ (id)observerWithQueue:(id)a3 calloutQueue:(id)a4 forGatewayName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:", v10, v9, v8, 0, 0);

  return v11;
}

- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4
{
  return (BBObserver *)-[BBObserver _initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:](self, "_initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:", a3, a4, CFSTR("BBObserverGatewayLocalName"), 0, 0);
}

- (id)_initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BBObserver *v17;

  v7 = a7;
  v12 = (objc_class *)MEMORY[0x24BDD1988];
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([v12 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.bulletinboard.observerconnection"), 0);
  v17 = -[BBObserver initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:connection:](self, "initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:connection:", v15, v14, v13, a6, v7, v16);

  return v17;
}

- (BBObserver)initWithQueue:(id)a3 calloutQueue:(id)a4 gatewayName:(id)a5 gatewayPriority:(unint64_t)a6 isGateway:(BOOL)a7 connection:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BBObserver *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v21;
  id v22;
  OS_dispatch_queue *v23;
  OS_dispatch_queue *calloutQueue;
  OS_dispatch_queue *v25;
  id v26;
  uint64_t v27;
  OS_dispatch_queue *v28;
  uint64_t v29;
  NSString *gatewayName;
  NSMutableDictionary *v31;
  NSMutableDictionary *sectionParametersBySectionID;
  uint64_t v33;
  NSMapTable *bulletinLifeAssertions;
  NSMutableDictionary *v35;
  NSMutableDictionary *remainingFeedsByBulletinID;
  BBObserverServerProxy *v37;
  BBObserverServerProxy *serverProxy;
  objc_super v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v40.receiver = self;
  v40.super_class = (Class)BBObserver;
  v18 = -[BBObserver init](&v40, sel_init);
  if (v18)
  {
    if (v14)
    {
      v19 = (OS_dispatch_queue *)v14;
      queue = v18->_queue;
      v18->_queue = v19;
    }
    else
    {
      v21 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v22 = MEMORY[0x24BDAC9B8];
      queue = v18->_queue;
      v18->_queue = v21;
    }

    if (v15)
    {
      v23 = (OS_dispatch_queue *)v15;
      calloutQueue = v18->_calloutQueue;
      v18->_calloutQueue = v23;
    }
    else
    {
      v25 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v26 = MEMORY[0x24BDAC9B8];
      calloutQueue = v18->_calloutQueue;
      v18->_calloutQueue = v25;
    }

    BBPrepareQueueForSafeSync(v18->_queue);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v27;

    v29 = objc_msgSend(v16, "copy");
    gatewayName = v18->_gatewayName;
    v18->_gatewayName = (NSString *)v29;

    v18->_gatewayPriority = a6;
    v18->_isGateway = a7;
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sectionParametersBySectionID = v18->_sectionParametersBySectionID;
    v18->_sectionParametersBySectionID = v31;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v33 = objc_claimAutoreleasedReturnValue();
    bulletinLifeAssertions = v18->_bulletinLifeAssertions;
    v18->_bulletinLifeAssertions = (NSMapTable *)v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    remainingFeedsByBulletinID = v18->_remainingFeedsByBulletinID;
    v18->_remainingFeedsByBulletinID = v35;

    v37 = -[BBObserverServerProxy initWithObserver:connection:queue:calloutQueue:]([BBObserverServerProxy alloc], "initWithObserver:connection:queue:calloutQueue:", v18, v17, v18->_queue, v18->_calloutQueue);
    serverProxy = v18->_serverProxy;
    v18->_serverProxy = v37;

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[BBObserverServerProxy invalidate](self->_serverProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBObserver;
  -[BBObserver dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *calloutQueue;
  NSObject *queue;
  _QWORD v6[5];
  _QWORD block[5];

  -[BBObserverServerProxy invalidate](self->_serverProxy, "invalidate");
  v3 = MEMORY[0x24BDAC760];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__BBObserver_invalidate__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(calloutQueue, block);
  queue = self->_queue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __24__BBObserver_invalidate__block_invoke_2;
  v6[3] = &unk_24C562E28;
  v6[4] = self;
  dispatch_async(queue, v6);
}

id __24__BBObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), 0);
}

uint64_t __24__BBObserver_invalidate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

- (void)_queue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary removeAllObjects](self->_sectionParametersBySectionID, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_bulletinLifeAssertions, "removeAllObjects");
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t observerFeed;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  observerFeed = self->_observerFeed;
  if ((observerFeed & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("notices"));
    observerFeed = self->_observerFeed;
    if ((observerFeed & 2) == 0)
    {
LABEL_3:
      if ((observerFeed & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((observerFeed & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("banner"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 4) == 0)
  {
LABEL_4:
    if ((observerFeed & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "addObject:", CFSTR("modal alert"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 8) == 0)
  {
LABEL_5:
    if ((observerFeed & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "addObject:", CFSTR("lockscreen"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x8000) == 0)
  {
LABEL_6:
    if ((observerFeed & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "addObject:", CFSTR("highlights"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x10) == 0)
  {
LABEL_7:
    if ((observerFeed & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "addObject:", CFSTR("sound"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x20) == 0)
  {
LABEL_8:
    if ((observerFeed & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "addObject:", CFSTR("locked banner"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x40) == 0)
  {
LABEL_9:
    if ((observerFeed & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v4, "addObject:", CFSTR("locked modal alert"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x80) == 0)
  {
LABEL_10:
    if ((observerFeed & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v4, "addObject:", CFSTR("car"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x4000) == 0)
  {
LABEL_11:
    if ((observerFeed & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v4, "addObject:", CFSTR("remote notifications"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x400) == 0)
  {
LABEL_12:
    if ((observerFeed & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v4, "addObject:", CFSTR("forwarding"));
  observerFeed = self->_observerFeed;
  if ((observerFeed & 0x200) == 0)
  {
LABEL_13:
    if (!observerFeed)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  objc_msgSend(v4, "addObject:", CFSTR("settings"));
  if (self->_observerFeed)
LABEL_14:
    objc_msgSend(v4, "addObject:", CFSTR("display"));
LABEL_15:
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("(none)");
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p; feeds: %@; delegate: %@>"), v8, self, v6, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setObserverFeed:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__BBObserver_setObserverFeed___block_invoke;
  v4[3] = &unk_24C5630A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __30__BBObserver_setObserverFeed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v3 = *(_QWORD *)(v1 + 72);
  v4 = *(_QWORD *)(v1 + 80);
  if (*(_BYTE *)(v1 + 56))
    return objc_msgSend(v2, "setObserverFeed:asLightsAndSirensGateway:priority:", v3, v4, *(_QWORD *)(v1 + 88));
  else
    return objc_msgSend(v2, "setObserverFeed:attachToLightsAndSirensGateway:", v3, v4);
}

- (BOOL)isValid
{
  return -[BBObserverServerProxy isValid](self->_serverProxy, "isValid");
}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4;
  BBObserverServerProxy *serverProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserver_getSectionInfoWithCompletion___block_invoke;
  v7[3] = &unk_24C5630C8;
  v8 = v4;
  v6 = v4;
  -[BBObserverServerProxy getSectionInfoWithHandler:](serverProxy, "getSectionInfoWithHandler:", v7);

}

void __43__BBObserver_getSectionInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3
{
  id v4;
  BBObserverServerProxy *serverProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__BBObserver_getSectionInfoForActiveSectionsWithCompletion___block_invoke;
  v7[3] = &unk_24C5630C8;
  v8 = v4;
  v6 = v4;
  -[BBObserverServerProxy getSectionInfoForActiveSectionsWithHandler:](serverProxy, "getSectionInfoForActiveSectionsWithHandler:", v7);

}

void __60__BBObserver_getSectionInfoForActiveSectionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v6();

}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  BBObserverServerProxy *serverProxy;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__BBObserver_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v9[3] = &unk_24C5630C8;
  v10 = v6;
  v8 = v6;
  -[BBObserverServerProxy getSectionInfoForSectionIDs:withHandler:](serverProxy, "getSectionInfoForSectionIDs:withHandler:", a3, v9);

}

void __57__BBObserver_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v6();

}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
  -[BBObserverServerProxy requestNoticesBulletinsForSectionID:](self->_serverProxy, "requestNoticesBulletinsForSectionID:", a3);
}

- (void)requestNoticesBulletinsForAllSections
{
  -[BBObserverServerProxy requestNoticesBulletinsForAllSections](self->_serverProxy, "requestNoticesBulletinsForAllSections");
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6;
  BBObserverServerProxy *serverProxy;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__BBObserver_getUniversalSectionIDForSectionID_withCompletion___block_invoke;
  v9[3] = &unk_24C5630F0;
  v10 = v6;
  v8 = v6;
  -[BBObserverServerProxy getUniversalSectionIDForSectionID:withHandler:](serverProxy, "getUniversalSectionIDForSectionID:withHandler:", a3, v9);

}

uint64_t __63__BBObserver_getUniversalSectionIDForSectionID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBulletinsWithCompletion:(id)a3
{
  id v4;
  BBObserverServerProxy *serverProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serverProxy = self->_serverProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__BBObserver_getBulletinsWithCompletion___block_invoke;
  v7[3] = &unk_24C563118;
  v8 = v4;
  v6 = v4;
  -[BBObserverServerProxy getBulletinsWithHandler:](serverProxy, "getBulletinsWithHandler:", v7);

}

uint64_t __41__BBObserver_getBulletinsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withCompletion:(id)a4
{
  id v6;
  BBObserverServerProxy *serverProxy;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__BBObserver_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withCompletion___block_invoke;
  v9[3] = &unk_24C563140;
  v10 = v6;
  v8 = v6;
  -[BBObserverServerProxy getPublisherMatchIDsOfBulletinsPublishedAfterDate:withHandler:](serverProxy, "getPublisherMatchIDsOfBulletinsPublishedAfterDate:withHandler:", a3, v9);

}

uint64_t __79__BBObserver_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withCompletion:(id)a5
{
  id v8;
  BBObserverServerProxy *serverProxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  serverProxy = self->_serverProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__BBObserver_getBulletinsForPublisherMatchIDs_sectionID_withCompletion___block_invoke;
  v11[3] = &unk_24C563118;
  v12 = v8;
  v10 = v8;
  -[BBObserverServerProxy getBulletinsForPublisherMatchIDs:sectionID:withHandler:](serverProxy, "getBulletinsForPublisherMatchIDs:sectionID:withHandler:", a3, a4, v11);

}

uint64_t __72__BBObserver_getBulletinsForPublisherMatchIDs_sectionID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendResponse:(id)a3
{
  -[BBObserver sendResponse:withCompletion:](self, "sendResponse:withCompletion:", a3, 0);
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__BBObserver_sendResponse_withCompletion___block_invoke;
  v8[3] = &unk_24C563168;
  v9 = v6;
  v7 = v6;
  -[BBObserver sendResponse:withCompletionIncludingModifiedResponse:](self, "sendResponse:withCompletionIncludingModifiedResponse:", a3, v8);

}

uint64_t __42__BBObserver_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendResponse:(id)a3 withCompletionIncludingModifiedResponse:(id)a4
{
  char *v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  NSObject *v10;
  void *v11;
  BBObserverServerProxy *serverProxy;
  id v13;
  BBObserverServerProxy *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  void (**v19)(id, _QWORD, id);
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *Name;
  __int16 v24;
  BBObserverServerProxy *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = (char *)a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  v9 = (void *)BBLogGeneral;
  if (!self->_serverProxy)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      v15 = v9;
      v16 = (void *)objc_opt_class();
      v17 = v16;
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      v22 = 2080;
      Name = sel_getName(a2);
      v24 = 2112;
      v25 = (BBObserverServerProxy *)v7;
      _os_log_error_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_ERROR, "%@-%s: attempting to send a response through an invalidated connection -> %@", buf, 0x20u);

      if (!v8)
        goto LABEL_8;
    }
    else if (!v8)
    {
      goto LABEL_8;
    }
    v8[2](v8, 0, v7);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_opt_class();
    serverProxy = self->_serverProxy;
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    v22 = 2112;
    Name = v7;
    v24 = 2112;
    v25 = serverProxy;
    v13 = v11;
    _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "%@: Sending response %@ through server proxy %@", buf, 0x20u);

  }
  v14 = self->_serverProxy;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__BBObserver_sendResponse_withCompletionIncludingModifiedResponse___block_invoke;
  v18[3] = &unk_24C563190;
  v18[4] = self;
  v19 = v8;
  -[BBObserverServerProxy handleResponse:withCompletion:](v14, "handleResponse:withCompletion:", v7, v18);

LABEL_8:
}

void __67__BBObserver_sendResponse_withCompletionIncludingModifiedResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v10 = 138412802;
    v11 = (id)objc_opt_class();
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    v8 = v11;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "%@: Response handling completed with success %d, modified response %@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

- (void)clearSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 2114;
    *(_QWORD *)&v9[14] = v4;
    v8 = *(id *)&v9[4];
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing section %{public}@", v9, 0x16u);

  }
  -[BBObserverServerProxy clearSection:](self->_serverProxy, "clearSection:", v4, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);

}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id WeakRetained;
  id v14;
  _BYTE v15[24];
  id v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)v15 = 138544130;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2114;
    *(_QWORD *)&v15[14] = v8;
    *(_WORD *)&v15[22] = 2114;
    v16 = v9;
    LOWORD(v17) = 2114;
    *(_QWORD *)((char *)&v17 + 2) = v10;
    v14 = *(id *)&v15[4];
    _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing from %{public}@ to %{public}@ in sections %{public}@", v15, 0x2Au);

  }
  -[BBObserverServerProxy clearBulletinsFromDate:toDate:inSections:](self->_serverProxy, "clearBulletinsFromDate:toDate:inSections:", v8, v9, v10, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17);

}

- (void)clearBulletins:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = (void *)objc_opt_class();
    v12 = v11;
    *(_DWORD *)buf = 138543874;
    v26 = v11;
    v27 = 2048;
    v28 = objc_msgSend(v6, "count");
    v29 = 2114;
    v30 = v7;
    _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Clearing %ld bulletins in section %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "bulletinID", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  -[BBObserverServerProxy clearBulletinIDs:inSection:](self->_serverProxy, "clearBulletinIDs:inSection:", v13, v7);
}

- (void)removeBulletins:(id)a3 inSection:(id)a4
{
  -[BBObserver removeBulletins:inSection:fromFeed:](self, "removeBulletins:inSection:fromFeed:", a3, a4, self->_observerFeed);
}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeed:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = (void *)objc_opt_class();
    v14 = v13;
    v15 = 138544130;
    v16 = v13;
    v17 = 2048;
    v18 = objc_msgSend(v8, "count");
    v19 = 2048;
    v20 = a5;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Removing %ld bulletins from feed %ld in section %{public}@", (uint8_t *)&v15, 0x2Au);

  }
  -[BBObserverServerProxy removeBulletins:inSection:fromFeeds:](self->_serverProxy, "removeBulletins:inSection:fromFeeds:", v8, v9, a5);

}

- (id)parametersForSectionID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__BBObserver_parametersForSectionID___block_invoke;
  v9[3] = &unk_24C5631B8;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  BBDispatchSafeSync(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__BBObserver_parametersForSectionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_5;
    v7[3] = &unk_24C563230;
    v7[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __55__BBObserver_getParametersForSectionID_withCompletion___block_invoke_5(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)getComposedImageSizeForAttachment:(id)a3 bulletin:(id)a4 withCompletion:(id)a5
{
  id v7;
  NSObject *calloutQueue;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;

  v7 = a5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBObserver.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BBObserver_getComposedImageSizeForAttachment_bulletin_withCompletion___block_invoke;
  block[3] = &unk_24C5632A8;
  v12 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, block);

}

uint64_t __72__BBObserver_getComposedImageSizeForAttachment_bulletin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)assertionExpired:(id)a3 transactionID:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__BBObserver_assertionExpired_transactionID___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __45__BBObserver_assertionExpired_transactionID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(NSObject **)(v2 + 16);
  v13 = MEMORY[0x24BDAC760];
  v15 = __45__BBObserver_assertionExpired_transactionID___block_invoke_2;
  v16 = &unk_24C562E50;
  v14 = 3221225472;
  v17 = v2;
  v18 = v3;
  dispatch_async(v4, &v13);
  objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", a1[5], v13, v14, v15, v16, v17);
  objc_msgSend(*(id *)(a1[4] + 40), "removeObjectForKey:", a1[5]);
  v5 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (id *)(a1[4] + 64);
    v7 = v5;
    WeakRetained = objc_loadWeakRetained(v6);
    v9 = (void *)objc_opt_class();
    v10 = a1[5];
    v11 = a1[6];
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v12 = v9;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: finished with bulletin %{public}@, transactionID %ld", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1[4] + 48), "finishedWithBulletinID:transactionID:", a1[5], a1[6]);

}

void __45__BBObserver_assertionExpired_transactionID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:purgeReferencesToBulletinID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_queue_registerBulletin:(id)a3 withTransactionID:(unint64_t)a4
{
  void *v6;
  BBAssertion *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v8, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_bulletinLifeAssertions, "objectForKey:", v6);
  v7 = (BBAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[BBAssertion initWithDelegate:identifier:]([BBAssertion alloc], "initWithDelegate:identifier:", self, v6);
    -[NSMapTable setObject:forKey:](self->_bulletinLifeAssertions, "setObject:forKey:", v7, v6);
  }
  -[BBAssertion increaseOrIgnoreTransactionID:](v7, "increaseOrIgnoreTransactionID:", a4);
  objc_msgSend(v8, "addLifeAssertion:", v7);
  objc_msgSend(v8, "addObserver:", self);

}

- (void)serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BBObserver_serverProxy_connectionStateDidChange___block_invoke;
  block[3] = &unk_24C5632F8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __51__BBObserver_serverProxy_connectionStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serverProxy:connectionStateDidChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_queue_serverProxy:(id)a3 connectionStateDidChange:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *calloutQueue;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  BOOL v19;
  _QWORD block[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  BBObserver *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disconnected");
    if (v4)
      v7 = CFSTR("connected");
    *(_DWORD *)buf = 138543618;
    v28 = self;
    v29 = 2114;
    v30 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "BBObserver: (%{public}@) %{public}@", buf, 0x16u);
  }
  v8 = MEMORY[0x24BDAC760];
  if (v4)
  {
    if (self->_observerFeed)
      -[BBObserver setObserverFeed:](self, "setObserverFeed:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_bulletinLifeAssertions;
    v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    -[BBObserver _queue_invalidate](self, "_queue_invalidate");
    calloutQueue = self->_calloutQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke;
    block[3] = &unk_24C562E50;
    block[4] = self;
    v21 = v9;
    v16 = v9;
    dispatch_async(calloutQueue, block);

  }
  v17 = self->_calloutQueue;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke_72;
  v18[3] = &unk_24C563320;
  v18[4] = self;
  v19 = v4;
  dispatch_async(v17, v18);
}

void __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating all bulletins for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v6, "observer:noteInvalidatedBulletinIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __58__BBObserver__queue_serverProxy_connectionStateDidChange___block_invoke_72(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:noteServerConnectionStateChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)updateBulletin:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *calloutQueue;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bulletinUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "sectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "sectionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __39__BBObserver_updateBulletin_withReply___block_invoke_2;
      v15[3] = &unk_24C563348;
      v15[4] = self;
      v16 = v6;
      v17 = v7;
      -[BBObserver getParametersForSectionID:withCompletion:](self, "getParametersForSectionID:withCompletion:", v12, v15);

      v13 = v16;
LABEL_6:

      goto LABEL_7;
    }
  }
  if (v7)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__BBObserver_updateBulletin_withReply___block_invoke;
    block[3] = &unk_24C5632A8;
    v19 = v7;
    dispatch_async(calloutQueue, block);
    v13 = v19;
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __39__BBObserver_updateBulletin_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__BBObserver_updateBulletin_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__BBObserver_updateBulletin_withReply___block_invoke_3;
  block[3] = &unk_24C563280;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __39__BBObserver_updateBulletin_withReply___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateBulletin:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_updateBulletin:(id)a3 withReply:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "bulletinUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bulletin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "transactionID");

  -[BBObserver _queue_registerBulletin:withTransactionID:](self, "_queue_registerBulletin:withTransactionID:", v10, v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BBObserver _queue_updateAddBulletin:withReply:](self, "_queue_updateAddBulletin:withReply:", v9, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BBObserver _queue_updateModifyBulletin:withReply:](self, "_queue_updateModifyBulletin:withReply:", v9, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[BBObserver _queue_updateRemoveBulletin:withReply:](self, "_queue_updateRemoveBulletin:withReply:", v9, v6);
      }
      else
      {
        v12 = BBLogBulletinLife;
        if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543362;
          v14 = v9;
          _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Invalid update %{public}@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }

}

- (void)_queue_updateAddBulletin:(id)a3 withReply:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *remainingFeedsByBulletinID;
  void *v17;
  NSObject *calloutQueue;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  unint64_t v24;
  char v25;

  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "feeds");
  v11 = self->_observerFeed & v10;
  objc_msgSend(v9, "bulletinID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_remainingFeedsByBulletinID, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  v15 = v14 | v10;
  remainingFeedsByBulletinID = self->_remainingFeedsByBulletinID;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](remainingFeedsByBulletinID, "setObject:forKey:", v17, v12);

  LOBYTE(remainingFeedsByBulletinID) = objc_msgSend(v8, "shouldPlayLightsAndSirens");
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke;
  block[3] = &unk_24C5633C0;
  v23 = v6;
  v24 = v11;
  block[4] = self;
  v22 = v9;
  v25 = (char)remainingFeedsByBulletinID;
  v19 = v9;
  v20 = v6;
  dispatch_async(calloutQueue, block);

}

void __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;
  char v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  id *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x212B949C0](*(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (id *)(*(_QWORD *)(a1 + 32) + 64);
        v7 = v5;
        v8 = objc_loadWeakRetained(v6);
        v9 = (void *)objc_opt_class();
        v10 = *(void **)(a1 + 40);
        v11 = v9;
        objc_msgSend(v10, "bulletinID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v9;
        v36 = 2114;
        v37 = v12;
        _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering ADD bulletin: %{public}@", buf, 0x16u);

      }
      if (v2)
      {
        v13 = (void *)MEMORY[0x24BE0BDC0];
        v14 = MEMORY[0x24BDAC760];
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_82;
        v32[3] = &unk_24C563370;
        v15 = v2;
        v33 = v15;
        objc_msgSend(v13, "sentinelWithCompletion:", v32);
        v29[0] = v14;
        v29[1] = 3221225472;
        v29[2] = __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_2;
        v29[3] = &unk_24C563398;
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v31 = v15;
        v16 = v30;
        v2 = (void (**)(_QWORD, _QWORD))objc_msgSend(v29, "copy");

      }
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(v17, "observer:addBulletin:forFeed:playLightsAndSirens:withReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v2);

      goto LABEL_14;
    }
    v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (id *)(*(_QWORD *)(a1 + 32) + 64);
        v22 = v20;
        v23 = objc_loadWeakRetained(v21);
        v24 = (void *)objc_opt_class();
        v25 = *(void **)(a1 + 40);
        v26 = v24;
        objc_msgSend(v25, "bulletinID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2114;
        v37 = v27;
        _os_log_impl(&dword_20CCB9000, v22, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering ADD bulletin: %{public}@", buf, 0x16u);

      }
      v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(v28, "observer:addBulletin:forFeed:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    }
  }
  if (!v2)
    return;
  v2[2](v2, 0);
LABEL_14:

}

uint64_t __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isFailed");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

uint64_t __49__BBObserver__queue_updateAddBulletin_withReply___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queue_updateModifyBulletin:(id)a3 withReply:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *calloutQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;

  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "feeds");

  v11 = self->_observerFeed & v10;
  calloutQueue = self->_calloutQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__BBObserver__queue_updateModifyBulletin_withReply___block_invoke;
  v15[3] = &unk_24C5633E8;
  v15[4] = self;
  v16 = v9;
  v17 = v6;
  v18 = v11;
  v13 = v6;
  v14 = v9;
  dispatch_async(calloutQueue, v15);

}

uint64_t __52__BBObserver__queue_updateModifyBulletin_withReply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  id *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t result;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!a1[7])
    goto LABEL_11;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (id *)(a1[4] + 64);
      v6 = v4;
      v7 = objc_loadWeakRetained(v5);
      v8 = (void *)objc_opt_class();
      v9 = (void *)a1[5];
      v10 = v8;
      objc_msgSend(v9, "bulletinID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering MODIFY bulletin: %{public}@", (uint8_t *)&v24, 0x16u);

    }
    v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
    objc_msgSend(v12, "observer:modifyBulletin:forFeed:", a1[4], a1[5], a1[7]);
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)(a1[4] + 64));
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
      goto LABEL_11;
    v15 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (id *)(a1[4] + 64);
      v17 = v15;
      v18 = objc_loadWeakRetained(v16);
      v19 = (void *)objc_opt_class();
      v20 = (void *)a1[5];
      v21 = v19;
      objc_msgSend(v20, "bulletinID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v19;
      v26 = 2114;
      v27 = v22;
      _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering MODIFY bulletin: %{public}@", (uint8_t *)&v24, 0x16u);

    }
    v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
    objc_msgSend(v12, "observer:modifyBulletin:", a1[4], a1[5]);
  }

LABEL_11:
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_queue_updateRemoveBulletin:(id)a3 withReply:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t observerFeed;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *remainingFeedsByBulletinID;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *calloutQueue;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;

  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "feeds");

  observerFeed = self->_observerFeed;
  objc_msgSend(v9, "bulletinID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_remainingFeedsByBulletinID, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  remainingFeedsByBulletinID = self->_remainingFeedsByBulletinID;
  v16 = v14 & ~v10;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14 & ~v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](remainingFeedsByBulletinID, "setObject:forKey:", v17, v12);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_remainingFeedsByBulletinID, "removeObjectForKey:", v12);
  }
  v18 = observerFeed & v10;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBObserver__queue_updateRemoveBulletin_withReply___block_invoke;
  block[3] = &unk_24C563410;
  block[4] = self;
  v23 = v9;
  v25 = v18;
  v26 = v16;
  v24 = v6;
  v20 = v6;
  v21 = v9;
  dispatch_async(calloutQueue, block);

}

uint64_t __52__BBObserver__queue_updateRemoveBulletin_withReply___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  id *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t result;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a1[7])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = (void *)BBLogBulletinDelivery;
      if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (id *)(a1[4] + 64);
        v6 = v4;
        v7 = objc_loadWeakRetained(v5);
        v8 = (void *)objc_opt_class();
        v9 = (void *)a1[5];
        v10 = v8;
        objc_msgSend(v9, "bulletinID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v8;
        v36 = 2114;
        v37 = v11;
        _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering REMOVE bulletin: %{public}@", (uint8_t *)&v34, 0x16u);

      }
      v12 = objc_loadWeakRetained((id *)(a1[4] + 64));
      objc_msgSend(v12, "observer:removeBulletin:forFeed:", a1[4], a1[5], a1[7]);

    }
  }
  v13 = a1[4];
  v14 = *(_QWORD *)(v13 + 72) & a1[8];
  v15 = objc_loadWeakRetained((id *)(v13 + 64));
  v16 = objc_opt_respondsToSelector();

  if (v14)
  {
    if ((v16 & 1) == 0)
      goto LABEL_15;
    v17 = (void *)BBLogBulletinDelivery;
    if (!os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v18 = (id *)(a1[4] + 64);
    v19 = v17;
    v20 = objc_loadWeakRetained(v18);
    v21 = (void *)objc_opt_class();
    v22 = (void *)a1[5];
    v23 = v21;
    objc_msgSend(v22, "bulletinID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v21;
    v36 = 2112;
    v37 = v24;
    _os_log_impl(&dword_20CCB9000, v19, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Suppressing FINAL REMOVE bulletin until removed from all feeds: %@", (uint8_t *)&v34, 0x16u);

  }
  else
  {
    if ((v16 & 1) == 0)
      goto LABEL_15;
    v25 = (void *)BBLogBulletinDelivery;
    if (os_log_type_enabled((os_log_t)BBLogBulletinDelivery, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (id *)(a1[4] + 64);
      v27 = v25;
      v28 = objc_loadWeakRetained(v26);
      v29 = (void *)objc_opt_class();
      v30 = (void *)a1[5];
      v31 = v29;
      objc_msgSend(v30, "bulletinID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v29;
      v36 = 2114;
      v37 = v32;
      _os_log_impl(&dword_20CCB9000, v27, OS_LOG_TYPE_DEFAULT, "Observer for %{public}@: Delivering FINAL REMOVE bulletin: %{public}@", (uint8_t *)&v34, 0x16u);

    }
    v19 = objc_loadWeakRetained((id *)(a1[4] + 64));
    -[NSObject observer:removeBulletin:](v19, "observer:removeBulletin:", a1[4], a1[5]);
  }

LABEL_15:
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)removeSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *calloutQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__BBObserver_removeSection___block_invoke;
    v7[3] = &unk_24C562E50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(calloutQueue, v7);

  }
}

void __28__BBObserver_removeSection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:removeSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)updateGlobalSettings:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__BBObserver_updateGlobalSettings___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

void __35__BBObserver_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:updateGlobalSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4;
  void *v5;
  NSObject *calloutQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__BBObserver_noteServerReceivedResponseForBulletin___block_invoke;
    v7[3] = &unk_24C562E50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(calloutQueue, v7);

  }
}

void __52__BBObserver_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "observer:noteServerReceivedResponseForBulletin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (BBObserverDelegate)delegate
{
  return (BBObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)observerFeed
{
  return self->_observerFeed;
}

- (NSString)gatewayName
{
  return self->_gatewayName;
}

- (unint64_t)gatewayPriority
{
  return self->_gatewayPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_remainingFeedsByBulletinID, 0);
  objc_storeStrong((id *)&self->_bulletinLifeAssertions, 0);
  objc_storeStrong((id *)&self->_sectionParametersBySectionID, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BBObserver)init
{
  return -[BBObserver initWithQueue:calloutQueue:](self, "initWithQueue:calloutQueue:", 0, 0);
}

- (BBObserver)initWithQueue:(id)a3
{
  return -[BBObserver initWithQueue:calloutQueue:](self, "initWithQueue:calloutQueue:", a3, a3);
}

- (BBObserver)initWithQueue:(id)a3 forGateway:(id)a4
{
  return (BBObserver *)-[BBObserver _initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:](self, "_initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:", a3, a3, a4, 0, 0);
}

- (BBObserver)initWithQueue:(id)a3 asGateway:(id)a4 priority:(unint64_t)a5
{
  return (BBObserver *)-[BBObserver _initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:](self, "_initWithQueue:calloutQueue:gatewayName:gatewayPriority:isGateway:", a3, a3, a4, a5, 1);
}

@end
