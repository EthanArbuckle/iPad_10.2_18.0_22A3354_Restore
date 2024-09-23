@implementation CPLScopeUpdateScopeTask

- (CPLScopeUpdateScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  CPLScopeUpdateScopeTask *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPLScopeUpdateScopeTask;
  v7 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v12, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, a3, a4, a5, a6, a7);
  if (v7)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("engine.sync.updatescope", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)_lookForStagingScopeWithIdentifier:(id)a3 transportScope:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CPLScopeUpdateScopeTask__lookForStagingScopeWithIdentifier_transportScope___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void)_markScopeAsDeletedAndSucceedTaskWithFlags:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  SEL v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__14982;
  v17[4] = __Block_byref_object_dispose__14983;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__14982;
  v15[4] = __Block_byref_object_dispose__14983;
  v16 = 0;
  -[CPLEngineScopedTask store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke;
  v11[3] = &unk_1E60DBE10;
  v11[4] = self;
  v8 = v5;
  v13 = v15;
  v14 = a2;
  v12 = v8;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_38;
  v10[3] = &unk_1E60DDAD0;
  v10[4] = self;
  v10[5] = v17;
  v10[6] = v15;
  v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

- (void)_markScopeAsFeatureDisabledWithFlags:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_14898();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineScopedTask scope](self, "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Feature is disabled for %@", buf, 0xCu);

    }
  }
  -[CPLEngineScopedTask store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke;
  v11[3] = &unk_1E60DD810;
  v11[4] = self;
  v12 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_3;
  v10[3] = &unk_1E60DD838;
  v8 = v4;
  v9 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

}

- (void)_markScopeHasBadTransportScopeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_14898();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineScopedTask scope](self, "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Transport scope for %@ is invalid", buf, 0xCu);

    }
  }
  -[CPLEngineScopedTask store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke;
  v12[3] = &unk_1E60DD838;
  v12[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_3;
  v10[3] = &unk_1E60DD810;
  v10[4] = self;
  v8 = v4;
  v9 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v12, v10);

}

- (void)_updateScopeWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 session:(id)a7 updatedTransportScope:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  -[CPLEngineScopedTask store](self, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transport");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke;
  v28[3] = &unk_1E60DBEA8;
  v28[4] = self;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v19;
  v34 = v17;
  v35 = a3;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_49;
  v27[3] = &unk_1E60DD838;
  v27[4] = self;
  v20 = v17;
  v21 = v19;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  v25 = v13;
  v26 = (id)objc_msgSend(v20, "performWriteTransactionWithBlock:completionHandler:", v28, v27);

}

- (void)_updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

- (void)_performAdditionalChecksWithNewScopeType:(int64_t)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 oldTransportScope:(id)a6 updatedTransportScope:(id)a7 completionHandler:(id)a8
{
  void (**v11)(id, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a4;
  v11 = (void (**)(id, _QWORD))a8;
  -[CPLEngineScopedTask scope](self, "scope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "scopeType");

  if (v13 != a3)
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scopeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      objc_msgSend(v19, "stagedScopeChange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        a3 = objc_msgSend(v16, "scopeType");
        objc_msgSend(v17, "scopeIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v18;
      }
      else
      {
        a3 = 6;
      }

    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      -[CPLScopeUpdateScopeTask _updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:completionHandler:](self, "_updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier:completionHandler:", v15, v11);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v11[2](v11, 0);
    goto LABEL_12;
  }
  v11[2](v11, 0);
LABEL_13:

}

- (void)_getLibraryInfo
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_fetchTransportScope
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)launch
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeUpdateScopeTask;
  -[CPLEngineSyncTask launch](&v10, sel_launch);
  -[CPLEngineScopedTask transportScope](self, "transportScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CPLEngineScopedTask store](self, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__CPLScopeUpdateScopeTask_launch__block_invoke;
    v9[3] = &unk_1E60DD838;
    v9[4] = self;
    v5 = (id)objc_msgSend(v4, "performReadTransactionWithBlock:", v9);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scopeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Will need to fetch transport scope for %@", buf, 0xCu);

      }
    }
    -[CPLScopeUpdateScopeTask _fetchTransportScope](self, "_fetchTransportScope");
  }
}

