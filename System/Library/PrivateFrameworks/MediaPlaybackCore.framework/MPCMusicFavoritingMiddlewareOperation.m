@implementation MPCMusicFavoritingMiddlewareOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)outputProtocols
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInputOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inputOperations, a3);
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSArray *v29;
  NSArray *invalidationObservers;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[MPCPlayerRequest userIdentity](self->_playerRequest, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[MPCMusicFavoritingMiddlewareOperation inputOperations](self, "inputOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", &unk_254AAD420);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v54;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v8), "controller");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v9 = 0;
    }

    objc_msgSend(v9, "resolvedPlayerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSystemMusicPath");

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEC88C0], "sharedMonitorForIdentity:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subscriptionStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCMusicFavoritingMiddleware setRequestingUserSubscriptionStatus:](self->_middleware, "setRequestingUserSubscriptionStatus:", v13);
      v47 = 0;
      v48 = &v47;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__27856;
      v51 = __Block_byref_object_dispose__27857;
      v52 = 0;
      v14 = objc_alloc(MEMORY[0x24BE65C50]);
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke;
      v44[3] = &unk_24CABAB68;
      v15 = v12;
      v45 = v15;
      v46 = &v47;
      v16 = (void *)objc_msgSend(v14, "initWithBlock:", v44);
      v17 = _Block_copy(self->_invalidationHandler);
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_2;
      v41[3] = &unk_24CAB9A20;
      v31 = v13;
      v42 = v31;
      v18 = v17;
      v43 = v18;
      objc_msgSend(v15, "beginObservingSubscriptionStatusWithHandler:", v41);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v48[5];
      v48[5] = v19;

      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__27856;
      v39 = __Block_byref_object_dispose__27857;
      v40 = 0;
      v21 = objc_alloc(MEMORY[0x24BE65C50]);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_3;
      v34[3] = &unk_24CAB9A48;
      v34[4] = &v35;
      v22 = (void *)objc_msgSend(v21, "initWithBlock:", v34);
      objc_msgSend(MEMORY[0x24BDDC908], "sharedDeviceLibraryController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDDBD70];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_4;
      v32[3] = &unk_24CAB9A70;
      v26 = v18;
      v33 = v26;
      objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", v25, v23, 0, v32);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v36[5];
      v36[5] = v27;

      v57[0] = v16;
      v57[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
      v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
      invalidationObservers = self->_invalidationObservers;
      self->_invalidationObservers = v29;

      -[MPAsyncOperation finish](self, "finish");
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v47, 8);
    }
    else
    {
      -[MPAsyncOperation finish](self, "finish");
    }

  }
  else
  {
    -[MPAsyncOperation finish](self, "finish");
  }

}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

uint64_t __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endObservingSubscriptionStatusWithToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (MPCMusicFavoritingMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7;
  id v8;
  MPCMusicFavoritingMiddlewareOperation *v9;
  MPCMusicFavoritingMiddlewareOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMusicFavoritingMiddlewareOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (NSArray)inputProtocols
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254AAD420;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

void __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (MPCMusicFavoritingMiddleware)middleware
{
  return self->_middleware;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (void)setPlayerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playerRequest, a3);
}

uint64_t __48__MPCMusicFavoritingMiddlewareOperation_execute__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
