@implementation FCAsyncBlockOperation

- (BOOL)isExecuting
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (BOOL)isFinished
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

+ (id)asyncBlockOperationWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBlock:", v3);

  return v4;
}

- (FCAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4;
  FCAsyncBlockOperation *v5;
  uint64_t v6;
  id block;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCAsyncBlockOperation initWithBlock:]";
    v13 = 2080;
    v14 = "FCAsyncBlockOperation.m";
    v15 = 1024;
    v16 = 45;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCAsyncBlockOperation;
  v5 = -[FCAsyncBlockOperation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)start
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  if (-[FCAsyncBlockOperation isCancelled](self, "isCancelled"))
  {
    -[FCAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    atomic_store(1u, (unsigned __int8 *)&self->_finished);
    -[FCAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[FCAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    atomic_store(1u, (unsigned __int8 *)&self->_executing);
    v3 = (void *)MEMORY[0x1A8580B64](-[FCAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting")));
    -[FCAsyncBlockOperation block](self, "block");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__FCAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E463AB18;
    v5[4] = self;
    ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

    objc_autoreleasePoolPop(v3);
  }
}

- (id)block
{
  return self->_block;
}

uint64_t __30__FCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 248));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 249));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke;
  v8[3] = &unk_1E463DD48;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "asyncBlockOperationWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2;
  v5[3] = &unk_1E463CD58;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  FCPerformBlockOnMainThread(v5);

}

uint64_t __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (FCAsyncBlockOperation)init
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
    v8 = "-[FCAsyncBlockOperation init]";
    v9 = 2080;
    v10 = "FCAsyncBlockOperation.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAsyncBlockOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
