@implementation FCAsyncSerialQueue

- (void)enqueueBlock:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fc_addAsyncOperationWithBlock:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCAsyncSerialQueue enqueueBlock:]";
    v8 = 2080;
    v9 = "FCAsyncSerialQueue.m";
    v10 = 1024;
    v11 = 51;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (FCAsyncSerialQueue)initWithUnderlyingQueue:(id)a3 qualityOfService:(int64_t)a4
{
  id v6;
  FCAsyncSerialQueue *v7;
  NSOperationQueue *v8;
  NSOperationQueue *serialOperationQueue;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAsyncSerialQueue;
  v7 = -[FCAsyncSerialQueue init](&v11, sel_init);
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialOperationQueue = v7->_serialOperationQueue;
    v7->_serialOperationQueue = v8;

    -[NSOperationQueue setQualityOfService:](v7->_serialOperationQueue, "setQualityOfService:", a4);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
    if (v6)
      -[NSOperationQueue setUnderlyingQueue:](v7->_serialOperationQueue, "setUnderlyingQueue:", v6);
  }

  return v7;
}

- (FCAsyncSerialQueue)init
{
  return -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:](self, "initWithUnderlyingQueue:qualityOfService:", 0, 9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
}

- (FCAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  return -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:](self, "initWithUnderlyingQueue:qualityOfService:", 0, a3);
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    +[FCAsyncBlockOperation asyncBlockOperationWithBlock:](FCAsyncBlockOperation, "asyncBlockOperationWithBlock:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQualityOfService:", a3);
    -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCAsyncSerialQueue withQualityOfService:enqueueBlock:]";
    v12 = 2080;
    v13 = "FCAsyncSerialQueue.m";
    v14 = 1024;
    v15 = 61;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)enqueueBlockForMainThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke;
    v7[3] = &unk_1E463DD48;
    v8 = v4;
    -[FCAsyncSerialQueue enqueueBlock:](self, "enqueueBlock:", v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCAsyncSerialQueue enqueueBlockForMainThread:]";
    v11 = 2080;
    v12 = "FCAsyncSerialQueue.m";
    v13 = 1024;
    v14 = 74;
    v15 = 2114;
    v16 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

void __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E463CD58;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __48__FCAsyncSerialQueue_enqueueBlockForMainThread___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)withQualityOfService:(int64_t)a3 enqueueBlockForMainThread:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    +[FCAsyncBlockOperation asyncBlockOperationWithMainThreadBlock:](FCAsyncBlockOperation, "asyncBlockOperationWithMainThreadBlock:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQualityOfService:", a3);
    -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v7);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCAsyncSerialQueue withQualityOfService:enqueueBlockForMainThread:]";
    v12 = 2080;
    v13 = "FCAsyncSerialQueue.m";
    v14 = 1024;
    v15 = 88;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)enqueueOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (void)cancelAllBlocks
{
  id v2;

  -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (BOOL)suspended
{
  void *v2;
  char v3;

  -[FCAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
}

- (void)setSerialOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialOperationQueue, a3);
}

@end
