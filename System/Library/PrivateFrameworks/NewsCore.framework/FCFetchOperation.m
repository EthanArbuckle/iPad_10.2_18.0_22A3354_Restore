@implementation FCFetchOperation

- (void)setFetchCompletionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (void)setFetchCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (FCFetchOperation)init
{
  FCFetchOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCFetchOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
    result->_cachePolicy = 0;
  return result;
}

- (void)operationDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  FCFetchOperation *v6;
  uint64_t v7;
  FCFetchOperationResult *result;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  FCFetchOperation *v20;
  id v21;

  v4 = a3;
  -[FCFetchOperation fetchCompletionBlock](self, "fetchCompletionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_result)
    {
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, v4);
      v7 = objc_claimAutoreleasedReturnValue();
      result = v6->_result;
      v6->_result = (FCFetchOperationResult *)v7;

    }
    objc_sync_exit(v6);

  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __48__FCFetchOperation_operationDidFinishWithError___block_invoke;
  v19 = &unk_1E463B2D0;
  v20 = self;
  v21 = v5;
  v9 = v5;
  v10 = (void (**)(_QWORD))_Block_copy(&v16);
  if (-[FCFetchOperation canSendFetchCompletionSynchronously](self, "canSendFetchCompletionSynchronously", v16, v17, v18, v19, v20))
  {
    v10[2](v10);
  }
  else
  {
    -[FCFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      FCDispatchQueueForQualityOfService(-[FCFetchOperation qualityOfService](self, "qualityOfService"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    FCBlockWithQualityOfService(-[FCFetchOperation qualityOfService](self, "qualityOfService"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, v15);

  }
}

- (id)fetchCompletionBlock
{
  return objc_getProperty(self, a2, 400, 1);
}

- (BOOL)canSendFetchCompletionSynchronously
{
  return self->_canSendFetchCompletionSynchronously;
}

void __48__FCFetchOperation_operationDidFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (FCFetchOperationResult)result
{
  return (FCFetchOperationResult *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCanSendFetchCompletionSynchronously:(BOOL)a3
{
  self->_canSendFetchCompletionSynchronously = a3;
}

- (void)setShouldFailOnMissingObjects:(BOOL)a3
{
  self->_shouldFailOnMissingObjects = a3;
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 408, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCompletionQueue, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)takeInputsFromFetchOperation:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[FCOperation setQualityOfService:](self, "setQualityOfService:", objc_msgSend(v4, "qualityOfService"));
  -[FCOperation setRelativePriority:](self, "setRelativePriority:", objc_msgSend(v4, "relativePriority"));
  -[FCFetchOperation setCachePolicy:](self, "setCachePolicy:", objc_msgSend(v4, "cachePolicy"));
  objc_msgSend(v4, "maximumCachedAge");
  -[FCFetchOperation setMaximumCachedAge:](self, "setMaximumCachedAge:");
  v5 = objc_msgSend(v4, "shouldFailOnMissingObjects");

  -[FCFetchOperation setShouldFailOnMissingObjects:](self, "setShouldFailOnMissingObjects:", v5);
}

- (double)maximumCachedAge
{
  return self->_maximumCachedAge;
}

- (void)finishExecutingWithResult:(id)a3
{
  id v4;
  FCFetchOperation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't finish executing a fetch operation without a result"));
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCFetchOperation finishExecutingWithResult:]";
    v18 = 2080;
    v19 = "FCFetchOperation.m";
    v20 = 1024;
    v21 = 73;
    v22 = 2114;
    v23 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_result)
  {
    objc_sync_exit(v5);
  }
  else
  {
    if (-[FCFetchOperation shouldFailOnMissingObjects](v5, "shouldFailOnMissingObjects")
      && !objc_msgSend(v4, "status")
      && objc_msgSend(v4, "anyMissingObjects"))
    {
      v6 = -[FCFetchOperation cachePolicy](v5, "cachePolicy");
      v7 = (void *)MEMORY[0x1E0CB35C8];
      if (v6 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "missingObjectDescriptions", CFSTR("FCErrorMissingObjectsDescriptionsKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fc_partialFailureErrorWithUserInfo:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }
    objc_storeStrong((id *)&v5->_result, v4);
    objc_sync_exit(v5);

    objc_msgSend(v4, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    -[FCOperation finishedPerformingOperationWithError:](v5, "finishedPerformingOperationWithError:", v13);
    v5 = (FCFetchOperation *)v13;
  }

}

- (BOOL)shouldFailOnMissingObjects
{
  return self->_shouldFailOnMissingObjects;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)setMaximumCachedAge:(double)a3
{
  self->_maximumCachedAge = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)finishExecutingWithFetchedObject:(id)a3
{
  id v4;

  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 0, a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v4);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCFetchOperation;
  -[FCOperation cancel](&v4, sel_cancel);
  if (-[FCOperation hasOperationStarted](self, "hasOperationStarted"))
  {
    +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 1, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v3);

  }
}

- (void)finishExecutingWithStatus:(unint64_t)a3
{
  id v4;

  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", a3, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v4);

}

- (void)finishExecutingWithError:(id)a3
{
  id v4;

  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 3, 0, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v4);

}

- (void)finishFromEarlyCancellation
{
  id v3;

  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", 1, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCFetchOperation finishExecutingWithResult:](self, "finishExecutingWithResult:", v3);

}

@end
