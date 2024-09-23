@implementation ASKResourceLoader

void __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKResourceLoaderDidIdleNotification"), WeakRetained);

  }
}

void __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("ASKResourceLoaderLoadReasonUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ASKResourceLoaderDidLoadAllForReasonNotification"), WeakRetained, v5);

  }
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "finishLoadForRequest:withResource:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASKResourceLoaderDidBeginLoadingNotification"), WeakRetained);

  }
}

void __62__ASKResourceLoader_postDidFinishLoadingForReason_requestKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("ASKResourceLoaderLoadReasonUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = CFSTR("ASKResourceLoaderRequestKeyUserInfoKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ASKResourceLoaderDidFinishLoadingForReasonNotification"), WeakRetained, v6);

  }
}

void __61__ASKResourceLoader_postDidBeginLoadingForReason_requestKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("ASKResourceLoaderLoadReasonUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = CFSTR("ASKResourceLoaderRequestKeyUserInfoKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ASKResourceLoaderDidBeginLoadingForReasonNotification"), WeakRetained, v6);

  }
}

- (ASKResourceLoader)initWithParentResourceLoader:(id)a3
{
  id v4;
  ASKResourceLoader *v5;
  uint64_t v6;
  NSOperationQueue *requestQueue;
  uint64_t v8;
  NSOperationQueue *accessQueue;
  uint64_t v10;
  NSOperationQueue *notificationQueue;
  uint64_t v12;
  ASKResourceCache *cachedResources;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASKResourceLoader;
  v5 = -[ASKResourceLoader init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "requestQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    requestQueue = v5->_requestQueue;
    v5->_requestQueue = (NSOperationQueue *)v6;

    objc_msgSend(v4, "accessQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (NSOperationQueue *)v8;

    objc_msgSend(v4, "notificationQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (NSOperationQueue *)v10;

    objc_msgSend(v4, "cachedResources");
    v12 = objc_claimAutoreleasedReturnValue();
    cachedResources = v5->_cachedResources;
    v5->_cachedResources = (ASKResourceCache *)v12;

    -[ASKResourceLoader _commonInit](v5, "_commonInit");
    v5->_isInBackground = 1;
  }

  return v5;
}

void __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke_2;
  v11[3] = &unk_1E9DB1B30;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

  objc_destroyWeak(&v15);
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingOperations;
  NSMapTable *v5;
  NSMapTable *requestsByCacheKey;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pendingOperations = self->_pendingOperations;
  self->_pendingOperations = v3;

  v5 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  requestsByCacheKey = self->_requestsByCacheKey;
  self->_requestsByCacheKey = v5;

}

- (id)cachedResourcesForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASKResourceLoader cachedResources](self, "cachedResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcesForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)finishLoadForRequest:(id)a3 withResource:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v23, "requestKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cacheKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "_loadReason");
  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v10);

  -[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v11);

  -[ASKResourceLoader cachedResources](self, "cachedResources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isGroupMember"))
    v18 = -[ASKResourceLoader isInBackground](self, "isInBackground");
  else
    v18 = 0;

  if (v8)
  {
    if (!v18)
    {
      v19 = objc_msgSend(v23, "cacheOptions");
      if ((v19 & 2) != 0)
      {
        -[ASKResourceLoader cachedResources](self, "cachedResources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v19 & 4) != 0)
          objc_msgSend(v20, "replaceResourcesForKey:withResource:", v11, v8);
        else
          objc_msgSend(v20, "addResource:forKey:", v8, v11);

      }
    }
  }
  objc_msgSend(v23, "didLoadResource:error:", v8, v9);
  -[ASKResourceLoader postDidFinishLoadingForReason:requestKey:](self, "postDidFinishLoadingForReason:requestKey:", v14, v10);
  v22 = self->_requestCountMap[v14];
  if (v22 >= 1)
    self->_requestCountMap[v14] = --v22;
  if (!v22)
    -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v14);
  -[ASKResourceLoader postDidIdleIfIdle](self, "postDidIdleIfIdle");

}

- (ASKResourceCache)cachedResources
{
  return self->_cachedResources;
}

