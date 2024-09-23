@implementation SUUIMediaSocialAdminPermissionsCoordinator

- (SUUIMediaSocialAdminPermissionsCoordinator)init
{
  SUUIMediaSocialAdminPermissionsCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  NSArray *lastKnownAuthors;
  NSDate *lastRequestDate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaSocialAdminPermissionsCoordinator;
  v2 = -[SUUIMediaSocialAdminPermissionsCoordinator init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaSocialAdminPermissionsCoordinator.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIMediaSocialAdminPermissionsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    lastKnownAuthors = v2->_lastKnownAuthors;
    v2->_lastKnownAuthors = 0;

    lastRequestDate = v2->_lastRequestDate;
    v2->_lastRequestDate = 0;

  }
  return v2;
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SUUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce_0 != -1)
    dispatch_once(&sharedCoordinator_sOnce_0, block);
  return (id)sharedCoordinator_sCoordinator_0;
}

void __63__SUUIMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCoordinator_sCoordinator_0;
  sharedCoordinator_sCoordinator_0 = (uint64_t)v1;

}

- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SUUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1C0];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v12 = *MEMORY[0x24BEB2B28];
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB2048], "sharedCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "getAdminStatusWithOptions:resultBlock:", v10, v5);
}

- (void)getAuthorsWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUUIMediaSocialAdminPermissionsCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke;
  block[3] = &unk_2511F83F8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __81__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsWithOptions_authorsBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  double v5;
  double v6;
  id *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("SUUIMediaSocialAdminPermissionsOptionIgnoreCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v6 = v5;

  v7 = *(id **)(a1 + 40);
  if (v6 > 30.0)
    v8 = v3;
  else
    v8 = 0;
  if (!v7[3] || (v8 & 1) != 0)
    goto LABEL_10;
  v9 = objc_msgSend(v7[3], "copy");
  if (!v9)
  {
    v7 = *(id **)(a1 + 40);
LABEL_10:
    objc_msgSend(v7, "_queueResultBlock:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_getAuthors");
    v10 = 0;
    goto LABEL_11;
  }
  v10 = (void *)v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    v12 = v10;
    (*(void (**)(void))(v11 + 16))();
    v10 = v12;
  }
LABEL_11:

}

- (void)getAuthorsAndWaitWithOptions:(id)a3 authorsBlock:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke;
  v11[3] = &unk_2511F9560;
  v12 = v8;
  v13 = v6;
  v9 = v8;
  v10 = v6;
  -[SUUIMediaSocialAdminPermissionsCoordinator getAuthorsWithOptions:authorsBlock:](self, "getAuthorsWithOptions:authorsBlock:", v7, v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __88__SUUIMediaSocialAdminPermissionsCoordinator_getAuthorsAndWaitWithOptions_authorsBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)lastKnownAuthors
{
  return (NSArray *)(id)-[NSArray copy](self->_lastKnownAuthors, "copy");
}

- (NSNumber)lastKnownAdminStatus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BEB2048], "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isCurrentUserAdmin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)reset
{
  NSArray *lastKnownAuthors;
  NSDate *lastRequestDate;
  id v5;

  lastKnownAuthors = self->_lastKnownAuthors;
  self->_lastKnownAuthors = 0;

  lastRequestDate = self->_lastRequestDate;
  self->_lastRequestDate = 0;

  objc_msgSend(MEMORY[0x24BEB2048], "sharedCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v5);
    objc_msgSend(v6, "setPromptStyle:", 1);
    objc_msgSend(v6, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_2511F55B8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "startWithAuthenticateResponseBlock:", v9);

}

void __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_2511F4C08;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __72__SUUIMediaSocialAdminPermissionsCoordinator__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 4);
  return result;
}

- (void)_fireResultsBlocksWithAuthors:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSDate *v9;
  NSDate *lastRequestDate;
  void *v11;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastKnownAuthors, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastRequestDate = self->_lastRequestDate;
    self->_lastRequestDate = v9;

  }
  v11 = (void *)-[NSMutableArray copy](self->_resultBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_resultBlocks, "removeAllObjects");
  if (objc_msgSend(v11, "count"))
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__SUUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke;
    block[3] = &unk_2511F4798;
    v14 = v11;
    v15 = v7;
    v16 = v8;
    dispatch_async(callbackQueue, block);

  }
}

void __82__SUUIMediaSocialAdminPermissionsCoordinator__fireResultsBlocksWithAuthors_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_getAuthors
{
  void *v3;
  void *v4;
  SUUIURLBag *v5;
  SUUIMediaSocialAdminPermissionsOperation *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSVDefaultUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, *MEMORY[0x24BEB2518]);

  v5 = -[SSURLBag initWithURLBagContext:]([SUUIURLBag alloc], "initWithURLBagContext:", v3);
  v6 = objc_alloc_init(SUUIMediaSocialAdminPermissionsOperation);
  -[SSVComplexOperation configureWithURLBag:](v6, "configureWithURLBag:", v5);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __57__SUUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke;
  v10 = &unk_2511F58B8;
  objc_copyWeak(&v11, &location);
  -[SUUIMediaSocialAdminPermissionsOperation setOutputBlock:](v6, "setOutputBlock:", &v7);
  -[SUUIMediaSocialAdminPermissionsOperation main](v6, "main", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __57__SUUIMediaSocialAdminPermissionsCoordinator__getAuthors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleOperationResponseWithAuthors:error:", v6, v5);

}

- (void)_handleOperationResponseWithAuthors:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUUIMediaSocialAdminPermissionsCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke;
  block[3] = &unk_2511F4798;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_msgSend(a1[4], "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("SUUIErrorDomain")))
  {
    v3 = objc_msgSend(a1[4], "code");

    if (v3 == 3)
    {
      objc_initWeak(&location, a1[5]);
      v4 = a1[5];
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2;
      v5[3] = &unk_2511F5590;
      objc_copyWeak(&v8, &location);
      v6 = a1[6];
      v7 = a1[4];
      objc_msgSend(v4, "_authenticateOnCompletion:", v5);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  objc_msgSend(a1[5], "_fireResultsBlocksWithAuthors:error:", a1[6], a1[4]);
}

void __88__SUUIMediaSocialAdminPermissionsCoordinator__handleOperationResponseWithAuthors_error___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_getAuthors");
  else
    objc_msgSend(WeakRetained, "_fireResultsBlocksWithAuthors:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_queueResultBlock:(id)a3
{
  void *v4;
  NSMutableArray *resultBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    resultBlocks = self->_resultBlocks;
    aBlock = v4;
    if (!resultBlocks)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_resultBlocks;
      self->_resultBlocks = v6;

      v4 = aBlock;
      resultBlocks = self->_resultBlocks;
    }
    v8 = _Block_copy(v4);
    -[NSMutableArray addObject:](resultBlocks, "addObject:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBlocks, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_lastKnownAuthors, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
