@implementation ICSelectorDelayer

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 waitToFireUntilRequestsStop:(BOOL)a7 callOnMainThread:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  ICSelectorDelayer *v15;
  ICSelectorDelayer *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  objc_super v20;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSelectorDelayer;
  v15 = -[ICSelectorDelayer init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    -[ICSelectorDelayer setTarget:](v15, "setTarget:", v14);
    -[ICSelectorDelayer setSelector:](v16, "setSelector:", a4);
    -[ICSelectorDelayer setDelay:](v16, "setDelay:", a5);
    -[ICSelectorDelayer setMaximumDelay:](v16, "setMaximumDelay:", a6);
    -[ICSelectorDelayer setWaitToFireUntilRequestsStop:](v16, "setWaitToFireUntilRequestsStop:", v9);
    -[ICSelectorDelayer setCallOnMainThread:](v16, "setCallOnMainThread:", v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.notes.coalescer.requests", v17);
    -[ICSelectorDelayer setRequestQueue:](v16, "setRequestQueue:", v18);

  }
  return v16;
}

- (void)setMaximumDelay:(double)a3
{
  self->_maximumDelay = a3;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  return -[ICSelectorDelayer initWithTarget:selector:delay:maximumDelay:waitToFireUntilRequestsStop:callOnMainThread:](self, "initWithTarget:selector:delay:maximumDelay:waitToFireUntilRequestsStop:callOnMainThread:", a3, a4, a6, a7, a5, 0.0);
}

uint64_t __28__ICSelectorDelayer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 callOnMainThread:(BOOL)a7
{
  return -[ICSelectorDelayer initWithTarget:selector:delay:maximumDelay:waitToFireUntilRequestsStop:callOnMainThread:](self, "initWithTarget:selector:delay:maximumDelay:waitToFireUntilRequestsStop:callOnMainThread:", a3, a4, 1, a7, a5, a6);
}

void __38__ICSelectorDelayer_isScheduledToFire__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)_cancelFireRequests
{
  void *v3;
  void *v4;

  -[ICSelectorDelayer fireBlock](self, "fireBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSelectorDelayer fireBlock](self, "fireBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

    -[ICSelectorDelayer setFireBlock:](self, "setFireBlock:", 0);
  }
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (BOOL)isScheduledToFire
{
  ICSelectorDelayer *v2;
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
  -[ICSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__ICSelectorDelayer_isScheduledToFire__block_invoke;
  v5[3] = &unk_1EA823D70;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[ICSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ICSelectorDelayer_dealloc__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)ICSelectorDelayer;
  -[ICSelectorDelayer dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_requestFireDate, 0);
  objc_destroyWeak(&self->_target);
}

uint64_t __32__ICSelectorDelayer_requestFire__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFireBlock:", 0);
}

void __32__ICSelectorDelayer_requestFire__block_invoke_2(uint64_t a1)
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
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__ICSelectorDelayer_requestFire__block_invoke_3;
    block[3] = &unk_1EA823E80;
    v3 = v4;
    v6 = v3;
    dispatch_sync(v2, block);

    objc_msgSend(v3, "callTargetSelector");
    WeakRetained = v4;
  }

}

void __32__ICSelectorDelayer_requestFire__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  dispatch_block_t v16;
  NSObject *v17;
  id v18;
  double v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD block[4];
  id v24;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "requestFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestFireDate:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRequestFireDate:", v3);

  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "waitToFireUntilRequestsStop");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "maximumDelay");
    if (v6 == 0.0)
    {
      v12 = 0;
      v13 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "requestFireDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 32), "maximumDelay");
      v12 = v10 > v11;
      v13 = v10 <= v11;

    }
    objc_msgSend(*(id *)(a1 + 32), "fireBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
      if (v13)
        goto LABEL_12;
LABEL_18:
      if (!v12)
        return;
      goto LABEL_19;
    }
    if (!v13)
      goto LABEL_18;
  }
  else
  {
    objc_msgSend(v5, "fireBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      return;
    LOBYTE(v12) = 0;
  }
LABEL_12:
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICSelectorDelayer_requestFire__block_invoke_2;
  block[3] = &unk_1EA823F98;
  objc_copyWeak(&v24, &location);
  v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
  objc_msgSend(*(id *)(a1 + 32), "setFireBlock:", v16);

  if ((objc_msgSend(*(id *)(a1 + 32), "callOnMainThread") & 1) != 0)
  {
    v17 = MEMORY[0x1E0C80D38];
    v18 = MEMORY[0x1E0C80D38];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundQueue");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "delay");
  v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
  objc_msgSend(*(id *)(a1 + 32), "fireBlock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v20, v17, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  if (v12)
  {
LABEL_19:
    if (objc_msgSend(*(id *)(a1 + 32), "callOnMainThread"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __32__ICSelectorDelayer_requestFire__block_invoke_4;
      v22[3] = &unk_1EA823E80;
      v22[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v22);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "callTargetSelector");
    }
  }
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setRequestFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestFireDate, a3);
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)requestFire
{
  NSObject *v3;
  _QWORD block[5];

  -[ICSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICSelectorDelayer_requestFire__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSDate)requestFireDate
{
  return self->_requestFireDate;
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (double)delay
{
  return self->_delay;
}

- (void)callTargetSelector
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Could not get method for selector %@ on target %@", (uint8_t *)&v6, 0x16u);

}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (OS_dispatch_queue)backgroundQueue
{
  OS_dispatch_queue *backgroundQueue;
  OS_dispatch_queue *v3;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;

  backgroundQueue = self->_backgroundQueue;
  if (backgroundQueue)
  {
    v3 = backgroundQueue;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.selector-delayer-background", v6);
    v8 = self->_backgroundQueue;
    self->_backgroundQueue = v7;

    v3 = self->_backgroundQueue;
  }
  return v3;
}

uint64_t __32__ICSelectorDelayer_requestFire__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callTargetSelector");
}

- (void)fireImmediately
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  -[ICSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICSelectorDelayer_fireImmediately__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_sync(v3, block);

  if (-[ICSelectorDelayer callOnMainThread](self, "callOnMainThread")
    && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __36__ICSelectorDelayer_fireImmediately__block_invoke_2;
    v5[3] = &unk_1EA823E80;
    v5[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    -[ICSelectorDelayer callTargetSelector](self, "callTargetSelector");
  }
}

uint64_t __36__ICSelectorDelayer_fireImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

uint64_t __36__ICSelectorDelayer_fireImmediately__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callTargetSelector");
}

- (void)cancelPreviousFireRequests
{
  NSObject *v3;
  _QWORD block[5];

  -[ICSelectorDelayer requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICSelectorDelayer_cancelPreviousFireRequests__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __47__ICSelectorDelayer_cancelPreviousFireRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFireRequests");
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

@end
