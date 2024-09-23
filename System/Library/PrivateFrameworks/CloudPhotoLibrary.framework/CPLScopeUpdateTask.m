@implementation CPLScopeUpdateTask

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorForScopesNeedingUpdateFromTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLScopeUpdateTask;
  v7 = -[CPLEngineMultiscopeSyncTask shouldProcessScope:inTransaction:](&v9, sel_shouldProcessScope_inTransaction_, v6, a4)|| objc_msgSend(v6, "scopeType") == 0;

  return v7;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLScopeUpdateScopeTask *v14;
  void *v15;
  CPLScopeUpdateScopeTask *v16;
  NSMutableSet *possibleStagedScopes;
  NSMutableSet *v18;
  NSMutableSet *v19;
  void *v20;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = [CPLScopeUpdateScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLScopeUpdateScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v13, v11, v10, v12);

  if (+[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(v10, "scopeType")))
  {
    possibleStagedScopes = self->_possibleStagedScopes;
    if (!possibleStagedScopes)
    {
      v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v19 = self->_possibleStagedScopes;
      self->_possibleStagedScopes = v18;

      possibleStagedScopes = self->_possibleStagedScopes;
    }
    objc_msgSend(v10, "scopeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](possibleStagedScopes, "addObject:", v20);

  }
  return v16;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.updatescope");
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13;
  CPLScopeUpdateTask *v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLScopeUpdateTask;
    -[CPLEngineSyncTask taskDidFinishWithError:](&v10, sel_taskDidFinishWithError_, v4);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke;
    v12[3] = &unk_1E60DD280;
    v8 = v6;
    v13 = v8;
    v14 = self;
    v15 = v16;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_5;
    v11[3] = &unk_1E60DDB58;
    v11[4] = self;
    v11[5] = v16;
    v9 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v12, v11);

    _Block_object_dispose(v16, 8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStagedScopes, 0);
}

void __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_2;
  v7[3] = &unk_1E60DDB30;
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v6 = v5;
  objc_msgSend(v4, "do:", v7);

}

void __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 1);

  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = v6;
    v15.super_class = (Class)CPLScopeUpdateTask;
    objc_msgSendSuper2(&v15, sel_taskDidFinishWithError_, v7);
  }
  else
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "supervisor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scopeUpdateTaskDidFinishSuccessfully:", *(_QWORD *)(a1 + 32));

      v13.receiver = *(id *)(a1 + 32);
      v13.super_class = (Class)CPLScopeUpdateTask;
      objc_msgSendSuper2(&v13, sel_taskDidFinishWithError_, 0);
      goto LABEL_12;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_14898();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLEngineSyncManager shortDescriptionForState:](CPLEngineSyncManager, "shortDescriptionForState:", 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Restarting from %@ to verify all scopes", buf, 0xCu);

      }
    }
    v10 = *(void **)(a1 + 32);
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("Need to verify all scopes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = v10;
    v14.super_class = (Class)CPLScopeUpdateTask;
    objc_msgSendSuper2(&v14, sel_taskDidFinishWithError_, v7);
  }

LABEL_12:
}

uint64_t __45__CPLScopeUpdateTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  _QWORD *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "enumeratorForDeletedStagedScopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v6 = v5;
    v26 = a2;
    v7 = 0;
    v8 = *(_QWORD *)v30;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
      objc_msgSend(*(id *)(a1 + 32), "stagingScopeForScope:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "valueForFlag:forScope:", 4, v11))
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v10;
              v35 = 2112;
              v36 = v11;
              v13 = v12;
              v14 = "%@ has been deleted and staged to %@ but this scope has also been deleted - removing staged flag";
              v15 = 22;
              goto LABEL_20;
            }
            goto LABEL_21;
          }
          goto LABEL_22;
        }
      }
      else
      {
        v16 = *(void **)(*(_QWORD *)(a1 + 40) + 152);
        objc_msgSend(v10, "scopeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v16, "containsObject:", v17);

        if (!(_DWORD)v16)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_14898();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v10;
              v13 = v12;
              v14 = "%@ is staged and deleted with no corresponding staging scope - removing staged flag";
              v15 = 12;
LABEL_20:
              _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
            }
LABEL_21:

          }
LABEL_22:
          v19 = *(void **)(a1 + 32);
          v28 = v7;
          v20 = objc_msgSend(v19, "setValue:forFlag:forScope:error:", 0, 64, v10, &v28);
          v21 = v28;

          if (!v20)
          {
            v7 = v21;
LABEL_30:

            if (v26)
            {
              v7 = objc_retainAutorelease(v7);
              v24 = 0;
              *v26 = v7;
            }
            else
            {
              v24 = 0;
            }
            goto LABEL_33;
          }
          v22 = *(void **)(a1 + 32);
          v27 = v21;
          v23 = objc_msgSend(v22, "setScopeNeedsToBePulledByClient:error:", v10, &v27);
          v7 = v27;

          if (!v23)
            goto LABEL_30;
          goto LABEL_24;
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_14898();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v10;
            _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "%@ has just been deleted with no corresponding staging scope - checking all scopes before discarding it", buf, 0xCu);
          }

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
LABEL_24:

      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v6)
          goto LABEL_3;

        goto LABEL_28;
      }
    }
  }

  v7 = 0;
LABEL_28:
  v24 = 1;
LABEL_33:

  return v24;
}

@end
