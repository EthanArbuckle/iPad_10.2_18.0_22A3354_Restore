@implementation MTPromise

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__MTPromise__finishPromise_withPromise___block_invoke;
  v12[3] = &unk_24C7A1E28;
  v7 = v5;
  v13 = v7;
  v8 = a4;
  objc_msgSend(v8, "addSuccessBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __40__MTPromise__finishPromise_withPromise___block_invoke_2;
  v10[3] = &unk_24C7A0EF8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "addErrorBlock:", v10);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[MTPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __29__MTPromise_addSuccessBlock___block_invoke;
  v12[3] = &unk_24C7A1C98;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __29__MTPromise_addSuccessBlock___block_invoke_2;
  v9[3] = &unk_24C7A1CC0;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

- (void)addErrorBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[MTPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __27__MTPromise_addErrorBlock___block_invoke;
  v12[3] = &unk_24C7A1C98;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __27__MTPromise_addErrorBlock___block_invoke_2;
  v9[3] = &unk_24C7A1CC0;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

- (void)addFinishBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[MTPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __28__MTPromise_addFinishBlock___block_invoke;
  v12[3] = &unk_24C7A1C98;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __28__MTPromise_addFinishBlock___block_invoke_2;
  v9[3] = &unk_24C7A1CC0;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[MTPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MTPromiseResult *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (v6 && v7)
  {
    MTMetricsKitOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v8;
      v10 = "MetricsKit: Someone is finishing a promise with both a result and an error. This will result in both the suc"
            "cess and error blocks being called. result = %@ error = %@";
      v11 = v9;
      v12 = 22;
LABEL_8:
      _os_log_impl(&dword_20D758000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
  else
  {
    if (v6 | v7)
      goto LABEL_10;
    MTMetricsKitOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "MetricsKit: Someone is finishing a promise with neither a result nor an error. This will result in neither t"
            "he success nor the error blocks being called.";
      v11 = v9;
      v12 = 2;
      goto LABEL_8;
    }
  }

LABEL_10:
  -[MTPromise stateLock](self, "stateLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lock");

  -[MTPromise stateLock](self, "stateLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "condition");

  if (v15 == 1)
  {
    v20 = (void *)objc_opt_class();
    -[MTPromise promiseResult](self, "promiseResult");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject error](v21, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "_errorIsCanceledError:", v22) & 1) != 0)
    {

    }
    else
    {
      v23 = objc_msgSend((id)objc_opt_class(), "_errorIsCanceledError:", v8);

      if ((v23 & 1) != 0)
        goto LABEL_16;
      MTMetricsKitOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D758000, v21, OS_LOG_TYPE_DEBUG, "MetricsKit: Someone is attempting to finish a finished MTPromise.", buf, 2u);
      }
    }

LABEL_16:
    -[MTPromise stateLock](self, "stateLock");
    v16 = (MTPromiseResult *)objc_claimAutoreleasedReturnValue();
    -[MTPromiseResult unlock](v16, "unlock");
    goto LABEL_17;
  }
  v16 = -[MTPromiseResult initWithResult:error:]([MTPromiseResult alloc], "initWithResult:error:", v6, v8);
  -[MTPromise setPromiseResult:](self, "setPromiseResult:", v16);
  -[MTPromise stateLock](self, "stateLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlockWithCondition:", 1);

  -[MTPromise completionBlocks](self, "completionBlocks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "flushCompletionBlocksWithPromiseResult:", v16);

  objc_initWeak((id *)buf, self);
  +[MTPromise _globalPromiseStorageAccessQueue](MTPromise, "_globalPromiseStorageAccessQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__MTPromise_finishWithResult_error___block_invoke;
  block[3] = &unk_24C7A0380;
  objc_copyWeak(&v26, (id *)buf);
  dispatch_async(v19, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
LABEL_17:

  return v15 != 1;
}

- (MTPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (_globalPromiseStorageAccessQueue_onceToken != -1)
    dispatch_once(&_globalPromiseStorageAccessQueue_onceToken, &__block_literal_global_15);
  return (id)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a3;
  v6 = (void (**)(id, void *))a4;
  -[MTPromise stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[MTPromise promiseResult](self, "promiseResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MTPromise stateLock](self, "stateLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    v6[2](v6, v8);
  }
  else
  {
    v11[2]();
    -[MTPromise stateLock](self, "stateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

  }
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (MTPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
  objc_storeStrong((id *)&self->_promiseResult, a3);
}

- (MTPromise)init
{
  MTPromise *v2;
  MTPromiseCompletionBlocks *v3;
  MTPromiseCompletionBlocks *completionBlocks;
  uint64_t v5;
  NSConditionLock *stateLock;
  NSObject *v7;
  _QWORD block[4];
  MTPromise *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTPromise;
  v2 = -[MTPromise init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MTPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v5;

    +[MTPromise _globalPromiseStorageAccessQueue](MTPromise, "_globalPromiseStorageAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __17__MTPromise_init__block_invoke;
    block[3] = &unk_24C7A0748;
    v10 = v2;
    dispatch_sync(v7, block);

  }
  return v2;
}

- (BOOL)finishWithResult:(id)a3
{
  return -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

uint64_t __28__MTPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __27__MTPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addErrorBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __29__MTPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSuccessBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__MTPromise__finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __27__MTPromise_thenWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_finishPromise:withPromise:", *(_QWORD *)(a1 + 32), v7);

}

void __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  v5 = *(_QWORD *)(a1 + 64);
  if (v5 == objc_msgSend(*(id *)(a1 + 40), "count") - 1)
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_configureAllPromise:withResults:promises:currentPromiseIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1);

}

uint64_t __29__MTPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callSuccessBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __27__MTPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callErrorBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

+ (MTPromise)promiseWithAll:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend((id)objc_opt_class(), "_configureAllPromise:withResults:promises:currentPromiseIndex:", v4, v5, v3, 0);

  return (MTPromise *)v4;
}

uint64_t __28__MTPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __61__MTPromise_Composition___setupCompositePromise_composition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_setupCompositePromise:composition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __28__MTPromise_catchWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_finishPromise:withPromise:", *(_QWORD *)(a1 + 32), v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_promiseResult, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (id)thenWithBlock:(id)a3
{
  id v4;
  MTPromise *v5;
  id v6;
  MTPromise *v7;
  MTPromise *v8;
  MTPromise *v9;
  _QWORD v11[4];
  MTPromise *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __27__MTPromise_thenWithBlock___block_invoke;
  v11[3] = &unk_24C7A1CE8;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v12 = v7;
  -[MTPromise addFinishBlock:](self, "addFinishBlock:", v11);
  v8 = v12;
  v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __17__MTPromise_init__block_invoke(uint64_t a1)
{
  id v2;

  +[MTPromise _globalPromiseStorage](MTPromise, "_globalPromiseStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void __36__MTPromise_finishWithResult_error___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[MTPromise _globalPromiseStorage](MTPromise, "_globalPromiseStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

+ (id)_globalPromiseStorage
{
  if (_globalPromiseStorage_onceToken != -1)
    dispatch_once(&_globalPromiseStorage_onceToken, &__block_literal_global_23);
  return (id)_globalPromiseStorage_sGlobalPromiseStorage;
}

+ (MTPromise)promiseWithResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "finishWithResult:", v3);

  return (MTPromise *)v4;
}

+ (void)_setupCompositePromise:(id)a3 composition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_findUnfinishedPromise:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__MTPromise_Composition___setupCompositePromise_composition___block_invoke;
    v10[3] = &unk_24C7A0D60;
    v13 = a1;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "addFinishBlock:", v10);

  }
  else
  {
    objc_msgSend(a1, "_resultOfComposition:errors:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v9);

  }
}

+ (id)_findUnfinishedPromise:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(a1, "_findUnfinishedPromise:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v6 = (id)v12;
              goto LABEL_28;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v9)
            continue;
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_26:
        v6 = 0;
        goto LABEL_29;
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v4;
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        while (2)
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v7);
            objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_findUnfinishedPromise:", v17);
            v6 = (id)objc_claimAutoreleasedReturnValue();

            if (v6)
            {
LABEL_28:

              goto LABEL_29;
            }
          }
          v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v14)
            continue;
          break;
        }
      }
    }

    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isFinished"))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;
