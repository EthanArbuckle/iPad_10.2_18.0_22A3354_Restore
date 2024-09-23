@implementation DMFBatchRequestOperation

- (DMFBatchRequestOperation)initWithActivityTransactionOperation:(id)a3 subOperations:(id)a4
{
  id v8;
  id v9;
  DMFBatchRequestOperation *v10;
  DMFBatchRequestOperation *v11;
  uint64_t v12;
  NSArray *subOperations;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFBatchRequestOperation.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityTransactionOperation"));

  }
  v16.receiver = self;
  v16.super_class = (Class)DMFBatchRequestOperation;
  v10 = -[DMFBatchRequestOperation init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activityTransactionOperation, a3);
    v12 = objc_msgSend(v9, "copy");
    subOperations = v11->_subOperations;
    v11->_subOperations = (NSArray *)v12;

  }
  return v11;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[DMFBatchRequestOperation activityTransactionOperation](self, "activityTransactionOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setName:", v4);
  v7.receiver = self;
  v7.super_class = (Class)DMFBatchRequestOperation;
  -[DMFBatchRequestOperation setName:](&v7, sel_setName_, v4);

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[DMFBatchRequestOperation subOperations](self, "subOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[DMFBatchRequestOperation activityTransactionOperation](self, "activityTransactionOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[DMFBatchRequestOperation name](self, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setName:", v7);

      }
    }
    v8 = (void *)objc_opt_new();
    -[DMFBatchRequestOperation setQueue:](self, "setQueue:", v8);

    -[DMFBatchRequestOperation activityTransactionOperation](self, "activityTransactionOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:selector:forOperationEvents:", self, sel_activityTransactionOperationDidStart_, 1);

    -[DMFBatchRequestOperation activityTransactionOperation](self, "activityTransactionOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:selector:forOperationEvents:", self, sel_activityTransactionOperationDidFinish_, 6);

    -[DMFBatchRequestOperation queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMFBatchRequestOperation activityTransactionOperation](self, "activityTransactionOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v12);

  }
  else
  {
    -[DMFBatchRequestOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)activityTransactionOperationDidStart:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__DMFBatchRequestOperation_activityTransactionOperationDidStart___block_invoke;
  v17[3] = &unk_1E6ED7D40;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DMFBatchRequestOperation subOperations](self, "subOperations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addDependency:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  -[DMFBatchRequestOperation queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v4);

  -[DMFBatchRequestOperation queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFBatchRequestOperation subOperations](self, "subOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperations:waitUntilFinished:", v12, 0);

}

void __65__DMFBatchRequestOperation_activityTransactionOperationDidStart___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityTransactionOperation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

}

- (void)activityTransactionOperationDidFinish:(id)a3
{
  -[DMFBatchRequestOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CATRemoteTaskOperation)activityTransactionOperation
{
  return self->_activityTransactionOperation;
}

- (void)setActivityTransactionOperation:(id)a3
{
  objc_storeStrong((id *)&self->_activityTransactionOperation, a3);
}

- (NSArray)subOperations
{
  return self->_subOperations;
}

- (void)setSubOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_activityTransactionOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
