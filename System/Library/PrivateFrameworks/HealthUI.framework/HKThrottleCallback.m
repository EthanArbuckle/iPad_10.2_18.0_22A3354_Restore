@implementation HKThrottleCallback

- (HKThrottleCallback)initWithThrottleDelay:(double)a3
{
  HKThrottleCallback *v4;
  HKThrottleCallback *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKThrottleCallback;
  v4 = -[HKThrottleCallback init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[HKThrottleCallback setThrottleDelayInNanoseconds:](v4, "setThrottleDelayInNanoseconds:", (uint64_t)(a3 / 0.000000001));
    v6 = dispatch_queue_create("HKThrottleCallback", 0);
    -[HKThrottleCallback setThrottlingQueue:](v5, "setThrottlingQueue:", v6);

    -[HKThrottleCallback setDelayInProgress:](v5, "setDelayInProgress:", 0);
    -[HKThrottleCallback setLastExecutionBlock:](v5, "setLastExecutionBlock:", 0);
  }
  return v5;
}

- (void)setThrottlingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_throttlingQueue, a3);
}

- (void)setThrottleDelayInNanoseconds:(int64_t)a3
{
  self->_throttleDelayInNanoseconds = a3;
}

- (void)setLastExecutionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDelayInProgress:(BOOL)a3
{
  self->_delayInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastExecutionBlock, 0);
  objc_storeStrong((id *)&self->_throttlingQueue, 0);
}

- (void)executeWithThrottle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKThrottleCallback throttlingQueue](self, "throttlingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HKThrottleCallback_executeWithThrottle___block_invoke;
  v7[3] = &unk_1E9C40068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__HKThrottleCallback_executeWithThrottle___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "throttleDelayInNanoseconds") < 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "delayInProgress");
    v3 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLastExecutionBlock:", v3);
    }
    else
    {
      (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setDelayInProgress:", 1);
      v4 = dispatch_time(0xFFFFFFFFFFFFFFFELL, objc_msgSend(*(id *)(a1 + 32), "throttleDelayInNanoseconds"));
      objc_msgSend(*(id *)(a1 + 32), "throttlingQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__HKThrottleCallback_executeWithThrottle___block_invoke_2;
      block[3] = &unk_1E9C3F0D0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v4, v5, block);

    }
  }
}

uint64_t __42__HKThrottleCallback_executeWithThrottle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "lastExecutionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastExecutionBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setLastExecutionBlock:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setDelayInProgress:", 0);
}

- (int64_t)throttleDelayInNanoseconds
{
  return self->_throttleDelayInNanoseconds;
}

- (OS_dispatch_queue)throttlingQueue
{
  return self->_throttlingQueue;
}

- (BOOL)delayInProgress
{
  return self->_delayInProgress;
}

- (id)lastExecutionBlock
{
  return self->_lastExecutionBlock;
}

@end
