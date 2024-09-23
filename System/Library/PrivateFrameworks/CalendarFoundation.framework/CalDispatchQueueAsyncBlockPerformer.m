@implementation CalDispatchQueueAsyncBlockPerformer

- (CalDispatchQueueAsyncBlockPerformer)initWithQueue:(id)a3
{
  id v6;
  CalDispatchQueueAsyncBlockPerformer *v7;
  CalDispatchQueueAsyncBlockPerformer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDispatchQueueAsyncBlockPerformer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CalDispatchQueueAsyncBlockPerformer;
  v7 = -[CalDispatchQueueAsyncBlockPerformer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_queue, a3);

  return v8;
}

- (id)performAsync:(id)a3
{
  id v4;
  CalCancelableDispatchBlock *v5;
  void *v6;
  CalCancelableDispatchBlock *v7;

  v4 = a3;
  v5 = [CalCancelableDispatchBlock alloc];
  -[CalDispatchQueueAsyncBlockPerformer queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CalCancelableDispatchBlock initWithBlock:inQueue:](v5, "initWithBlock:inQueue:", v4, v6);

  -[CalCancelableDispatchBlock performAsync](v7, "performAsync");
  return v7;
}

- (id)performAfterDelay:(double)a3 block:(id)a4
{
  id v6;
  CalCancelableDispatchBlock *v7;
  void *v8;
  CalCancelableDispatchBlock *v9;

  v6 = a4;
  v7 = [CalCancelableDispatchBlock alloc];
  -[CalDispatchQueueAsyncBlockPerformer queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CalCancelableDispatchBlock initWithBlock:inQueue:](v7, "initWithBlock:inQueue:", v6, v8);

  -[CalCancelableDispatchBlock performAfterDelay:](v9, "performAfterDelay:", a3);
  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
