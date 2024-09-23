@implementation CATBatchRemoteTaskOperation

- (CATBatchRemoteTaskOperation)initWithTaskClient:(id)a3 requests:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CATBatchRemoteTaskOperation *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATBatchRemoteTaskOperation.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v7, "prepareTaskOperationForRequest:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[CATBatchRemoteTaskOperation initWithRemoteTaskOperations:](self, "initWithRemoteTaskOperations:", v9);
  return v16;
}

- (CATBatchRemoteTaskOperation)initWithRemoteTaskOperations:(id)a3
{
  id v4;
  CATBatchRemoteTaskOperation *v5;
  uint64_t v6;
  NSOperationQueue *mQueue;
  void *v8;
  uint64_t v9;
  NSArray *mRemoteTasks;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CATBatchRemoteTaskOperation;
  v5 = -[CATOperation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    mQueue = v5->mQueue;
    v5->mQueue = (NSOperationQueue *)v6;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.main"), objc_opt_class(), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v5->mQueue, "setName:", v8);

    v9 = objc_msgSend(v4, "copy");
    mRemoteTasks = v5->mRemoteTasks;
    v5->mRemoteTasks = (NSArray *)v9;

  }
  return v5;
}

- (CATBatchRemoteTaskOperation)init
{
  return -[CATBatchRemoteTaskOperation initWithRemoteTaskOperations:](self, "initWithRemoteTaskOperations:", 0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NSArray)remoteTaskOperations
{
  return (NSArray *)(id)-[NSArray copy](self->mRemoteTasks, "copy");
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATBatchRemoteTaskOperation;
  -[CATBatchRemoteTaskOperation cancel](&v3, sel_cancel);
  -[CATBatchRemoteTaskOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_cancelSubOperations, 0, 0);
}

- (void)cancelSubOperations
{
  -[NSArray makeObjectsPerformSelector:](self->mRemoteTasks, "makeObjectsPerformSelector:", sel_cancel);
}

- (void)main
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CATOperation setTotalUnitCount:](self, "setTotalUnitCount:", -[NSArray count](self->mRemoteTasks, "count"));
  -[CATOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", 0);
  if (-[NSArray count](self->mRemoteTasks, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->mRemoteTasks;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, sel_remoteTaskDidFinish_, 6, (_QWORD)v9);
          -[NSOperationQueue addOperation:](self->mQueue, "addOperation:", v8);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  else
  {
    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)remoteTaskDidFinish:(id)a3
{
  unint64_t v4;
  id v5;

  -[CATOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", -[CATOperation completedUnitCount](self, "completedUnitCount", a3) + 1);
  v4 = -[CATOperation completedUnitCount](self, "completedUnitCount");
  if (v4 >= -[NSArray count](self->mRemoteTasks, "count"))
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E8]), "initWithTarget:selector:object:", self, sel_endOperationWithResultObject_, 0);
    -[NSOperationQueue addOperation:](self->mQueue, "addOperation:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mRemoteTasks, 0);
}

@end
