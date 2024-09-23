@implementation MSVAsyncOperation

- (MSVAsyncOperation)init
{
  MSVAsyncOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSVAsyncOperation;
  v2 = -[MSVAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaservices.MSVAsyncOperation.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_isExecuting);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v3);

  -[MSVAsyncOperation _setExecuting:](self, "_setExecuting:", 1);
  NSStringFromSelector(sel_isExecuting);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v4);

  -[MSVAsyncOperation execute](self, "execute");
}

- (void)finish
{
  -[MSVAsyncOperation finishWithError:](self, "finishWithError:", 0);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  NSStringFromSelector(sel_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  NSStringFromSelector(sel_isFinished);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  NSStringFromSelector(sel_isExecuting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", v7);

  -[MSVAsyncOperation setError:](self, "setError:", v4);
  -[MSVAsyncOperation _setExecuting:](self, "_setExecuting:", 0);
  -[MSVAsyncOperation _setFinished:](self, "_setFinished:", 1);
  NSStringFromSelector(sel_error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v8);

  NSStringFromSelector(sel_isFinished);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v9);

  NSStringFromSelector(sel_isExecuting);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", v10);

}

- (NSError)error
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2839;
  v11 = __Block_byref_object_dispose__2840;
  v12 = 0;
  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__MSVAsyncOperation_error__block_invoke;
  v6[3] = &unk_1E43E9F70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MSVAsyncOperation_setError___block_invoke;
  block[3] = &unk_1E43E9F20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)_isExecuting
{
  MSVAsyncOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MSVAsyncOperation__isExecuting__block_invoke;
  v5[3] = &unk_1E43E9F70;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_setExecuting:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MSVAsyncOperation__setExecuting___block_invoke;
  v6[3] = &unk_1E43E93E8;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)_isFinished
{
  MSVAsyncOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MSVAsyncOperation__isFinished__block_invoke;
  v5[3] = &unk_1E43E9F70;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_setFinished:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MSVAsyncOperation accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MSVAsyncOperation__setFinished___block_invoke;
  v6[3] = &unk_1E43E93E8;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

uint64_t __34__MSVAsyncOperation__setFinished___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 249) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __32__MSVAsyncOperation__isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 249);
  return result;
}

uint64_t __35__MSVAsyncOperation__setExecuting___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 248) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __33__MSVAsyncOperation__isExecuting__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 248);
  return result;
}

void __30__MSVAsyncOperation_setError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

void __26__MSVAsyncOperation_error__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
