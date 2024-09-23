@implementation HLPURLSessionManager

+ (id)defaultManager
{
  if (defaultManager_predicate_0 != -1)
    dispatch_once(&defaultManager_predicate_0, &__block_literal_global_14);
  return (id)defaultManager_gURLSessionManager;
}

void __38__HLPURLSessionManager_defaultManager__block_invoke()
{
  HLPURLSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(HLPURLSessionManager);
  v1 = (void *)defaultManager_gURLSessionManager;
  defaultManager_gURLSessionManager = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *sessionTaskQueue;
  objc_super v4;
  _QWORD block[5];

  -[NSURLSession invalidateAndCancel](self->_URLSession, "invalidateAndCancel");
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__HLPURLSessionManager_dealloc__block_invoke;
  block[3] = &unk_24D32E6B8;
  block[4] = self;
  dispatch_sync(sessionTaskQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)HLPURLSessionManager;
  -[HLPURLSessionManager dealloc](&v4, sel_dealloc);
}

void __31__HLPURLSessionManager_dealloc__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (HLPURLSessionManager)init
{
  HLPURLSessionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sessionTaskQueue;
  NSObject *v5;
  _QWORD block[4];
  HLPURLSessionManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HLPURLSessionManager;
  v2 = -[HLPURLSessionManager init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.IPURLSessionSerialQueue", 0);
    sessionTaskQueue = v2->_sessionTaskQueue;
    v2->_sessionTaskQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_sessionTaskQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__HLPURLSessionManager_init__block_invoke;
    block[3] = &unk_24D32E6B8;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __28__HLPURLSessionManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBD1B8];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setCoalesceTaskURLMap:", v3);

  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setUncoalesceTaskMap:", v4);

  if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
  {
    if (!PingPongClientLibraryCore_frameworkLibrary_1)
    {
      v12 = xmmword_24D32F4C0;
      v13 = 0;
      PingPongClientLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    }
    if (PingPongClientLibraryCore_frameworkLibrary_1)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2050000000;
      v5 = (void *)getPPCRedirectClass_softClass_0;
      v11 = getPPCRedirectClass_softClass_0;
      if (!getPPCRedirectClass_softClass_0)
      {
        *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v12 + 1) = 3221225472;
        v13 = __getPPCRedirectClass_block_invoke_0;
        v14 = &unk_24D32E720;
        v15 = &v8;
        __getPPCRedirectClass_block_invoke_0((uint64_t)&v12);
        v5 = (void *)v9[3];
      }
      v6 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v8, 8);
      v7 = objc_alloc_init(v6);
      objc_msgSend(*(id *)(a1 + 32), "setUrlRedirector:", v7, v8);

    }
  }
}

- (NSURLSession)URLSession
{
  NSURLSession *URLSession;
  id WeakRetained;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *sessionTaskQueue;
  id v18;
  id v19;
  _QWORD block[5];
  id v22;
  id v23;

  URLSession = self->_URLSession;
  if (!URLSession)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "URLSessionManagerSessionConfiguration:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 5242880, 26214400, v6);
      objc_msgSend(MEMORY[0x24BDD1800], "setSharedURLCache:", v9);
      objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setURLCache:", v9);

    }
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "URLSessionManagerSessionOperationQueue:", self);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x24BDD1710]);
      objc_msgSend(v13, "setMaxConcurrentOperationCount:", 4);
    }
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_coalesceRequests = objc_msgSend(v16, "URLSessionManagerShouldCoalesceRequest:", self);

    }
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__HLPURLSessionManager_URLSession__block_invoke;
    block[3] = &unk_24D32E648;
    block[4] = self;
    v22 = v7;
    v23 = v13;
    v18 = v13;
    v19 = v7;
    dispatch_sync(sessionTaskQueue, block);

    URLSession = self->_URLSession;
  }
  return URLSession;
}

void __34__HLPURLSessionManager_URLSession__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setURLSession:", v2);

}

- (id)_mappedURLRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[HLPURLSessionManager urlRedirector](self, "urlRedirector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPURLSessionManager urlRedirector](self, "urlRedirector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappedURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
  {

LABEL_5:
    v9 = v4;
    goto LABEL_6;
  }
  v9 = (id)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v9, "setURL:", v8);
  v11 = (void *)MEMORY[0x24BDBCED8];
  -[HLPURLSessionManager authenticationHandler](self, "authenticationHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customHeaderFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v9, "allHTTPHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addEntriesFromDictionary:", v15);

    objc_msgSend(v9, "setAllHTTPHeaderFields:", v14);
  }

LABEL_6:
  return v9;
}

