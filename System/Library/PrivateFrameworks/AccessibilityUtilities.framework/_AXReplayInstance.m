@implementation _AXReplayInstance

+ (id)replayBlock:(id)a3 name:(id)a4 attempts:(int64_t)a5 interval:(double)a6 async:(BOOL)a7 queue:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  _AXReplayInstance *v19;
  void *v20;

  v10 = a7;
  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(_AXReplayInstance);
  -[_AXReplayInstance setName:](v19, "setName:", v17);

  -[_AXReplayInstance setReplayBlock:](v19, "setReplayBlock:", v18);
  -[_AXReplayInstance setCompletionBlock:](v19, "setCompletionBlock:", v15);

  -[_AXReplayInstance setAttemptsRemaining:](v19, "setAttemptsRemaining:", a5);
  -[_AXReplayInstance setMaxAttempts:](v19, "setMaxAttempts:", a5);
  -[_AXReplayInstance setInterval:](v19, "setInterval:", a6);
  -[_AXReplayInstance setAsync:](v19, "setAsync:", v10);
  -[_AXReplayInstance setQueue:](v19, "setQueue:", v16);

  -[_AXReplayInstance queue](v19, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    -[_AXReplayInstance setQueue:](v19, "setQueue:", MEMORY[0x1E0C80D38]);
  return v19;
}

- (void)dispatch
{
  NSObject *v3;
  _QWORD block[5];

  if (-[_AXReplayInstance async](self, "async"))
  {
    -[_AXReplayInstance queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29___AXReplayInstance_dispatch__block_invoke;
    block[3] = &unk_1E24C4C38;
    block[4] = self;
    dispatch_async(v3, block);

  }
  else
  {
    -[_AXReplayInstance _dispatchSynchronously](self, "_dispatchSynchronously");
  }
}

- (void)_dispatchSynchronously
{
  int64_t attemptsRemaining;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  int v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL8 didSucceed;
  void *v16;
  id v17;
  id v18;

  attemptsRemaining = self->_attemptsRemaining;
  if (attemptsRemaining >= 1)
  {
    do
    {
      self->_attemptsRemaining = attemptsRemaining - 1;
      -[_AXReplayInstance replayBlock](self, "replayBlock");
      v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = 0;
      v5 = ((uint64_t (**)(_QWORD, id *, id *))v4)[2](v4, &v18, &v17);
      v6 = v18;
      v7 = v17;

      -[_AXReplayInstance setUnderlyingResult:](self, "setUnderlyingResult:", v6);
      -[_AXReplayInstance setUnderlyingError:](self, "setUnderlyingError:", v7);
      if (v5)
      {
        self->_didSucceed = 1;

      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3978];
        -[_AXReplayInstance interval](self, "interval");
        v10 = v9;

        objc_msgSend(v8, "sleepForTimeInterval:", v10);
      }

      attemptsRemaining = self->_attemptsRemaining;
    }
    while (attemptsRemaining > 0);
  }
  if (self->_didSucceed)
  {
    v11 = 0;
  }
  else
  {
    -[_AXReplayInstance underlyingError](self, "underlyingError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[_AXReplayInstance underlyingError](self, "underlyingError");
    else
      -[_AXReplayInstance _genericFailError](self, "_genericFailError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_AXReplayInstance completionBlock](self, "completionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_AXReplayInstance completionBlock](self, "completionBlock");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    didSucceed = self->_didSucceed;
    -[_AXReplayInstance underlyingResult](self, "underlyingResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, void *, void *))v14)[2](v14, didSucceed, v16, v11);

  }
}

- (void)_dispatchAsynchronously
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  char v4;
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  double v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL8 didSucceed;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;

  --self->_attemptsRemaining;
  -[_AXReplayInstance replayBlock](self, "replayBlock");
  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  v4 = ((uint64_t (**)(_QWORD, id *, id *))v3)[2](v3, &v20, &v19);
  v5 = v20;
  v6 = v19;
  self->_didSucceed = v4;

  -[_AXReplayInstance setUnderlyingError:](self, "setUnderlyingError:", v6);
  -[_AXReplayInstance setUnderlyingResult:](self, "setUnderlyingResult:", v5);
  if (!self->_didSucceed)
  {
    if (self->_attemptsRemaining >= 1)
    {
      -[_AXReplayInstance interval](self, "interval");
      v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      -[_AXReplayInstance queue](self, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44___AXReplayInstance__dispatchAsynchronously__block_invoke;
      block[3] = &unk_1E24C4C38;
      block[4] = self;
      dispatch_after(v11, v12, block);

      goto LABEL_7;
    }
    -[_AXReplayInstance underlyingError](self, "underlyingError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[_AXReplayInstance underlyingError](self, "underlyingError");
    else
      -[_AXReplayInstance _genericFailError](self, "_genericFailError");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[_AXReplayInstance completionBlock](self, "completionBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_AXReplayInstance completionBlock](self, "completionBlock");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      didSucceed = self->_didSucceed;
      -[_AXReplayInstance underlyingResult](self, "underlyingResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BOOL8, void *, _QWORD))v15)[2](v15, didSucceed, v17, v8);

    }
    goto LABEL_4;
  }
  -[_AXReplayInstance completionBlock](self, "completionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_AXReplayInstance completionBlock](self, "completionBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[_AXReplayInstance underlyingResult](self, "underlyingResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *, _QWORD))v8)[2](v8, 1, v9, 0);

LABEL_4:
  }
LABEL_7:

}

- (id)_genericFailError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  -[_AXReplayInstance name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_errorWithDomain:description:", CFSTR("AXReplayer"), CFSTR("Exhausted retry attempts for block: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)replayBlock
{
  return self->_replayBlock;
}

- (void)setReplayBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(int64_t)a3
{
  self->_maxAttempts = a3;
}

- (int64_t)attemptsRemaining
{
  return self->_attemptsRemaining;
}

- (void)setAttemptsRemaining:(int64_t)a3
{
  self->_attemptsRemaining = a3;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (id)underlyingResult
{
  return self->_underlyingResult;
}

- (void)setUnderlyingResult:(id)a3
{
  objc_storeStrong(&self->_underlyingResult, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_underlyingResult, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_replayBlock, 0);
}

@end
