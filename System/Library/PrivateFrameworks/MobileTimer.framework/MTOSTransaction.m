@implementation MTOSTransaction

+ (id)transactionWithDescription:(id)a3
{
  return (id)objc_msgSend(a1, "transactionWithDescription:timeout:", a3, 5.0);
}

+ (id)transactionWithDescription:(id)a3 timeout:(double)a4
{
  return (id)objc_msgSend(a1, "transactionWithDescription:timeout:timeoutBlock:", a3, &__block_literal_global_20, a4);
}

+ (id)transactionWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDescription:timeout:timeoutBlock:", v8, v7, a4);

  return v9;
}

- (MTOSTransaction)initWithDescription:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_source_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD handler[4];
  id v22;
  id v23;
  id location;
  objc_super v25;

  v8 = a3;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MTOSTransaction;
  v10 = -[MTOSTransaction init](&v25, sel_init);
  if (v10)
  {
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v11 = os_transaction_create();
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    v13 = dispatch_queue_create("com.apple.MTOSTransaction.serial", 0);
    v14 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v13;

    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v10 + 3));
    v16 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v15;

    objc_initWeak(&location, v10);
    v17 = *((_QWORD *)v10 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__MTOSTransaction_initWithDescription_timeout_timeoutBlock___block_invoke;
    handler[3] = &unk_1E39CD018;
    objc_copyWeak(&v23, &location);
    v22 = v9;
    dispatch_source_set_event_handler(v17, handler);
    v18 = *((_QWORD *)v10 + 2);
    v19 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v10 + 2));

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return (MTOSTransaction *)v10;
}

void __60__MTOSTransaction_initWithDescription_timeout_timeoutBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "transaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    objc_msgSend(WeakRetained, "_cancel");
  }

}

- (void)end
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MTOSTransaction_end__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __22__MTOSTransaction_end__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_cancel
{
  NSObject *timer;
  OS_os_transaction *transaction;
  OS_dispatch_source *v5;

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  transaction = self->_transaction;
  self->_transaction = 0;

  v5 = self->_timer;
  self->_timer = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MTOSTransaction _cancel](self, "_cancel");
  v3.receiver = self;
  v3.super_class = (Class)MTOSTransaction;
  -[MTOSTransaction dealloc](&v3, sel_dealloc);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
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
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
