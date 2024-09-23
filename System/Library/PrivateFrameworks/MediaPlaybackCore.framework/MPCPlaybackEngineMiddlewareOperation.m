@implementation MPCPlaybackEngineMiddlewareOperation

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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  MPCPlaybackEngineMiddlewareOperation *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[MPCPlaybackEngineMiddlewareOperation inputOperations](self, "inputOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_254AAD420);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "controller");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  objc_msgSend(v10, "resolvedPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInProcess");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDDCAC8];
    -[MPCPlaybackEngineMiddlewareOperation playerRequest](self, "playerRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playerPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "infoCenterForPlayerID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[MPCPlaybackEngineMiddlewareOperation middleware](self, "middleware");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPlaybackEngine:", v18);

      v20 = _Block_copy(self->_invalidationHandler);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke;
      block[3] = &unk_24CAB98A8;
      v24 = self;
      v25 = v20;
      v23 = v18;
      v21 = v20;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

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

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (MPCPlaybackEngineMiddleware)middleware
{
  return self->_middleware;
}

void __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1[4]);
  v3 = objc_alloc(MEMORY[0x24BDDCAA0]);
  v4 = *MEMORY[0x24BDDBA00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke_2;
  v6[3] = &unk_24CAB3970;
  objc_copyWeak(&v8, &location);
  v7 = a1[6];
  v5 = (void *)objc_msgSend(v3, "initWithName:object:handler:", v4, 0, v6);
  objc_msgSend(v2, "addObject:", v5);
  objc_storeStrong((id *)a1[5] + 36, v2);
  objc_msgSend(a1[5], "finish");

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (MPCPlaybackEngineMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7;
  id v8;
  MPCPlaybackEngineMiddlewareOperation *v9;
  MPCPlaybackEngineMiddlewareOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackEngineMiddlewareOperation;
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (void)setPlayerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playerRequest, a3);
}

void __47__MPCPlaybackEngineMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
