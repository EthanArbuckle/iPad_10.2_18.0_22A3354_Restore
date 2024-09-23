@implementation MPCMediaRemoteMiddlewareParticipantsOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

void __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = objc_alloc(MEMORY[0x24BDDCAF8]);
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v11, "initWithIdentifier:mediaRemoteUserIdentity:", v12, v13);
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v16 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(a1 + 32), "middleware");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setQueueParticipants:", v16);

    v3 = v18;
  }
  objc_msgSend(*(id *)(a1 + 32), "finish", v18);

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
  -[MPCMediaRemoteMiddlewareParticipantsOperation middleware](self, "middleware");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = _Block_copy(self->_invalidationHandler);
    -[MPCMediaRemoteMiddlewareParticipantsOperation middleware](self, "middleware");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackQueueParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddlewareParticipantsOperation setParticipantsFuture:](self, "setParticipantsFuture:", v8);

    -[MPCMediaRemoteMiddlewareParticipantsOperation participantsFuture](self, "participantsFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke;
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

    -[MPCMediaRemoteMiddlewareParticipantsOperation participantsFuture](self, "participantsFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_2;
    v19[3] = &unk_24CAB8530;
    v19[4] = self;
    objc_msgSend(v15, "onSuccess:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_3;
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

- (MPCFuture)participantsFuture
{
  return self->_participantsFuture;
}

- (void)setParticipantsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_participantsFuture, a3);
}

- (MPCMediaRemoteMiddlewareParticipantsOperation)initWithMiddleware:(id)a3
{
  id v5;
  MPCMediaRemoteMiddlewareParticipantsOperation *v6;
  MPCMediaRemoteMiddlewareParticipantsOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaRemoteMiddlewareParticipantsOperation;
  v6 = -[MPAsyncOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_middleware, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFuture, 0);
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
  -[MPCMediaRemoteMiddlewareParticipantsOperation participantsFuture](self, "participantsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("participantsFuture=%@"), v3);
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

uint64_t __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MPCMediaRemoteMiddlewareParticipantsOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 7000, a2, CFSTR("Failed to load participants"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);

}

@end
