@implementation ASCTaskCoordinator

+ (OS_os_log)log
{
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, &__block_literal_global_28);
  return (OS_os_log *)(id)log_log_7;
}

void __25__ASCTaskCoordinator_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCTaskCoordinator");
  v1 = (void *)log_log_7;
  log_log_7 = (uint64_t)v0;

}

- (ASCTaskCoordinator)initWithName:(id)a3
{
  id v4;
  ASCTaskCoordinator *v5;
  uint64_t v6;
  NSString *name;
  NSRecursiveLock *v8;
  NSRecursiveLock *consistencyLock;
  NSMutableDictionary *v10;
  NSMutableDictionary *pendingResults;
  NSCache *v12;
  NSCache *loadedResults;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCTaskCoordinator;
  v5 = -[ASCTaskCoordinator init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    consistencyLock = v5->_consistencyLock;
    v5->_consistencyLock = v8;

    -[NSRecursiveLock setName:](v5->_consistencyLock, "setName:", v4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingResults = v5->_pendingResults;
    v5->_pendingResults = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    loadedResults = v5->_loadedResults;
    v5->_loadedResults = v12;

    -[NSCache setName:](v5->_loadedResults, "setName:", v4);
    -[NSCache setCountLimit:](v5->_loadedResults, "setCountLimit:", 50);
  }

  return v5;
}

- (void)withLock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[ASCTaskCoordinator consistencyLock](self, "consistencyLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  v6[2]();
  -[ASCTaskCoordinator consistencyLock](self, "consistencyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (void)taskForKey:(id)a3 didCompleteWithResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[ASCTaskCoordinator name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1BCB7B000, v8, OS_LOG_TYPE_INFO, "%{public}@: Task for %@ did complete with %@", buf, 0x20u);

  }
  -[ASCTaskCoordinator loadedResults](self, "loadedResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, v6);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__ASCTaskCoordinator_taskForKey_didCompleteWithResult___block_invoke;
  v12[3] = &unk_1E75605A0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[ASCTaskCoordinator withLock:](self, "withLock:", v12);

}

void __55__ASCTaskCoordinator_taskForKey_didCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pendingResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)taskForKey:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == 3072)
      goto LABEL_8;
  }
  else
  {

  }
  +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ASCTaskCoordinator name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v6;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Task for %@ did fail with %{public}@", buf, 0x20u);

  }
LABEL_8:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__ASCTaskCoordinator_taskForKey_didFailWithError___block_invoke;
  v14[3] = &unk_1E75605A0;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  -[ASCTaskCoordinator withLock:](self, "withLock:", v14);

}

void __50__ASCTaskCoordinator_taskForKey_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pendingResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (BOOL)hasTaskForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[ASCTaskCoordinator taskForKey:](self, "taskForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)taskForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[ASCTaskCoordinator loadedResults](self, "loadedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__ASCTaskCoordinator_taskForKey___block_invoke;
    v9[3] = &unk_1E7561658;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[ASCTaskCoordinator withLock:](self, "withLock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

void __33__ASCTaskCoordinator_taskForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pendingResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)taskForKey:(id)a3 withCreatorBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ASCTaskCoordinator loadedResults](self, "loadedResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[ASCTaskCoordinator name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@: Using cached result to satisfy %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CFDBB8], "promiseWithResult:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke;
    v14[3] = &unk_1E75618C0;
    v14[4] = self;
    v15 = v6;
    v17 = buf;
    v16 = v7;
    -[ASCTaskCoordinator withLock:](self, "withLock:", v14);
    v12 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }

  return v12;
}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "%{public}@: Reusing pending task to satisfy %@", buf, 0x16u);

    }
    objc_msgSend(v3, "asc_copy");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "%{public}@: Starting new task to satisfy %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_8;
    v24[3] = &unk_1E7561898;
    objc_copyWeak(&v26, (id *)buf);
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v10, "addSuccessBlock:", v24);
    v18 = v14;
    v19 = 3221225472;
    v20 = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_2;
    v21 = &unk_1E7560CD0;
    objc_copyWeak(&v23, (id *)buf);
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v10, "addErrorBlock:", &v18);
    objc_msgSend(v10, "asc_copy", v18, v19, v20, v21);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_8(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "taskForKey:didCompleteWithResult:", *(_QWORD *)(a1 + 32), v4);

}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "taskForKey:didFailWithError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)removeTaskForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ASCTaskCoordinator *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[ASCTaskCoordinator name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@: Removing task for key %@", buf, 0x16u);

  }
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __39__ASCTaskCoordinator_removeTaskForKey___block_invoke;
  v12 = &unk_1E75605A0;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[ASCTaskCoordinator withLock:](self, "withLock:", &v9);
  -[ASCTaskCoordinator loadedResults](self, "loadedResults", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

void __39__ASCTaskCoordinator_removeTaskForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pendingResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancel");
    objc_msgSend(*(id *)(a1 + 32), "pendingResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    v3 = v5;
  }

}

- (void)removeAllFinishedTasks
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[ASCTaskCoordinator log](ASCTaskCoordinator, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ASCTaskCoordinator name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1BCB7B000, v3, OS_LOG_TYPE_INFO, "%{public}@: Removing all finished tasks", (uint8_t *)&v6, 0xCu);

  }
  -[ASCTaskCoordinator loadedResults](self, "loadedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (NSString)name
{
  return self->_name;
}

- (NSRecursiveLock)consistencyLock
{
  return self->_consistencyLock;
}

- (NSMutableDictionary)pendingResults
{
  return self->_pendingResults;
}

- (NSCache)loadedResults
{
  return self->_loadedResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedResults, 0);
  objc_storeStrong((id *)&self->_pendingResults, 0);
  objc_storeStrong((id *)&self->_consistencyLock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
