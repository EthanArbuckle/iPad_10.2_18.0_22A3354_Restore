@implementation CalNWideQueue

- (CalNWideQueue)initWithSerialQueue:(id)a3 andWidth:(unint64_t)a4
{
  id v6;
  CalNWideQueue *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *semaphore;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalNWideQueue;
  v7 = -[CalNWideQueue init](&v13, sel_init);
  if (v7)
  {
    if (v6)
      v8 = (dispatch_queue_t)v6;
    else
      v8 = dispatch_queue_create("CalNWideQueue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_semaphore_create(a4);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v10;

  }
  return v7;
}

- (void)executeBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__CalNWideQueue_executeBlock___block_invoke;
  v7[3] = &unk_1E2A84490;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __30__CalNWideQueue_executeBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CalNWideQueue_executeBlock___block_invoke_2;
  v4[3] = &unk_1E2A84808;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

intptr_t __30__CalNWideQueue_executeBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
