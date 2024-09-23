@implementation CRKWaitForProgressOperation

- (CRKWaitForProgressOperation)initWithOperationQueue:(id)a3 operation:(id)a4 expectedCompletedUnitCount:(int64_t)a5 expectedTotalUnitCount:(int64_t)a6
{
  id v11;
  id v12;
  CRKWaitForProgressOperation *v13;
  CRKWaitForProgressOperation *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKWaitForProgressOperation;
  v13 = -[CRKWaitForProgressOperation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_operationQueue, a3);
    objc_storeStrong((id *)&v14->_operation, a4);
    v14->_expectedTotalUnitCount = a6;
    v14->_expctedCompletedUnitCount = a5;
  }

  return v14;
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
  v4.super_class = (Class)CRKWaitForProgressOperation;
  -[CRKWaitForProgressOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CRKWaitForProgressOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __37__CRKWaitForProgressOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "operation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endOperationWithError:", v4);

  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CRKWaitForProgressOperation operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:selector:forOperationEvents:", self, sel_observedOperationDidProgress_, 8);

  -[CRKWaitForProgressOperation operation](self, "operation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:forOperationEvents:", self, sel_observedOperationDidFail_, 4);

  -[CRKWaitForProgressOperation operationQueue](self, "operationQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKWaitForProgressOperation operation](self, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

}

- (void)observedOperationDidProgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (-[CRKWaitForProgressOperation isExecuting](self, "isExecuting"))
  {
    v4 = objc_msgSend(v6, "totalUnitCount");
    if (v4 == -[CRKWaitForProgressOperation expectedTotalUnitCount](self, "expectedTotalUnitCount"))
    {
      v5 = objc_msgSend(v6, "completedUnitCount");
      if (v5 == -[CRKWaitForProgressOperation expctedCompletedUnitCount](self, "expctedCompletedUnitCount"))
        -[CRKWaitForProgressOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (void)observedOperationDidFail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CRKWaitForProgressOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKWaitForProgressOperation endOperationWithError:](self, "endOperationWithError:", v4);

  }
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (CATOperation)operation
{
  return self->_operation;
}

- (int64_t)expectedTotalUnitCount
{
  return self->_expectedTotalUnitCount;
}

- (int64_t)expctedCompletedUnitCount
{
  return self->_expctedCompletedUnitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
