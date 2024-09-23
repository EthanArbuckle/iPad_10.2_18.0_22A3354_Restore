@implementation CATSerialOperationEnqueuer

- (void)dealloc
{
  objc_super v3;

  if (self->mCurrentlyExecutingOperation)
    -[CATSerialOperationEnqueuer stopObservingOperation:](self, "stopObservingOperation:");
  v3.receiver = self;
  v3.super_class = (Class)CATSerialOperationEnqueuer;
  -[CATSerialOperationEnqueuer dealloc](&v3, sel_dealloc);
}

- (CATSerialOperationEnqueuer)initWithTargetOperationQueue:(id)a3
{
  id v5;
  CATSerialOperationEnqueuer *v6;
  CATSerialOperationEnqueuer *v7;
  uint64_t v8;
  NSMutableArray *mPendingOperations;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATSerialOperationEnqueuer;
  v6 = -[CATSerialOperationEnqueuer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTargetQueue, a3);
    v8 = objc_opt_new();
    mPendingOperations = v7->mPendingOperations;
    v7->mPendingOperations = (NSMutableArray *)v8;

    v7->mLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)addOperation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__CATSerialOperationEnqueuer_addOperation___block_invoke;
  v6[3] = &unk_24C1C5C00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CATSerialOperationEnqueuer performThreadSafeBlock:](self, "performThreadSafeBlock:", v6);

}

uint64_t __43__CATSerialOperationEnqueuer_addOperation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "enqueueNextOperation");
}

- (void)enqueueNextOperation
{
  NSOperation **p_mCurrentlyExecutingOperation;
  void *v4;
  void *v5;

  p_mCurrentlyExecutingOperation = &self->mCurrentlyExecutingOperation;
  if (!self->mCurrentlyExecutingOperation)
  {
    -[NSMutableArray cat_popFirstObject](self->mPendingOperations, "cat_popFirstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)p_mCurrentlyExecutingOperation, v4);
      objc_storeStrong(&self->mStrongSelf, self);
      -[NSOperationQueue addOperation:](self->mTargetQueue, "addOperation:", v5);
      -[CATSerialOperationEnqueuer startObservingOperation:](self, "startObservingOperation:", v5);
      -[CATSerialOperationEnqueuer checkIfOperationIsFinished:](self, "checkIfOperationIsFinished:", v5);
      v4 = v5;
    }

  }
}

- (void)checkIfOperationIsFinished:(id)a3
{
  NSOperation *v4;
  NSOperation *v5;
  _BOOL4 v6;
  NSOperation *mCurrentlyExecutingOperation;
  id mStrongSelf;
  NSOperation *v9;

  v4 = (NSOperation *)a3;
  v5 = v4;
  if (self->mCurrentlyExecutingOperation == v4)
  {
    v9 = v4;
    v6 = -[NSOperation isFinished](v4, "isFinished");
    v5 = v9;
    if (v6)
    {
      -[CATSerialOperationEnqueuer stopObservingOperation:](self, "stopObservingOperation:", v9);
      mCurrentlyExecutingOperation = self->mCurrentlyExecutingOperation;
      self->mCurrentlyExecutingOperation = 0;

      mStrongSelf = self->mStrongSelf;
      self->mStrongSelf = 0;

      -[CATSerialOperationEnqueuer enqueueNextOperation](self, "enqueueNextOperation");
      v5 = v9;
    }
  }

}

- (void)performThreadSafeBlock:(id)a3
{
  os_unfair_lock_s *p_mLock;
  void (**v4)(_QWORD);

  p_mLock = &self->mLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_mLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_mLock);
}

- (void)startObservingOperation:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 0, CFSTR("CATSerialOperationEnqueuerObservationContext"));
}

- (void)stopObservingOperation:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), CFSTR("CATSerialOperationEnqueuerObservationContext"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  objc_super v22;

  v10 = a4;
  v11 = v10;
  if (a6 == CFSTR("CATSerialOperationEnqueuerObservationContext"))
  {
    v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATSerialOperationEnqueuer observeValueForKeyPath:ofObject:change:context:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("CATSerialOperationEnqueuer.m"), 142, CFSTR("expected %@, got %@"), v17, v19);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __77__CATSerialOperationEnqueuer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20[3] = &unk_24C1C5C00;
    v20[4] = self;
    v21 = v12;
    v13 = v12;
    -[CATSerialOperationEnqueuer performThreadSafeBlock:](self, "performThreadSafeBlock:", v20);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CATSerialOperationEnqueuer;
    -[CATSerialOperationEnqueuer observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

uint64_t __77__CATSerialOperationEnqueuer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkIfOperationIsFinished:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mPendingOperations, 0);
  objc_storeStrong((id *)&self->mCurrentlyExecutingOperation, 0);
  objc_storeStrong((id *)&self->mTargetQueue, 0);
}

@end
