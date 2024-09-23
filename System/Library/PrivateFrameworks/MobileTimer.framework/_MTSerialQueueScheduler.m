@implementation _MTSerialQueueScheduler

- (_MTSerialQueueScheduler)initWithQueue:(id)a3
{
  id v5;
  _MTSerialQueueScheduler *v6;
  _MTSerialQueueScheduler *v7;
  uint64_t v8;
  NAScheduler *internalScheduler;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MTSerialQueueScheduler;
  v6 = -[_MTSerialQueueScheduler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalQueue, a3);
    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    internalScheduler = v7->_internalScheduler;
    v7->_internalScheduler = (NAScheduler *)v8;

  }
  return v7;
}

- (void)performBlock:(id)a3
{
  -[NAScheduler performBlock:](self->_internalScheduler, "performBlock:", a3);
}

- (void)performSyncBlock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, a3);
}

- (id)performCancelableBlock:(id)a3
{
  return (id)-[NAScheduler performCancelableBlock:](self->_internalScheduler, "performCancelableBlock:", a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return (id)-[NAScheduler afterDelay:performBlock:](self->_internalScheduler, "afterDelay:performBlock:", a4, a3);
}

- (NAScheduler)internalScheduler
{
  return self->_internalScheduler;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_internalScheduler, 0);
}

@end
