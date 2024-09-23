@implementation MSVAsyncBlockOperation

- (MSVAsyncBlockOperation)initWithStartHandler:(id)a3
{
  id v4;
  MSVAsyncBlockOperation *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  uint64_t v8;
  id startHandler;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVAsyncBlockOperation;
  v5 = -[MSVAsyncOperation init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mediaservices.MSVAsyncBlockOperation.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = MEMORY[0x1A1AFBD28](v4);
    startHandler = v5->_startHandler;
    v5->_startHandler = (id)v8;

  }
  return v5;
}

- (void)cancel
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVAsyncBlockOperation;
  -[MSVAsyncBlockOperation cancel](&v5, sel_cancel);
  -[MSVAsyncBlockOperation cancellationHandler](self, "cancellationHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);

}

- (void)execute
{
  (*((void (**)(void))self->_startHandler + 2))();
}

- (void)finishWithError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSVAsyncBlockOperation;
  -[MSVAsyncOperation finishWithError:](&v4, sel_finishWithError_, a3);
  -[MSVAsyncBlockOperation setCancellationHandler:](self, "setCancellationHandler:", 0);
}

- (id)cancellationHandler
{
  NSObject *accessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__46;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MSVAsyncBlockOperation_cancellationHandler__block_invoke;
  v5[3] = &unk_1E43E9F70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (void *)MEMORY[0x1A1AFBD28](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setCancellationHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MSVAsyncBlockOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_1E43E9EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (id)startHandler
{
  return self->_startHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __49__MSVAsyncBlockOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 280);
  *(_QWORD *)(v3 + 280) = v2;

}

void __45__MSVAsyncBlockOperation_cancellationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AFBD28](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