LABEL_29:

  return v6;
}

+ (id)_resultOfComposition:(id)a3 errors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "promiseResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7 && v9)
      objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(v8, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v13;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(a1, "_resultOfComposition:errors:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v17);
      }

      v21 = (id)objc_msgSend(v14, "copy");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v32 = v6;
        v23 = v6;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v34 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_msgSend(v23, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "_resultOfComposition:errors:", v29, v7);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v25);
        }

        v21 = (id)objc_msgSend(v22, "copy");
        v6 = v32;
      }
      else
      {
        v21 = v6;
      }
    }
  }

  return v21;
}

- (BOOL)isFinished
{
  void *v3;
  void *v4;

  -[MTPromise stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[MTPromise _isFinished](self, "_isFinished");
  -[MTPromise stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)_isFinished
{
  void *v2;
  BOOL v3;

  -[MTPromise stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

+ (MTPromise)promiseWithComposition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(a1, "_setupCompositePromise:composition:", v5, v4);

  return (MTPromise *)v5;
}

- (id)catchWithBlock:(id)a3
{
  id v4;
  MTPromise *v5;
  id v6;
  MTPromise *v7;
  MTPromise *v8;
  MTPromise *v9;
  _QWORD v11[4];
  MTPromise *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __28__MTPromise_catchWithBlock___block_invoke;
  v11[3] = &unk_24C7A1CE8;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v12 = v7;
  -[MTPromise addFinishBlock:](self, "addFinishBlock:", v11);
  v8 = v12;
  v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke;
  v24[3] = &unk_24C7A1D88;
  objc_copyWeak(v28, &location);
  v15 = v11;
  v25 = v15;
  v28[1] = (id)a6;
  v16 = v12;
  v26 = v16;
  v17 = v10;
  v27 = v17;
  objc_msgSend(v13, "addSuccessBlock:", v24);
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2;
  v20[3] = &unk_24C7A1DB0;
  v23 = a6;
  v18 = v16;
  v21 = v18;
  v19 = v17;
  v22 = v19;
  objc_msgSend(v13, "addErrorBlock:", v20);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

+ (void)cancelPromisesInComposition:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v19 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", v9);

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v6);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = v3;
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v4);
            +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j), (_QWORD)v14);
          }
          v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        }
        while (v11);
      }
    }

    goto LABEL_21;
  }
  objc_msgSend(v3, "cancel");
