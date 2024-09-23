@implementation ATLegacySyncSessionTask

- (ATLegacySyncSessionTask)initWithDataClass:(id)a3
{
  id v4;
  ATLegacySyncSessionTask *v5;
  void *v6;
  uint64_t v7;
  ATClient *client;
  objc_class *v9;
  const char *Name;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATLegacySyncSessionTask;
  v5 = -[ATSessionTask initWithDataClass:](&v14, sel_initWithDataClass_, v4);
  if (v5)
  {
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientForDataclass:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    client = v5->_client;
    v5->_client = (ATClient *)v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_create(Name, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    -[ATSessionTask setLocalizedDescription:](v5, "setLocalizedDescription:", v4);
  }

  return v5;
}

- (id)sessionGroupingKey
{
  return CFSTR("ATLegacySyncSessionTaskGroupingKey");
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ATLegacySyncSessionTask_cancel__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)prepareWithHostAnchor:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  double Current;
  char v9;
  ATClient *client;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  ATClient *v15;
  char v16;
  double v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = objc_opt_respondsToSelector();
  client = self->_client;
  if ((v9 & 1) != 0)
  {
    v21 = 0;
    v11 = -[ATClient prepareForSyncWithHostAnchor:progressCallback:error:](client, "prepareForSyncWithHostAnchor:progressCallback:error:", v6, &__block_literal_global_1559, &v21);
    v12 = v21;
    if ((v11 & 1) != 0)
      goto LABEL_12;
    _ATLogCategoryiTunesSync();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    -[ATSessionTask dataClass](self, "dataClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v14;
    v24 = 2114;
    v25 = *(double *)&v12;
LABEL_9:
    _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_ERROR, "Sync Failed! Prep failed for %{public}@, error: %{public}@", buf, 0x16u);

LABEL_10:
    -[ATSessionTask setError:](self, "setError:", v12);
    -[ATSessionTask setFinished:](self, "setFinished:", 1);
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = self->_client;
    v20 = 0;
    v16 = -[ATClient prepareForSyncWithHostAnchor:progressCallback:grappaID:hostVersion:error:](v15, "prepareForSyncWithHostAnchor:progressCallback:grappaID:hostVersion:error:", v6, &__block_literal_global_12, -[ATLegacySyncSessionTask grappaSessionID](self, "grappaSessionID"), v7, &v20);
    v12 = v20;
    if ((v16 & 1) != 0)
      goto LABEL_12;
    _ATLogCategoryiTunesSync();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    -[ATSessionTask dataClass](self, "dataClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v14;
    v24 = 2114;
    v25 = *(double *)&v12;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_12:
  v17 = CFAbsoluteTimeGetCurrent();
  _ATLogCategoryiTunesSync();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[ATSessionTask dataClass](self, "dataClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v19;
    v24 = 2048;
    v25 = v17 - Current;
    _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "---%{public}@ Prep Time: %.1fs---", buf, 0x16u);

  }
}

- (void)reconcileWithAnchor:(id)a3 syncType:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  CFAbsoluteTime Current;
  ATClient *client;
  _QWORD v11[5];
  id v12;
  CFAbsoluteTime v13;
  unsigned int v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ATClient syncEndedWithSuccess:](self->_client, "syncEndedWithSuccess:", 1);
    -[ATSessionTask setFinished:](self, "setFinished:", 1);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _ATLogCategoryiTunesSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ATSessionTask dataClass](self, "dataClass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "Running reconcile phase for %{public}@", buf, 0xCu);

    }
    Current = CFAbsoluteTimeGetCurrent();
    client = self->_client;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke;
    v11[3] = &unk_1E927CED8;
    v11[4] = self;
    v14 = a4;
    v12 = v6;
    v13 = Current;
    dispatch_client_async(client, v11);

  }
  else
  {
    -[ATLegacySyncSessionTask _finishWithError:shouldAddAssetTask:](self, "_finishWithError:shouldAddAssetTask:", 0, 1);
  }

}

