@implementation MPCFuture

uint64_t __23__MPCFuture_onSuccess___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __26__MPCFuture_onCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __23__MPCFuture_onInvalid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 9))
  {
    v3 = *(NSObject **)(v2 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__MPCFuture_onInvalid___block_invoke_2;
    block[3] = &unk_24CAB9720;
    v10 = *(id *)(a1 + 48);
    dispatch_async(v3, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setFuture:");
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 80);
      *(_QWORD *)(v6 + 80) = v5;

      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    }
    v8 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v4, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  }
}

- (void)setDebugLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MPCFuture)initWithQueue:(id)a3
{
  id v5;
  MPCFuture *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCFuture;
  v6 = -[MPCFuture init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCFuture.accessQueue", v7);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_calloutQueue, a3);
  }

  return v6;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

void __29__MPCFuture_finishWithValue___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

- (id)onInvalid:(id)a3
{
  id v4;
  MPCFutureInvalidationToken *v5;
  NSObject *accessQueue;
  MPCFutureInvalidationToken *v7;
  id v8;
  MPCFutureInvalidationToken *v9;
  MPCFutureInvalidationToken *v10;
  _QWORD block[5];
  MPCFutureInvalidationToken *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MPCFutureInvalidationToken);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_onInvalid___block_invoke;
  block[3] = &unk_24CAB98A8;
  block[4] = self;
  v14 = v4;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  dispatch_async(accessQueue, block);
  v9 = v13;
  v10 = v7;

  return v10;
}

- (id)onSuccess:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__MPCFuture_onSuccess___block_invoke;
  v8[3] = &unk_24CAB9830;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

- (id)onFailure:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__MPCFuture_onFailure___block_invoke;
  v8[3] = &unk_24CAB9830;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

void __23__MPCFuture_onFailure___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = *(void **)(v2 + 24);
    if (v3)
    {
      v4 = v3;
      v5 = *(void **)(a1 + 40);
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __23__MPCFuture_onFailure___block_invoke_2;
      block[3] = &unk_24CAB9830;
      v14 = v4;
      v15 = v5;
      v7 = v4;
      dispatch_async(v6, block);

    }
  }
  else
  {
    v8 = *(void **)(v2 + 64);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(_QWORD *)(v10 + 64) = v9;

      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    }
    v12 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v8, "addObject:", v12);

  }
}

- (id)onCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__MPCFuture_onCompletion___block_invoke;
  v8[3] = &unk_24CAB9830;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v8);

  return self;
}

void __29__MPCFuture_finishWithValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPCFuture.m"), 132, CFSTR("Finish with value on already finalized future."));

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithValue___block_invoke_2;
  block[3] = &unk_24CABAA28;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_async(v6, block);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_finalize");

}

- (void)_onQueue_finalize
{
  NSMutableArray *successBlocks;
  NSMutableArray *failureBlocks;
  NSMutableArray *completionBlocks;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  self->_finalized = 1;
  successBlocks = self->_successBlocks;
  self->_successBlocks = 0;

  failureBlocks = self->_failureBlocks;
  self->_failureBlocks = 0;

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

}

uint64_t __23__MPCFuture_disconnect__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 10))
    *(_BYTE *)(v1 + 10) = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBlocks, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_failureBlocks, 0);
  objc_storeStrong((id *)&self->_successBlocks, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MPCFuture *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_finalized && !self->_invalid)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_FAULT, "Deallocating future that wasn't finalized or invalidated: %{public}@", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)MPCFuture;
  -[MPCFuture dealloc](&v4, sel_dealloc);
}

void __26__MPCFuture_onCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = *(id *)(v2 + 16);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__MPCFuture_onCompletion___block_invoke_2;
    block[3] = &unk_24CAB98A8;
    v16 = v4;
    v17 = v5;
    v15 = v3;
    v7 = v4;
    v8 = v3;
    dispatch_async(v6, block);

  }
  else
  {
    v9 = *(void **)(v2 + 72);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 72);
      *(_QWORD *)(v11 + 72) = v10;

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    v13 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v9, "addObject:", v13);

  }
}

void __23__MPCFuture_onSuccess___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    if (!*(_QWORD *)(v2 + 24))
    {
      v3 = *(id *)(v2 + 16);
      v4 = *(void **)(a1 + 40);
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __23__MPCFuture_onSuccess___block_invoke_2;
      block[3] = &unk_24CAB9830;
      v13 = v3;
      v14 = v4;
      v6 = v3;
      dispatch_async(v5, block);

    }
  }
  else
  {
    v7 = *(void **)(v2 + 56);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    }
    v11 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v7, "addObject:", v11);

  }
}

void __23__MPCFuture_invalidate__block_invoke_2(uint64_t a1)
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

- (void)invalidate
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_invalidate__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)disconnect
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__MPCFuture_disconnect__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)finishWithValue:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithValue___block_invoke;
  block[3] = &unk_24CABA558;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_sync(accessQueue, block);

}

void __23__MPCFuture_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    *(_BYTE *)(v1 + 9) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__MPCFuture_invalidate__block_invoke_2;
    block[3] = &unk_24CABA2D0;
    v11 = v5;
    v7 = v5;
    dispatch_async(v6, block);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 80);
    *(_QWORD *)(v8 + 80) = 0;

  }
}

- (void)finishWithError:(id)a3
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithError___block_invoke;
  block[3] = &unk_24CABA558;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_sync(accessQueue, block);

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p:"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_debugLabel)
    objc_msgSend(v3, "appendFormat:", CFSTR(" debugLabel=%@"), self->_debugLabel);
  if (self->_finalized)
    objc_msgSend(v4, "appendFormat:", CFSTR(" finalized=YES"));
  if (self->_invalid)
    objc_msgSend(v4, "appendFormat:", CFSTR(" invalid=YES"));
  if (self->_disconnected)
    objc_msgSend(v4, "appendFormat:", CFSTR(" disconnected=YES"));
  if (self->_error)
    objc_msgSend(v4, "appendFormat:", CFSTR(" error=%@"), self->_error);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (id)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (NSString)debugLabel
{
  return self->_debugLabel;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (NSMutableArray)successBlocks
{
  return self->_successBlocks;
}

- (NSMutableArray)failureBlocks
{
  return self->_failureBlocks;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSMapTable)invalidBlocks
{
  return self->_invalidBlocks;
}

void __29__MPCFuture_finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPCFuture.m"), 151, CFSTR("Finish with error on already finalized future."));

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MPCFuture_finishWithError___block_invoke_2;
  block[3] = &unk_24CABAA28;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_async(v6, block);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_finalize");

}

void __29__MPCFuture_finishWithError___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

uint64_t __23__MPCFuture_onInvalid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __23__MPCFuture_onFailure___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
