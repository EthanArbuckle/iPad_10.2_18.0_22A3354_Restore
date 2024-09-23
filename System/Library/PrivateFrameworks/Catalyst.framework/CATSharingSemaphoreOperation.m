@implementation CATSharingSemaphoreOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[5];
  objc_super v7;
  _QWORD block[4];
  id v9;

  v7.receiver = self;
  v7.super_class = (Class)CATSharingSemaphoreOperation;
  -[CATSharingSemaphoreOperation cancel](&v7, sel_cancel);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__CATSharingSemaphoreOperation_cancel__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_9;
  block[3] = &unk_24C1C5998;
  v9 = v4;
  dispatch_async(v5, block);

}

void __38__CATSharingSemaphoreOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
}

- (void)signal
{
  NSObject *v3;
  id v4;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  if (-[CATOperation isExecuting](self, "isExecuting"))
  {
    if (-[CATSharingSemaphoreOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo(404, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[CATOperation endOperationWithError:](self, "endOperationWithError:", v4);

    }
    else
    {
      -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }
}

@end
