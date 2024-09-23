@implementation CATBlockOperationObserver

- (void)setDelegateQueue:(id)a3
{
  NSObject *v5;
  OS_dispatch_queue *v6;

  v6 = (OS_dispatch_queue *)a3;
  if (self->_delegateQueue != v6)
  {
    objc_storeStrong((id *)&self->_delegateQueue, a3);
    v5 = v6;
    if (!v6)
      v5 = MEMORY[0x24BDAC9B8];
    dispatch_set_target_queue((dispatch_object_t)self->mQueue, v5);
  }

}

- (CATBlockOperationObserver)init
{
  id v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CATBlockOperationObserver;
  v2 = -[CATBlockOperationObserver init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 1), MEMORY[0x24BDAC9B8]);
  }
  return (CATBlockOperationObserver *)v2;
}

- (void)operationDidStart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CATBlockOperationObserver didStart](self, "didStart");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CATBlockOperationObserver invokeBlock:operation:](self, "invokeBlock:operation:", v5, v4);

}

- (void)operationDidProgress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CATBlockOperationObserver didProgress](self, "didProgress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CATBlockOperationObserver invokeBlock:operation:](self, "invokeBlock:operation:", v5, v4);

}

- (void)operationDidFinish:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CATBlockOperationObserver didFinish](self, "didFinish");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CATBlockOperationObserver invokeBlock:operation:](self, "invokeBlock:operation:", v5, v4);

}

- (void)invokeBlock:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *mQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    mQueue = self->mQueue;
    v9 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__CATBlockOperationObserver_invokeBlock_operation___block_invoke;
    v12[3] = &unk_24C1C5970;
    v14 = v6;
    v13 = v7;
    v10 = v12;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke;
    block[3] = &unk_24C1C5998;
    v16 = v10;
    v11 = mQueue;
    dispatch_async(v11, block);

  }
}

uint64_t __51__CATBlockOperationObserver_invokeBlock_operation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (id)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didProgress
{
  return self->_didProgress;
}

- (void)setDidProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinish, 0);
  objc_storeStrong(&self->_didProgress, 0);
  objc_storeStrong(&self->_didStart, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
}

@end
