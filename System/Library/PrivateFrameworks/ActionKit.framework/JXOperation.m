@implementation JXOperation

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JXOperation;
  -[JXOperation dealloc](&v2, sel_dealloc);
}

- (JXOperation)init
{
  JXOperation *v2;
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_queue_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JXOperation;
  v2 = -[JXOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%p.state"), v5, v2);

    v7 = objc_retainAutorelease(v6);
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    -[JXOperation setStateQueue:](v2, "setStateQueue:", v8);

    -[JXOperation setIsExecuting:](v2, "setIsExecuting:", 0);
    -[JXOperation setIsFinished:](v2, "setIsFinished:", 0);

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[JXOperation stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __20__JXOperation_start__block_invoke;
  v5[3] = &unk_24F8BB688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  if (*((_BYTE *)v7 + 24))
  {
    v4 = (void *)MEMORY[0x22E315218]();
    -[JXOperation main](self, "main");
    objc_autoreleasePoolPop(v4);
  }
  _Block_object_dispose(&v6, 8);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JXOperation;
  -[JXOperation cancel](&v3, sel_cancel);
  -[JXOperation finish](self, "finish");
}

- (void)finish
{
  NSObject *v3;
  _QWORD block[5];

  -[JXOperation stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__JXOperation_finish__block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)startAndWaitUntilFinished
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v3, "addOperation:", self);
  objc_msgSend(v3, "waitUntilAllOperationsAreFinished");

}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (OS_dispatch_queue)stateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setStateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

uint64_t __21__JXOperation_finish__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "willFinish");
    v3 = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "willChangeValueForKey:", CFSTR("isExecuting"));
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
      objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setIsFinished:", 1);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
      return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
    }
    else
    {
      result = objc_msgSend(v4, "isFinished");
      if ((result & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 0);
        return objc_msgSend(*(id *)(a1 + 32), "setIsFinished:", 1);
      }
    }
  }
  return result;
}

uint64_t __20__JXOperation_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "isReady"), !(_DWORD)result)
    || (result = objc_msgSend(*(id *)(a1 + 32), "isExecuting"), (result & 1) != 0)
    || (result = objc_msgSend(*(id *)(a1 + 32), "isFinished"), (_DWORD)result))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
    objc_msgSend(*(id *)(a1 + 32), "setIsExecuting:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  }
  return result;
}

@end