LABEL_21:

}

+ (MTPromise)promiseWithError:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "finishWithError:", v3);

  return (MTPromise *)v4;
}

+ (MTPromise)promiseWithAny:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "_configureAnyPromise:withPromises:currentPromiseIndex:", v4, v3, 0);

  return (MTPromise *)v4;
}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[MTPromise stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[MTPromise _isFinished](self, "_isFinished"))
  {
    v4 = (void *)objc_opt_class();
    -[MTPromise promiseResult](self, "promiseResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_errorIsCanceledError:", v6);

  }
  else
  {
    v7 = 0;
  }
  -[MTPromise stateLock](self, "stateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v7;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  -[MTPromise stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lockWhenCondition:beforeDate:", 1, v6);

  if ((v8 & 1) != 0)
  {
    -[MTPromise promiseResult](self, "promiseResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPromise stateLock](self, "stateLock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unlock");

    objc_msgSend(v15, "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && !v17)
    {
      objc_msgSend(v15, "error");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    MTError(400, 0, v9, v10, v11, v12, v13, v14, 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)resultWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)waitUntilFinished
{
  id v2;

  v2 = -[MTPromise resultWithError:](self, "resultWithError:", 0);
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3;

  v3 = -[MTPromise resultWithTimeout:error:](self, "resultWithTimeout:error:", 0, a3);
}

- (BOOL)cancel
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", 0, v3);

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return -[MTPromise finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)BOOLCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, char, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __41__MTPromise_BOOLCompletionHandlerAdapter__block_invoke;
  v8 = &unk_24C7A1D10;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x212BA8428](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __41__MTPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:error:", v7, v8);

  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithResult:error:", 0, v8);
  }

}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __37__MTPromise_completionHandlerAdapter__block_invoke;
  v8 = &unk_24C7A1D38;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x212BA8428](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __37__MTPromise_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "finishWithResult:error:", v6, v5);

}

- (id)errorOnlyCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __46__MTPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  v8 = &unk_24C7A1D60;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x212BA8428](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __46__MTPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "finishWithError:", v5);
  else
    objc_msgSend(WeakRetained, "finishWithResult:", MEMORY[0x24BDBD1C8]);

}

- (id)nilValueCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __45__MTPromise_nilValueCompletionHandlerAdapter__block_invoke;
  v8 = &unk_24C7A1D38;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x212BA8428](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __45__MTPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v9 | v5)
  {
    if (v9)
      objc_msgSend(WeakRetained, "finishWithResult:");
    else
      objc_msgSend(WeakRetained, "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v8);

  }
}

void __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t i;
  void *v4;
  id v5;

  v5 = a2;
  for (i = *(_QWORD *)(a1 + 48) + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);

}

+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  id location;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectAtIndexedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke;
  v20[3] = &unk_24C7A1DD8;
  v23 = a5;
  v12 = v9;
  v21 = v12;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v10, "addSuccessBlock:", v20);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke_2;
  v16[3] = &unk_24C7A1E00;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a5;
  v14 = v12;
  v17 = v14;
  v15 = v13;
  v18 = v15;
  objc_msgSend(v10, "addErrorBlock:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  unint64_t i;
  void *v4;
  id v5;

  v5 = a2;
  for (i = *(_QWORD *)(a1 + 48) + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);

}

void __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  else
    objc_msgSend(WeakRetained, "_configureAnyPromise:withPromises:currentPromiseIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) + 1);

}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v5 = objc_msgSend(v3, "code") == 3072;
  else
    v5 = 0;

  return v5;
}

uint64_t __40__MTPromise__finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __34__MTPromise__globalPromiseStorage__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v1 = (void *)_globalPromiseStorage_sGlobalPromiseStorage;
  _globalPromiseStorage_sGlobalPromiseStorage = (uint64_t)v0;

}

void __45__MTPromise__globalPromiseStorageAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.MetricsKit.globalPromiseStorageAccessQueue", 0);
  v1 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue;
  _globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue = (uint64_t)v0;

}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (void)setStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_stateLock, a3);
}

@end
