@implementation _NALazyFuture

- (_NALazyFuture)initWithBlock:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  _NALazyFuture *v8;
  _NALazyFuture *v9;
  void *v10;
  dispatch_queue_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_NALazyFuture;
  v8 = -[NAFuture init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_NALazyFuture setBlock:](v8, "setBlock:", v6);
    if (v7)
    {
      -[_NALazyFuture setScheduler:](v9, "setScheduler:", v7);
    }
    else
    {
      +[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NALazyFuture setScheduler:](v9, "setScheduler:", v10);

    }
    v11 = dispatch_queue_create("com.apple.NetAppsUtilities.LazyFutureAccessQueue", 0);
    -[_NALazyFuture setAccessQueue:](v9, "setAccessQueue:", v11);

  }
  return v9;
}

- (void)willAddCompletionBlock
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[_NALazyFuture accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___NALazyFuture_willAddCompletionBlock__block_invoke;
  block[3] = &unk_1E6227D40;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v9 + 24))
  {
    -[_NALazyFuture scheduler](self, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __39___NALazyFuture_willAddCompletionBlock__block_invoke_2;
    v6[3] = &unk_1E6227D68;
    v6[4] = self;
    objc_msgSend(v5, "performBlock:", v6);

  }
  _Block_object_dispose(&v8, 8);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
