@implementation SUUIResourceLoader

- (SUUIResourceLoader)initWithOperationQueue:(id)a3
{
  return -[SUUIResourceLoader initWithOperationQueue:clientContext:](self, "initWithOperationQueue:clientContext:", a3, 0);
}

- (SUUIResourceLoader)initWithClientContext:(id)a3
{
  id v5;
  void *v6;
  SUUIResourceLoader *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIResourceLoader.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientContext"));

  }
  objc_msgSend(v5, "resourceLoadQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIResourceLoader initWithOperationQueue:clientContext:](self, "initWithOperationQueue:clientContext:", v6, v5);

  return v7;
}

- (SUUIResourceLoader)initWithOperationQueue:(id)a3 clientContext:(id)a4
{
  id v8;
  id v9;
  SUUIResourceLoader *v10;
  SUUIResourceLoader *v11;
  NSOperationQueue *v12;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v14;
  NSMutableDictionary *operationsByRequestID;
  uint64_t v16;
  NSMapTable *requestsByCacheKey;
  NSCache *v18;
  NSCache *resourcesByRequestID;
  void *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIResourceLoader.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v22.receiver = self;
  v22.super_class = (Class)SUUIResourceLoader;
  v10 = -[SUUIResourceLoader init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clientContext, a4);
    if (v8)
    {
      objc_storeStrong((id *)&v11->_operationQueue, a3);
    }
    else
    {
      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      operationQueue = v11->_operationQueue;
      v11->_operationQueue = v12;

      -[NSOperationQueue setName:](v11->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIResourceLoader.queueFor28304306Fix"));
      -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_operationQueue, "setMaxConcurrentOperationCount:", 8);
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    operationsByRequestID = v11->_operationsByRequestID;
    v11->_operationsByRequestID = v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    requestsByCacheKey = v11->_requestsByCacheKey;
    v11->_requestsByCacheKey = (NSMapTable *)v16;

    v18 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    resourcesByRequestID = v11->_resourcesByRequestID;
    v11->_resourcesByRequestID = v18;

    -[NSCache setCountLimit:](v11->_resourcesByRequestID, "setCountLimit:", 750);
    -[NSCache setDelegate:](v11->_resourcesByRequestID, "setDelegate:", v11);
  }

  return v11;
}

- (SUUIResourceLoader)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("SUUIResourceLoader must be initialized with an operation queue"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache setDelegate:](self->_resourcesByRequestID, "setDelegate:", 0);
  -[SUUIResourceLoader cancelAllRequests](self, "cancelAllRequests");
  v3.receiver = self;
  v3.super_class = (Class)SUUIResourceLoader;
  -[SUUIResourceLoader dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIResourceLoader name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIResourceLoader operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inBackground)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}"), self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; name = %@; operationQueue = %@; inBackground = %@; loadCounts = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)addResource:(id)a3 forRequestIdentifier:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  NSCache *resourcesByRequestID;
  _SUUIResourceCacheValue *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BDD16E0];
  v7 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithUnsignedInteger:", a4);
  resourcesByRequestID = self->_resourcesByRequestID;
  v9 = -[_SUUIResourceCacheValue initWithResource:requestCacheKey:]([_SUUIResourceCacheValue alloc], "initWithResource:requestCacheKey:", v7, 0);

  -[NSCache setObject:forKey:](resourcesByRequestID, "setObject:forKey:", v9, v10);
}

- (id)cachedResourceForRequestIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
  -[NSCache objectForKey:](self->_resourcesByRequestID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAllCachedResources
{
  -[NSCache removeAllObjects](self->_resourcesByRequestID, "removeAllObjects");
}

- (void)cancelAllRequests
{
  void *v3;

  -[NSMutableDictionary allValues](self->_operationsByRequestID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

  -[NSMutableDictionary removeAllObjects](self->_operationsByRequestID, "removeAllObjects");
  if (self->_requestCountMap[2] >= 1)
  {
    self->_requestCountMap[2] = 0;
    -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", 1);
  }
  if (self->_requestCountMap[1] >= 1)
  {
    self->_requestCountMap[1] = 0;
    -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", 0);
  }
  if (self->_requestCountMap[0] >= 1)
  {
    self->_requestCountMap[0] = 0;
    -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", -1);
  }
}

- (void)cancelRequestWithIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t *requestCountMap;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cancel");
    -[NSMutableDictionary removeObjectForKey:](self->_operationsByRequestID, "removeObjectForKey:", v10);
    v6 = objc_msgSend(v5, "_loadReason");
    requestCountMap = self->_requestCountMap;
    v8 = 2;
    if (v6 != 1)
      v8 = v6 == 0;
    v9 = requestCountMap[v8];
    if (v9 >= 1)
      requestCountMap[v8] = --v9;
    if (!v9)
      -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v6);
  }

}

