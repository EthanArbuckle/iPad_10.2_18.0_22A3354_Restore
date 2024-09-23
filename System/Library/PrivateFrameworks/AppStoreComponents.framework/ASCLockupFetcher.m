@implementation ASCLockupFetcher

+ (ASCLockupFetcher)sharedFetcher
{
  if (sharedFetcher_onceToken_0 != -1)
    dispatch_once(&sharedFetcher_onceToken_0, &__block_literal_global_9);
  return (ASCLockupFetcher *)(id)sharedFetcher_sharedFetcher_0;
}

void __33__ASCLockupFetcher_sharedFetcher__block_invoke()
{
  ASCLockupFetcher *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ASCLockupFetcher alloc];
  +[ASCServicesConnection sharedConnection](ASCServicesConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ASCLockupFetcher initWithConnection:](v0, "initWithConnection:", v3);
  v2 = (void *)sharedFetcher_sharedFetcher_0;
  sharedFetcher_sharedFetcher_0 = v1;

}

- (ASCLockupFetcher)initWithConnection:(id)a3
{
  id v5;
  ASCLockupFetcher *v6;
  ASCLockupFetcher *v7;
  ASCPendingPromises *v8;
  ASCPendingPromises *pendingRequests;
  ASCTaskCoordinator *v10;
  ASCTaskCoordinator *requestCoordinator;
  ASCLazy *v12;
  ASCLazy *bundleCoordinator;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFetcher;
  v6 = -[ASCLockupFetcher init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v8;

    v10 = -[ASCTaskCoordinator initWithName:]([ASCTaskCoordinator alloc], "initWithName:", CFSTR("ASCLockupFetcher.requests"));
    requestCoordinator = v7->_requestCoordinator;
    v7->_requestCoordinator = v10;

    v12 = -[ASCLazy initWithFactory:]([ASCLazy alloc], "initWithFactory:", &__block_literal_global_9);
    bundleCoordinator = v7->_bundleCoordinator;
    v7->_bundleCoordinator = v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F68, v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F88, v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCRebootstrapNotifier sharedNotifier](ASCRebootstrapNotifier, "sharedNotifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_daemonDidRebootstrap_, 0x1E7565F08, v17);

  }
  return v7;
}

ASCTaskCoordinator *__39__ASCLockupFetcher_initWithConnection___block_invoke()
{
  return -[ASCTaskCoordinator initWithName:]([ASCTaskCoordinator alloc], "initWithName:", CFSTR("ASCLockupFetcher.bundleIDs"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupFetcher;
  -[ASCLockupFetcher dealloc](&v4, sel_dealloc);
}

- (void)daemonConnectionWasLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Connection to daemon was lost");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("ASCLockupFetcherErrorDomain"), 1, v5);

  -[ASCLockupFetcher pendingRequests](self, "pendingRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishAllWithError:", v6);

}

- (void)daemonDidRebootstrap:(id)a3
{
  id v3;

  -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllFinishedTasks");

}

- (id)loadedLockupWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taskForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "isFinished"))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)lockupWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__ASCLockupFetcher_lockupWithRequest___block_invoke;
  v9[3] = &unk_1E7560790;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "taskForKey:withCreatorBlock:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __38__ASCLockupFetcher_lockupWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v2);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockupFetcherService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutablePromiseAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ASCLockupFetcher_lockupWithRequest___block_invoke_2;
  v8[3] = &unk_1E7560A48;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

id __38__ASCLockupFetcher_lockupWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addPromise:", v5);

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLockupWithRequest:withReplyHandler:", v7, v8);

  return v5;
}

- (void)submitBatchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  ASCLockupFetcher *v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke;
  v37[3] = &unk_1E7560578;
  v23 = v4;
  v38 = v23;
  v39 = self;
  v24 = v6;
  v40 = v24;
  objc_msgSend(v7, "withLock:", v37);

  objc_msgSend(v23, "lockupBatchRequestWithIDs:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[ASCLockupFetcher pendingRequests](self, "pendingRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v10);

    -[ASCLockupFetcher connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lockupFetcherService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutablePromiseAdapter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_2;
    v33[3] = &unk_1E7560A48;
    objc_copyWeak(&v35, &location);
    v13 = v25;
    v34 = v13;
    objc_msgSend(v22, "thenWithBlock:", v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v13, "requests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_3;
          v26[3] = &unk_1E7560790;
          v27 = v14;
          v28 = v19;
          v21 = (id)objc_msgSend(v20, "taskForKey:withCreatorBlock:", v19, v26);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v16);
    }

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

}

