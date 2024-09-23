@implementation AMSUIWebFlowTimeout

- (AMSUIWebFlowTimeout)initWithTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  AMSUIWebFlowTimeout *v11;
  AMSUIWebFlowTimeout *v12;
  void *v13;
  id block;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebFlowTimeout;
  v11 = -[AMSUIWebFlowTimeout init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a3;
    v11->_timeRemaining = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = _Block_copy(v10);
    block = v12->_block;
    v12->_block = v13;

  }
  return v12;
}

+ (id)timeoutWithTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeout:queue:block:", v8, v7, a3);

  return v9;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSUIWebFlowTimeout queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__AMSUIWebFlowTimeout_start__block_invoke;
  v8[3] = &unk_24CB4F0E8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_24CB4F3C0;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

void __28__AMSUIWebFlowTimeout_start__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_block_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  double v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  _QWORD block[4];
  id v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "enqueuedBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = MEMORY[0x24BDAC760];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __28__AMSUIWebFlowTimeout_start__block_invoke_2;
    v20 = &unk_24CB4F800;
    objc_copyWeak(&v21, &location);
    v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, &v17);
    objc_msgSend(*(id *)(a1 + 32), "setEnqueuedBlock:", v4, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStartTime:", v5);

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeRemaining");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "enqueuedBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v11 = v9;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8 * 1000000000.0;
    if (v8 <= 0.01)
      v13 = 10000000.0;
    if (v13 <= 9.22337204e18)
      v14 = dispatch_time(0, (uint64_t)v13);
    else
      v14 = -1;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_0;
    block[3] = &unk_24CB4F3C0;
    v24 = v12;
    v25 = v11;
    v15 = v12;
    v16 = v11;
    dispatch_after(v14, v10, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __28__AMSUIWebFlowTimeout_start__block_invoke_2(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEnqueuedBlock:", 0);
  objc_msgSend(WeakRetained, "block");
  v1 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v1)[2](v1, WeakRetained);

}

- (void)pause
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSUIWebFlowTimeout queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__AMSUIWebFlowTimeout_pause__block_invoke;
  v8[3] = &unk_24CB4F0E8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_24CB4F3C0;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

void __28__AMSUIWebFlowTimeout_pause__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(*(id *)(a1 + 32), "enqueuedBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "enqueuedBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setEnqueuedBlock:", 0);
    objc_msgSend(*(id *)(a1 + 32), "timeRemaining");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    v9 = -v8;
    if (v8 >= 0.0)
      v9 = v8;
    v10 = v5 - v9;
    if (v10 < 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "timeout");
      if (v10 > v11)
        v10 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setTimeRemaining:", v10);
  }
}

- (void)reset
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[AMSUIWebFlowTimeout pause](self, "pause");
  -[AMSUIWebFlowTimeout queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__AMSUIWebFlowTimeout_reset__block_invoke;
  v8[3] = &unk_24CB4F0E8;
  v8[4] = self;
  v5 = v8;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_7;
  block[3] = &unk_24CB4F3C0;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

uint64_t __28__AMSUIWebFlowTimeout_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "timeout");
  return objc_msgSend(*(id *)(a1 + 32), "setTimeRemaining:");
}

- (id)enqueuedBlock
{
  return self->_enqueuedBlock;
}

- (void)setEnqueuedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_enqueuedBlock, 0);
}

@end
