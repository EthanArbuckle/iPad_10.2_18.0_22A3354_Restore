@implementation CPLPullScopesTask

- (CPLPullScopesTask)initWithEngineLibrary:(id)a3 session:(id)a4
{
  id v6;
  CPLPullScopesTask *v7;
  uint64_t v8;
  CPLEngineStore *store;
  uint64_t v10;
  CPLEngineScopeStorage *scopes;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLPullScopesTask;
  v7 = -[CPLEngineSyncTask initWithEngineLibrary:session:](&v13, sel_initWithEngineLibrary_session_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "store");
    v8 = objc_claimAutoreleasedReturnValue();
    store = v7->_store;
    v7->_store = (CPLEngineStore *)v8;

    -[CPLEngineStore scopes](v7->_store, "scopes");
    v10 = objc_claimAutoreleasedReturnValue();
    scopes = v7->_scopes;
    v7->_scopes = (CPLEngineScopeStorage *)v10;

  }
  return v7;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.pullscopes");
}

- (BOOL)_checkShouldHandleBatchInTransaction:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  char v9;

  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled", a3) || self->_ignoreNewChanges || self->_badError)
    return 0;
  v4 = self->_clientCacheIdentifier;
  -[CPLEngineStore clientCacheIdentifier](self->_store, "clientCacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9 = objc_msgSend((id)v4, "isEqual:", v5);

    if ((v9 & 1) != 0)
      return 1;
    goto LABEL_10;
  }

  if (v4 | v6)
  {
LABEL_10:
    -[CPLPullScopesTask cancel](self, "cancel");
    return 0;
  }
  return 1;
}

- (void)_handleChangedOrNewScopes:(id)a3 deletedScopeIdentifiers:(id)a4 newScopeListSyncAnchor:(id)a5
{
  id v7;
  id v8;
  CPLEngineStore *store;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  store = self->_store;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke;
  v14[3] = &unk_1E60DD2A8;
  v14[4] = self;
  v15 = v8;
  v16 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_5;
  v13[3] = &unk_1E60DD838;
  v13[4] = self;
  v10 = v7;
  v11 = v8;
  v12 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](store, "performWriteTransactionWithBlock:completionHandler:", v14, v13);

}

- (void)_handleFinalScopeListSyncAnchor:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CPLEngineStore *store;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  store = self->_store;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke;
  v15[3] = &unk_1E60DD2A8;
  v15[4] = self;
  v16 = v7;
  v17 = v6;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_3;
  v13[3] = &unk_1E60DD810;
  v13[4] = self;
  v14 = v16;
  v10 = v16;
  v11 = v6;
  v12 = -[CPLEngineStore performWriteTransactionWithBlock:completionHandler:](store, "performWriteTransactionWithBlock:completionHandler:", v15, v13);

}

- (void)launch
{
  CPLEngineStore *store;
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLPullScopesTask;
  -[CPLEngineSyncTask launch](&v6, sel_launch);
  store = self->_store;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__CPLPullScopesTask_launch__block_invoke;
  v5[3] = &unk_1E60DD838;
  v5[4] = self;
  v4 = -[CPLEngineStore performReadTransactionWithBlock:](store, "performReadTransactionWithBlock:", v5);
}

- (void)cancel
{
  CPLEngineStore *store;
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLPullScopesTask;
  -[CPLEngineSyncTask cancel](&v6, sel_cancel);
  store = self->_store;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__CPLPullScopesTask_cancel__block_invoke;
  v5[3] = &unk_1E60DD838;
  v5[4] = self;
  v4 = -[CPLEngineStore performReadTransactionWithBlock:](store, "performReadTransactionWithBlock:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badError, 0);
  objc_storeStrong((id *)&self->_fetchChangesTask, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

uint64_t __27__CPLPullScopesTask_cancel__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancel");
}

void __27__CPLPullScopesTask_launch__block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  char v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:");

  }
  else
  {
    v4 = objc_msgSend(v3[10], "shouldSyncScopeList");
    v5 = *(id **)(a1 + 32);
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5[10], "clientCacheIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 96);
      *(_QWORD *)(v7 + 96) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "scopeListSyncAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transport");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __27__CPLPullScopesTask_launch__block_invoke_2;
      v20[3] = &unk_1E60D7E70;
      v21 = *(_QWORD *)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __27__CPLPullScopesTask_launch__block_invoke_3;
      v19[3] = &unk_1E60D7E98;
      v19[4] = v21;
      objc_msgSend(v11, "fetchScopeListChangesForScopeListSyncAnchor:progressHandler:completionHandler:", v9, v20, v19);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 104);
      *(_QWORD *)(v13 + 104) = v12;

      objc_msgSend(v11, "createGroupForFetchScopeListChanges");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_2369();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
          *(_DWORD *)buf = 138412290;
          v23 = v17;
          _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Launching %@", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), v15);

    }
    else
    {
      objc_msgSend(v5, "taskDidFinishWithError:", 0);
    }
  }
}

uint64_t __27__CPLPullScopesTask_launch__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleChangedOrNewScopes:deletedScopeIdentifiers:newScopeListSyncAnchor:", a2, a3, a4);
}

uint64_t __27__CPLPullScopesTask_launch__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinalScopeListSyncAnchor:error:", a2, a3);
}

void __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_checkShouldHandleBatchInTransaction:") && !*(_QWORD *)(a1 + 40))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_2;
    v4[3] = &unk_1E60DDA30;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v3, "do:", v4);

  }
}

