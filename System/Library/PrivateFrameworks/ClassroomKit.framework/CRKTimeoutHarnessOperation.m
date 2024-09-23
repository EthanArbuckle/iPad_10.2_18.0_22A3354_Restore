@implementation CRKTimeoutHarnessOperation

- (CRKTimeoutHarnessOperation)initWithTimerPrimitives:(id)a3 operationQueue:(id)a4 operation:(id)a5 timerIdentifier:(id)a6 timeout:(double)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CRKTimeoutHarnessOperation *v17;
  CRKTimeoutHarnessOperation *v18;
  uint64_t v19;
  NSString *timerIdentifier;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKTimeoutHarnessOperation;
  v17 = -[CRKTimeoutHarnessOperation init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_timerPrimitives, a3);
    objc_storeStrong((id *)&v18->_operationQueue, a4);
    objc_storeStrong((id *)&v18->_operation, a5);
    v19 = objc_msgSend(v16, "copy");
    timerIdentifier = v18->_timerIdentifier;
    v18->_timerIdentifier = (NSString *)v19;

    v18->_timeout = a7;
  }

  return v18;
}

- (CRKTimeoutHarnessOperation)initWithOperationQueue:(id)a3 operation:(id)a4 timout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CRKTimeoutHarnessOperation *v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "makePrimitives");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeoutTimerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CRKTimeoutHarnessOperation initWithTimerPrimitives:operationQueue:operation:timerIdentifier:timeout:](self, "initWithTimerPrimitives:operationQueue:operation:timerIdentifier:timeout:", v11, v9, v8, v12, a5);

  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKTimeoutHarnessOperation;
  -[CRKTimeoutHarnessOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CRKTimeoutHarnessOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __36__CRKTimeoutHarnessOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeoutTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "operation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    v4 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endOperationWithError:", v5);

  }
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CRKTimeoutHarnessOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __34__CRKTimeoutHarnessOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

- (void)run
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKTimeoutHarnessOperation.m"), 95, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[CRKTimeoutHarnessOperation isExecuting](self, "isExecuting"))
  {
    objc_initWeak(&location, self);
    -[CRKTimeoutHarnessOperation operation](self, "operation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:selector:forOperationEvents:", self, sel_dependentOperationDidFinish_, 6);

    -[CRKTimeoutHarnessOperation timerPrimitives](self, "timerPrimitives");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKTimeoutHarnessOperation timerIdentifier](self, "timerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKTimeoutHarnessOperation timeout](self, "timeout");
    v8 = v7;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __33__CRKTimeoutHarnessOperation_run__block_invoke;
    v14[3] = &unk_24D9C7A60;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v5, "scheduleTimerWithIdentifier:timeInterval:fireHandler:", v6, v14, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKTimeoutHarnessOperation setTimeoutTimer:](self, "setTimeoutTimer:", v9);

    -[CRKTimeoutHarnessOperation operationQueue](self, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKTimeoutHarnessOperation operation](self, "operation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __33__CRKTimeoutHarnessOperation_run__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeoutDidFire");

}

- (void)dependentOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKTimeoutHarnessOperation timeoutTimer](self, "timeoutTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  if (-[CRKTimeoutHarnessOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v7, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKTimeoutHarnessOperation endOperationWithError:](self, "endOperationWithError:", v6);
    }
    else
    {
      objc_msgSend(v7, "resultObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKTimeoutHarnessOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
    }

  }
}

- (void)timeoutDidFire
{
  void *v3;
  id v4;

  if (-[CRKTimeoutHarnessOperation isExecuting](self, "isExecuting"))
  {
    -[CRKTimeoutHarnessOperation operation](self, "operation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    CRKErrorWithCodeAndUserInfo(32, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKTimeoutHarnessOperation endOperationWithError:](self, "endOperationWithError:", v4);

  }
}

+ (id)timeoutTimerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-timeoutTimer"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (CRKOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (CATOperation)operation
{
  return self->_operation;
}

- (NSString)timerIdentifier
{
  return self->_timerIdentifier;
}

- (double)timeout
{
  return self->_timeout;
}

- (CRKCancelable)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_timerIdentifier, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
}

@end
