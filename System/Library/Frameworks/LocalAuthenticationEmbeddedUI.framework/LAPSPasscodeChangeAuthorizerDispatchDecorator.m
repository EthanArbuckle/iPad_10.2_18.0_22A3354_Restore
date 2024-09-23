@implementation LAPSPasscodeChangeAuthorizerDispatchDecorator

- (LAPSPasscodeChangeAuthorizerDispatchDecorator)initWithAuthorizer:(id)a3
{
  id v5;
  LAPSPasscodeChangeAuthorizerDispatchDecorator *v6;
  LAPSPasscodeChangeAuthorizerDispatchDecorator *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LAPSPasscodeChangeAuthorizerDispatchDecorator;
  v6 = -[LAPSPasscodeChangeAuthorizerDispatchDecorator init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizer, a3);
    v8 = (void *)MEMORY[0x24BE606C0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createUserInitiatedSerialQueueWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)authorizeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke;
  v6[3] = &unk_24FDCD9A8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LAPSPasscodeChangeAuthorizerDispatchDecorator _performOnBackgroundQueue:](self, "_performOnBackgroundQueue:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_2;
    v6[3] = &unk_24FDCD980;
    objc_copyWeak(&v8, v2);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "authorizeWithCompletion:", v6);

    objc_destroyWeak(&v8);
  }

}

void __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_3;
    v5[3] = &unk_24FDCD958;
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(WeakRetained, "_performOnMainQueue:", v5);

  }
}

uint64_t __73__LAPSPasscodeChangeAuthorizerDispatchDecorator_authorizeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_performOnBackgroundQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_workQueue, a3);
}

- (void)_performOnMainQueue:(id)a3
{
  dispatch_async(MEMORY[0x24BDAC9B8], a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
}

@end