- (void)cancel
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  v9.receiver = self;
  v9.super_class = (Class)CPLScopeUpdateScopeTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__CPLScopeUpdateScopeTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineSyncTask session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDefer");

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = objc_opt_class();
        v8 = *(id *)&v13[4];
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v13, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError", *(_OWORD *)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v9);

    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;

  }
  return v10;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.updatescope");
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  CPLScopeUpdateScopeTask *v17;
  id v18;
  _QWORD block[4];
  id v20;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__CPLScopeUpdateScopeTask_task_didFinishWithError___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v20 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookForStagingScopeTask, 0);
  objc_storeStrong((id *)&self->_fetchedTransportScope, 0);
  objc_storeStrong((id *)&self->_fetchTransportScope, 0);
  objc_storeStrong((id *)&self->_getLibraryInfo, 0);
  objc_storeStrong((id *)&self->_previousScopeChange, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __51__CPLScopeUpdateScopeTask_task_didFinishWithError___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 152))
    return objc_msgSend(*(id *)(result + 40), "taskDidFinishWithError:", *(_QWORD *)(result + 48));
  return result;
}

uint64_t __33__CPLScopeUpdateScopeTask_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "cancel");
}

uint64_t __33__CPLScopeUpdateScopeTask_launch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeChangeForScope:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  return objc_msgSend(*(id *)(a1 + 32), "_getLibraryInfo");
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  _QWORD v18[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:", v17);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE **)(a1 + 32);
    if (v7[144])
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "transportScope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_BYTE **)(a1 + 32);
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2;
    v18[3] = &unk_1E60DC010;
    v18[4] = v7;
    objc_msgSend(v5, "fetchTransportScopeForScope:transportScope:completionHandler:", v6, v8, v18);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 128);
    *(_QWORD *)(v10 + 128) = v9;

    if (!v8)
    {
      objc_msgSend(v6, "scopeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "store");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mainScopeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if (v15)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setShouldCreateScopeIfNecessary:", 1);
    }
    objc_msgSend(v5, "createGroupForSetup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), v16);

  }
}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD block[4];
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 104);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3;
  v19[3] = &unk_1E60D6FB0;
  v20 = v9;
  v21 = v7;
  v22 = v10;
  v23 = v8;
  v13 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v25 = v13;
  v14 = v11;
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int8x16_t v14;
  _QWORD v15[5];
  _QWORD v16[4];
  int8x16_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 48), "scope");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "scopeIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v19 = v5;
          _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Transport returned no transport scope for %@ but no error either", buf, 0xCu);

        }
      }
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 136), *(id *)(a1 + 40));
  if (v2)
  {
    if (objc_msgSend(v2, "isCPLErrorWithCode:", 23))
    {
      objc_msgSend(*(id *)(a1 + 48), "_markScopeAsDeletedAndSucceedTaskWithFlags:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      v10 = objc_msgSend(v2, "isCPLErrorWithCode:", 1002);
      v11 = *(void **)(a1 + 48);
      if (v10)
        objc_msgSend(v11, "_markScopeAsFeatureDisabledWithFlags:", 0);
      else
        objc_msgSend(v11, "taskDidFinishWithError:", v2);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_61;
    v16[3] = &unk_1E60DD810;
    v14 = *(int8x16_t *)(a1 + 40);
    v8 = (id)v14.i64[0];
    v17 = vextq_s8(v14, v14, 8uLL);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3_63;
    v15[3] = &unk_1E60DD838;
    v15[4] = *(_QWORD *)(a1 + 48);
    v9 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v16, v15);

  }
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(v12 + 128);
  *(_QWORD *)(v12 + 128) = 0;

}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_61(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v12 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scopes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeChangeForScope:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 112);
    *(_QWORD *)(v7 + 112) = v6;

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2_62;
    v13[3] = &unk_1E60DDA58;
    v14 = v4;
    v15 = *(id *)(a1 + 40);
    v16 = v5;
    v17 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v4;
    objc_msgSend(v12, "do:", v13);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v12, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v10);
    goto LABEL_5;
  }
LABEL_6:

}

void __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_3_63(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:", v5);

  }
  else
  {
    objc_msgSend(v4, "_getLibraryInfo");
  }

}

