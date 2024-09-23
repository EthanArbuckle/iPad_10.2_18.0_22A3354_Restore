@implementation MPCMediaRemoteMiddlewarePlaybackStateOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

uint64_t __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2) - 1;
    if (v3 > 4)
      v4 = 0;
    else
      v4 = qword_210ED9320[v3];
    objc_msgSend(*(id *)(a1 + 32), "middleware");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayerState:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finish");
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
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[MPCMediaRemoteMiddlewarePlaybackStateOperation middleware](self, "middleware");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = _Block_copy(self->_invalidationHandler);
    -[MPCMediaRemoteMiddlewarePlaybackStateOperation middleware](self, "middleware");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddlewarePlaybackStateOperation setPlaybackStateFuture:](self, "setPlaybackStateFuture:", v8);

    -[MPCMediaRemoteMiddlewarePlaybackStateOperation playbackStateFuture](self, "playbackStateFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke;
    v20[3] = &unk_24CAB9720;
    v21 = v5;
    v11 = v5;
    objc_msgSend(v9, "onInvalid:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    invalidationObservers = self->_invalidationObservers;
    self->_invalidationObservers = v13;

    -[MPCMediaRemoteMiddlewarePlaybackStateOperation playbackStateFuture](self, "playbackStateFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_2;
    v19[3] = &unk_24CAB3998;
    v19[4] = self;
    objc_msgSend(v15, "onSuccess:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_3;
    v18[3] = &unk_24CAB6D88;
    v18[4] = self;
    v17 = (id)objc_msgSend(v16, "onFailure:", v18);

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

- (MPCFuture)playbackStateFuture
{
  return self->_playbackStateFuture;
}

- (void)setPlaybackStateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStateFuture, a3);
}

- (MPCMediaRemoteMiddlewarePlaybackStateOperation)initWithMiddleware:(id)a3
{
  id v5;
  MPCMediaRemoteMiddlewarePlaybackStateOperation *v6;
  MPCMediaRemoteMiddlewarePlaybackStateOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewarePlaybackStateOperation;
  v6 = -[MPAsyncOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_middleware, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackStateFuture, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (id)timeoutDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MPCMediaRemoteMiddlewarePlaybackStateOperation playbackStateFuture](self, "playbackStateFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("playbackStateFuture=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

uint64_t __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MPCMediaRemoteMiddlewarePlaybackStateOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 6000, a2, CFSTR("Failed to get playback state"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

@end
