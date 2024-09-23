@implementation CRKSequentialOperation

- (CRKSequentialOperation)initWithSequentialOperations:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CRKSequentialOperation *v8;
  uint64_t v9;
  NSArray *operations;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRKSequentialOperation;
  v8 = -[CRKSequentialOperation init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    operations = v8->_operations;
    v8->_operations = (NSArray *)v9;

    v11 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_queue, v11);
    if (!v7)

  }
  return v8;
}

- (CRKSequentialOperation)init
{
  return -[CRKSequentialOperation initWithSequentialOperations:queue:](self, "initWithSequentialOperations:queue:", MEMORY[0x24BDBD1A8], 0);
}

+ (id)sequentialOperationWithOperations:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSequentialOperations:queue:", v4, 0);

  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CRKSequentialOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __30__CRKSequentialOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enqueueFront");
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKSequentialOperation;
  -[CRKSequentialOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CRKSequentialOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __32__CRKSequentialOperation_cancel__block_invoke(uint64_t a1)
{
  void *v1;
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
  objc_msgSend(*(id *)(a1 + 32), "operations", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "cancel");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)enqueueFront
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (-[CRKSequentialOperation isExecuting](self, "isExecuting"))
  {
    if (-[CRKSequentialOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CRKSequentialOperation endOperationWithError:](self, "endOperationWithError:", v9);
LABEL_8:

      return;
    }
    -[CRKSequentialOperation operations](self, "operations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = -[CRKSequentialOperation frontOfQueue](self, "frontOfQueue");
      -[CRKSequentialOperation operations](self, "operations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count") - 1;

      if (v4 <= v6)
      {
        -[CRKSequentialOperation operations](self, "operations");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", -[CRKSequentialOperation frontOfQueue](self, "frontOfQueue"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        -[CRKSequentialOperation setFrontOfQueue:](self, "setFrontOfQueue:", -[CRKSequentialOperation frontOfQueue](self, "frontOfQueue") + 1);
        objc_msgSend(v9, "addTarget:selector:forOperationEvents:", self, sel_frontOperationDidFinish_, 6);
        -[CRKSequentialOperation queue](self, "queue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addOperation:", v9);

        goto LABEL_8;
      }
    }
    else
    {

    }
    -[CRKSequentialOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)frontOperationDidFinish:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4, v6 = -[CRKSequentialOperation isCancelled](self, "isCancelled"),
                         v5,
                         (v6 & 1) == 0))
  {
    -[CRKSequentialOperation setFailedOperation:](self, "setFailedOperation:", v8);
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSequentialOperation endOperationWithError:](self, "endOperationWithError:", v7);

  }
  else
  {
    -[CRKSequentialOperation enqueueFront](self, "enqueueFront");
  }

}

- (CATOperation)failedOperation
{
  return self->_failedOperation;
}

- (void)setFailedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_failedOperation, a3);
}

- (unint64_t)frontOfQueue
{
  return self->_frontOfQueue;
}

- (void)setFrontOfQueue:(unint64_t)a3
{
  self->_frontOfQueue = a3;
}

- (NSArray)operations
{
  return self->_operations;
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_failedOperation, 0);
}

@end
