@implementation MSASModelEnumerator

- (MSASModelEnumerator)init
{
  __assert_rtn("-[MSASModelEnumerator init]", "MSASModelEnumerator.m", 36, "0");
}

- (MSASModelEnumerator)initWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5
{
  id v8;
  id v9;
  MSASModelEnumerator *v10;
  id v11;
  void *stepBlock;
  uint64_t v13;
  const char *v15;
  objc_super v16;
  uint8_t buf[4];
  MSASModelEnumerator *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MSASModelEnumerator;
  v10 = -[MSASModelEnumerator init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_retainAutorelease(v8);
    if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(v11, "UTF8String"), -1, &v10->_stmt, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 138543874;
        v18 = v10;
        v19 = 2114;
        v20 = v11;
        v21 = 2082;
        v22 = v15;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not compile SQL query: “%{public}@”. sqlite error: %{public}s", buf, 0x20u);
      }
      stepBlock = v10;
      v10 = 0;
    }
    else
    {
      v10->_db = a3;
      v13 = objc_msgSend(v9, "copy");
      stepBlock = v10->_stepBlock;
      v10->_stepBlock = (id)v13;
    }

  }
  return v10;
}

- (void)dealloc
{
  void (**v3)(_QWORD);
  NSObject *queue;
  objc_super v5;
  _QWORD v6[5];

  if (self->_stmt)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__MSASModelEnumerator_dealloc__block_invoke;
    v6[3] = &unk_1E95BCED0;
    v6[4] = self;
    v3 = (void (**)(_QWORD))MEMORY[0x1D8255DD0](v6, a2);
    queue = self->_queue;
    if (queue)
      dispatch_sync(queue, v3);
    else
      v3[2](v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)MSASModelEnumerator;
  -[MSASModelEnumerator dealloc](&v5, sel_dealloc);
}

- (id)nextObject
{
  void (**v3)(_QWORD);
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6191;
  v12 = __Block_byref_object_dispose__6192;
  v13 = 0;
  if (-[MSASModelEnumerator stmt](self, "stmt"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__MSASModelEnumerator_nextObject__block_invoke;
    v7[3] = &unk_1E95BCEF8;
    v7[4] = self;
    v7[5] = &v8;
    v3 = (void (**)(_QWORD))MEMORY[0x1D8255DD0](v7);
    queue = self->_queue;
    if (queue)
      dispatch_sync(queue, v3);
    else
      v3[2](v3);

  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (id)stepBlock
{
  return self->_stepBlock;
}

- (void)setStepBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_stepBlock, 0);
}

void __33__MSASModelEnumerator_nextObject__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_step((sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "stmt"));
  if (v2 == 101)
  {
    sqlite3_finalize((sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "stmt"));
    objc_msgSend(*(id *)(a1 + 32), "setStmt:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setStepBlock:", 0);
  }
  else if (v2 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "stepBlock");
    v7 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v7[2](v7, objc_msgSend(*(id *)(a1 + 32), "stmt"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2082;
    v11 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v6, "db"));
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Can't enumerate the next object in the model. Error: %{public}s", buf, 0x16u);
  }
}

uint64_t __30__MSASModelEnumerator_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 16));
}

+ (id)enumeratorWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5
{
  id v7;
  id v8;
  MSASModelEnumerator *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[MSASModelEnumerator initWithDatabase:query:stepBlock:]([MSASModelEnumerator alloc], "initWithDatabase:query:stepBlock:", a3, v8, v7);

  return v9;
}

@end