- (void)enterBackground
{
  if (!self->_inBackground)
  {
    self->_inBackground = 1;
    -[SUUIResourceLoader _reprioritizeOperations](self, "_reprioritizeOperations");
  }
}

- (void)enterForeground
{
  if (self->_inBackground)
  {
    self->_inBackground = 0;
    -[SUUIResourceLoader _reprioritizeOperations](self, "_reprioritizeOperations");
  }
}

- (NSOperationQueue)delegateQueue
{
  NSOperationQueue *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    return delegateQueue;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  return (NSOperationQueue *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isIdle
{
  return -[NSMutableDictionary count](self->_operationsByRequestID, "count") == 0;
}

- (BOOL)isIdleForReason:(int64_t)a3
{
  uint64_t v3;

  v3 = a3 == 0;
  if (a3 == 1)
    v3 = 2;
  return self->_requestCountMap[v3] == 0;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", objc_msgSend(v6, "requestIdentifier"));
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SUUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4);
    if (v9 > objc_msgSend(v8, "queuePriority"))
    {
      -[SUUIResourceLoader _updateLoadReason:forOperation:](self, "_updateLoadReason:forOperation:", a4, v8);
      objc_msgSend(v8, "setQueuePriority:", v9);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(v6, "newLoadOperation");
    objc_msgSend(v10, "setClientContext:", self->_clientContext);
    objc_msgSend(v10, "_setLoadReason:", a4);
    objc_msgSend(v10, "setQualityOfService:", -[SUUIResourceLoader _qualityOfService](self, "_qualityOfService"));
    objc_msgSend(v10, "setQueuePriority:", -[SUUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a4));
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v15[3] = &unk_2511F6538;
    objc_copyWeak(&v17, &location);
    v11 = v6;
    v16 = v11;
    objc_msgSend(v10, "setOutputBlock:", v15);
    -[SUUIResourceLoader _sendDidBeginLoadingIfNecessary](self, "_sendDidBeginLoadingIfNecessary");
    objc_msgSend(v11, "cacheKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMapTable setObject:forKey:](self->_requestsByCacheKey, "setObject:forKey:", v7, v12);
    -[NSMutableDictionary setObject:forKey:](self->_operationsByRequestID, "setObject:forKey:", v10, v7);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);
    v13 = a4 == 0;
    if (a4 == 1)
      v13 = 2;
    ++self->_requestCountMap[v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v8 == 0;
}

void __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v10[3] = &unk_2511F5128;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = *(id *)(a1 + 32);
  v9 = v5;
  v12 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v13);
}

void __53__SUUIResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishLoadForRequest:withResource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)requestIdentifierForCacheKey:(id)a3
{
  return -[NSMapTable objectForKey:](self->_requestsByCacheKey, "objectForKey:", a3);
}

- (BOOL)trySetReason:(int64_t)a3 forRequestWithIdentifier:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a4);
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUIResourceLoader _updateLoadReason:forOperation:](self, "_updateLoadReason:forOperation:", a3, v7);
    objc_msgSend(v7, "setQueuePriority:", -[SUUIResourceLoader _queuePriorityForLoadReason:](self, "_queuePriorityForLoadReason:", a3));
  }

  return v7 != 0;
}

- (int64_t)resourceCacheLimit
{
  return -[NSCache countLimit](self->_resourcesByRequestID, "countLimit");
}

- (void)setResourceCacheLimit:(int64_t)a3
{
  -[NSCache setCountLimit:](self->_resourcesByRequestID, "setCountLimit:", a3);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  void *v5;
  NSMapTable *requestsByCacheKey;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "requestCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    requestsByCacheKey = self->_requestsByCacheKey;
    objc_msgSend(v8, "requestCacheKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](requestsByCacheKey, "removeObjectForKey:", v7);

  }
}

- (int64_t)_queuePriorityForLoadReason:(int64_t)a3
{
  int64_t v3;
  int64_t v4;

  v3 = 4;
  if ((unint64_t)(a3 + 1) < 3)
    v3 = 4 * (a3 + 1);
  v4 = -8;
  if (!a3)
    v4 = -4;
  if (a3 == 1)
    v4 = 0;
  if (self->_inBackground)
    return v4;
  else
    return v3;
}