- (void)setDefaultSessionDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_defaultSessionDelegate, obj);
    v6 = (uint64_t)+[HLPURLSessionTask delegateRespondsWithDelegate:](HLPURLSessionTask, "delegateRespondsWithDelegate:", obj);
    *(_DWORD *)&self->_defaultSessionDelegateResponds.willCacheResponse = v6;
    *(_WORD *)&self->_defaultSessionDelegateResponds.didCompleteWithError = WORD2(v6);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_respondsToRequestResumed = objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_respondsToRequestCompleted = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_respondsToDidReceiveChallenge = objc_opt_respondsToSelector() & 1;

  }
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5
{
  return -[HLPURLSessionManager newURLSessionItemWithRequest:identifier:networkDelegate:completionHandler:](self, "newURLSessionItemWithRequest:identifier:networkDelegate:completionHandler:", a3, a4, a5, 0);
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  return -[HLPURLSessionManager newURLSessionItemWithRequest:identifier:networkDelegate:completionHandler:](self, "newURLSessionItemWithRequest:identifier:networkDelegate:completionHandler:", a3, a4, 0, a5);
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 networkDelegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HLPURLSessionTask *v19;
  void *v20;
  id WeakRetained;
  unint64_t v22;
  HLPURLSessionItem *v23;
  NSObject *sessionTaskQueue;
  NSObject *v25;
  id v26;
  HLPURLSessionItem *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  HLPURLSessionManager *v32;
  id v33;
  id v34;
  uint64_t *v35;
  _QWORD block[5];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = a6;
  -[HLPURLSessionManager _mappedURLRequest:](self, "_mappedURLRequest:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (v11 || (objc_msgSend(v14, "lastPathComponent"), (v11 = (id)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__4;
    v43 = __Block_byref_object_dispose__4;
    v44 = 0;
    if (v12)
      goto LABEL_5;
    if (!self->_coalesceRequests)
      goto LABEL_5;
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke;
    block[3] = &unk_24D32F3B0;
    v38 = &v39;
    block[4] = self;
    v37 = v15;
    dispatch_sync(sessionTaskQueue, block);

    if (!v40[5])
    {
LABEL_5:
      HLPLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v10;
        _os_log_impl(&dword_2153AA000, v16, OS_LOG_TYPE_DEFAULT, "Fetching: %@", buf, 0xCu);
      }

      -[HLPURLSessionManager URLSession](self, "URLSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataTaskWithRequest:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[HLPURLSessionTask initWithSessionTask:identifier:]([HLPURLSessionTask alloc], "initWithSessionTask:identifier:", v18, v11);
      v20 = (void *)v40[5];
      v40[5] = (uint64_t)v19;

      WeakRetained = v12;
      if (!v12)
        WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
      objc_msgSend((id)v40[5], "setNetworkDelegate:", WeakRetained);
      if (v12)
      {
        v22 = (unint64_t)+[HLPURLSessionTask delegateRespondsWithDelegate:](HLPURLSessionTask, "delegateRespondsWithDelegate:", v12);
      }
      else
      {

        v22 = *(unsigned int *)&self->_defaultSessionDelegateResponds.willCacheResponse | ((unint64_t)*(unsigned __int16 *)&self->_defaultSessionDelegateResponds.didCompleteWithError << 32);
      }
      objc_msgSend((id)v40[5], "setDelegateResponds:", v22 & 0xFFFFFFFFFFFFLL);
      v25 = self->_sessionTaskQueue;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke_24;
      v30[3] = &unk_24D32F3D8;
      v31 = v12;
      v32 = self;
      v34 = v18;
      v35 = &v39;
      v33 = v15;
      v26 = v18;
      dispatch_sync(v25, v30);

    }
    v27 = [HLPURLSessionItem alloc];
    v23 = -[HLPURLSessionItem initWithSessionTask:completionHandler:](v27, "initWithSessionTask:completionHandler:", v40[5], v29);
    _Block_object_dispose(&v39, 8);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __98__HLPURLSessionManager_newURLSessionItemWithRequest_identifier_networkDelegate_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "coalesceRequests"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "uncoalesceTaskMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "coalesceTaskURLMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
  }
  v5 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

- (void)resumeSessionItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  HLPURLSessionManager *v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    if (self->_respondsToRequestResumed)
    {
      v5 = MEMORY[0x24BDAC760];
      v6 = 3221225472;
      v7 = __42__HLPURLSessionManager_resumeSessionItem___block_invoke;
      v8 = &unk_24D32EA90;
      v9 = self;
      v10 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], &v5);

    }
    objc_msgSend(v4, "resume", v5, v6, v7, v8, v9);
  }

}

void __42__HLPURLSessionManager_resumeSessionItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLSessionManagerRequestResumed:sessionTask:", v2, v3);

}

