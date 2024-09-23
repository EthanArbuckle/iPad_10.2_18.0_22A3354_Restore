@implementation CalculateRequest

- (void)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  char v10;

  +[CalculateRequest _lock](CalculateRequest, "_lock");
  if (-[CalculateRequest isCanceled](self, "isCanceled"))
  {
    +[CalculateRequest _unlock](CalculateRequest, "_unlock");
  }
  else
  {
    -[CalculateRequest setIsCanceled:](self, "setIsCanceled:", 1);
    -[CalculateRequest setResult:](self, "setResult:", 0);
    -[CalculateRequest setError:](self, "setError:", 0);
    v10 = 0;
    -[CalculateRequest expression](self, "expression");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalculateRequest options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    +[Calculate evaluate:options:error:needsUpdate:](Calculate, "evaluate:options:error:needsUpdate:", v3, v4, &v9, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    +[CalculateRequest _unlock](CalculateRequest, "_unlock");
    -[CalculateRequest resultHandler](self, "resultHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CalculateRequest resultHandler](self, "resultHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v8)[2](v8, v5, v6);

    }
  }
}

- (void)update
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (+[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled"))
  {
    +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__CalculateRequest_update__block_invoke;
    v6[3] = &unk_1E6E9FD60;
    v6[4] = self;
    -[NSObject refreshWithCompletionHandler:](v3, "refreshWithCompletionHandler:", v6);
  }
  else
  {
    +[CalculateRequest _lock](CalculateRequest, "_lock");
    if ((calculateRequestUpdating & 1) == 0)
    {
      calculateRequestUpdating = 1;
      +[CalculateRequest serialQueue](CalculateRequest, "serialQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v4, &__block_literal_global_696);

    }
    +[CalculateRequest _unlock](CalculateRequest, "_unlock");
    +[CalculateRequest serialQueue](CalculateRequest, "serialQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__CalculateRequest_update__block_invoke_3;
    v5[3] = &unk_1E6EA05D0;
    v5[4] = self;
    dispatch_async(v3, v5);
  }

}

- (void)cancel
{
  BOOL v3;
  void *v4;
  id v5;

  +[CalculateRequest _lock](CalculateRequest, "_lock");
  v3 = -[CalculateRequest isCanceled](self, "isCanceled");
  -[CalculateRequest setResult:](self, "setResult:", 0);
  -[CalculateRequest setError:](self, "setError:", 0);
  -[CalculateRequest setIsCanceled:](self, "setIsCanceled:", 1);
  +[CalculateRequest _unlock](CalculateRequest, "_unlock");
  if (!v3)
  {
    -[CalculateRequest resultHandler](self, "resultHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CalculateRequest resultHandler](self, "resultHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

    }
  }
}

- (void)finish
{
  BOOL v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  +[CalculateRequest _lock](CalculateRequest, "_lock");
  v3 = -[CalculateRequest isCanceled](self, "isCanceled");
  -[CalculateRequest result](self, "result");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CalculateRequest error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateRequest setResult:](self, "setResult:", 0);
  -[CalculateRequest setError:](self, "setError:", 0);
  -[CalculateRequest setIsCanceled:](self, "setIsCanceled:", 1);
  +[CalculateRequest _unlock](CalculateRequest, "_unlock");
  if (!v3)
  {
    -[CalculateRequest resultHandler](self, "resultHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CalculateRequest resultHandler](self, "resultHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v6)[2](v6, v7, v4);

    }
  }

}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_storeStrong((id *)&self->_expression, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (CalculateResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

uint64_t __26__CalculateRequest_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluate");
}

uint64_t __26__CalculateRequest_update__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluate");
}

uint64_t __26__CalculateRequest_update__block_invoke_2()
{
  void *v0;

  +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refresh");

  +[CalculateRequest _lock](CalculateRequest, "_lock");
  calculateRequestUpdating = 0;
  return +[CalculateRequest _unlock](CalculateRequest, "_unlock");
}

+ (void)_lock
{
  if (_lock_onceToken[0] != -1)
    dispatch_once(_lock_onceToken, &__block_literal_global_690);
  objc_msgSend((id)calculateRequestLock, "lock");
}

+ (void)_unlock
{
  objc_msgSend((id)calculateRequestLock, "unlock");
}

+ (id)serialQueue
{
  if (serialQueue_onceToken != -1)
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_692);
  return (id)serialQueue_queue;
}

void __31__CalculateRequest_serialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.framework.calculate.evaluate", 0);
  v1 = (void *)serialQueue_queue;
  serialQueue_queue = (uint64_t)v0;

}

void __25__CalculateRequest__lock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)calculateRequestLock;
  calculateRequestLock = (uint64_t)v0;

}

@end