- (int64_t)_qualityOfService
{
  if (self->_inBackground)
    return 9;
  else
    return 25;
}

- (void)_updateLoadReason:(int64_t)a3 forOperation:(id)a4
{
  uint64_t v6;
  void *v7;
  int64_t *requestCountMap;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v6 = objc_msgSend(v12, "_loadReason");
  v7 = v12;
  if (v6 != a3)
  {
    objc_msgSend(v12, "_setLoadReason:", a3);
    requestCountMap = self->_requestCountMap;
    v9 = a3 == 0;
    v10 = 2;
    if (a3 == 1)
      v9 = 2;
    ++requestCountMap[v9];
    if (v6 != 1)
      v10 = v6 == 0;
    v11 = requestCountMap[v10];
    if (v11 >= 1)
      requestCountMap[v10] = --v11;
    v7 = v12;
    if (!v11)
    {
      -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v6);
      v7 = v12;
    }
  }

}

- (void)_reprioritizeOperations
{
  NSMutableDictionary *operationsByRequestID;
  _QWORD v3[5];

  operationsByRequestID = self->_operationsByRequestID;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__SUUIResourceLoader__reprioritizeOperations__block_invoke;
  v3[3] = &unk_2511F6560;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](operationsByRequestID, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __45__SUUIResourceLoader__reprioritizeOperations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "setQueuePriority:", objc_msgSend(v4, "_queuePriorityForLoadReason:", objc_msgSend(v5, "_loadReason")));
  objc_msgSend(v5, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "_qualityOfService"));

}

- (void)_finishLoadForRequest:(id)a3 withResource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSCache *resourcesByRequestID;
  _SUUIResourceCacheValue *v11;
  void *v12;
  _SUUIResourceCacheValue *v13;
  void *v14;
  int64_t *requestCountMap;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", objc_msgSend(v18, "requestIdentifier"));
  -[NSMutableDictionary objectForKey:](self->_operationsByRequestID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_loadReason");
  -[NSMutableDictionary removeObjectForKey:](self->_operationsByRequestID, "removeObjectForKey:", v7);
  if (v6)
  {
    if (objc_msgSend(v18, "cachesInMemory"))
    {
      resourcesByRequestID = self->_resourcesByRequestID;
      v11 = [_SUUIResourceCacheValue alloc];
      objc_msgSend(v18, "cacheKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SUUIResourceCacheValue initWithResource:requestCacheKey:](v11, "initWithResource:requestCacheKey:", v6, v12);
      -[NSCache setObject:forKey:](resourcesByRequestID, "setObject:forKey:", v13, v7);

    }
    objc_msgSend(v18, "finishWithResource:", v6);
  }
  else
  {
    objc_msgSend(v18, "cacheKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[NSMapTable removeObjectForKey:](self->_requestsByCacheKey, "removeObjectForKey:", v14);

  }
  requestCountMap = self->_requestCountMap;
  v16 = 2;
  if (v9 != 1)
    v16 = v9 == 0;
  v17 = requestCountMap[v16];
  if (v17 >= 1)
    requestCountMap[v16] = --v17;
  if (!v17)
    -[SUUIResourceLoader _sendDidLoadAllForReason:](self, "_sendDidLoadAllForReason:", v9);
  -[SUUIResourceLoader _sendDidIdleIfNecessary](self, "_sendDidIdleIfNecessary");

}

- (void)_sendDidBeginLoadingIfNecessary
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  if (-[SUUIResourceLoader isIdle](self, "isIdle"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("SUUIResourceLoaderDidBeginLoadingNotification"), self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "resourceLoaderDidBeginLoading:", self);

    }
  }
}

- (void)_sendDidIdleIfNecessary
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  if (-[SUUIResourceLoader isIdle](self, "isIdle"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("SUUIResourceLoaderDidIdleNotification"), self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "resourceLoaderDidIdle:", self);

    }
  }
}

- (void)_sendDidLoadAllForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("SUUIResourceLoaderLoadReasonUserInfoKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SUUIResourceLoaderDidLoadAllForReasonNotification"), self, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "resourceLoader:didLoadAllForReason:", self, a3);

  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (SUUIResourceLoaderDelegate)delegate
{
  return (SUUIResourceLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_resourcesByRequestID, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_operationsByRequestID, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