- (void)cancelSessionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "cancel");
    objc_msgSend(v4, "sessionTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "isCancelled"))
    {
      objc_msgSend(v5, "task");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPURLSessionManager removeTaskFromMap:](self, "removeTaskFromMap:", v6);

      if (self->_respondsToRequestCompleted)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __42__HLPURLSessionManager_cancelSessionItem___block_invoke;
        v7[3] = &unk_24D32EA90;
        v7[4] = self;
        v8 = v5;
        dispatch_async(MEMORY[0x24BDAC9B8], v7);

      }
    }

  }
}

void __42__HLPURLSessionManager_cancelSessionItem___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLSessionManagerRequestCompleted:sessionTask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  HLPURLSessionManager *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__HLPURLSessionManager_sessionTask_didCompleteWithError___block_invoke;
    block[3] = &unk_24D32E648;
    v8 = v6;
    v11 = v8;
    v12 = v7;
    v13 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_msgSend(v8, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPURLSessionManager removeTaskFromMap:](self, "removeTaskFromMap:", v9);

  }
}

void __57__HLPURLSessionManager_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithError:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "respondsToRequestCompleted"))
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLSessionManagerRequestCompleted:sessionTask:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

- (void)removeTaskFromMap:(id)a3
{
  id v4;
  NSObject *sessionTaskQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionTaskQueue = self->_sessionTaskQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HLPURLSessionManager_removeTaskFromMap___block_invoke;
  v7[3] = &unk_24D32EA90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionTaskQueue, v7);

}

void __42__HLPURLSessionManager_removeTaskFromMap___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "coalesceRequests");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "coalesceTaskURLMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);

  }
  else
  {
    objc_msgSend(v3, "uncoalesceTaskMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (id)sessionTaskForTask:(id)a3
{
  id v4;
  NSObject *sessionTaskQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HLPURLSessionManager_sessionTaskForTask___block_invoke;
  block[3] = &unk_24D32F400;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sessionTaskQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__HLPURLSessionManager_sessionTaskForTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "coalesceRequests"))
  {
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "coalesceTaskURLMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v9);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HLPURLSessionManager *v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  HLPURLSessionManager *v30;
  id v31;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    v27[3] = &unk_24D32F450;
    v14 = v12;
    v28 = v14;
    v15 = v10;
    v29 = v15;
    v30 = self;
    v16 = v11;
    v31 = v16;
    v17 = (void (**)(_QWORD))MEMORY[0x2199E0554](v27);
    -[HLPURLSessionManager authenticationHandler](self, "authenticationHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "canAuthenticateWithURLResponse:", v15))
    {
      v19 = objc_msgSend(v14, "retryCount");

      if (!v19)
      {
        objc_msgSend(v14, "setRetryCount:", objc_msgSend(v14, "retryCount") + 1);
        -[HLPURLSessionManager authenticationHandler](self, "authenticationHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
        v21[3] = &unk_24D32F4A0;
        v25 = v17;
        v22 = v9;
        v26 = v16;
        v23 = self;
        v24 = v14;
        objc_msgSend(v20, "authenticateWithCompletion:", v21);

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {

    }
    v17[2](v17);
    goto LABEL_8;
  }
  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_9:

}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "delegateResponds") & 0x1000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v6[3] = &unk_24D32F428;
    v6[4] = *(_QWORD *)(a1 + 48);
    v7 = v4;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v3, "sessionTask:didReceiveResponse:completionHandler:", v7, v5, v6);

  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*(id *)(a1 + 32), "setDataTaskData:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionTask:didCompleteWithError:", *(_QWORD *)(a1 + 40), 0);
  }
  else if (a2 == 1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*(id *)(a1 + 40), "setDataTaskData:", v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v15 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    objc_msgSend(*(id *)(a1 + 32), "originalRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setAllHTTPHeaderFields:", v15);
    objc_msgSend(*(id *)(a1 + 40), "URLSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataTaskWithRequest:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "setTask:", v10);
    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
    block[3] = &unk_24D32F478;
    block[4] = v11;
    v17 = v12;
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    v14 = v10;
    dispatch_sync(v13, block);
    objc_msgSend(v14, "resume");

  }
}

void __81__HLPURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataTaskData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "appendData:", v10);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *sessionTaskQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTask:", v8);
  objc_msgSend(v9, "setDataTaskData:", 0);
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HLPURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  block[3] = &unk_24D32F478;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  dispatch_sync(sessionTaskQueue, block);
  objc_msgSend(v13, "resume");

}

