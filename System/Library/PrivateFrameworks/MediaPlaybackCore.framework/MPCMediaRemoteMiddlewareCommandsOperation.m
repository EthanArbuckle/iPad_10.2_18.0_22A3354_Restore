@implementation MPCMediaRemoteMiddlewareCommandsOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
    v3 = a2;
  else
    v3 = (void *)MEMORY[0x24BDBD1B8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "middleware");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportedCommands:", v3);

  v7 = objc_msgSend(v5, "commandInfoForCommand:", 125);
  if (v7)
  {
    v8 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v9, "middleware");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "controller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentItemForIdentifier:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLastSectionContentItemFuture:", v12);

      objc_msgSend(*(id *)(a1 + 32), "lastSectionContentItemFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_3;
      v28[3] = &unk_24CAB9720;
      v29 = *(id *)(a1 + 48);
      objc_msgSend(v13, "onInvalid:", v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = *(_QWORD *)(a1 + 40);
      v30[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 280);
      *(_QWORD *)(v17 + 280) = v16;

      objc_msgSend(*(id *)(a1 + 32), "lastSectionContentItemFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_4;
      v27[3] = &unk_24CAB47A0;
      v27[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v19, "onCompletion:", v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_5;
      v24[3] = &unk_24CAB8C28;
      v21 = v8;
      v22 = *(_QWORD *)(a1 + 32);
      v25 = v21;
      v26 = v22;
      v23 = (id)objc_msgSend(v20, "onFailure:", v24);

    }
    else
    {
      objc_msgSend(v9, "finish");
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSArray *v13;
  NSArray *invalidationObservers;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[MPCMediaRemoteMiddlewareCommandsOperation middleware](self, "middleware");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = _Block_copy(self->_invalidationHandler);
    -[MPCMediaRemoteMiddlewareCommandsOperation middleware](self, "middleware");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "supportedCommands");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddlewareCommandsOperation setSupportedCommandsFuture:](self, "setSupportedCommandsFuture:", v8);

    -[MPCMediaRemoteMiddlewareCommandsOperation supportedCommandsFuture](self, "supportedCommandsFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke;
    v24[3] = &unk_24CAB9720;
    v11 = v5;
    v25 = v11;
    objc_msgSend(v9, "onInvalid:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    invalidationObservers = self->_invalidationObservers;
    self->_invalidationObservers = v13;

    -[MPCMediaRemoteMiddlewareCommandsOperation supportedCommandsFuture](self, "supportedCommandsFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_2;
    v21[3] = &unk_24CAB47C8;
    v22 = v12;
    v23 = v11;
    v21[4] = self;
    v16 = v12;
    v17 = v11;
    objc_msgSend(v15, "onSuccess:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_6;
    v20[3] = &unk_24CAB6D88;
    v20[4] = self;
    v19 = (id)objc_msgSend(v18, "onFailure:", v20);

  }
  else
  {
    -[MPAsyncOperation cancel](self, "cancel");
    -[MPAsyncOperation finish](self, "finish");
  }

}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (MPCFuture)supportedCommandsFuture
{
  return self->_supportedCommandsFuture;
}

- (void)setSupportedCommandsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCommandsFuture, a3);
}

- (MPCMediaRemoteMiddlewareCommandsOperation)initWithMiddleware:(id)a3
{
  id v5;
  MPCMediaRemoteMiddlewareCommandsOperation *v6;
  MPCMediaRemoteMiddlewareCommandsOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewareCommandsOperation;
  v6 = -[MPAsyncOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_middleware, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionContentItemFuture, 0);
  objc_storeStrong((id *)&self->_supportedCommandsFuture, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)timeoutDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MPCMediaRemoteMiddlewareCommandsOperation supportedCommandsFuture](self, "supportedCommandsFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareCommandsOperation lastSectionContentItemFuture](self, "lastSectionContentItemFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("supportedCommandsFuture=%@ lastSectionContentItemFuture=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (MPCFuture)lastSectionContentItemFuture
{
  return self->_lastSectionContentItemFuture;
}

- (void)setLastSectionContentItemFuture:(id)a3
{
  objc_storeStrong((id *)&self->_lastSectionContentItemFuture, a3);
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 4000, a2, CFSTR("Failed to get supported commands"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "middleware");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastSectionContentItem:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __52__MPCMediaRemoteMiddlewareCommandsOperation_execute__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 4000, a2, CFSTR("Failed to get lastSectionContentItem with id: %@"), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

@end