uint64_t __47__CPLScopeUpdateScopeTask__fetchTransportScope__block_invoke_2_62(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "setTransportScope:forScope:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 56), "transportScope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 1;
    else
      return objc_msgSend(*(id *)(a1 + 32), "setupInitialSyncTransportGroupsForScope:error:", *(_QWORD *)(a1 + 48), a2);
  }
  return result;
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:", v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[17];
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(v6, "transportScope");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(v11 + 112);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_2;
    v19[3] = &unk_1E60DBFE8;
    v19[4] = v11;
    v20 = v9;
    v13 = v9;
    objc_msgSend(v5, "getScopeInfoWithTransportScope:scope:previousScopeChange:completionHandler:", v13, v10, v12, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 120);
    *(_QWORD *)(v15 + 120) = v14;

    objc_msgSend(v5, "createGroupForLibraryStateCheck");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), v17);

  }
}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  dispatch_block_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD block[4];
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v17 = *(void **)(v15 + 104);
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_3;
  v26[3] = &unk_1E60DBFC0;
  v27 = v14;
  v28 = v15;
  v33 = a2;
  v29 = v11;
  v30 = v12;
  v31 = v16;
  v32 = v13;
  v19 = v26;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v35 = v19;
  v20 = v17;
  v21 = v13;
  v22 = v12;
  v23 = v11;
  v24 = v14;
  v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v20, v25);

}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_3(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "isCPLErrorWithCode:", 32))
    {
      v3 = *(_BYTE **)(a1 + 40);
      if (v3[144])
      {
        objc_msgSend(v3, "_markScopeHasBadTransportScopeWithError:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "scope");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v23 = v13;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "We will need to determine the transport scope for %@ again", buf, 0xCu);

          }
          v3 = *(_BYTE **)(a1 + 40);
        }
        v3[144] = 1;
        objc_msgSend(*(id *)(a1 + 40), "_fetchTransportScope");
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isCPLErrorWithCode:", 23))
    {
      objc_msgSend(*(id *)(a1 + 40), "_markScopeAsDeletedAndSucceedTaskWithFlags:", 0);
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "isCPLErrorWithCode:", 1002);
      v11 = *(void **)(a1 + 40);
      if (v10)
        objc_msgSend(v11, "_markScopeAsFeatureDisabledWithFlags:", 0);
      else
        objc_msgSend(v11, "taskDidFinishWithError:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_59;
    v16[3] = &unk_1E60DBF98;
    v16[4] = v5;
    v21 = v8;
    v17 = v4;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 72);
    objc_msgSend(v5, "_performAdditionalChecksWithNewScopeType:updatedScopeChange:updatedFlags:oldTransportScope:updatedTransportScope:completionHandler:", v8, v17, v6, v7, v9, v16);

  }
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 120);
  *(_QWORD *)(v14 + 120) = 0;

}

void __42__CPLScopeUpdateScopeTask__getLibraryInfo__block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Additional checks for %@ failed: %@", (uint8_t *)&v12, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", v3);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateScopeWithNewScopeType:updatedScopeChange:updatedFlags:oldTransportScope:session:updatedTransportScope:", v6, v8, v9, v10, v11, *(_QWORD *)(a1 + 64));

  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scopes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2;
    v15[3] = &unk_1E60DBF70;
    v7 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v4;
    v17 = v7;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v20 = v8;
    v21 = v9;
    v18 = v6;
    v19 = v3;
    v10 = v3;
    v11 = v6;
    v12 = v4;
    v13 = (id)objc_msgSend(v10, "performReadTransactionWithBlock:", v15);

  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void (**v13)(id, void *);
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  dispatch_block_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;

  v3 = a2;
  if (objc_msgSend(a1[4], "checkScopeIsValidInTransaction:", v3))
  {
    objc_msgSend(a1[5], "primaryScope");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_18:
      (*((void (**)(void))a1[9] + 2))();
      goto LABEL_19;
    }
    v5 = (void *)v4;
    objc_msgSend(a1[5], "sharingScopeForScope:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (unint64_t)a1[6];
    if (v7)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v11 = v7 | v9;

      if (v11)
        goto LABEL_15;
    }
    else
    {
      v15 = objc_msgSend((id)v7, "isEqual:");

      if ((v15 & 1) == 0)
      {
LABEL_15:
        objc_msgSend(a1[5], "transportScopeForScope:", v5);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;

          objc_msgSend(a1[5], "scopeChangeForScope:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = a1[4];
          v20 = (void *)v19[13];
          v21 = MEMORY[0x1E0C809B0];
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_52;
          v28[3] = &unk_1E60DBF48;
          v28[4] = v19;
          v36 = a1[9];
          v29 = a1[7];
          v30 = v17;
          v31 = v5;
          v32 = v18;
          v33 = a1[6];
          v34 = a1[8];
          v35 = a1[5];
          v22 = v28;
          block[0] = v21;
          block[1] = 3221225472;
          block[2] = __cpl_dispatch_async_block_invoke_14959;
          block[3] = &unk_1E60D71F8;
          v38 = v22;
          v23 = v20;
          v24 = v18;
          v25 = v5;
          v26 = v17;
          v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          dispatch_async(v23, v27);

          goto LABEL_19;
        }
      }
    }

    goto LABEL_18;
  }
  objc_msgSend(v3, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void (**)(id, void *))a1[9];
  if (v12)
    objc_msgSend(v3, "error");
  else
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v14);

