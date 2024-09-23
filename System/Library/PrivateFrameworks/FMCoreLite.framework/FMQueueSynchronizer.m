@implementation FMQueueSynchronizer

- (FMQueueSynchronizer)initWithQueue:(id)a3
{
  NSObject *v5;
  FMQueueSynchronizer *v6;
  FMQueueSynchronizer *v7;
  _QWORD block[4];
  dispatch_queue_t v10;
  objc_super v11;

  v5 = a3;
  dispatch_assert_queue_not_V2(v5);
  v11.receiver = self;
  v11.super_class = (Class)FMQueueSynchronizer;
  v6 = -[FMQueueSynchronizer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__FMQueueSynchronizer_initWithQueue___block_invoke;
    block[3] = &unk_1E5E0DE90;
    v10 = v5;
    dispatch_sync(v10, block);

  }
  return v7;
}

void __37__FMQueueSynchronizer_initWithQueue___block_invoke(uint64_t a1)
{
  dispatch_queue_set_specific(*(dispatch_queue_t *)(a1 + 32), &QueueContextKey, &stru_1E5E0E900, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)conditionalSync:(id)a3
{
  NSObject *v4;
  void (**v5)(void);
  _QWORD block[4];
  void (**v7)(void);

  v5 = (void (**)(void))a3;
  if (dispatch_get_specific(&QueueContextKey))
  {
    v5[2]();
  }
  else
  {
    -[FMQueueSynchronizer queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FMQueueSynchronizer_conditionalSync___block_invoke;
    block[3] = &unk_1E5E0E0E8;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __39__FMQueueSynchronizer_conditionalSync___block_invoke(uint64_t a1)
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

@end
