@implementation CATDispatchTimer

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
  v3.receiver = self;
  v3.super_class = (Class)CATDispatchTimer;
  -[CATDispatchTimer dealloc](&v3, sel_dealloc);
}

- (CATDispatchTimer)initWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  CATDispatchTimer *v20;
  uint64_t v21;
  NSString *mIdentifier;
  uint64_t v23;
  id mFireHandler;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)CATDispatchTimer;
  v20 = -[CATDispatchTimer init](&v26, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    mIdentifier = v20->mIdentifier;
    v20->mIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->mWorkQueue, a4);
    objc_storeStrong((id *)&v20->mDelegateQueue, a5);
    v20->mTimeInterval = a6;
    v20->mTotalFires = a7;
    v20->mFiresForever = a8;
    v23 = MEMORY[0x20BD10A78](v19);
    mFireHandler = v20->mFireHandler;
    v20->mFireHandler = (id)v23;

  }
  return v20;
}

+ (id)scheduledTimerWithIdentifier:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 timeInterval:(double)a6 totalFires:(unint64_t)a7 firesForever:(BOOL)a8 fireHandler:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v9 = a8;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:", v19, v18, v17, a7, v9, v16, a6);

  objc_msgSend(v20, "resume");
  return v20;
}

- (void)resume
{
  OS_dispatch_source *v3;
  OS_dispatch_source *mTimerSource;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->mWorkQueue);
  mTimerSource = self->mTimerSource;
  self->mTimerSource = v3;

  v5 = self->mTimerSource;
  v6 = dispatch_time(0, (uint64_t)(self->mTimeInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, (unint64_t)(self->mTimeInterval * 1000000000.0), 0);
  objc_initWeak(&location, self);
  v7 = self->mTimerSource;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__CATDispatchTimer_resume__block_invoke;
  v8[3] = &unk_24C1C58B0;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->mTimerSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__CATDispatchTimer_resume__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;
  intptr_t v3;
  dispatch_source_t *v4;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = dispatch_source_testcancel(WeakRetained[8]);
    v2 = v4;
    if (!v3)
    {
      -[dispatch_source_t timerDidFire](v4, "timerDidFire");
      v2 = v4;
    }
  }

}

- (void)timerDidFire
{
  void *v3;
  unint64_t v4;
  id mFireHandler;
  char v6;
  OS_dispatch_queue *mDelegateQueue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  char v14;
  _QWORD block[4];
  id v16;

  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  v3 = (void *)MEMORY[0x20BD10A78](self->mFireHandler);
  if (v3)
  {
    v4 = self->mFireCount + 1;
    self->mFireCount = v4;
    if (self->mFiresForever || v4 != self->mTotalFires)
    {
      v6 = 0;
    }
    else
    {
      dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
      mFireHandler = self->mFireHandler;
      self->mFireHandler = 0;

      v6 = 1;
    }
    mDelegateQueue = self->mDelegateQueue;
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __32__CATDispatchTimer_timerDidFire__block_invoke;
    v11[3] = &unk_24C1C6260;
    v11[4] = self;
    v12 = v3;
    v13 = v4;
    v14 = v6;
    v9 = v11;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_14;
    block[3] = &unk_24C1C5998;
    v16 = v9;
    v10 = mDelegateQueue;
    dispatch_async(v10, block);

  }
}

uint64_t __32__CATDispatchTimer_timerDidFire__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)invalidate
{
  uint64_t v3;
  OS_dispatch_queue *mWorkQueue;
  _QWORD *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  dispatch_source_cancel((dispatch_source_t)self->mTimerSource);
  v3 = MEMORY[0x24BDAC760];
  mWorkQueue = self->mWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__CATDispatchTimer_invalidate__block_invoke;
  v7[3] = &unk_24C1C5A60;
  v7[4] = self;
  v5 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_14;
  block[3] = &unk_24C1C5998;
  v9 = v5;
  v6 = mWorkQueue;
  dispatch_async(v6, block);

}

void __30__CATDispatchTimer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

- (void)reset
{
  uint64_t v2;
  OS_dispatch_queue *mWorkQueue;
  _QWORD *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  mWorkQueue = self->mWorkQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__CATDispatchTimer_reset__block_invoke;
  v6[3] = &unk_24C1C5A60;
  v6[4] = self;
  v4 = v6;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_14;
  block[3] = &unk_24C1C5998;
  v8 = v4;
  v5 = mWorkQueue;
  dispatch_async(v5, block);

}

uint64_t __25__CATDispatchTimer_reset__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong(&self->mFireHandler, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mIdentifier, 0);
}

@end
