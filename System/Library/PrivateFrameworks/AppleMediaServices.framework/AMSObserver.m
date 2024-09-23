@implementation AMSObserver

- (AMSObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSObserver *v11;
  uint64_t v12;
  id completionBlock;
  uint64_t v14;
  id failureBlock;
  uint64_t v16;
  id resultBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AMSObserver;
  v11 = -[AMSObserver init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    completionBlock = v11->_completionBlock;
    v11->_completionBlock = (id)v12;

    v14 = objc_msgSend(v10, "copy");
    failureBlock = v11->_failureBlock;
    v11->_failureBlock = (id)v14;

    v16 = objc_msgSend(v8, "copy");
    resultBlock = v11->_resultBlock;
    v11->_resultBlock = (id)v16;

  }
  return v11;
}

- (AMSObserver)initWithResultBlock:(id)a3
{
  return -[AMSObserver initWithResultBlock:completionBlock:failureBlock:](self, "initWithResultBlock:completionBlock:failureBlock:", a3, 0, 0);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)_sendCompletionUsingQueue:(id)a3
{
  NSObject *v4;
  AMSObserver *v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[AMSObserver completionBlock](v5, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AMSObserver_AMSObservable___sendCompletionUsingQueue___block_invoke;
    block[3] = &unk_1E2541A30;
    v8 = v6;
    dispatch_async(v4, block);

  }
}

uint64_t __56__AMSObserver_AMSObservable___sendCompletionUsingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendFailure:(id)a3 usingQueue:(id)a4
{
  id v6;
  NSObject *v7;
  AMSObserver *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[AMSObserver failureBlock](v8, "failureBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__AMSObserver_AMSObservable___sendFailure_usingQueue___block_invoke;
    v10[3] = &unk_1E253E978;
    v12 = v9;
    v11 = v6;
    dispatch_async(v7, v10);

  }
}

uint64_t __54__AMSObserver_AMSObservable___sendFailure_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sendResult:(id)a3 usingQueue:(id)a4
{
  id v6;
  NSObject *v7;
  AMSObserver *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[AMSObserver resultBlock](v8, "resultBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__AMSObserver_AMSObservable___sendResult_usingQueue___block_invoke;
    v10[3] = &unk_1E253E978;
    v12 = v9;
    v11 = v6;
    dispatch_async(v7, v10);

  }
}

uint64_t __53__AMSObserver_AMSObservable___sendResult_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