LABEL_19:
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_52(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 96);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_53;
    v14[3] = &unk_1E60DBF20;
    v6 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 96);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 80);
    v18 = *(id *)(a1 + 88);
    objc_msgSend(v6, "getScopeInfoWithTransportScope:scope:previousScopeChange:completionHandler:", v3, v4, v5, v14);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 120);
    *(_QWORD *)(v8 + 120) = v7;

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Fetching rewind sync anchors from %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "createGroupForLibraryStateCheck");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), v12);

  }
}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_53(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;

  v8 = a3;
  v9 = a6;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60DBEF8;
  v19 = v9;
  v26 = *(id *)(a1 + 72);
  v12 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v8;
  v22 = v12;
  v23 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 64);
  v13 = v18;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_14959;
  block[3] = &unk_1E60D71F8;
  v28 = v13;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  void (*v2)(void);
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 88) + 16);
LABEL_3:
    v2();
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    v3 = *(_QWORD *)(a1 + 88);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 64);
        v17 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v30 = v16;
        v31 = 2114;
        v32 = v15;
        v33 = 2112;
        v34 = v17;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "While checking for rewind sync anchors for %@ (related to %{public}@), got an unexpected scope change: %@", buf, 0x20u);
      }

    }
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 88) + 16);
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 48), "rewindAnchorsPerSharingScopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 56);
        v8 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        v30 = v8;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Identified a new shared library (%{public}@) and %@ might need to rewind", buf, 0x16u);
      }

    }
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_55;
    v25[3] = &unk_1E60DBED0;
    v25[4] = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 72);
    v26 = *(id *)(a1 + 80);
    v27 = *(id *)(a1 + 56);
    v28 = v6;
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_57;
    v23[3] = &unk_1E60DD500;
    v12 = *(id *)(a1 + 88);
    v23[4] = *(_QWORD *)(a1 + 40);
    v24 = v12;
    v13 = (id)objc_msgSend(v11, "performWriteTransactionWithBlock:completionHandler:", v25, v23);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 56);
        v19 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Identified a new shared library (%{public}@) but there is no need to rewind %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

LABEL_24:
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(v21 + 120);
  *(_QWORD *)(v21 + 120) = 0;

}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_55(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "checkScopeIsValidInTransaction:", v3))
  {
    v4 = a1[5];
    objc_msgSend(a1[6], "scopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "localIndex");
    if (v7 == objc_msgSend(a1[6], "localIndex"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_56;
      v11[3] = &unk_1E60DD160;
      v12 = a1[5];
      v13 = a1[7];
      v14 = v6;
      objc_msgSend(v3, "do:", v11);

    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = a1[6];
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "%@ has been invalidated before being able to set rewind sync anchors", buf, 0xCu);
        }

      }
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setError:", v10);

    }
  }

}

void __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "error");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v4 = *(_QWORD *)(a1 + 40);
    if (!v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
      goto LABEL_7;
    }
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);

LABEL_7:
}

uint64_t __114__CPLScopeUpdateScopeTask__updateScopeChangeForPrimaryScopeRelatedToSharingScopeWithIdentifier_completionHandler___block_invoke_2_56(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRewindSyncAnchor:forScope:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3) & 1) != 0)
  {
    v15 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_2;
    v16[3] = &unk_1E60DBE80;
    v8 = *(_QWORD *)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v18 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_updateScopeWithNewScopeType:scope:updatedScopeChange:updatedFlags:oldTransportScope:updatedTransportScope:shouldUpdateTransportScope:store:transport:session:inTransaction:", v4, v5, v8, v6, v7, v9, v16, v11, v10, v12, v3);

  }
  else
  {
    objc_msgSend(v3, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setError:", v14);

    }
  }

}

void __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_49(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskDidFinishWithError:", v3);

}

BOOL __136__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_updatedScopeChange_updatedFlags_oldTransportScope_session_updatedTransportScope___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 136);
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "concreteScopeFromTransportScope:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "concreteScopeFromTransportScope:", *(_QWORD *)(a1 + 48));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Updated fetched transport scope from %@ to %@", (uint8_t *)&v10, 0x16u);

      }
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v4 + 136), *(id *)(a1 + 48));
  }

  return v5 == 0;
}

void __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:") & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_2;
    v6[3] = &unk_1E60DD6D0;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "do:", v6);
  }
  else
  {
    objc_msgSend(v5, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setError:", v4);

    }
  }

}

void __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (!v4)
    v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "taskDidFinishWithError:", v4);

}

uint64_t __67__CPLScopeUpdateScopeTask__markScopeHasBadTransportScopeWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "setTransportScope:forScope:error:", 0, v6, a2);

  return v7;
}

void __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:") & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_2;
    v7[3] = &unk_1E60DDA30;
    v3 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    objc_msgSend(v6, "do:", v7);

  }
  else
  {
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setError:", v5);

    }
  }

}

void __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskDidFinishWithError:", v3);

}

