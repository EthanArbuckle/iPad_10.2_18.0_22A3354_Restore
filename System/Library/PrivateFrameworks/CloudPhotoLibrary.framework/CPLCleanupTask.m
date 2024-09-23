@implementation CPLCleanupTask

- (void)_cleanupSharingFlags
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v13 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke;
  v9[3] = &unk_1E60DD280;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = v12;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_2;
  v8[3] = &unk_1E60DDB58;
  v8[4] = self;
  v8[5] = v12;
  v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v9, v8);

  _Block_object_dispose(v12, 8);
}

- (void)_doOneIteration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[3];
  char v19;

  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cleanupTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__CPLCleanupTask__doOneIteration__block_invoke;
  v11[3] = &unk_1E60D8270;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v14 = v18;
  v8 = v4;
  v13 = v8;
  v15 = v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __33__CPLCleanupTask__doOneIteration__block_invoke_2;
  v10[3] = &unk_1E60DDAD0;
  v10[4] = self;
  v10[5] = v18;
  v10[6] = v16;
  v9 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

}

- (void)launch
{
  +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.cleanup"), CFSTR("cleaning store"), 1);
  -[CPLCleanupTask _doOneIteration](self, "_doOneIteration");
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.cleanup"));
  v5.receiver = self;
  v5.super_class = (Class)CPLCleanupTask;
  -[CPLEngineSyncTask taskDidFinishWithError:](&v5, sel_taskDidFinishWithError_, v4);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.cleanup");
}

void __33__CPLCleanupTask__doOneIteration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldDefer");

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_4715();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = (id)objc_opt_class();
        v7 = v19;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setError:", v8);

  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__CPLCleanupTask__doOneIteration__block_invoke_3;
    v15 = &unk_1E60DD7C0;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 56);
    v16 = v9;
    v17 = v10;
    objc_msgSend(v3, "do:", &v12);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 48), "sharingScopeIdentifier", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
}

void __33__CPLCleanupTask__doOneIteration__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v9, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:", v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v6 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskDidFinishWithError:", v7);

  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_doOneIteration");
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(v8, "_cleanupSharingFlags");
    else
      objc_msgSend(v8, "taskDidFinishWithError:", 0);
  }

}

uint64_t __33__CPLCleanupTask__doOneIteration__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupStepHasMore:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, a2);
}

void __38__CPLCleanupTask__cleanupSharingFlags__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldDefer");

  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_4715();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = (id)objc_opt_class();
        v7 = v16;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Session has been deferred. Stopping %@ now", buf, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setError:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sharingScopeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_1;
      v12[3] = &unk_1E60DD7C0;
      v10 = *(id *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v13 = v10;
      v14 = v11;
      objc_msgSend(v3, "do:", v12);

    }
  }

}

void __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v9, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:", v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v6 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskDidFinishWithError:", v7);

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(v8, "_cleanupSharingFlags");
    else
      objc_msgSend(v8, "taskDidFinishWithError:", 0);
  }

}

uint64_t __38__CPLCleanupTask__cleanupSharingFlags__block_invoke_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "pushRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "deleteSharingFlagsWithMaxCount:deletedCount:error:", 200, &v7, a2);
  if ((_DWORD)v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 != 0;

  return v5;
}

@end
