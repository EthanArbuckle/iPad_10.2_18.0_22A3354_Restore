@implementation FCTimedOperationThrottler

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  FCTimedOperationThrottler *v13;
  id v14;

  v5 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __84__FCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v12 = &unk_1E463B790;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(&v9);
  -[FCTimedOperationThrottler delegate](self, "delegate", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "operationThrottlerPerformOperation:", self);
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v8, "operationThrottler:performAsyncOperationWithCompletion:", self, v7);
LABEL_6:

}

void __84__FCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "cooldownTime");
  v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));

}

- (FCOperationThrottlerDelegate)delegate
{
  return (FCOperationThrottlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (void)tickle
{
  id v2;

  -[FCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tickle");

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (FCOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (FCTimedOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  FCTimedOperationThrottler *v5;
  FCTimedOperationThrottler *v6;
  FCOperationThrottler *v7;
  FCOperationThrottler *operationThrottler;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCTimedOperationThrottler initWithDelegate:]";
    v14 = 2080;
    v15 = "FCOperationThrottler.m";
    v16 = 1024;
    v17 = 194;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11.receiver = self;
  v11.super_class = (Class)FCTimedOperationThrottler;
  v5 = -[FCTimedOperationThrottler init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[FCOperationThrottler initWithDelegate:]([FCOperationThrottler alloc], "initWithDelegate:", v6);
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;

  }
  return v6;
}

- (FCTimedOperationThrottler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTimedOperationThrottler init]";
    v9 = 2080;
    v10 = "FCOperationThrottler.m";
    v11 = 1024;
    v12 = 189;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTimedOperationThrottler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)tickleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tickleWithCompletion:", v4);

}

- (BOOL)suspended
{
  void *v2;
  char v3;

  -[FCTimedOperationThrottler operationThrottler](self, "operationThrottler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspended");

  return v3;
}

- (void)setOperationThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_operationThrottler, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationThrottler, 0);
}

@end
