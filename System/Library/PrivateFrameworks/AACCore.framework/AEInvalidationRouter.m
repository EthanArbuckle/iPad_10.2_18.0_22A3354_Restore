@implementation AEInvalidationRouter

- (AEInvalidationRouter)initWithQueue:(id)a3
{
  id v5;
  AEInvalidationRouter *v6;
  AEInvalidationRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEInvalidationRouter;
  v6 = -[AEInvalidationRouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_mode = 0;
  }

  return v7;
}

- (void)setRouterMode:(int64_t)a3
{
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD block[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AEInvalidationRouter_setRouterMode___block_invoke;
  block[3] = &unk_24FA21C98;
  v6 = queue;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __38__AEInvalidationRouter_setRouterMode___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[4] = *(_QWORD *)(a1 + 40);
  v3 = WeakRetained;
  -[AEInvalidationRouter forwardError]((uint64_t)WeakRetained);

}

- (void)forwardError
{
  id *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;

  if (a1)
  {
    v2 = (id *)(a1 + 24);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained && *(_QWORD *)(a1 + 32) == 1)
    {
      v6 = WeakRetained;
      v4 = *(id *)(a1 + 40);
      if (v4)
      {
        v5 = *(unsigned __int8 *)(a1 + 9);

        if (v5)
          return;
        *(_BYTE *)(a1 + 9) = 1;
        v6 = objc_loadWeakRetained(v2);
        objc_msgSend(v6, "invalidationRouter:didReceiveInvalidationError:", a1, *(_QWORD *)(a1 + 40));
      }
      WeakRetained = v6;
    }

  }
}

- (void)setRouterDelegate:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AEInvalidationRouter_setRouterDelegate___block_invoke;
  block[3] = &unk_24FA21CC0;
  v6 = queue;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__AEInvalidationRouter_setRouterDelegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_storeWeak(WeakRetained + 3, *(id *)(a1 + 32));
  -[AEInvalidationRouter forwardError]((uint64_t)WeakRetained);

}

- (void)fetchCapturedErrorWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AEInvalidationRouter_fetchCapturedErrorWithCompletion___block_invoke;
  block[3] = &unk_24FA21CE8;
  v9 = v4;
  v6 = v4;
  v7 = queue;
  objc_copyWeak(&v10, &location);
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__AEInvalidationRouter_fetchCapturedErrorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    v3 = *((_QWORD *)WeakRetained + 5);
  else
    v3 = 0;
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, v3);

}

- (id)invalidationHandler
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__AEInvalidationRouter_invalidationHandler__block_invoke;
  v9[3] = &unk_24FA21D10;
  v10 = v4;
  v5 = v4;
  objc_copyWeak(&v11, &location);
  v6 = (void *)MEMORY[0x22E329CEC](v9);
  v7 = (void *)MEMORY[0x22E329CEC]();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __43__AEInvalidationRouter_invalidationHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__AEInvalidationRouter_invalidationHandler__block_invoke_2;
  v6[3] = &unk_24FA21CC0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __43__AEInvalidationRouter_invalidationHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 8))
    {
      *((_BYTE *)WeakRetained + 8) = 1;
      v3 = WeakRetained;
      objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
      WeakRetained = v3;
      if (*((_QWORD *)v3 + 4) == 1)
      {
        -[AEInvalidationRouter forwardError]((uint64_t)v3);
        WeakRetained = v3;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
