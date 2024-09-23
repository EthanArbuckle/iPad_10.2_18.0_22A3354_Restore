@implementation FCAsyncOnceOperation

- (id)executeWithCallbackQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void (**v7)(_QWORD);
  void *v8;
  unint64_t interest;
  uint64_t v10;
  NSObject *v11;
  _QWORD *workBlock;
  void (*v13)(void);
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  OS_dispatch_group *v17;
  void *v19;
  void *v20;
  _QWORD v21[10];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[NFMutexLock lock](self->_lock, "lock");
  if (self->_finished)
  {
    -[NFMutexLock unlock](self->_lock, "unlock");
    v8 = 0;
  }
  else
  {
    interest = self->_interest;
    v10 = MEMORY[0x1E0C809B0];
    if (!interest)
    {
      if (self->_activeGroup && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("already have an active group"));
        *(_DWORD *)buf = 136315906;
        v24 = "-[FCAsyncOnceOperation executeWithCallbackQueue:completionHandler:]";
        v25 = 2080;
        v26 = "FCOnce.m";
        v27 = 1024;
        v28 = 155;
        v29 = 2114;
        v30 = v19;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      if (self->_activeOperation && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("already have an active operation"));
        *(_DWORD *)buf = 136315906;
        v24 = "-[FCAsyncOnceOperation executeWithCallbackQueue:completionHandler:]";
        v25 = 2080;
        v26 = "FCOnce.m";
        v27 = 1024;
        v28 = 156;
        v29 = 2114;
        v30 = v20;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      objc_storeStrong((id *)&self->_activeGroup, v11);
      workBlock = self->_workBlock;
      v21[5] = v10;
      v21[6] = 3221225472;
      v21[7] = __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke;
      v21[8] = &unk_1E4645C68;
      v21[9] = self;
      v22 = v11;
      v13 = (void (*)(void))workBlock[2];
      v14 = v11;
      v15 = workBlock;
      v13();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_activeOperation, v16);

      -[FCOperationCanceling setRelativePriority:](self->_activeOperation, "setRelativePriority:", self->_relativePriority);
      interest = self->_interest;
    }
    self->_interest = interest + 1;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke_2;
    v21[3] = &unk_1E463AB18;
    v21[4] = self;
    +[FCCancelHandler cancelHandlerWithBlock:](FCCancelHandler, "cancelHandlerWithBlock:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_activeGroup;
    -[NFMutexLock unlock](self->_lock, "unlock");
    if (v17)
    {
      dispatch_group_notify((dispatch_group_t)v17, v6, v7);

      goto LABEL_14;
    }
  }
  v7[2](v7);
LABEL_14:

  return v8;
}

- (FCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  FCAsyncOnceOperation *v8;
  _QWORD aBlock[4];
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, v6);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FCAsyncOnceOperation_initWithTarget_selector___block_invoke;
  aBlock[3] = &unk_1E4645C40;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v7 = _Block_copy(aBlock);
  v8 = -[FCAsyncOnceOperation initWithBlock:](self, "initWithBlock:", v7);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v8;
}

- (FCAsyncOnceOperation)initWithBlock:(id)a3
{
  id v4;
  FCAsyncOnceOperation *v5;
  uint64_t v6;
  id workBlock;
  NFMutexLock *v8;
  NFMutexLock *lock;

  v4 = a3;
  v5 = -[FCAsyncOnceOperation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workBlock = v5->_workBlock;
    v5->_workBlock = (id)v6;

    v8 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E0D60AE0]);
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

id __48__FCAsyncOnceOperation_initWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    ((void (*)(id, _QWORD, void (**)(id, _QWORD)))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 40)))(WeakRetained, *(_QWORD *)(a1 + 40), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3[2](v3, 0);
    v6 = 0;
  }

  return v6;
}

- (id)executeWithCompletionHandler:(id)a3
{
  return -[FCAsyncOnceOperation executeWithCallbackQueue:completionHandler:](self, "executeWithCallbackQueue:completionHandler:", MEMORY[0x1E0C80D38], a3);
}

void __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  dispatch_group_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SEL v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v8 = 0;
    v5 = (dispatch_group_t *)(a1 + 40);
LABEL_6:
    -[FCAssetHandle setFetchOperation:](v8, 0);
    -[FCHLSPlaylistState setCurrentStreamInf:](*(_QWORD *)(a1 + 32), 0);
    objc_setProperty_nonatomic_copy(*(id *)(a1 + 32), v9, 0, 16);
    v4 = *(_QWORD *)(a1 + 32);
    goto LABEL_7;
  }
  v5 = (dispatch_group_t *)(a1 + 40);
  if (*(_QWORD *)(v4 + 32) == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(v4 + 8) = 1;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 && (*(_BYTE *)(v6 + 9) = a2, (v7 = *(_QWORD *)(a1 + 32)) != 0))
    {
      *(_QWORD *)(v7 + 24) = 0;
      v8 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(*(id *)(v4 + 56), "unlock");
  dispatch_group_leave(*v5);
}

- (void)setRelativePriority:(int64_t)a3
{
  FCOperationCanceling *activeOperation;
  FCOperationCanceling *v6;
  uint64_t v7;
  uint64_t v8;
  FCOperationCanceling *v9;

  -[NFMutexLock lock](self->_lock, "lock");
  self->_relativePriority = a3;
  -[FCOperationCanceling setRelativePriority:](self->_activeOperation, "setRelativePriority:", a3);
  objc_opt_class();
  activeOperation = self->_activeOperation;
  if (activeOperation && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = activeOperation;
    v7 = 25;
    if (!a3)
      v7 = 17;
    if (a3 == -1)
      v8 = 9;
    else
      v8 = v7;
    v9 = v6;
    -[FCOperationCanceling setQualityOfService:](v6, "setQualityOfService:", v8);
  }
  else
  {
    v9 = 0;
  }
  -[NFMutexLock unlock](self->_lock, "unlock");

}

uint64_t __67__FCAsyncOnceOperation_executeWithCallbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    --*(_QWORD *)(v2 + 24);
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 && *(_QWORD *)(v3 + 24))
      return objc_msgSend(*(id *)(v3 + 56), "unlock");
  }
  else
  {
    v3 = 0;
  }
  -[FCAssetHandle setFetchOperation:](v3, 0);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 40);
  else
    v5 = 0;
  objc_msgSend(v5, "cancel");
  -[FCHLSPlaylistState setCurrentStreamInf:](*(_QWORD *)(a1 + 32), 0);
  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(v3 + 56), "unlock");
}

- (BOOL)finishedExecuting
{
  BOOL finished;

  -[NFMutexLock lock](self->_lock, "lock");
  finished = self->_finished;
  -[NFMutexLock unlock](self->_lock, "unlock");
  return finished;
}

- (BOOL)finishedExecutingWithFailure
{
  BOOL v3;

  -[NFMutexLock lock](self->_lock, "lock");
  v3 = self->_finished && !self->_succeeded;
  -[NFMutexLock unlock](self->_lock, "unlock");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_activeOperation, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end