void __39__ASCLockupFetcher_submitBatchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "requests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "requestCoordinator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasTaskForKey:", v7);

        if (v9)
        {
          v10 = *(void **)(a1 + 48);
          objc_msgSend(v7, "id");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeObject:", v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addPromise:", v5);

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLockupsWithRequest:withReplyHandler:", v7, v8);

  return v5;
}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__ASCLockupFetcher_submitBatchRequest___block_invoke_4;
  v3[3] = &unk_1E7560A70;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "thenWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __39__ASCLockupFetcher_submitBatchRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("No lockup for %@ was fetched from batch request"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ASCLockupFetcherErrorDomain"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithError:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)lockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5
{
  id v8;
  id v9;
  ASCPair *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = -[ASCPair initWithFirst:second:]([ASCPair alloc], "initWithFirst:second:", v8, v9);
  -[ASCLockupFetcher bundleCoordinator](self, "bundleCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke;
  v17[3] = &unk_1E7560B10;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a5;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "taskForKey:withCreatorBlock:", v10, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v2);

  objc_msgSend(*(id *)(a1 + 32), "requestCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v3);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockupFetcherService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutablePromiseAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_2;
  v9[3] = &unk_1E7560AE8;
  objc_copyWeak(&v12, &location);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 56);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v7;
}

id __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "addPromise:", v4);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(v4, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getLockupForBundleID:withContext:enableAppDistribution:withReplyHandler:", v6, v7, v8, v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_3;
  v11[3] = &unk_1E7560AC0;
  v12 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 64);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  objc_msgSend(v4, "addSuccessBlock:", v11);
  objc_destroyWeak(&v13);

  return v4;
}

void __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  ASCLockupRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  id v10;
  ASCLockupRequest *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = [ASCLockupRequest alloc];
  objc_msgSend(v3, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASCLockupRequest initWithID:kind:context:](v4, "initWithID:kind:context:", v5, v6, *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 48))
  {
    -[ASCLockupRequest lockupRequestWithAppDistributionEnabled](v11, "lockupRequestWithAppDistributionEnabled");
    v7 = objc_claimAutoreleasedReturnValue();

    v11 = (ASCLockupRequest *)v7;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_4;
  v12[3] = &unk_1E7560A98;
  v13 = v3;
  v9 = v3;
  v10 = (id)objc_msgSend(WeakRetained, "taskForKey:withCreatorBlock:", v11, v12);

}

uint64_t __72__ASCLockupFetcher_lockupForBundleID_withContext_enableAppDistribution___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[ASCLockupFetcher connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockupFetcherService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mutablePromiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__ASCLockupFetcher_lockupFromMediaAPIResponse_withContext___block_invoke;
  v15[3] = &unk_1E7560B38;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "thenWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __59__ASCLockupFetcher_lockupFromMediaAPIResponse_withContext___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CFDBB8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildLockupFromMediaAPIResponse:withContext:withReplyHandler:", v7, v6, v8);

  return v5;
}

- (id)collectionWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id from;
  id location;

  v4 = a3;
  -[ASCLockupFetcher pendingRequests](self, "pendingRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  -[ASCLockupFetcher requestCoordinator](self, "requestCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v6);

  -[ASCLockupFetcher connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockupFetcherService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke;
  v12[3] = &unk_1E7560B88;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_copyWeak(&v15, &from);
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v10;
}

id __42__ASCLockupFetcher_collectionWithRequest___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "addPromise:", v4);

  v6 = a1[4];
  objc_msgSend(v4, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getLockupCollectionWithRequest:withReplyHandler:", v6, v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke_2;
  v9[3] = &unk_1E7560B60;
  v10 = a1[4];
  objc_copyWeak(&v11, a1 + 6);
  objc_msgSend(v4, "addSuccessBlock:", v9);
  objc_destroyWeak(&v11);

  return v4;
}

void __42__ASCLockupFetcher_collectionWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ASCLockupRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  ASCLockupRequest *v12;
  id WeakRetained;
  id v14;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v8 = [ASCLockupRequest alloc];
        objc_msgSend(v7, "id");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "kind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ASCLockupRequest initWithID:kind:context:](v8, "initWithID:kind:context:", v9, v10, v11);

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __42__ASCLockupFetcher_collectionWithRequest___block_invoke_3;
        v16[3] = &unk_1E7560A98;
        v16[4] = v7;
        v14 = (id)objc_msgSend(WeakRetained, "taskForKey:withCreatorBlock:", v12, v16);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

uint64_t __42__ASCLockupFetcher_collectionWithRequest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingRequests
{
  return self->_pendingRequests;
}

- (ASCTaskCoordinator)requestCoordinator
{
  return self->_requestCoordinator;
}

- (ASCLazy)bundleCoordinator
{
  return self->_bundleCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleCoordinator, 0);
  objc_storeStrong((id *)&self->_requestCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
