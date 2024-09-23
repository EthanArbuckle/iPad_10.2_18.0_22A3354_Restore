@implementation VSTimeoutOperation

- (VSTimeoutOperation)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use -initWithOperation:timeout: instead of -init."));

  return 0;
}

- (VSTimeoutOperation)initWithOperation:(id)a3 timeout:(double)a4
{
  id v7;
  VSTimeoutOperation *v8;
  NSOperationQueue *v9;
  NSOperationQueue *privateQueue;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSTimeoutOperation;
  v8 = -[VSTimeoutOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v9;

    -[NSOperationQueue setName:](v8->_privateQueue, "setName:", CFSTR("VSTimeoutOperation"));
    objc_storeStrong((id *)&v8->_operation, a3);
    v8->_timeout = a4;
  }

  return v8;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  VSTimeoutOperation *v13;
  _QWORD v14[5];

  -[VSTimeoutOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTimeoutOperation operation](self, "operation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);
  -[VSTimeoutOperation timeout](self, "timeout");
  +[VSDelayOperation delayOperationWithDelay:](VSDelayOperation, "delayOperationWithDelay:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v5);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__VSTimeoutOperation_executionDidBegin__block_invoke;
  v14[3] = &unk_1E939EE88;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDependency:", v5);
  objc_msgSend(v3, "addOperation:", v7);
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __39__VSTimeoutOperation_executionDidBegin__block_invoke_2;
  v11[3] = &unk_1E939F138;
  v12 = v5;
  v13 = self;
  v9 = v5;
  objc_msgSend(v8, "blockOperationWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDependency:", v4);
  objc_msgSend(v3, "addOperation:", v10);

}

uint64_t __39__VSTimeoutOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

uint64_t __39__VSTimeoutOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "finishExecutionIfPossible");
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTimeoutOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSTimeoutOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (NSOperation)operation
{
  return self->_operation;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