- (void)_finishWithError:(id)a3 shouldAddAssetTask:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ATAssetSessionTask *v7;
  void *v8;
  ATAssetSessionTask *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    v7 = [ATAssetSessionTask alloc];
    -[ATSessionTask dataClass](self, "dataClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATAssetSessionTask initWithDataClass:](v7, "initWithDataClass:", v8);

    v10 = (void *)MEMORY[0x1E0CB3940];
    -[ATSessionTask dataClass](self, "dataClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ sync"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSessionTask setLocalizedDescription:](v9, "setLocalizedDescription:", v12);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATAssetSessionTask setFilterPredicate:](v9, "setFilterPredicate:", v13);

    -[ATSessionTask session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSessionTasks:", v15);

  }
  -[ATSessionTask setError:](self, "setError:", v6);
  -[ATSessionTask setFinished:](self, "setFinished:", 1);

}

- (unsigned)grappaSessionID
{
  return self->_grappaSessionID;
}

- (void)setGrappaSessionID:(unsigned int)a3
{
  self->_grappaSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

uint64_t __63__ATLegacySyncSessionTask__finishWithError_shouldAddAssetTask___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "dataclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Application")))
  {

    goto LABEL_5;
  }
  v4 = objc_msgSend(v2, "isRestore");

  if ((v4 & 1) == 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

void __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[7];
  char v11;
  id obj;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__1549;
  v14[4] = __Block_byref_object_dispose__1550;
  v15 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 152);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = MEMORY[0x1E0C809B0];
  obj = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke_15;
  v13[3] = &unk_1E927CE88;
  v13[4] = v3;
  v7 = objc_msgSend(v4, "reconcileSync:withNewAnchor:progressCallback:error:", v5, v2, v13, &obj);
  objc_storeStrong(&v15, obj);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 160);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke_2;
  v10[3] = &unk_1E927CEB0;
  v10[6] = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v10[4] = v8;
  v10[5] = v14;
  dispatch_async(v9, v10);
  _Block_object_dispose(v14, 8);

}

uint64_t __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:");
}

uint64_t __56__ATLegacySyncSessionTask_reconcileWithAnchor_syncType___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  double Current;
  double v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v4 = *(double *)(a1 + 48);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "syncEndedWithSuccess:", *(unsigned __int8 *)(a1 + 56));
    if (*(_BYTE *)(a1 + 56))
    {
      _ATLogCategoryiTunesSync();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "dataClass");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v17 = 138543874;
        v18 = v6;
        v19 = 2114;
        v20 = v7;
        v21 = 2048;
        v22 = Current - v4;
        _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Reconcile completed for %{public}@ with error: %{public}@ in %.1fs", (uint8_t *)&v17, 0x20u);

      }
      v8 = *(void **)(a1 + 32);
      v9 = 0;
      v10 = 1;
    }
    else
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
      _ATLogCategoryiTunesSync();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "dataClass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v17 = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v16;
        _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_ERROR, "Sync Failed! Reconciliation failed for %{public}@, error: %{public}@", (uint8_t *)&v17, 0x16u);

      }
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v10 = 0;
    }
    return objc_msgSend(v8, "_finishWithError:shouldAddAssetTask:", v9, v10);
  }
  return result;
}

void __33__ATLegacySyncSessionTask_cancel__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "cancelSyncOperations");
    v2 = objc_opt_respondsToSelector();
    v3 = *(_QWORD **)(a1 + 32);
    if ((v2 & 1) != 0)
    {
      v4 = (void *)v3[19];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __33__ATLegacySyncSessionTask_cancel__block_invoke_2;
      v5[3] = &unk_1E927E120;
      v5[4] = v3;
      dispatch_client_async(v4, v5);
    }
    else
    {
      objc_msgSend(v3, "setFinished:", 1);
    }
  }
}

uint64_t __33__ATLegacySyncSessionTask_cancel__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "syncEndedWithSuccess:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

@end
