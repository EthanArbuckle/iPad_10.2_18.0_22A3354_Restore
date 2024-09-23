@implementation DCSelectorDelayer

- (DCSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  DCSelectorDelayer *v13;
  DCSelectorDelayer *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  objc_super v18;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DCSelectorDelayer;
  v13 = -[DCSelectorDelayer init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    -[DCSelectorDelayer setTarget:](v13, "setTarget:", v12);
    -[DCSelectorDelayer setSelector:](v14, "setSelector:", a4);
    -[DCSelectorDelayer setDelay:](v14, "setDelay:", a5);
    -[DCSelectorDelayer setWaitToFireUntilRequestsStop:](v14, "setWaitToFireUntilRequestsStop:", v8);
    -[DCSelectorDelayer setCallOnMainThread:](v14, "setCallOnMainThread:", v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.notes.coalescer.requests", v15);
    -[DCSelectorDelayer setRequestQueue:](v14, "setRequestQueue:", v16);

  }
  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[DCSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__DCSelectorDelayer_dealloc__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)DCSelectorDelayer;
  -[DCSelectorDelayer dealloc](&v4, sel_dealloc);
}

uint64_t __28__DCSelectorDelayer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

- (void)requestFire
{
  NSObject *v3;
  _QWORD block[5];

  -[DCSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__DCSelectorDelayer_requestFire__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __32__DCSelectorDelayer_requestFire__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  dispatch_block_t v5;
  NSObject *v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v2 = objc_msgSend(*(id *)(a1 + 32), "waitToFireUntilRequestsStop");
  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
  }
  else
  {

    if (v4)
      return;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __32__DCSelectorDelayer_requestFire__block_invoke_2;
  v14 = &unk_24C5B7CE0;
  objc_copyWeak(&v15, &location);
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &v11);
  objc_msgSend(*(id *)(a1 + 32), "setFireBlock:", v5, v11, v12, v13, v14);

  if (objc_msgSend(*(id *)(a1 + 32), "callOnMainThread"))
  {
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC9B8];
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "delay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v9, v6, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __32__DCSelectorDelayer_requestFire__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "requestQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__DCSelectorDelayer_requestFire__block_invoke_3;
    block[3] = &unk_24C5B7AE0;
    v3 = v4;
    v6 = v3;
    dispatch_sync(v2, block);

    objc_msgSend(v3, "callTargetSelector");
    WeakRetained = v4;
  }

}

uint64_t __32__DCSelectorDelayer_requestFire__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFireBlock:", 0);
}

- (void)fireImmediately
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  -[DCSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DCSelectorDelayer_fireImmediately__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_sync(v3, block);

  if (-[DCSelectorDelayer callOnMainThread](self, "callOnMainThread"))
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __36__DCSelectorDelayer_fireImmediately__block_invoke_2;
    v5[3] = &unk_24C5B7AE0;
    v5[4] = self;
    dc_performBlockOnMainThread(v5);
  }
  else
  {
    -[DCSelectorDelayer callTargetSelector](self, "callTargetSelector");
  }
}

uint64_t __36__DCSelectorDelayer_fireImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

uint64_t __36__DCSelectorDelayer_fireImmediately__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callTargetSelector");
}

- (void)callTargetSelector
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "imp";
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

- (BOOL)isScheduledToFire
{
  DCSelectorDelayer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[DCSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__DCSelectorDelayer_isScheduledToFire__block_invoke;
  v5[3] = &unk_24C5B7F00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__DCSelectorDelayer_isScheduledToFire__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)cancelPreviousFireRequests
{
  NSObject *v3;
  _QWORD block[5];

  -[DCSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DCSelectorDelayer_cancelPreviousFireRequests__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __47__DCSelectorDelayer_cancelPreviousFireRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

- (void)_cancelFireRequests
{
  void *v3;
  void *v4;

  -[DCSelectorDelayer fireBlock](self, "fireBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DCSelectorDelayer fireBlock](self, "fireBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

    -[DCSelectorDelayer setFireBlock:](self, "setFireBlock:", 0);
  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_destroyWeak(&self->_target);
}

@end
