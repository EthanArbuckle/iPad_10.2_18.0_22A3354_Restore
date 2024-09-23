@implementation ULQueueScheduler

- (ULQueueScheduler)initWithQueue:(id)a3
{
  id v4;
  ULQueueScheduler *v5;
  ULQueueScheduler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULQueueScheduler;
  v5 = -[ULQueueScheduler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULQueueScheduler setQueue:](v5, "setQueue:", v4);

  return v6;
}

- (void)performAsyncBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[ULQueueScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ULQueueScheduler_performAsyncBlock___block_invoke;
  block[3] = &unk_2511EF440;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __38__ULQueueScheduler_performAsyncBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performSyncBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[ULQueueScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ULQueueScheduler_performSyncBlock___block_invoke;
  block[3] = &unk_2511EF440;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __37__ULQueueScheduler_performSyncBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