- (BOOL)loadResourceWithRequest:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v6 = a3;
  objc_msgSend(v6, "requestKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v11 = 4 * a4;
    if ((unint64_t)a4 >= 3)
      v11 = 4;
    v12 = -8;
    if (a4 == 1)
      v12 = -4;
    if (a4 == 2)
      v12 = 0;
    if (v10)
      v13 = v12;
    else
      v13 = v11;
    if (v13 > objc_msgSend(v9, "queuePriority"))
    {
      -[ASKResourceLoader updateLoadReason:forOperation:requestKey:](self, "updateLoadReason:forOperation:requestKey:", a4, v9, v7);
      objc_msgSend(v9, "setQueuePriority:", v13);
    }
  }
  else
  {
    objc_msgSend(v6, "makeLoadOperation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setLoadReason:", a4);
    objc_msgSend(v14, "setQualityOfService:", -[ASKResourceLoader currentQualityOfService](self, "currentQualityOfService"));
    v15 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v16 = 4 * a4;
    if ((unint64_t)a4 >= 3)
      v16 = 4;
    v17 = -8;
    if (a4 == 1)
      v17 = -4;
    if (a4 == 2)
      v17 = 0;
    if (v15)
      v18 = v17;
    else
      v18 = v16;
    objc_msgSend(v14, "setQueuePriority:", v18);
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__ASKResourceLoader_loadResourceWithRequest_reason___block_invoke;
    v25[3] = &unk_1E9DB1B58;
    objc_copyWeak(&v27, &location);
    v19 = v6;
    v26 = v19;
    objc_msgSend(v14, "setOutputBlock:", v25);
    -[ASKResourceLoader postDidBeginLoadingIfIdle](self, "postDidBeginLoadingIfIdle");
    -[ASKResourceLoader postDidBeginLoadingForReason:requestKey:](self, "postDidBeginLoadingForReason:requestKey:", a4, v7);
    -[ASKResourceLoader pendingOperations](self, "pendingOperations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v7);

    -[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cacheKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v7, v22);

    -[ASKResourceLoader requestQueue](self, "requestQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v14);

    ++self->_requestCountMap[a4];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v9 == 0;
}

- (BOOL)isIdle
{
  void *v2;
  BOOL v3;

  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (NSMapTable)requestsByCacheKey
{
  return self->_requestsByCacheKey;
}

- (BOOL)setReason:(int64_t)a3 forRequestWithKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASKResourceLoader updateLoadReason:forOperation:requestKey:](self, "updateLoadReason:forOperation:requestKey:", a3, v8, v6);
    v9 = -[ASKResourceLoader isInBackground](self, "isInBackground");
    v10 = 4 * a3;
    if ((unint64_t)a3 >= 3)
      v10 = 4;
    v11 = -8;
    if (a3 == 1)
      v11 = -4;
    if (a3 == 2)
      v11 = 0;
    if (v9)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v8, "setQueuePriority:", v12);
  }

  return v8 != 0;
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (int64_t)currentQualityOfService
{
  if (-[ASKResourceLoader isInBackground](self, "isInBackground"))
    return 9;
  else
    return 25;
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)postDidBeginLoadingIfIdle
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ASKResourceLoader isIdle](self, "isIdle"))
  {
    objc_initWeak(&location, self);
    -[ASKResourceLoader notificationQueue](self, "notificationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__ASKResourceLoader_postDidBeginLoadingIfIdle__block_invoke;
    v4[3] = &unk_1E9DB1B80;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "addOperationWithBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)postDidFinishLoadingForReason:(int64_t)a3 requestKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[ASKResourceLoader notificationQueue](self, "notificationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__ASKResourceLoader_postDidFinishLoadingForReason_requestKey___block_invoke;
  v9[3] = &unk_1E9DB1BA8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addOperationWithBlock:", v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)postDidBeginLoadingForReason:(int64_t)a3 requestKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[ASKResourceLoader notificationQueue](self, "notificationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ASKResourceLoader_postDidBeginLoadingForReason_requestKey___block_invoke;
  v9[3] = &unk_1E9DB1BA8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addOperationWithBlock:", v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)postDidIdleIfIdle
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ASKResourceLoader isIdle](self, "isIdle"))
  {
    objc_initWeak(&location, self);
    -[ASKResourceLoader notificationQueue](self, "notificationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__ASKResourceLoader_postDidIdleIfIdle__block_invoke;
    v4[3] = &unk_1E9DB1B80;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "addOperationWithBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)updateLoadReason:(int64_t)a3 forOperation:(id)a4 requestKey:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = objc_msgSend(v12, "_loadReason");
  if (v9 != a3)
  {
    v10 = v9;
    objc_msgSend(v12, "_setLoadReason:", a3);
    -[ASKResourceLoader postDidFinishLoadingForReason:requestKey:](self, "postDidFinishLoadingForReason:requestKey:", v10, v8);
    -[ASKResourceLoader postDidBeginLoadingForReason:requestKey:](self, "postDidBeginLoadingForReason:requestKey:", a3, v8);
    v11 = self->_requestCountMap[v10];
    if (v11 >= 1)
      self->_requestCountMap[v10] = --v11;
    if (!v11)
      -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v10);
  }

}

- (BOOL)isIdleForReason:(int64_t)a3
{
  return self->_requestCountMap[a3] == 0;
}

