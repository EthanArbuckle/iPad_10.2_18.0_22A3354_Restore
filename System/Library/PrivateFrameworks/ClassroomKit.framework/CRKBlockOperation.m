@implementation CRKBlockOperation

- (CRKBlockOperation)initWithOperationBlock:(id)a3
{
  id v4;
  CRKBlockOperation *v5;
  uint64_t v6;
  id operationBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKBlockOperation;
  v5 = -[CRKBlockOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    operationBlock = v5->_operationBlock;
    v5->_operationBlock = (id)v6;

  }
  return v5;
}

+ (id)blockOperationWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOperationBlock:", v3);

  return v4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKBlockOperation;
  -[CRKBlockOperation cancel](&v7, sel_cancel);
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDBCF18];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__CRKBlockOperation_cancel__block_invoke;
  v4[3] = &unk_24D9C7A60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "cat_performBlockOnMainRunLoop:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__CRKBlockOperation_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isExecuting"))
  {
    CATErrorWithCodeAndUserInfo();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "endOperationWithError:", v1);

  }
}

- (void)main
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[CRKBlockOperation operationBlock](self, "operationBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__CRKBlockOperation_main__block_invoke;
  v7[3] = &unk_24D9C96A8;
  objc_copyWeak(&v8, &location);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __25__CRKBlockOperation_main__block_invoke_2;
  v5[3] = &unk_24D9C96D0;
  objc_copyWeak(&v6, &location);
  ((void (**)(_QWORD, _QWORD *, _QWORD *))v3)[2](v3, v7, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __25__CRKBlockOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isExecuting"))
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "endOperationWithResultObject:", v6);

  }
}

void __25__CRKBlockOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  id v6;

  v6 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isExecuting"))
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "endOperationWithError:", v6);

  }
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
}

@end
