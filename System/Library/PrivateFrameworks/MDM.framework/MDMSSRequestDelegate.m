@implementation MDMSSRequestDelegate

- (MDMSSRequestDelegate)initWithRequest:(id)a3
{
  id v5;
  MDMSSRequestDelegate *v6;
  MDMSSRequestDelegate *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSTimer *timeoutTimer;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MDMSSRequestDelegate;
  v6 = -[MDMSSRequestDelegate init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
      -[MDMSSRequestDelegate initWithRequest:].cold.1();
    objc_storeStrong((id *)&v6->_request, a3);
    -[SSRequest setDelegate:](v7->_request, "setDelegate:", v7);
    v8 = objc_alloc(MEMORY[0x24BDBCF40]);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = objc_msgSend(v8, "initWithFireDate:interval:target:selector:userInfo:repeats:", v9, v7, sel__timerDidFire_, v7, 1);
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (NSTimer *)v11;

    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTimer:forMode:", v7->_timeoutTimer, *MEMORY[0x24BDBCB80]);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MDMSSRequestDelegate;
  -[MDMSSRequestDelegate dealloc](&v3, sel_dealloc);
}

- (void)_startTimeout:(double)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  double v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke;
  v8[3] = &unk_24EB69178;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  _performBlockOnMainThread(v8);

}

void __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v15 = v4;
    v16 = 2048;
    v17 = v5;
    v6 = v4;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Request starting. Timeout: %.1f seconds", buf, 0x16u);

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_cold_1();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_2;
  v12[3] = &unk_24EB68318;
  v13 = *(id *)(a1 + 40);
  v7 = MEMORY[0x22767CBAC](v12);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFireDate:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start");
}

uint64_t __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__MDMSSRequestDelegate_cancel__block_invoke;
  v2[3] = &unk_24EB68230;
  v2[4] = self;
  _performBlockOnMainThread(v2);
}

uint64_t __30__MDMSSRequestDelegate_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling request...", (uint8_t *)&v9, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 16))
    __30__MDMSSRequestDelegate_cancel__block_invoke_cold_1();
  v6 = *(void **)(v5 + 24);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFireDate:", v7);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancel");
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSTimer *timeoutTimer;
  void *v10;
  void *v11;
  id completionBlock;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v5;
    v8 = v18;
    _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Request failed. Error: %{public}@", buf, 0x16u);

  }
  timeoutTimer = self->_timeoutTimer;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimer setFireDate:](timeoutTimer, "setFireDate:", v10);

  v11 = (void *)MEMORY[0x22767CBAC](self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__MDMSSRequestDelegate_request_didFailWithError___block_invoke;
    v14[3] = &unk_24EB67F18;
    v16 = v11;
    v15 = v5;
    dispatch_async(v13, v14);

  }
}

uint64_t __49__MDMSSRequestDelegate_request_didFailWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)requestDidFinish:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSTimer *timeoutTimer;
  void *v8;
  void *v9;
  id completionBlock;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v6 = v15;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed.", buf, 0xCu);

  }
  timeoutTimer = self->_timeoutTimer;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimer setFireDate:](timeoutTimer, "setFireDate:", v8);

  v9 = (void *)MEMORY[0x22767CBAC](self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__MDMSSRequestDelegate_requestDidFinish___block_invoke;
    block[3] = &unk_24EB693E0;
    v13 = v9;
    dispatch_async(v11, block);

  }
}

uint64_t __41__MDMSSRequestDelegate_requestDidFinish___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_timerDidFire:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id completionBlock;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v18 = (id)objc_opt_class();
    v6 = v18;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Request timed out. Canceling.", buf, 0xCu);

  }
  -[MDMSSRequestDelegate cancel](self, "cancel");
  v7 = (void *)MEMORY[0x22767CBAC](self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BE2A6C0];
  DMCErrorArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 30001, v11, *MEMORY[0x24BE2A588], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__MDMSSRequestDelegate__timerDidFire___block_invoke;
    block[3] = &unk_24EB67F18;
    v16 = v7;
    v15 = v12;
    dispatch_async(v13, block);

  }
}

uint64_t __38__MDMSSRequestDelegate__timerDidFire___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (SSRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)initWithRequest:.cold.1()
{
  __assert_rtn("-[MDMSSRequestDelegate initWithRequest:]", "MDMSSRequestDelegate.m", 41, "request");
}

void __54__MDMSSRequestDelegate__startTimeout_completionBlock___block_invoke_cold_1()
{
  __assert_rtn("-[MDMSSRequestDelegate _startTimeout:completionBlock:]_block_invoke", "MDMSSRequestDelegate.m", 64, "!self->_completionBlock");
}

void __30__MDMSSRequestDelegate_cancel__block_invoke_cold_1()
{
  __assert_rtn("-[MDMSSRequestDelegate cancel]_block_invoke", "MDMSSRequestDelegate.m", 79, "self->_completionBlock");
}

@end
