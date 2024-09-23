@implementation SUUIRedeemPreflightOperation

- (id)_initSUUIRedeemPreflightOperation
{
  SUUIRedeemPreflightOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemPreflightOperation;
  v2 = -[SUUIRedeemPreflightOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIRedeemPreflightOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

    v2->_forcesAuthentication = 1;
  }
  return v2;
}

- (SUUIRedeemPreflightOperation)initWithClientContext:(id)a3 redeemCode:(id)a4 forcesAuthentication:(BOOL)a5
{
  id v9;
  id v10;
  id *v11;
  SUUIRedeemPreflightOperation *v12;
  uint64_t v13;
  NSString *redeemCode;

  v9 = a3;
  v10 = a4;
  v11 = -[SUUIRedeemPreflightOperation _initSUUIRedeemPreflightOperation](self, "_initSUUIRedeemPreflightOperation");
  v12 = (SUUIRedeemPreflightOperation *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 31, a3);
    v13 = objc_msgSend(v10, "copy");
    redeemCode = v12->_redeemCode;
    v12->_redeemCode = (NSString *)v13;

    v12->_forcesAuthentication = a5;
  }

  return v12;
}

- (BOOL)loadsRedeemCodeMetadata
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SUUIRedeemPreflightOperation_loadsRedeemCodeMetadata__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUUIRedeemPreflightOperation_loadsRedeemCodeMetadata__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 264);
  return result;
}

- (id)outputBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__95;
  v10 = __Block_byref_object_dispose__95;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUUIRedeemPreflightOperation_outputBlock__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SUUIRedeemPreflightOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SUUIRedeemConfiguration)redeemConfiguration
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2_1;
  v10 = __Block_byref_object_dispose__3_1;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SUUIRedeemPreflightOperation_redeemConfiguration__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIRedeemConfiguration *)v3;
}

void __51__SUUIRedeemPreflightOperation_redeemConfiguration__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

- (void)setLoadsRedeemCodeMetadata:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SUUIRedeemPreflightOperation_setLoadsRedeemCodeMetadata___block_invoke;
  v4[3] = &unk_2511F82E0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __59__SUUIRedeemPreflightOperation_setLoadsRedeemCodeMetadata___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 264) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setOutputBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SUUIRedeemPreflightOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_2511F4C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__SUUIRedeemPreflightOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 272) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 272);
    *(_QWORD *)(v5 + 272) = v4;

  }
}

- (void)setRedeemConfiguration:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIRedeemPreflightOperation_setRedeemConfiguration___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__SUUIRedeemPreflightOperation_setRedeemConfiguration___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), *(id *)(a1 + 40));
}

