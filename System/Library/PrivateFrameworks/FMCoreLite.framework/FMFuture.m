@implementation FMFuture

- (FMFuture)init
{
  FMFuture *v2;
  void *v3;
  uint64_t v4;
  NSString *descriptor;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFuture;
  v2 = -[FMFuture init](&v9, sel_init);
  if (v2)
  {
    _FMScopedDescriptor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    descriptor = v2->_descriptor;
    v2->_descriptor = (NSString *)v4;

    v6 = dispatch_queue_create("com.apple.FMFutureAccessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

void __31__FMFuture_addCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v2, "addObject:", v6);

  }
}

- (id)addFailureBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__FMFuture_addFailureBlock___block_invoke;
  v8[3] = &unk_1E5E0E228;
  v9 = v4;
  v5 = v4;
  -[FMFuture addCompletionBlock:](self, "addCompletionBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addCompletionBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
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
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FMFuture_addCompletionBlock___block_invoke;
  block[3] = &unk_1E5E0E250;
  v10 = &v23;
  v11 = &v17;
  block[4] = self;
  v12 = &v13;
  v6 = v4;
  v9 = v6;
  if (accessQueue)
    dispatch_sync(accessQueue, block);
  else
    __31__FMFuture_addCompletionBlock___block_invoke((uint64_t)block);
  if (*((_BYTE *)v14 + 24))
  {
    _FMFutureWillPerformCallback(self);
    (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v24[5], v18[5]);
    _FMFutureDidPerformCallback(self);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return self;
}

- (BOOL)isFinished
{
  NSObject *accessQueue;
  int finished;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  BOOL v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__FMFuture_isFinished__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  if (accessQueue)
  {
    dispatch_sync(accessQueue, v6);
    finished = *((unsigned __int8 *)v8 + 24);
  }
  else
  {
    finished = self->_finished;
    v10 = self->_finished;
  }
  v4 = finished != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __22__FMFuture_isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (BOOL)isCancelled
{
  NSObject *accessQueue;
  uint64_t *v3;
  BOOL v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  FMFuture *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  accessQueue = self->_accessQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __23__FMFuture_isCancelled__block_invoke;
  v10 = &unk_1E5E0DD78;
  v11 = self;
  v12 = &v13;
  if (accessQueue)
  {
    dispatch_sync(accessQueue, &v7);
    v3 = v14;
  }
  else
  {
    v4 = -[FMFuture _queue_isCancelled](self, "_queue_isCancelled", v7, v8, v9, v10, v11, v12, v13);
    v3 = v14;
    *((_BYTE *)v14 + 24) = v4;
  }
  v5 = *((_BYTE *)v3 + 24);
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __23__FMFuture_isCancelled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCancelled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isCancelled
{
  return self->_finished && -[NSError fm_isCancelledError](self->_resultError, "fm_isCancelledError");
}

- (BOOL)cancel
{
  NSObject *accessQueue;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  FMFuture *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __18__FMFuture_cancel__block_invoke;
  v9 = &unk_1E5E0E020;
  v10 = self;
  v11 = &v12;
  if (accessQueue)
    dispatch_sync(accessQueue, &v6);
  else
    __18__FMFuture_cancel__block_invoke((uint64_t)&v6);
  if (*((_BYTE *)v13 + 24))
  {
    -[FMFuture _flushCompletionBlocks](self, "_flushCompletionBlocks", v6, v7, v8, v9, v10, v11, v12);
    -[FMFuture didCancel](self, "didCancel");
    v4 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __18__FMFuture_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  FMFuture *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  accessQueue = self->_accessQueue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __35__FMFuture_finishWithResult_error___block_invoke;
  v16 = &unk_1E5E0E1B0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  v20 = &v21;
  if (accessQueue)
    dispatch_sync(accessQueue, &v13);
  else
    __35__FMFuture_finishWithResult_error___block_invoke((uint64_t)&v13);
  -[FMFuture _flushCompletionBlocks](self, "_flushCompletionBlocks", v13, v14, v15, v16, v17);
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __35__FMFuture_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    objc_storeStrong((id *)(v1 + 32), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (BOOL)finishWithResult:(id)a3
{
  return -[FMFuture finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (BOOL)finishWithError:(id)a3
{
  return -[FMFuture finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (BOOL)finishWithNoResult
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FMFuture finishWithResult:](self, "finishWithResult:", v3);

  return (char)self;
}

- (id)completionHandlerAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__FMFuture_completionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E5E0E1D8;
  v3[4] = self;
  return (id)MEMORY[0x1AF455734](v3, a2);
}

uint64_t __36__FMFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (id)errorOnlyCompletionHandlerAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__FMFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E5E0E200;
  v3[4] = self;
  return (id)MEMORY[0x1AF455734](v3, a2);
}

void __45__FMFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithResult:", v3);

  }
}

- (id)addSuccessBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__FMFuture_addSuccessBlock___block_invoke;
  v8[3] = &unk_1E5E0E228;
  v9 = v4;
  v5 = v4;
  -[FMFuture addCompletionBlock:](self, "addCompletionBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __28__FMFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __28__FMFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_flushCompletionBlocks
{
  NSObject *accessQueue;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _FMFutureWillPerformCallback(self);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FMFuture__flushCompletionBlocks__block_invoke;
  block[3] = &unk_1E5E0E278;
  block[4] = self;
  block[5] = v21;
  block[6] = v19;
  block[7] = &v13;
  if (accessQueue)
    dispatch_sync(accessQueue, block);
  else
    __34__FMFuture__flushCompletionBlocks__block_invoke(block);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v23, 16);
    }
    while (v5);
  }

  _FMFutureDidPerformCallback(self);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

void __34__FMFuture__flushCompletionBlocks__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
  v2 = objc_msgSend(*(id *)(a1[4] + 24), "copy");
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

}

- (id)flatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FMPromise *v8;
  uint64_t v9;
  FMPromise *v10;
  id v11;
  id v12;
  id v13;
  FMPromise *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  FMPromise *v22;
  _QWORD v23[4];
  id v24;
  FMPromise *v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1AF455734](v4);
  objc_msgSend(v5, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("flatMap"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(FMPromise);
  -[FMPromise setDescriptor:](v8, "setDescriptor:", v7);
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __20__FMFuture_flatMap___block_invoke;
  v23[3] = &unk_1E5E0E2A0;
  v24 = v7;
  v26 = v4;
  v10 = v8;
  v25 = v10;
  v11 = v4;
  v12 = v7;
  v13 = -[FMFuture addSuccessBlock:](self, "addSuccessBlock:", v23);
  v18 = v9;
  v19 = 3221225472;
  v20 = __20__FMFuture_flatMap___block_invoke_2;
  v21 = &unk_1E5E0E200;
  v22 = v10;
  v14 = v10;
  v15 = -[FMFuture addFailureBlock:](self, "addFailureBlock:", &v18);
  -[FMPromise future](v14, "future", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __20__FMFuture_flatMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  _FMPushScopedDescriptor(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _FMPopScopedDescriptor();
  v6 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___FMFinishPromiseWithFuture_block_invoke;
  v15[3] = &unk_1E5E0E2F0;
  v9 = v6;
  v16 = v9;
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = ___FMFinishPromiseWithFuture_block_invoke_2;
  v13[3] = &unk_1E5E0E200;
  v14 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v7, "addFailureBlock:", v13);

}

uint64_t __20__FMFuture_flatMap___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)reschedule:(id)a3
{
  id v4;
  FMPromise *v5;
  void *v6;
  FMPromise *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  FMPromise *v17;

  v4 = a3;
  v5 = objc_alloc_init(FMPromise);
  +[FMFuture _descriptorForChainOperation:onFuture:withBlock:](FMFuture, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("reschedule"), self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMPromise setDescriptor:](v5, "setDescriptor:", v6);

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __23__FMFuture_reschedule___block_invoke;
  v15 = &unk_1E5E0E2C8;
  v16 = v4;
  v17 = v5;
  v7 = v5;
  v8 = v4;
  v9 = -[FMFuture addCompletionBlock:](self, "addCompletionBlock:", &v12);
  -[FMPromise future](v7, "future", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __23__FMFuture_reschedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __23__FMFuture_reschedule___block_invoke_2;
  v10[3] = &unk_1E5E0DE68;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __23__FMFuture_reschedule___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FMPromise *v8;
  uint64_t v9;
  FMPromise *v10;
  id v11;
  FMPromise *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  FMPromise *v23;
  id v24;
  _QWORD v25[4];
  FMPromise *v26;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1AF455734](v4);
  objc_msgSend(v5, "_descriptorForChainOperation:onFuture:withBlock:", CFSTR("recover"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(FMPromise);
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __20__FMFuture_recover___block_invoke;
  v25[3] = &unk_1E5E0E2F0;
  v10 = v8;
  v26 = v10;
  v11 = -[FMFuture addSuccessBlock:](self, "addSuccessBlock:", v25);
  v18 = v9;
  v19 = 3221225472;
  v20 = __20__FMFuture_recover___block_invoke_2;
  v21 = &unk_1E5E0E318;
  v23 = v10;
  v24 = v4;
  v22 = v7;
  v12 = v10;
  v13 = v4;
  v14 = v7;
  v15 = -[FMFuture addFailureBlock:](self, "addFailureBlock:", &v18);
  -[FMPromise future](v12, "future", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __20__FMFuture_recover___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __20__FMFuture_recover___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  _FMPushScopedDescriptor(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _FMPopScopedDescriptor();
  v6 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___FMFinishPromiseWithFuture_block_invoke;
  v15[3] = &unk_1E5E0E2F0;
  v9 = v6;
  v16 = v9;
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = ___FMFinishPromiseWithFuture_block_invoke_2;
  v13[3] = &unk_1E5E0E200;
  v14 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v7, "addFailureBlock:", v13);

}

+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5
{
  return 0;
}

- (NSString)description
{
  NSObject *accessQueue;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD block[9];
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2;
  v20[4] = __Block_byref_object_dispose__2;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__2;
  v18[4] = __Block_byref_object_dispose__2;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FMFuture_description__block_invoke;
  block[3] = &unk_1E5E0E340;
  block[4] = self;
  block[5] = v20;
  block[6] = v18;
  block[7] = v16;
  block[8] = v14;
  if (accessQueue)
    dispatch_sync(accessQueue, block);
  else
    __23__FMFuture_description__block_invoke((uint64_t)block);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __23__FMFuture_description__block_invoke_2;
  v12[3] = &unk_1E5E0E368;
  v12[4] = v14;
  v12[5] = v16;
  v12[6] = v20;
  __23__FMFuture_description__block_invoke_2(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __23__FMFuture_description__block_invoke_3;
  v11[3] = &unk_1E5E0E390;
  v11[4] = self;
  __23__FMFuture_description__block_invoke_3((uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __23__FMFuture_description__block_invoke_4;
  v10[3] = &unk_1E5E0E3B8;
  v10[4] = v20;
  v10[5] = v18;
  __23__FMFuture_description__block_invoke_4((uint64_t)v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p (%@)%@%@>"), objc_opt_class(), self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  return (NSString *)v8;
}

uint64_t __23__FMFuture_description__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCancelled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

__CFString *__23__FMFuture_description__block_invoke_2(_QWORD *a1)
{
  __CFString *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    return CFSTR("canceled");
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    return CFSTR("active");
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v2 = CFSTR("succeeded");
  else
    v2 = CFSTR("failed");
  return v2;
}

__CFString *__23__FMFuture_description__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR(": \"%@\"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E5E0E900;
  }
  return v5;
}

__CFString *__23__FMFuture_description__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", result = %@"), v1);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v2)
      return &stru_1E5E0E900;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", error = %@"), v2);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong(&self->_resultValue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)recoverIgnoringError
{
  return -[FMFuture recover:](self, "recover:", &__block_literal_global_3);
}

FMFuture *__48__FMFuture_FMConveniences__recoverIgnoringError__block_invoke()
{
  return +[FMFuture futureWithNoResult](FMFuture, "futureWithNoResult");
}

+ (id)futureWithResult:(id)a3
{
  id v3;
  FMPromise *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(FMPromise);
  -[FMPromise finishWithResult:](v4, "finishWithResult:", v3);

  -[FMPromise future](v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)futureWithError:(id)a3
{
  id v3;
  FMPromise *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(FMPromise);
  -[FMPromise finishWithError:](v4, "finishWithError:", v3);

  -[FMPromise future](v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)futureWithNoResult
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMFuture futureWithResult:](FMFuture, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)futureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[FMScheduler mainThreadScheduler](FMScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithBlock:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5;
  id v6;
  FMPromise *v7;
  FMPromise *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  FMPromise *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(FMPromise);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __54__FMFuture_FMConveniences__futureWithBlock_scheduler___block_invoke;
  v15 = &unk_1E5E0E400;
  v16 = v7;
  v17 = v5;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v6, "performBlock:", &v12);

  -[FMPromise future](v8, "future", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __54__FMFuture_FMConveniences__futureWithBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[FMScheduler mainThreadScheduler](FMScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lazyFutureWithBlock:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5;
  id v6;
  _FMLazyFuture *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_FMLazyFuture initWithBlock:scheduler:]([_FMLazyFuture alloc], "initWithBlock:scheduler:", v6, v5);

  return v7;
}

+ (id)combineAllFutures:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[FMScheduler mainThreadScheduler](FMScheduler, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "combineAllFutures:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)combineAllFutures:(id)a3 scheduler:(id)a4
{
  return (id)objc_msgSend(a1, "combineAllFutures:ignoringErrors:scheduler:", a3, 0, a4);
}

+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  FMFuture *v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  FMFuture *v13;
  id v14;
  void *v15;
  FMFuture *v16;
  _QWORD v18[4];
  FMFuture *v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  size_t v24;
  BOOL v25;
  _QWORD v26[6];
  _QWORD v27[3];
  void *v28;
  _QWORD v29[4];

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = objc_alloc_init(FMFuture);
    v10 = objc_msgSend(v7, "count");
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = v10;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v28 = 0;
    v28 = malloc_type_calloc(8uLL, v10, 0x924DD72CuLL);
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke;
    v26[3] = &unk_1E5E0E428;
    v26[4] = v27;
    v26[5] = v10;
    v12 = (void *)MEMORY[0x1AF455734](v26);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2;
    v18[3] = &unk_1E5E0E478;
    v25 = a4;
    v22 = v29;
    v23 = v27;
    v13 = v9;
    v19 = v13;
    v24 = v10;
    v20 = v8;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
    v15 = v21;
    v16 = v13;

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    +[FMFuture futureWithResult:](FMFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v16 = (FMFuture *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v4 = *(void **)(v3 + 8 * v2);
      *(_QWORD *)(v3 + 8 * v2) = 0;

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3;
  v8[3] = &unk_1E5E0E450;
  v15 = *(_BYTE *)(a1 + 80);
  v12 = *(_OWORD *)(a1 + 56);
  v13 = a3;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 72);
  v9 = v5;
  v14 = v6;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7 = (id)objc_msgSend(a2, "addCompletionBlock:", v8);

}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    v9 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    v12 = v11 == 0;
    v13 = v7;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    v20 = v6;
    v13 = v20;
    v21 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    do
    {
      v22 = __ldaxr(v21);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, v21));
    v12 = v23 == 0;
    if (v20)
    {
LABEL_5:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 8 * *(_QWORD *)(a1 + 72)), v13);
      if (v12)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 80));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4;
          v31[3] = &unk_1E5E0DDC8;
          v18 = *(void **)(a1 + 40);
          v32 = *(id *)(a1 + 32);
          v33 = v17;
          v19 = v17;
          objc_msgSend(v18, "performBlock:", v31);

        }
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  else
  {
    v24 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    do
    {
      v25 = __ldaxr(v24);
      v26 = v25 - 1;
    }
    while (__stlxr(v26, v24));
    v12 = v26 == 0;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5;
  v28[3] = &unk_1E5E0DDC8;
  v27 = *(void **)(a1 + 40);
  v29 = *(id *)(a1 + 32);
  v30 = v6;
  objc_msgSend(v27, "performBlock:", v28);

  v13 = 0;
  if (v12)
LABEL_17:
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, v15, v16);
LABEL_18:

}

uint64_t __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

+ (id)chainFutures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_chainFuturesWithFutureStack:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[FMFuture futureWithNoResult](FMFuture, "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_chainFuturesWithFutureStack:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 < 2)
  {
    v8 = v6;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__FMFuture_FMConveniences___chainFuturesWithFutureStack___block_invoke;
    v10[3] = &unk_1E5E0E4A0;
    v11 = v4;
    v12 = a1;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __57__FMFuture_FMConveniences___chainFuturesWithFutureStack___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  return objc_msgSend(*(id *)(a1 + 40), "_chainFuturesWithFutureStack:", *(_QWORD *)(a1 + 32));
}

+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3
{
  void (**v3)(id, void *);
  FMFuture *v4;
  void *v5;

  v3 = (void (**)(id, void *))a3;
  v4 = objc_alloc_init(FMFuture);
  -[FMFuture completionHandlerAdapter](v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  return v4;
}

+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3
{
  void (**v3)(id, void *);
  FMFuture *v4;
  void *v5;

  v3 = (void (**)(id, void *))a3;
  v4 = objc_alloc_init(FMFuture);
  -[FMFuture errorOnlyCompletionHandlerAdapter](v4, "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  return v4;
}

@end