uint64_t __64__CPLScopeUpdateScopeTask__markScopeAsFeatureDisabledWithFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  int v19;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transportScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    v16 = *(_QWORD **)(a1 + 32);
    v17 = v16[17];
    if (v17)
    {
      objc_msgSend(v16, "scope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v5, "setTransportScope:forScope:error:", v17, v18, a2);

      if (!v19)
        goto LABEL_10;
    }
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v7, "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "updateFlags:forScope:error:", v8, v9, a2);

    if (v10)
    {
      v7 = *(void **)(a1 + 32);
      goto LABEL_6;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_13;
  }
LABEL_6:
  objc_msgSend(v7, "scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeChangeForScope:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "libraryInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "setLibraryState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "storeScopeChange:forScope:error:", v12, v14, a2);

  }
  else
  {
    v15 = 1;
  }

LABEL_13:
  return v15;
}

void __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:") & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_2;
    v7[3] = &unk_1E60DBDE8;
    v3 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v6, "do:", v7);

  }
  else
  {
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setError:", v5);

    }
  }

}

void __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_38(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:", v5);

  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
         && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_lookForStagingScopeWithIdentifier:transportScope:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", 0);
  }

}

uint64_t __70__CPLScopeUpdateScopeTask__markScopeAsDeletedAndSucceedTaskWithFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  void *v44;
  int v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transportScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    v20 = *(_QWORD **)(a1 + 32);
    v21 = v20[17];
    if (v21)
    {
      objc_msgSend(v20, "scope");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "setTransportScope:forScope:error:", v21, v22, a2);

      if (!(_DWORD)v10)
        goto LABEL_26;
    }
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v7, "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "updateFlags:forScope:error:", v8, v9, a2);

    if (!(_DWORD)v10)
      goto LABEL_26;
    v7 = *(void **)(a1 + 32);
  }
  objc_msgSend(v7, "scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(v11, "scopeType"));
  if (v12)
    v13 = 68;
  else
    v13 = 4;

  objc_msgSend(*(id *)(a1 + 32), "scope");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "setValue:forFlag:forScope:error:", 1, v13, v14, a2);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stagingScopeForScope:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_25:

      goto LABEL_26;
    }
    v17 = *(_QWORD **)(a1 + 32);
    v18 = (void *)v17[17];
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      objc_msgSend(v17, "transportScope");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v19;
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transport");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = 0;
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transportUserIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v23;
    v45 = objc_msgSend(v25, "getProposedStagingScopeIdentifier:stagingTransportScope:forScope:transportScope:transportUserIdentifier:", &v47, &v46, v26, v23, v27);
    v28 = v47;
    obj = v46;
    v29 = v46;

    v16 = 0;
    if (v45)
    {
      if (v28)
      {
        if (v29)
        {
          objc_msgSend(v5, "scopeWithIdentifier:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v16 = 0;
          }
          else
          {
            objc_msgSend(v5, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v28, 0, 16, v29, a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
          }
          goto LABEL_24;
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v40;
            _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_ERROR, "We should have a proposed staging scope transport scope for %@ here", buf, 0xCu);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 56);
        v42 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v41, v42, v37, 214, CFSTR("We should have a proposed staging scope transport scope for %@ here"), v38, obj);
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "scope");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v33;
            _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "We should have a proposed staging scope identifier for %@ here", buf, 0xCu);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 56);
        v36 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, v37, 213, CFSTR("We should have a proposed staging scope identifier for %@ here"), v38, obj);
      }

      abort();
    }
LABEL_24:

    goto LABEL_25;
  }
LABEL_26:

  return v10;
}

void __77__CPLScopeUpdateScopeTask__lookForStagingScopeWithIdentifier_transportScope___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  CPLScopeUpdateScopeTask *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v2 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "taskDidFinishWithError:");

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v15 = v4;
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "%@ is staged with no known staging scope - will try to look for it directly as %{public}@", buf, 0x16u);

      }
    }
    v6 = [CPLScopeUpdateScopeTask alloc];
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientCacheIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CPLScopeUpdateScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v6, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v7, v8, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 152);
    *(_QWORD *)(v11 + 152) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "launch");
  }
}

+ (void)_updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v39;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int64_t v53;
  SEL v54;
  id v55;

  v36 = a4;
  v35 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  objc_msgSend(v21, "scopes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  if (!v20)
    v20 = &__block_literal_global_15001;
  v42[2] = __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke_2;
  v42[3] = &unk_1E60DBE58;
  v43 = v36;
  v44 = v17;
  v53 = a3;
  v54 = a2;
  v55 = a1;
  v45 = v35;
  v46 = v25;
  v47 = v19;
  v48 = v18;
  v49 = v22;
  v50 = v21;
  v51 = v23;
  v52 = v20;
  v41 = v23;
  v27 = v21;
  v28 = v22;
  v29 = v20;
  v30 = v18;
  v31 = v19;
  v32 = v26;
  v33 = v35;
  v34 = v17;
  v39 = v36;
  objc_msgSend(v24, "do:", v42);

}

