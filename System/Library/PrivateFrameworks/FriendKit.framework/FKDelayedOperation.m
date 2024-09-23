@implementation FKDelayedOperation

- (FKDelayedOperation)initWithQueue:(id)a3 delay:(double)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FKDelayedOperation;
  v11 = -[FKDelayedOperation init](&v20, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x212BE4EE8](v10);
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    objc_storeStrong((id *)v11 + 2, a3);
    *((_QWORD *)v11 + 4) = 0;
    v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v11 + 2));
    v15 = (void *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = v14;

    *((double *)v11 + 6) = a4;
    v16 = *((_QWORD *)v11 + 5);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __48__FKDelayedOperation_initWithQueue_delay_block___block_invoke;
    handler[3] = &unk_24CCDFA48;
    v19 = v11;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume(*((dispatch_object_t *)v11 + 5));

  }
  return (FKDelayedOperation *)v11;
}

uint64_t __48__FKDelayedOperation_initWithQueue_delay_block___block_invoke(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(*(_QWORD *)(result + 32) + 24);
  while (1)
  {
    v2 = __ldxr(v1);
    if (v2 != 1)
      break;
    if (!__stxr(0, v1))
      return objc_msgSend(*(id *)(result + 32), "_queue_executeBlock");
  }
  __clrex();
  return result;
}

- (void)execute
{
  CFAbsoluteTime v3;
  NSObject *queue;
  int *p_blockEnqueued;
  NSObject *timerSource;
  dispatch_time_t v8;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_lastExecution + self->_delay;
  if (v3 >= CFAbsoluteTimeGetCurrent())
  {
    p_blockEnqueued = &self->_blockEnqueued;
    while (!__ldxr((unsigned int *)p_blockEnqueued))
    {
      if (!__stxr(1u, (unsigned int *)p_blockEnqueued))
      {
        timerSource = self->_timerSource;
        v8 = dispatch_walltime(0, (uint64_t)(self->_delay * 1000000000.0));
        dispatch_source_set_timer(timerSource, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
        return;
      }
    }
    __clrex();
  }
  else
  {
    -[FKDelayedOperation _queue_updateLastExecution](self, "_queue_updateLastExecution");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__FKDelayedOperation_execute__block_invoke;
    block[3] = &unk_24CCDFA48;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __29__FKDelayedOperation_execute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_executeBlock");
}

- (void)invalidate
{
  OS_dispatch_source *timerSource;
  NSObject *queue;
  _QWORD block[5];

  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  timerSource = self->_timerSource;
  self->_timerSource = 0;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__FKDelayedOperation_invalidate__block_invoke;
  block[3] = &unk_24CCDFA48;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__FKDelayedOperation_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)_queue_executeBlock
{
  void (**block)(void);

  -[FKDelayedOperation _queue_updateLastExecution](self, "_queue_updateLastExecution");
  block = (void (**)(void))self->_block;
  if (block)
    block[2]();
}

- (void)_queue_updateLastExecution
{
  self->_lastExecution = CFAbsoluteTimeGetCurrent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
