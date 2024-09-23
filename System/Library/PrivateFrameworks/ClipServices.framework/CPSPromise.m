@implementation CPSPromise

+ (id)promise
{
  return objc_alloc_init(CPSPromise);
}

- (CPSPromise)init
{
  CPSPromise *v2;
  uint64_t v3;
  NSConditionLock *stateLock;
  NSMutableArray *v5;
  NSMutableArray *completionBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSPromise;
  v2 = -[CPSPromise init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;

  }
  return v2;
}

- (void)addCompletionBlock:(id)a3
{
  NSMutableArray *completionBlocks;
  void *v5;
  void (**v6)(id, id, NSError *);

  v6 = (void (**)(id, id, NSError *))a3;
  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[CPSPromise _isFinished](self, "_isFinished"))
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    v6[2](v6, self->_result, self->_error);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    v5 = (void *)MEMORY[0x20BD30A54](v6);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v5);

    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }

}

- (void)finish
{
  -[CPSPromise _finishWithResult:error:](self, "_finishWithResult:error:", 0, 0);
}

- (void)finishWithError:(id)a3
{
  -[CPSPromise _finishWithResult:error:](self, "_finishWithResult:error:", 0, a3);
}

- (void)finishWithResult:(id)a3
{
  -[CPSPromise _finishWithResult:error:](self, "_finishWithResult:error:", a3, 0);
}

- (BOOL)_isFinished
{
  return -[NSConditionLock condition](self->_stateLock, "condition") == 1;
}

- (void)_finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[CPSPromise _isFinished](self, "_isFinished"))
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    objc_storeStrong((id *)&self->_error, a4);
    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1);
    -[CPSPromise _flushCompletionBlocks](self, "_flushCompletionBlocks");
  }

}

- (void)_flushCompletionBlocks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