+ (void)updateScopeWithNewScopeType:(int64_t)a3 scope:(id)a4 updatedScopeChange:(id)a5 updatedFlags:(id)a6 oldTransportScope:(id)a7 updatedTransportScope:(id)a8 shouldUpdateTransportScope:(id)a9 store:(id)a10 transport:(id)a11 session:(id)a12 inTransaction:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v34;
  id v35;
  id v36;
  id v37;

  v37 = a4;
  v35 = a5;
  v34 = a6;
  v17 = a7;
  v36 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  objc_msgSend(v19, "scopes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scopeIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scopeWithIdentifier:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && (v26 = objc_msgSend(v25, "cloudIndex"), v26 == objc_msgSend(v37, "cloudIndex")))
  {
    v28 = v34;
    v27 = v35;
    objc_msgSend(a1, "_updateScopeWithNewScopeType:scope:updatedScopeChange:updatedFlags:oldTransportScope:updatedTransportScope:shouldUpdateTransportScope:store:transport:session:inTransaction:", a3, v37, v35, v34, v17, v36, v18, v19, v20, v21, v22);
  }
  else
  {
    objc_msgSend(v37, "scopeIdentifier");
    v29 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("%@ has become stale before updating scope info"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setError:", v31);

    v17 = v29;
    v28 = v34;
    v27 = v35;
  }

}

uint64_t __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  int v54;
  NSObject *v55;
  void *v56;
  char v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  id v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  if (!v7)
  {
    if (v4)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v5;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "%@ is a scope we don't support anymore", buf, 0xCu);
        }

      }
    }
    else if (objc_msgSend(v5, "scopeType"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v5;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ was degraded and can't be identified anymore", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v5, "scopeType");
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v5;
          _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "%@ is a scope we still don't support", buf, 0xCu);
        }

      }
      v4 = 0;
    }
LABEL_36:
    if (v4 == objc_msgSend(v5, "scopeType"))
    {
      v23 = 1;
      v24 = v5;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "flagsForScope:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(a1 + 56);
      objc_msgSend(v5, "scopeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scopeWithIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v106 = v5;
            v107 = 2112;
            v108 = v94;
            _os_log_impl(&dword_1B03C2000, v93, OS_LOG_TYPE_ERROR, "Failed to find %@ after upgrading its scope type to %@", buf, 0x16u);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = *(_QWORD *)(a1 + 120);
        v95 = *(_QWORD *)(a1 + 128);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v96, v95, v97, 367, CFSTR("Failed to find %@ after upgrading its scope type to %@"), v5, v98);

LABEL_143:
        goto LABEL_144;
      }
      v24 = v28;

      v29 = *(void **)(a1 + 56);
      objc_msgSend(v24, "scopeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "shouldAutoactivateScopeWithIdentifier:scopeType:", v30, v4))
      {
        v31 = objc_msgSend(v25, "valueForFlag:", 0x10000);

        if (v31
          && objc_msgSend(v25, "valueForFlag:", 16)
          && (objc_msgSend(v25, "valueForFlag:", 32) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v24, "scopeIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v106 = v33;
              v107 = 2114;
              v108 = v34;
              _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_DEFAULT, "Identified %{public}@ as %{public}@ - enabling sync for this scope", buf, 0x16u);

            }
          }
          objc_msgSend(v25, "setValue:forFlag:", 0, 16);
        }
      }
      else
      {

      }
      if (v6 && objc_msgSend(v6, "hasFlagUpdates"))
      {
        objc_msgSend(v25, "updateFlags:", v6);

        v6 = 0;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v24, "scopeIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v106 = v36;
          v107 = 2114;
          v108 = v37;
          v109 = 2114;
          v110 = v25;
          _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEFAULT, "After scope type for %{public}@ was upgraded to %{public}@, scope flags are %{public}@", buf, 0x20u);

        }
      }
      v23 = objc_msgSend(*(id *)(a1 + 56), "updateFlags:forScope:error:", v25, v24, a2);

      if (!v23)
        goto LABEL_62;
    }
    if (v6 && objc_msgSend(v6, "hasFlagUpdates"))
    {
      objc_msgSend(*(id *)(a1 + 56), "flagsForScope:", v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38 && (v40 = objc_msgSend(v38, "flags"), v40 != objc_msgSend(v6, "flags")))
      {
        objc_msgSend(v39, "updateFlags:", v6);
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "scopeIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v106 = v56;
            v107 = 2114;
            v108 = v39;
            _os_log_impl(&dword_1B03C2000, v55, OS_LOG_TYPE_DEFAULT, "Updating flags for %{public}@: %{public}@", buf, 0x16u);

          }
        }
        v57 = objc_msgSend(*(id *)(a1 + 56), "updateFlags:forScope:error:", v6, v24, a2);

        if ((v57 & 1) == 0)
          goto LABEL_85;
      }
      else
      {

      }