- (void)reprioritizeOperations
{
  int64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[ASKResourceLoader currentQualityOfService](self, "currentQualityOfService");
  v4 = -[ASKResourceLoader isInBackground](self, "isInBackground");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ASKResourceLoader pendingOperations](self, "pendingOperations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "_loadReason");
        if (v4)
        {
          if (v12 == 1)
            v13 = -4;
          else
            v13 = -8;
          if (v12 == 2)
            v14 = 0;
          else
            v14 = v13;
        }
        else if (v12 >= 3)
        {
          v14 = 4;
        }
        else
        {
          v14 = 4 * v12;
        }
        objc_msgSend(v11, "setQueuePriority:", v14);
        objc_msgSend(v11, "setQualityOfService:", v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)postDidLoadAllForReason:(int64_t)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  -[ASKResourceLoader notificationQueue](self, "notificationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ASKResourceLoader_postDidLoadAllForReason___block_invoke;
  v6[3] = &unk_1E9DB1BD0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (ASKResourceLoader)initWithRequestQueue:(id)a3 accessQueue:(id)a4 notificationQueue:(id)a5 cacheLimit:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  ASKResourceLoader *v14;
  ASKResourceLoader *v15;
  ASKResourceCache *v16;
  ASKResourceCache *cachedResources;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASKResourceLoader;
  v14 = -[ASKResourceLoader init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestQueue, a3);
    objc_storeStrong((id *)&v15->_accessQueue, a4);
    objc_storeStrong((id *)&v15->_notificationQueue, a5);
    v16 = objc_alloc_init(ASKResourceCache);
    cachedResources = v15->_cachedResources;
    v15->_cachedResources = v16;

    -[ASKResourceCache setLimit:](v15->_cachedResources, "setLimit:", a6);
    -[ASKResourceCache setEvictsObjectsWhenApplicationEntersBackground:](v15->_cachedResources, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[ASKResourceLoader _commonInit](v15, "_commonInit");
  }

  return v15;
}

- (void)enterForeground
{
  if (self->_isInBackground)
  {
    self->_isInBackground = 0;
    -[ASKResourceLoader reprioritizeOperations](self, "reprioritizeOperations");
  }
}

- (ASKResourceLoader)init
{
  -[ASKResourceLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[ASKResourceLoader cancelAllRequests](self, "cancelAllRequests");
  v3.receiver = self;
  v3.super_class = (Class)ASKResourceLoader;
  -[ASKResourceLoader dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceLoader requestQueue](self, "requestQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceLoader accessQueue](self, "accessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASKResourceLoader notificationQueue](self, "notificationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASKResourceLoader isInBackground](self, "isInBackground"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{onScreen: %ld, cacheAhead: %ld, cacheFarAhead: %ld}"), self->_requestCountMap[2], self->_requestCountMap[1], self->_requestCountMap[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p requestQueue = %@, accessQueue = %@, notificationQueue = %@, isInBackground = %@, loadCounts = %@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)addResource:(id)a3 forCacheKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASKResourceLoader cachedResources](self, "cachedResources");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addResource:forKey:", v7, v6);

}

- (void)removeAllCachedResources
{
  id v2;

  -[ASKResourceLoader cachedResources](self, "cachedResources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllResources");

}

- (id)requestKeyForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cancelAllRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_cancel);

  -[ASKResourceLoader pendingOperations](self, "pendingOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  if (self->_requestCountMap[2] >= 1)
    self->_requestCountMap[2] = 0;
  if (self->_requestCountMap[1] >= 1)
    self->_requestCountMap[1] = 0;
  if (self->_requestCountMap[0] >= 1)
    self->_requestCountMap[0] = 0;
}

- (void)cancelRequestForCacheKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[ASKResourceLoader requestKeyForCacheKey:](self, "requestKeyForCacheKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASKResourceLoader pendingOperations](self, "pendingOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "cancel");
      -[ASKResourceLoader pendingOperations](self, "pendingOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v4);

      -[ASKResourceLoader requestsByCacheKey](self, "requestsByCacheKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v11);

      v9 = objc_msgSend(v6, "_loadReason");
      -[ASKResourceLoader postDidFinishLoadingForReason:requestKey:](self, "postDidFinishLoadingForReason:requestKey:", v9, v4);
      v10 = self->_requestCountMap[v9];
      if (v10 >= 1)
        self->_requestCountMap[v9] = --v10;
      if (!v10)
        -[ASKResourceLoader postDidLoadAllForReason:](self, "postDidLoadAllForReason:", v9);
    }

  }
}

- (void)enterBackground
{
  if (!self->_isInBackground)
  {
    self->_isInBackground = 1;
    -[ASKResourceLoader reprioritizeOperations](self, "reprioritizeOperations");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_requestsByCacheKey, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