- (void)main
{
  SUUIRedeemPreflightResult *v3;
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  SUUIReloadConfigurationOperation *v13;
  void *v14;
  void *v15;
  void *v16;
  SUUIRedeemConfiguration *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  SUUIRedeemConfiguration *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  SUUIRedeemConfiguration *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  intptr_t (*v29)(uint64_t, int);
  void *v30;
  SUUIRedeemPreflightResult *v31;
  SUUIRedeemConfiguration *v32;
  dispatch_semaphore_t v33;
  _QWORD v34[4];
  SUUIRedeemPreflightResult *v35;
  _QWORD v36[4];
  SUUIRedeemPreflightResult *v37;
  dispatch_semaphore_t v38;

  v3 = objc_alloc_init(SUUIRedeemPreflightResult);
  -[SUUIRedeemPreflightResult setClientContext:](v3, "setClientContext:", self->_clientContext);
  if (-[SUUIRedeemPreflightOperation forcesAuthentication](self, "forcesAuthentication"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BEC8B68]);
    -[SUUIRedeemPreflightOperation _authenticationContext](self, "_authenticationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requiredUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "canPerformExtendedBiometricActionsForAccountIdentifier:", v6) & 1) == 0)
    {
      v7 = dispatch_semaphore_create(0);
      v8 = objc_alloc(MEMORY[0x24BEB1DB8]);
      -[SUUIRedeemPreflightOperation _authenticationContext](self, "_authenticationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithAuthenticationContext:", v9);

      -[SUUIRedeemPreflightOperation redeemViewController](self, "redeemViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "set_parentViewController:", v11);

      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __36__SUUIRedeemPreflightOperation_main__block_invoke;
      v36[3] = &unk_2511FD758;
      v37 = v3;
      v38 = v7;
      v12 = v7;
      objc_msgSend(v10, "startWithAuthenticateResponseBlock:", v36);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  if (!self->_clientContext && !-[SUUIRedeemPreflightResult resultType](v3, "resultType"))
  {
    v13 = objc_alloc_init(SUUIReloadConfigurationOperation);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __36__SUUIRedeemPreflightOperation_main__block_invoke_2;
    v34[3] = &unk_2511F5798;
    v35 = v3;
    -[SUUIReloadConfigurationOperation setOutputBlock:](v13, "setOutputBlock:", v34);
    -[SUUIReloadConfigurationOperation main](v13, "main");

  }
  if (!-[SUUIRedeemPreflightResult resultType](v3, "resultType")
    && -[SUUIRedeemPreflightOperation loadsRedeemCodeMetadata](self, "loadsRedeemCodeMetadata")
    && self->_redeemCode)
  {
    -[SUUIRedeemPreflightResult clientContext](v3, "clientContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemPreflightOperation _redeemCodeMetadataWithClientContext:](self, "_redeemCodeMetadataWithClientContext:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIRedeemPreflightResult setCodeMetadata:](v3, "setCodeMetadata:", v15);
  }
  -[SUUIRedeemPreflightOperation redeemConfiguration](self, "redeemConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && !-[SUUIRedeemPreflightResult resultType](v3, "resultType"))
  {
    v17 = [SUUIRedeemConfiguration alloc];
    objc_msgSend(v16, "operationQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "category");
    -[SUUIRedeemPreflightResult clientContext](v3, "clientContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SUUIRedeemConfiguration initWithOperationQueue:category:clientContext:](v17, "initWithOperationQueue:category:clientContext:", v18, v19, v20);

    v22 = dispatch_semaphore_create(0);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __36__SUUIRedeemPreflightOperation_main__block_invoke_3;
    v30 = &unk_2511FD780;
    v31 = v3;
    v32 = v21;
    v33 = v22;
    v23 = v22;
    v24 = v21;
    -[SUUIRedeemConfiguration loadConfigurationWithCompletionBlock:](v24, "loadConfigurationWithCompletionBlock:", &v27);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

  }
  -[SUUIRedeemPreflightOperation outputBlock](self, "outputBlock", v27, v28, v29, v30);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    (*(void (**)(uint64_t, SUUIRedeemPreflightResult *))(v25 + 16))(v25, v3);

}

void __36__SUUIRedeemPreflightOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "authenticatedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "setAccount:", v5);
  }
  else
  {
    objc_msgSend(v6, "setError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setResultType:", 1);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __36__SUUIRedeemPreflightOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  SUUIClientContext *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v5 = -[SUUIClientContext initWithConfigurationDictionary:]([SUUIClientContext alloc], "initWithConfigurationDictionary:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setClientContext:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
    objc_msgSend(*(id *)(a1 + 32), "setResultType:", 2);
  }

}

intptr_t __36__SUUIRedeemPreflightOperation_main__block_invoke_3(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "setRedeemConfiguration:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "setError:");
    objc_msgSend(*(id *)(a1 + 32), "setResultType:", 3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_authenticationContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v3);
    objc_msgSend(v4, "setPromptStyle:", 1);
    objc_msgSend(v4, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_redeemCodeMetadataWithClientContext:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2_1;
  v27 = __Block_byref_object_dispose__3_1;
  v28 = 0;
  v5 = dispatch_semaphore_create(0);
  objc_msgSend(v4, "URLBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BEB2B60];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__SUUIRedeemPreflightOperation__redeemCodeMetadataWithClientContext___block_invoke;
  v20[3] = &unk_2511FD7A8;
  v20[4] = self;
  v22 = &v23;
  v8 = v5;
  v21 = v8;
  objc_msgSend(v6, "loadValueForKey:completionBlock:", v7, v20);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    v9 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DC0]), "initWithAccount:", v11);
    objc_msgSend(v9, "setAuthenticationContext:", v12);
    v13 = objc_alloc(MEMORY[0x24BEB2008]);
    v14 = (void *)objc_msgSend(v13, "initWithURL:", v24[5]);
    objc_msgSend(v9, "setRequestProperties:", v14);
    v15 = objc_alloc_init(MEMORY[0x24BEC8C10]);
    objc_msgSend(v9, "setDataProvider:", v15);
    objc_msgSend(v9, "main");
    v16 = objc_alloc(MEMORY[0x24BEB2060]);
    objc_msgSend(v15, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithRedeemCodeDictionary:", v17);

    objc_msgSend(v18, "setInputCode:", self->_redeemCode);
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v18;
}

intptr_t __69__SUUIRedeemPreflightOperation__redeemCodeMetadataWithClientContext___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1808];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "mutableCopy");

    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = objc_alloc(MEMORY[0x24BDD1838]);
    v9 = (void *)objc_msgSend(v8, "initWithName:value:", *MEMORY[0x24BEB2B58], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
    objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(v5, "setQueryItems:", v7);
    objc_msgSend(v5, "URL");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (SUUIRedeemViewControllerLegacy)redeemViewController
{
  return (SUUIRedeemViewControllerLegacy *)objc_loadWeakRetained((id *)&self->_redeemViewController);
}

- (void)setRedeemViewController:(id)a3
{
  objc_storeWeak((id *)&self->_redeemViewController, a3);
}

- (BOOL)forcesAuthentication
{
  return self->_forcesAuthentication;
}

- (void)setForcesAuthentication:(BOOL)a3
{
  self->_forcesAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemViewController);
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_redeemCode, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
