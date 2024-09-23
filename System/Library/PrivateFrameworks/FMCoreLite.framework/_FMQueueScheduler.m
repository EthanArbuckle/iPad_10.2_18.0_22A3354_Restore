@implementation _FMQueueScheduler

- (_FMQueueScheduler)initWithQueue:(id)a3
{
  id v5;
  _FMQueueScheduler *v6;
  _FMQueueScheduler *v7;
  _FMQueueScheduler *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_FMQueueScheduler;
  v6 = -[_FMQueueScheduler init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)performBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_FMQueueScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  FMCancelationToken *v5;
  NSObject *v6;
  FMCancelationToken *v7;
  id v8;
  void *v9;
  FMCancelationToken *v10;
  _QWORD v12[4];
  FMCancelationToken *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(FMCancelationToken);
  -[_FMQueueScheduler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44___FMQueueScheduler_performCancelableBlock___block_invoke;
  v12[3] = &unk_1E5E0DF08;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_async(v6, v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  FMCancelationToken *v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD handler[4];
  NSObject *v19;
  id v20;

  v6 = a4;
  -[_FMQueueScheduler queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);

  if (a3 <= 1.84467441e10)
    v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  else
    v9 = -1;
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  v10 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45___FMQueueScheduler_afterDelay_performBlock___block_invoke;
  handler[3] = &unk_1E5E0E400;
  v20 = v6;
  v11 = v8;
  v19 = v11;
  v12 = v6;
  dispatch_source_set_event_handler(v11, handler);
  v13 = objc_alloc_init(FMCancelationToken);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __45___FMQueueScheduler_afterDelay_performBlock___block_invoke_2;
  v16[3] = &unk_1E5E0DE90;
  v17 = v11;
  v14 = v11;
  -[FMCancelationToken addCancelationBlock:](v13, "addCancelationBlock:", v16);
  dispatch_resume(v14);

  return v13;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
