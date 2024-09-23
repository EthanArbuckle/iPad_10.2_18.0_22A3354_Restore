@implementation MPCMediaRemoteMiddlewareControllerOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)inputProtocols
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *invalidationObservers;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = _Block_copy(self->_invalidationHandler);
  -[MPCMediaRemoteMiddlewareControllerOperation playerPath](self, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCMediaRemoteController controllerForPlayerPath:](MPCMediaRemoteController, "controllerForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareControllerOperation setControllerFuture:](self, "setControllerFuture:", v5);

  -[MPCMediaRemoteMiddlewareControllerOperation controllerFuture](self, "controllerFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke;
  v19[3] = &unk_24CAB9720;
  v20 = v3;
  v8 = v3;
  objc_msgSend(v6, "onInvalid:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  invalidationObservers = self->_invalidationObservers;
  self->_invalidationObservers = v10;

  -[MPCMediaRemoteMiddlewareControllerOperation controllerFuture](self, "controllerFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareControllerOperation middleware](self, "middleware");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setControllerFuture:", v12);

  -[MPCMediaRemoteMiddlewareControllerOperation controllerFuture](self, "controllerFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_2;
  v18[3] = &unk_24CAB43F8;
  v18[4] = self;
  objc_msgSend(v14, "onSuccess:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_3;
  v17[3] = &unk_24CAB6D88;
  v17[4] = self;
  v16 = (id)objc_msgSend(v15, "onFailure:", v17);

}

- (MPCFuture)controllerFuture
{
  return self->_controllerFuture;
}

- (void)setControllerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_controllerFuture, a3);
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "middleware");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setController:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

- (MPCMediaRemoteController)controller
{
  void *v2;
  void *v3;

  -[MPCMediaRemoteMiddlewareControllerOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCMediaRemoteController *)v3;
}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (MPCMediaRemoteMiddlewareControllerOperation)initWithMiddleware:(id)a3 playerPath:(id)a4
{
  id v7;
  id v8;
  MPCMediaRemoteMiddlewareControllerOperation *v9;
  MPCMediaRemoteMiddlewareControllerOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMediaRemoteMiddlewareControllerOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerPath, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerFuture, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (NSArray)outputProtocols
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254AAD420;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)timeoutDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MPCMediaRemoteMiddlewareControllerOperation controllerFuture](self, "controllerFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("controllerFuture=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void)setInputOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inputOperations, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__MPCMediaRemoteMiddlewareControllerOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

@end
