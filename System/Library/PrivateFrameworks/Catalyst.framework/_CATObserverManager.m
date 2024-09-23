@implementation _CATObserverManager

- (_CATObserverManager)initWithOperation:(id)a3
{
  CATOperation *v5;
  _CATObserverManager *v6;
  _CATObserverManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *mQueue;
  dispatch_source_t v15;
  OS_dispatch_source *mProgressSource;
  NSObject *v17;
  void *v19;
  _QWORD handler[4];
  id v21;
  id v22;
  id from;
  id location;
  objc_super v25;

  v5 = (CATOperation *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  v25.receiver = self;
  v25.super_class = (Class)_CATObserverManager;
  v6 = -[_CATObserverManager init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mOperation = v5;
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_opt_class();
    -[CATOperation UUID](v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v9, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    mQueue = v7->mQueue;
    v7->mQueue = (OS_dispatch_queue *)v13;

    objc_initWeak(&location, v7);
    objc_initWeak(&from, v5);
    v15 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)v7->mQueue);
    mProgressSource = v7->mProgressSource;
    v7->mProgressSource = (OS_dispatch_source *)v15;

    v17 = v7->mProgressSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __41___CATObserverManager_initWithOperation___block_invoke;
    handler[3] = &unk_24C1C5CB8;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume((dispatch_object_t)v7->mProgressSource);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v5;
  CATOperation *v6;
  OS_dispatch_queue *mQueue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  CATOperation *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _CATObserverManager *v16;
  CATOperation *v17;
  _QWORD block[4];
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  v6 = self->mOperation;
  mQueue = self->mQueue;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __35___CATObserverManager_addObserver___block_invoke;
  v14[3] = &unk_24C1C5A10;
  v15 = v5;
  v16 = self;
  v17 = v6;
  v9 = v14;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v19 = v9;
  v10 = mQueue;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *mQueue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD block[4];
  id v15;

  v4 = a3;
  objc_initWeak(&location, self);
  mQueue = self->mQueue;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38___CATObserverManager_removeObserver___block_invoke;
  v10[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v7 = v10;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v15 = v7;
  v8 = mQueue;
  v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)operationDidStart:(id)a3
{
  CATOperation *v5;
  OS_dispatch_queue *mQueue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  CATOperation *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  CATOperation *v14;
  _QWORD block[4];
  id v16;

  v5 = (CATOperation *)a3;
  if (self->mOperation != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 556, CFSTR("%@ cannot call %@ with an operation (%@) not being observed"), self, v12, v5);

  }
  -[CATOperation addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", self, CFSTR("completedUnitCount"), 7, CFSTR("_CATOperationCompletedUnitCountObservationContext"));
  mQueue = self->mQueue;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41___CATObserverManager_operationDidStart___block_invoke;
  v13[3] = &unk_24C1C5C00;
  v13[4] = self;
  v14 = v5;
  v8 = v13;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v16 = v8;
  v9 = mQueue;
  v10 = v5;
  dispatch_async(v9, block);

}

- (void)operationDidProgress:(id)a3
{
  uint64_t v4;
  OS_dispatch_queue *mQueue;
  _QWORD *v6;
  NSObject *v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD block[4];
  id v15;

  if (self->mOperation != a3)
  {
    v9 = (void *)MEMORY[0x24BDD1448];
    v10 = a3;
    objc_msgSend(v9, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 586, CFSTR("%@ cannot call %@ with an operation (%@) not being observed"), self, v12, v10);

  }
  v4 = MEMORY[0x24BDAC760];
  mQueue = self->mQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44___CATObserverManager_operationDidProgress___block_invoke;
  v13[3] = &unk_24C1C5A60;
  v13[4] = self;
  v6 = v13;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v15 = v6;
  v7 = mQueue;
  dispatch_async(v7, block);

}

- (void)notifyObserversOperationDidProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && (self->mState - 5) >= 0xFFFFFFFE)
  {
    -[NSMutableSet allObjects](self->mObservers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "operationDidProgress:", v4);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)operationDidFinish:(id)a3
{
  CATOperation *v5;
  OS_dispatch_queue *mQueue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  CATOperation *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  CATOperation *v14;
  _QWORD block[4];
  id v16;

  v5 = (CATOperation *)a3;
  if (self->mOperation != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperation.m"), 612, CFSTR("%@ cannot call %@ with an operation (%@) not being observed"), self, v12, v5);

  }
  mQueue = self->mQueue;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42___CATObserverManager_operationDidFinish___block_invoke;
  v13[3] = &unk_24C1C5C00;
  v13[4] = self;
  v14 = v5;
  v8 = v13;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_24C1C5998;
  v16 = v8;
  v9 = mQueue;
  v10 = v5;
  dispatch_async(v9, block);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v10 = a4;
  if (a6 == CFSTR("_CATOperationCompletedUnitCountObservationContext"))
  {
    v12 = *MEMORY[0x24BDD0E80];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "integerValue");
    if (v15 == v17)
      goto LABEL_4;
    v11 = v10;
    if (v17 < objc_msgSend(v11, "totalUnitCount"))
      -[_CATObserverManager operationDidProgress:](self, "operationDidProgress:", v11);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_CATObserverManager;
    v11 = a5;
    -[_CATObserverManager observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, v11, a6);
  }

LABEL_4:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStrongOperation, 0);
  objc_storeStrong((id *)&self->mProgressSource, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mObservers, 0);
}

@end