LABEL_63:
      if (*(_QWORD *)(a1 + 64)
        && (objc_msgSend(*(id *)(a1 + 72), "isEqual:") & 1) == 0
        && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 104) + 16))())
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 80), "concreteScopeFromTransportScope:", *(_QWORD *)(a1 + 72));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 80), "concreteScopeFromTransportScope:", *(_QWORD *)(a1 + 64));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v106 = v42;
            v107 = 2112;
            v108 = v43;
            _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_DEFAULT, "Updated transport scope from %@ to %@", buf, 0x16u);

          }
        }
        v44 = objc_msgSend(*(id *)(a1 + 56), "setTransportScope:forScope:error:", *(_QWORD *)(a1 + 64), v24, a2);
        if (!v44)
        {
LABEL_84:
          if (!v44)
            goto LABEL_85;
LABEL_120:
          v77 = *(void **)(a1 + 96);
          if (v77)
          {
            objc_msgSend(v77, "scopeFilter");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (v78)
            {
              objc_msgSend(*(id *)(a1 + 56), "updatedScopeFilter:", v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              if (v79 != v78)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLTaskOSLogDomain_14898();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                  {
                    v81 = *(void **)(a1 + 96);
                    objc_msgSend(v78, "simpleDescription");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "simpleDescription");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v106 = v81;
                    v107 = 2114;
                    v108 = v82;
                    v109 = 2114;
                    v110 = v83;
                    _os_log_impl(&dword_1B03C2000, v80, OS_LOG_TYPE_DEFAULT, "Updating scope filter for %@ from %{public}@ to %{public}@", buf, 0x20u);

                  }
                }
                objc_msgSend(*(id *)(a1 + 96), "updateScopeFilter:", v79);
              }

            }
          }
          v21 = 1;
          goto LABEL_131;
        }
      }
      else
      {
        v44 = 1;
      }
      if (!v24)
        goto LABEL_84;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_84;
      v45 = *(id *)(a1 + 48);
      objc_msgSend(v45, "stagedScopeChange");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (!v46
        || (v48 = *(void **)(a1 + 88),
            objc_msgSend(v46, "scopeIdentifier"),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v48) = objc_msgSend(v48, "mainScopeSupportsSharingScopeWithIdentifier:", v49),
            v49,
            !(_DWORD)v48))
      {

        goto LABEL_120;
      }
      if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(v47, "scopeType")))
      {
        objc_msgSend(v47, "scopeIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "scopeWithIdentifier:", v50);
        v51 = objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = (void *)v51;
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v106 = v52;
              v107 = 2112;
              v108 = v24;
              v109 = 2112;
              v110 = v47;
              _os_log_impl(&dword_1B03C2000, v53, OS_LOG_TYPE_DEFAULT, "Updating staged %@ from info provided by %@: %@", buf, 0x20u);
            }

          }
          v54 = objc_msgSend(*(id *)(a1 + 56), "storeScopeChange:forScope:error:", v47, v52, a2);
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v106 = v24;
              v107 = 2114;
              v108 = v50;
              v109 = 2112;
              v110 = v47;
              _os_log_impl(&dword_1B03C2000, v58, OS_LOG_TYPE_DEFAULT, "%@ is a staging scope for unknown %{public}@. Assuming it has been deleted before we know. Using staged scope change: %@", buf, 0x20u);
            }

          }
          objc_msgSend(*(id *)(a1 + 56), "beginCreatingScopeWithIdentifier:", v50);
          v59 = *(void **)(a1 + 56);
          objc_msgSend(v47, "scopeType");
          objc_msgSend(v45, "stagedScopeFlags");
          objc_msgSend(v45, "stagedTransportScope");
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v50;
          v62 = (void *)v60;
          v104 = v61;
          objc_msgSend(v59, "createScopeWithIdentifier:scopeType:flags:transportScope:error:");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
            goto LABEL_117;
          objc_msgSend(*(id *)(a1 + 56), "flagsForScope:", v52);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v106 = v52;
              _os_log_impl(&dword_1B03C2000, v64, OS_LOG_TYPE_DEFAULT, "Marking %@ as deleted immediately", buf, 0xCu);
            }

          }
          v65 = v52;
          v66 = +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(v65, "scopeType"));

          v67 = v66 ? 68 : 4;
          objc_msgSend(v63, "setValue:forFlag:", 1, v67);
          v68 = *(void **)(a1 + 56);
          objc_msgSend(v65, "scopeIdentifier");
          v102 = v63;
          v103 = v65;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v68, "shouldAutoactivateScopeWithIdentifier:scopeType:", v69, objc_msgSend(v65, "scopeType")))
          {
            v70 = objc_msgSend(v102, "valueForFlag:", 0x10000);

            v71 = v102;
            if (v70
              && objc_msgSend(v102, "valueForFlag:", 16)
              && (objc_msgSend(v102, "valueForFlag:", 32) & 1) == 0)
            {
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_14898();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v65, "scopeIdentifier");
                  v73 = v72;
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v103, "scopeType"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v106 = v74;
                  v107 = 2114;
                  v108 = v75;
                  _os_log_impl(&dword_1B03C2000, v73, OS_LOG_TYPE_DEFAULT, "Identified %{public}@ as %{public}@ (inferred from staging scope) - enabling sync for this scope", buf, 0x16u);

                  v72 = v73;
                  v71 = v102;
                  v65 = v103;
                }

              }
              objc_msgSend(v71, "setValue:forFlag:", 0, 16);
            }
          }
          else
          {

            v71 = v102;
          }
          v76 = objc_msgSend(*(id *)(a1 + 56), "updateFlags:forScope:error:", v71, v65, a2);

          if (v76)
            v54 = objc_msgSend(*(id *)(a1 + 56), "storeScopeChange:forScope:error:", v47, v65, a2);
          else