void __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (!v4)
  {
    if (v5[14] || *(_QWORD *)(a1 + 40))
    {
      v8 = *(void **)(a1 + 32);
    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
      v5 = *(_QWORD **)(a1 + 32);
      if (v11)
      {
        +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (v5[16] + v5[15] + v5[17])
        v12 = _CPLSilentLogging == 0;
      else
        v12 = 0;
      if (v12)
      {
        __CPLTaskOSLogDomain_2369();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD **)(a1 + 32);
          v15 = v14[16];
          v16 = v14[15];
          v17 = v14[17];
          v18 = 134218496;
          v19 = v15;
          v20 = 2048;
          v21 = v16;
          v22 = 2048;
          v23 = v17;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Finishing updating scope list with %lu new scopes, %lu deletes scopes and %lu modified scopes", (uint8_t *)&v18, 0x20u);
        }

        v5 = *(_QWORD **)(a1 + 32);
      }
      v8 = v5;
    }
    objc_msgSend(v8, "taskDidFinishWithError:");
    goto LABEL_8;
  }
  objc_msgSend(v3, "error");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = (void *)v6;
  objc_msgSend(v5, "taskDidFinishWithError:", v6);

LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 104);
  *(_QWORD *)(v9 + 104) = 0;

}

uint64_t __59__CPLPullScopesTask__handleFinalScopeListSyncAnchor_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "storeScopeListSyncAnchor:error:", *(_QWORD *)(a1 + 40), a2);
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v5 = a2;
  if (objc_msgSend(a1[4], "_checkShouldHandleBatchInTransaction:"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_2;
    v6[3] = &unk_1E60DD160;
    v3 = a1[5];
    v4 = a1[4];
    v7 = v3;
    v8 = v4;
    v9 = a1[6];
    objc_msgSend(v5, "do:", v6);

  }
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "error");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 112);
    *(_QWORD *)(v6 + 112) = v5;

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_2369();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Failed to handle scope list changes: %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancel");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  }

}

BOOL __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  __int128 v15;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "scopeWithIdentifier:", v8, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_2369();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = v15;
              *(_QWORD *)((char *)&buf + 4) = v8;
              _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Scope %@ has been deleted according to server - we will need to check that", (uint8_t *)&buf, 0xCu);
            }

          }
          v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setScopeNeedsUpdateFromTransport:error:", v9, a2);
          *((_BYTE *)v23 + 24) = v11;
          if (!v11)
          {

            goto LABEL_17;
          }
          ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 120);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_17:

  if (*((_BYTE *)v23 + 24))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2381;
    v29 = __Block_byref_object_dispose__2382;
    v30 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_1;
    v17[3] = &unk_1E60D7E48;
    v12 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v17[5] = &v22;
    v17[6] = &buf;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
    if (a2 && !*((_BYTE *)v23 + 24))
      *a2 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);

    v13 = *((_BYTE *)v23 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v22, 8);
  return v13;
}

void __94__CPLPullScopesTask__handleChangedOrNewScopes_deletedScopeIdentifiers_newScopeListSyncAnchor___block_invoke_1(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1[4] + 88), "scopeWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_2369();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Scope %@ has changes to pull from the server", buf, 0xCu);
      }

    }
    ++*(_QWORD *)(a1[4] + 136);
    v11 = *(void **)(a1[4] + 88);
    v12 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "setScopeHasChangesToPullFromTransport:error:", v9, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v13;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      goto LABEL_23;
    v14 = *(void **)(a1[4] + 88);
    objc_msgSend(v8, "updatedTransportScope");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[6] + 8);
    v33 = *(id *)(v16 + 40);
    LOBYTE(v14) = objc_msgSend(v14, "setTransportScope:forScope:error:", v15, v9, &v33);
    objc_storeStrong((id *)(v16 + 40), v33);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (_BYTE)v14;

    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      goto LABEL_23;
    objc_msgSend(*(id *)(a1[4] + 88), "scopeChangeForScope:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "updateScopeChange:", v17))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_2369();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v9;
          v37 = 2112;
          v38 = v17;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Updating scope change for %@ to %@", buf, 0x16u);
        }

      }
      v19 = *(void **)(a1[4] + 88);
      v20 = *(_QWORD *)(a1[6] + 8);
      v32 = *(id *)(v20 + 40);
      v21 = objc_msgSend(v19, "storeScopeChange:forScope:error:", v17, v9, &v32);
      objc_storeStrong((id *)(v20 + 40), v32);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v21;
    }
  }
  else
  {
    ++*(_QWORD *)(a1[4] + 128);
    v22 = *(void **)(a1[4] + 88);
    objc_msgSend(v8, "updatedTransportScope");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1[6] + 8);
    v31 = *(id *)(v24 + 40);
    objc_msgSend(v22, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v7, 0, 16, v23, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v24 + 40), v31);

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v17 != 0;
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(*(id *)(a1[4] + 88), "scopeChangeForScope:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "updateScopeChange:", v25))
      {
        v26 = *(void **)(a1[4] + 88);
        v27 = *(_QWORD *)(a1[6] + 8);
        v30 = *(id *)(v27 + 40);
        v28 = objc_msgSend(v26, "storeScopeChange:forScope:error:", v25, v17, &v30);
        objc_storeStrong((id *)(v27 + 40), v30);
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v28;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_2369();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v7;
          v37 = 2112;
          v38 = v25;
          _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, "Scope %@ is new - will try to identify it. Initial scope change is %@", buf, 0x16u);
        }

      }
    }
  }

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
LABEL_23:
    *a4 = 1;

}

@end
