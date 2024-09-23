@implementation CATOperationQueue

- (void)setUnderlyingQueue:(id)a3
{
  id v5;
  CATOperationQueue *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  +[CATOperationQueue backgroundQueue](CATOperationQueue, "backgroundQueue");
  v6 = (CATOperationQueue *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATOperationQueue.m"), 32, CFSTR("%@ cannot call %@ for backgroundQueue"), self, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)CATOperationQueue;
  -[CATOperationQueue setUnderlyingQueue:](&v9, sel_setUnderlyingQueue_, v5);

}

+ (id)backgroundQueue
{
  if (backgroundQueue_onceToken != -1)
    dispatch_once(&backgroundQueue_onceToken, &__block_literal_global_6);
  return (id)backgroundQueue_backgroundQueue;
}

uint64_t __36__CATOperationQueue_backgroundQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)backgroundQueue_backgroundQueue;
  backgroundQueue_backgroundQueue = v0;

  return objc_msgSend((id)backgroundQueue_backgroundQueue, "setName:", CFSTR("Global Background Queue"));
}

+ (id)currentQueue
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATOperationQueue.m"), 59, CFSTR("%@ cannot use +currentQueue, call +[NSOperationQueue currentQueue] instead."), a1);

  return 0;
}

+ (id)mainQueue
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATOperationQueue.m"), 66, CFSTR("%@ cannot use +mainQueue, call +[NSOperationQueue mainQueue] instead."), a1);

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATOperationQueue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = '%@', suspended = %d, operationCount = %lu, maxConcurrentOperationCount = %ld }>"), v4, self, v5, -[CATOperationQueue isSuspended](self, "isSuspended"), -[CATOperationQueue operationCount](self, "operationCount"), -[CATOperationQueue maxConcurrentOperationCount](self, "maxConcurrentOperationCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addOperation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CATOperationQueue startObserving:](self, "startObserving:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "operationWillEnqueueOntoOperationQueue:", self);
  -[CATOperationQueue delegateWillAddOperation:](self, "delegateWillAddOperation:", v4);
  v5.receiver = self;
  v5.super_class = (Class)CATOperationQueue;
  -[CATOperationQueue addOperation:](&v5, sel_addOperation_, v4);

}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[CATOperationQueue addOperation:](self, "addOperation:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "waitUntilFinished", (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  objc_super v18;

  v10 = a4;
  if (a6 == CFSTR("_CATOperationQueueIsFinishedObservationContext"))
  {
    v12 = *MEMORY[0x24BDD0E80];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "BOOLValue");
    if ((v15 & 1) == 0 && v17)
    {
      -[CATOperationQueue delegateOperationDidFinish:](self, "delegateOperationDidFinish:", v10);
      -[CATOperationQueue stopObserving:](self, "stopObserving:", v10);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CATOperationQueue;
    v11 = a5;
    -[CATOperationQueue observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, v11, a6);

  }
}

- (void)delegateOperationDidFinish:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CATOperationQueue delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "operationQueue:operationDidFinish:", self, v5);

}

- (void)delegateWillAddOperation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CATOperationQueue delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "operationQueue:willAddOperation:", self, v5);

}

- (void)startObserving:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 3, CFSTR("_CATOperationQueueIsFinishedObservationContext"));
}

- (void)stopObserving:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), CFSTR("_CATOperationQueueIsFinishedObservationContext"));
}

- (CATOperationQueueDelegate)delegate
{
  return (CATOperationQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