LABEL_117:
            v54 = 0;
          v50 = v104;
          objc_msgSend(*(id *)(a1 + 56), "endCreatingScopeWithIdentifier:", v104);
        }

        if (!v54)
          goto LABEL_85;
        goto LABEL_120;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_14898();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v47;
          _os_log_impl(&dword_1B03C2000, v99, OS_LOG_TYPE_ERROR, "Staging is unsupported for %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = *(_QWORD *)(a1 + 120);
      v100 = *(_QWORD *)(a1 + 128);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v101, v100, v97, 403, CFSTR("Staging is unsupported for %@"), v47);
      goto LABEL_143;
    }
LABEL_62:
    if (!v23)
    {
LABEL_85:
      v21 = 0;
LABEL_131:
      v5 = v24;
      goto LABEL_132;
    }
    goto LABEL_63;
  }
  if (v4 != objc_msgSend(v7, "scopeType"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v106 = v86;
        v107 = 2112;
        v108 = v87;
        _os_log_impl(&dword_1B03C2000, v85, OS_LOG_TYPE_ERROR, "Invalid scope type %@ for scope change %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = *(_QWORD *)(a1 + 120);
    v90 = *(_QWORD *)(a1 + 128);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLScopeUpdateTask.m");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v4);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v89, v90, v91, 323, CFSTR("Invalid scope type %@ for scope change %@"), v92, *(_QWORD *)(a1 + 48));

LABEL_144:
    abort();
  }
  if (objc_msgSend(*(id *)(a1 + 56), "storeScopeChange:forScope:error:", *(_QWORD *)(a1 + 48), v5, a2))
  {
    objc_msgSend(*(id *)(a1 + 48), "libraryState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "isDisabled");
    else
      v10 = 0;
    objc_msgSend(*(id *)(a1 + 56), "flagsForScope:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      v15 = objc_msgSend(*(id *)(a1 + 56), "setValue:forFlag:forScope:error:", 1, 8, v5, a2);
      objc_msgSend(v9, "disabledDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v15 & 1) != 0)
      {
        v18 = objc_msgSend(*(id *)(a1 + 56), "setDisabledDate:forScope:error:", v16, v5, a2);

        if ((v18 & 1) == 0)
          goto LABEL_29;
LABEL_26:
        v19 = *(void **)(a1 + 56);
        objc_msgSend(v9, "deleteDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v19, "setDeleteDate:forScope:error:", v20, v5, a2);

        if ((_DWORD)v19)
          goto LABEL_36;
        goto LABEL_30;
      }

    }
    else
    {
      if (!objc_msgSend(v13, "valueForFlag:", 8)
        || (objc_msgSend(v14, "valueForFlag:", 0x40000) & 1) != 0)
      {
        goto LABEL_26;
      }
      objc_msgSend(v14, "setValue:forFlag:", 0, 8);
      if (objc_msgSend(*(id *)(a1 + 56), "updateFlags:forScope:error:", v14, v5, a2))
      {
        objc_msgSend(*(id *)(a1 + 56), "setDisabledDate:forScope:error:", 0, v5, a2);
        goto LABEL_26;
      }
    }
LABEL_29:

  }
LABEL_30:
  v21 = 0;
LABEL_132:

  return v21;
}

uint64_t __199__CPLScopeUpdateScopeTask__updateScopeWithNewScopeType_scope_updatedScopeChange_updatedFlags_oldTransportScope_updatedTransportScope_shouldUpdateTransportScope_store_transport_session_inTransaction___block_invoke()
{
  return 1;
}

@end