void __66__HLPURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "coalesceRequests") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "uncoalesceTaskMap");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, id);
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v9 = (void (**)(id, id))a6;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "delegateResponds") & 1) != 0)
  {
    objc_msgSend(v10, "networkDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionTask:willCacheResponse:completionHandler:", v10, v12, v9);

  }
  else
  {
    v9[2](v9, v12);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  void (**v12)(id, id);
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  v11 = a6;
  v12 = (void (**)(id, id))a7;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "delegateResponds") & 0x100) != 0)
  {
    objc_msgSend(v13, "networkDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionTask:willPerformHTTPRedirection:newRequest:completionHandler:", v13, v15, v11, v12);

  }
  else
  {
    v12[2](v12, v11);
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  int64_t v8;
  id v9;

  if (a7 >= 1 || a6 <= 0)
    v8 = a7;
  else
    v8 = a6;
  if (v8 != -1)
  {
    -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDownloadTaskTotalBytes:", v8);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "downloadTaskTotalBytes");
  if (v13 && v8)
  {
    if ((objc_msgSend(v7, "delegateResponds") & 0x10000) != 0)
    {
      objc_msgSend(v7, "networkDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionTask:didFinishDownloadingToURL:", v7, v13);

    }
    else
    {
      v9 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v13, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataWithContentsOfFile:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFormattedData:", v11);

    }
  }
  else
  {
    objc_msgSend(v7, "setDownloadTaskTotalBytes:", 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResponse:", v11);
    objc_msgSend(v11, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastModified:", v13);

  }
  if ((objc_msgSend(v8, "delegateResponds") & 0x100000000) != 0)
  {
    objc_msgSend(v8, "networkDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionTask:didCompleteWithError:", v8, v7);

  }
  if (v8)
  {
    if (v7)
    {
      -[HLPURLSessionManager sessionTask:didCompleteWithError:](self, "sessionTask:didCompleteWithError:", v8, v7);
    }
    else
    {
      objc_msgSend(v8, "dataError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPURLSessionManager sessionTask:didCompleteWithError:](self, "sessionTask:didCompleteWithError:", v8, v15);

    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a5;
  v9 = (void (**)(id, uint64_t, _QWORD))a6;
  -[HLPURLSessionManager sessionTaskForTask:](self, "sessionTaskForTask:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "delegateResponds") & 0x10000000000) != 0
    && (objc_msgSend(v15, "protectionSpace"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "host"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hasSuffix:", CFSTR(".apple.com")),
        v12,
        v11,
        v13))
  {
    objc_msgSend(v10, "networkDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionTask:didReceiveChallenge:completionHandler:", v10, v15, v9);

  }
  else
  {
    v9[2](v9, 3, 0);
  }

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (self->_respondsToDidReceiveChallenge
    && (objc_msgSend(v8, "protectionSpace"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "host"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(".apple.com")),
        v11,
        v10,
        v12))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "URLSessionManagerDidReceiveChallenge:completionHandler:", v8, v9);

  }
  else
  {
    v9[2](v9, 3, 0);
  }

}

- (HLPURLSessionManagerDelegate)delegate
{
  return (HLPURLSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HLPURLSessionDelegate)defaultSessionDelegate
{
  return (HLPURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
}

- (HLPURLSessionCustomAuthHandling)authenticationHandler
{
  return self->_authenticationHandler;
}

- (void)setAuthenticationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationHandler, a3);
}

- (BOOL)respondsToRequestResumed
{
  return self->_respondsToRequestResumed;
}

- (void)setRespondsToRequestResumed:(BOOL)a3
{
  self->_respondsToRequestResumed = a3;
}

- (BOOL)respondsToRequestCompleted
{
  return self->_respondsToRequestCompleted;
}

- (void)setRespondsToRequestCompleted:(BOOL)a3
{
  self->_respondsToRequestCompleted = a3;
}

- (BOOL)respondsToDidReceiveChallenge
{
  return self->_respondsToDidReceiveChallenge;
}

- (void)setRespondsToDidReceiveChallenge:(BOOL)a3
{
  self->_respondsToDidReceiveChallenge = a3;
}

- (BOOL)coalesceRequests
{
  return self->_coalesceRequests;
}

- (void)setCoalesceRequests:(BOOL)a3
{
  self->_coalesceRequests = a3;
}

- (NSMutableDictionary)coalesceTaskURLMap
{
  return self->_coalesceTaskURLMap;
}

- (void)setCoalesceTaskURLMap:(id)a3
{
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, a3);
}

- (NSMutableDictionary)uncoalesceTaskMap
{
  return self->_uncoalesceTaskMap;
}

- (void)setUncoalesceTaskMap:(id)a3
{
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, a3);
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (PPCRedirect)urlRedirector
{
  return self->_urlRedirector;
}

- (void)setUrlRedirector:(id)a3
{
  objc_storeStrong((id *)&self->_urlRedirector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRedirector, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, 0);
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, 0);
  objc_storeStrong((id *)&self->_authenticationHandler, 0);
  objc_destroyWeak((id *)&self->_defaultSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionTaskQueue, 0);
}

@end
