@implementation AVOperationQueueWithFundamentalDependency

- (AVOperationQueueWithFundamentalDependency)initWithFundamentalOperation:(id)a3
{
  AVOperationQueueWithFundamentalDependency *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  v4 = -[AVOperationQueueWithFundamentalDependency init](&v7, sel_init);
  if (v4)
  {
    v4->_fundamentalOperation = (NSOperation *)a3;
    if (a3)
    {
      v6.receiver = v4;
      v6.super_class = (Class)AVOperationQueueWithFundamentalDependency;
      -[AVOperationQueueWithFundamentalDependency addOperation:](&v6, sel_addOperation_, a3);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  -[AVOperationQueueWithFundamentalDependency dealloc](&v3, sel_dealloc);
}

- (void)addOperation:(id)a3
{
  objc_super v5;

  if (self->_fundamentalOperation)
    objc_msgSend(a3, "addDependency:");
  v5.receiver = self;
  v5.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  -[AVOperationQueueWithFundamentalDependency addOperation:](&v5, sel_addOperation_, a3);
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  if (self->_fundamentalOperation)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(a3);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "addDependency:", self->_fundamentalOperation);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVOperationQueueWithFundamentalDependency;
  -[AVOperationQueueWithFundamentalDependency addOperations:waitUntilFinished:](&v11, sel_addOperations_waitUntilFinished_, a3, v4);
}

@end
