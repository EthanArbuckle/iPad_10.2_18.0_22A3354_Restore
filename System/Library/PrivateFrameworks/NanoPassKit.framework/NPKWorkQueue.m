@implementation NPKWorkQueue

- (NPKWorkQueue)init
{
  return -[NPKWorkQueue initWithQueue:](self, "initWithQueue:", 0);
}

- (NPKWorkQueue)initWithQueue:(id)a3
{
  return -[NPKWorkQueue initWithQueue:takeOutTransactions:](self, "initWithQueue:takeOutTransactions:", a3, 0);
}

- (NPKWorkQueue)initWithQueue:(id)a3 takeOutTransactions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NPKWorkQueue *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKWorkQueue;
  v7 = -[NPKWorkQueue init](&v11, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create(0, 0);
    -[NPKWorkQueue setQueue:](v7, "setQueue:", v8);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKWorkQueue setRemainingWork:](v7, "setRemainingWork:", v9);

    -[NPKWorkQueue setCallbackQueue:](v7, "setCallbackQueue:", v6);
    -[NPKWorkQueue setTakeOutTransactions:](v7, "setTakeOutTransactions:", v4);
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSString *workQueueName;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  NPKWorkQueue *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_remainingWork, "count"))
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        workQueueName = self->_workQueueName;
        v7 = -[NSMutableArray count](self->_remainingWork, "count");
        *(_DWORD *)buf = 134218498;
        v10 = self;
        v11 = 2112;
        v12 = workQueueName;
        v13 = 2048;
        v14 = v7;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: deallocating NPKWorkQueueItem:%p, %@ has %lu remaining work items.", buf, 0x20u);
      }

    }
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_remainingWork, "enumerateObjectsUsingBlock:", &__block_literal_global_21);
  }
  v8.receiver = self;
  v8.super_class = (Class)NPKWorkQueue;
  -[NPKWorkQueue dealloc](&v8, sel_dealloc);
}

void __23__NPKWorkQueue_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "transaction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_onQueue_doWorkIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD);
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!-[NPKWorkQueue performingWork](self, "performingWork"))
  {
    -[NPKWorkQueue remainingWork](self, "remainingWork");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[NPKWorkQueue setPerformingWork:](self, "setPerformingWork:", 1);
      -[NPKWorkQueue remainingWork](self, "remainingWork");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPKWorkQueue remainingWork](self, "remainingWork");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      objc_msgSend(v6, "workBlock");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transaction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke;
      v22[3] = &unk_24CFE7E40;
      v22[4] = self;
      v11 = v9;
      v23 = v11;
      v12 = (void *)MEMORY[0x2199B6780](v22);
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        pk_Payment_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKWorkQueue workQueueName](self, "workQueueName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@: starting next work block", buf, 0xCu);

        }
      }
      -[NPKWorkQueue callbackQueue](self, "callbackQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[NPKWorkQueue callbackQueue](self, "callbackQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        v19[0] = v10;
        v19[1] = 3221225472;
        v19[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_6;
        v19[3] = &unk_24CFEB768;
        v20 = v8;
        v21 = v12;
        dispatch_async(v18, v19);

      }
      else
      {
        ((void (**)(_QWORD, void *))v8)[2](v8, v12);
      }

    }
  }
}

void __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueueName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@: ended work block", buf, 0xCu);

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: ending XPC transaction for work", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_3;
  block[3] = &unk_24CFE7998;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v9, block);

}

uint64_t __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "performingWork") & 1) == 0)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKWorkQueue _onQueue_doWorkIfNecessary]_block_invoke";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKWorkQueue.m";
        v10 = 2048;
        v11 = 77;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: NPKWorkQueue was performing work, but somehow self.performingWork was NO)", (uint8_t *)&v6, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(*(id *)(a1 + 32), "setPerformingWork:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_doWorkIfNecessary");
}

uint64_t __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)performWork:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (-[NPKWorkQueue takeOutTransactions](self, "takeOutTransactions"))
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: taking out XPC transaction for work", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Work queue: %@ Item transaction"), self->_workQueueName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[NPKWorkQueue queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__NPKWorkQueue_performWork___block_invoke;
  block[3] = &unk_24CFE84E8;
  block[4] = self;
  v14 = v9;
  v15 = v4;
  v11 = v4;
  v12 = v9;
  dispatch_async(v10, block);

}

uint64_t __28__NPKWorkQueue_performWork___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "remainingWork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPKWorkQueueItem itemWithTransaction:work:](NPKWorkQueueItem, "itemWithTransaction:work:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_doWorkIfNecessary");
}

- (void)flush
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSString *workQueueName;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  NPKWorkQueue *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      workQueueName = self->_workQueueName;
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = workQueueName;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@, %@: Requested to flush pending works", buf, 0x16u);
    }

  }
  -[NPKWorkQueue queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__NPKWorkQueue_flush__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v7, block);

}

void __21__NPKWorkQueue_flush__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "remainingWork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 16);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@, %@: Flushed pending works", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (NSString)workQueueName
{
  return self->_workQueueName;
}

- (void)setWorkQueueName:(id)a3
{
  objc_storeStrong((id *)&self->_workQueueName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)remainingWork
{
  return self->_remainingWork;
}

- (void)setRemainingWork:(id)a3
{
  objc_storeStrong((id *)&self->_remainingWork, a3);
}

- (BOOL)performingWork
{
  return self->_performingWork;
}

- (void)setPerformingWork:(BOOL)a3
{
  self->_performingWork = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  self->_callbackQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)takeOutTransactions
{
  return self->_takeOutTransactions;
}

- (void)setTakeOutTransactions:(BOOL)a3
{
  self->_takeOutTransactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingWork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workQueueName, 0);
}

@end
