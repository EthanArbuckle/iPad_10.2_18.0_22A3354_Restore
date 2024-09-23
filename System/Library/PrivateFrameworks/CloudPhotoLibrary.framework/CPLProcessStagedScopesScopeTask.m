@implementation CPLProcessStagedScopesScopeTask

- (CPLProcessStagedScopesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  CPLProcessStagedScopesScopeTask *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPLProcessStagedScopesScopeTask;
  v7 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v12, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, a3, a4, a5, a6, a7);
  if (v7)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("engine.sync.processtagedscopes", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)_excludeScopes
{
  void *v3;
  void *v4;
  CPLEngineScope *destinationScope;
  void *v6;
  id v7;

  -[CPLEngineSyncTask session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludeScopeIdentifierFromPushToTransport:", v4);

  destinationScope = self->_destinationScope;
  if (destinationScope)
  {
    -[CPLEngineScope scopeIdentifier](destinationScope, "scopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "excludeScopeIdentifierFromPushToTransport:", v6);

  }
  objc_msgSend(v7, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);

}

- (void)_deleteStagingScopeIfNecessary
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_startActualCleanup
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
  v7[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_checkDestinationAndProcessCleanup
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
  v7[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_cleanupStagedScopeInTransaction:(id)a3 store:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CPLTransportScopeMapping *v8;
  CPLTransportScopeMapping *transportScopeMapping;
  CPLEngineScope *destinationScope;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CPLEngineScope *v15;
  void *v16;
  void *v17;
  CPLTransportScopeMapping *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  CPLEngineScope *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "scopes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLTransportScopeMapping initWithTranslator:]([CPLTransportScopeMapping alloc], "initWithTranslator:", v7);
  transportScopeMapping = self->_transportScopeMapping;
  self->_transportScopeMapping = v8;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  destinationScope = self->_destinationScope;
  v33[0] = self->_stagingScope;
  v33[1] = destinationScope;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(CPLEngineScope **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v24, "transportScopeForScope:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_18636();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              -[CPLEngineScopedTask scope](self, "scope");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v30 = v15;
              v31 = 2112;
              v32 = v21;
              _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Transport scope for %@ is unknown. Can't clean-up %@", buf, 0x16u);

            }
          }
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("missing transport scope"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLProcessStagedScopesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v22);

          goto LABEL_19;
        }
        v17 = v16;
        if (self->_destinationScope == v15)
          objc_storeStrong((id *)&self->_destinationTransportScope, v16);
        if (v15 == self->_stagingScope)
          objc_storeStrong((id *)&self->_stagingTransportScope, v17);
        v18 = self->_transportScopeMapping;
        -[CPLEngineScope scopeIdentifier](v15, "scopeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLTransportScopeMapping setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v12)
        continue;
      break;
    }
  }

  -[CPLProcessStagedScopesScopeTask _checkDestinationAndProcessCleanup](self, "_checkDestinationAndProcessCleanup");
LABEL_19:

}

- (void)launch
{
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD v9[6];
  objc_super v10;
  _QWORD block[4];
  id v12;

  v10.receiver = self;
  v10.super_class = (Class)CPLProcessStagedScopesScopeTask;
  -[CPLEngineSyncTask launch](&v10, sel_launch);
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CPLProcessStagedScopesScopeTask_launch__block_invoke;
  v9[3] = &unk_1E60D6DF8;
  v9[4] = self;
  v9[5] = a2;
  v6 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v12 = v6;
  v7 = queue;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

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
  v9.super_class = (Class)CPLProcessStagedScopesScopeTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CPLProcessStagedScopesScopeTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.processtagedscopes");
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  CPLProcessStagedScopesScopeTask *v11;
  _QWORD v12[4];
  id v13;
  CPLProcessStagedScopesScopeTask *v14;

  v4 = a3;
  if (v4 && (self->_destinationScope || self->_stagingScope))
  {
    -[CPLEngineScopedTask store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke;
    v12[3] = &unk_1E60DD810;
    v13 = v5;
    v14 = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_3;
    v9[3] = &unk_1E60DD810;
    v10 = v4;
    v11 = self;
    v6 = v5;
    v7 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v12, v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLProcessStagedScopesScopeTask;
    -[CPLEngineSyncTask taskDidFinishWithError:](&v8, sel_taskDidFinishWithError_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_deleteTask, 0);
  objc_storeStrong((id *)&self->_cleanupTask, 0);
  objc_storeStrong((id *)&self->_checkDestinationTask, 0);
  objc_storeStrong((id *)&self->_stagingTransportScope, 0);
  objc_storeStrong((id *)&self->_destinationTransportScope, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_stagingScope, 0);
  objc_storeStrong((id *)&self->_destinationScopeChange, 0);
  objc_storeStrong((id *)&self->_destinationScope, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_2;
  v6[3] = &unk_1E60DDA30;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "do:", v6);

}

void __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = *(void **)(a1 + 32);
  v6.receiver = v3;
  v6.super_class = (Class)CPLProcessStagedScopesScopeTask;
  objc_msgSendSuper2(&v6, sel_taskDidFinishWithError_, v5);

}

uint64_t __58__CPLProcessStagedScopesScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  if (v5
    && (objc_msgSend(v5, "scopeIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "scopeWithIdentifier:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7)
    && (v8 = objc_msgSend(v4, "setScopeNeedsUpdateFromTransport:error:", v7, a2), v7, !v8))
  {
    v12 = 0;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
    if (v9)
    {
      objc_msgSend(v9, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scopeWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = objc_msgSend(v4, "setScopeNeedsUpdateFromTransport:error:", v11, a2);
      else
        v12 = 1;

    }
    else
    {
      v12 = 1;
    }
  }

  return v12;
}

uint64_t __41__CPLProcessStagedScopesScopeTask_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "cancel");
}

void __41__CPLProcessStagedScopesScopeTask_launch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CPLProcessStagedScopesScopeTask_launch__block_invoke_2;
  v9[3] = &unk_1E60DD7E8;
  v5 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v3;
  v12 = v5;
  v6 = v3;
  v7 = v4;
  v8 = (id)objc_msgSend(v6, "performReadTransactionWithBlock:", v9);

}

void __41__CPLProcessStagedScopesScopeTask_launch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isScopeValidInTransaction:", v3) & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@ is staged and needs to be cleaned-up first", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scopeForSharingScope:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 112);
    *(_QWORD *)(v9 + 112) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "scopeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "mainScopeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    {
      objc_msgSend(*(id *)(a1 + 40), "scopeChangeForScope:");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 120);
      *(_QWORD *)(v15 + 120) = v14;

    }
    objc_msgSend(*(id *)(a1 + 40), "stagingScopeForScope:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 128);
    *(_QWORD *)(v18 + 128) = v17;

    v20 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v20 + 128))
    {
      if (*(_QWORD *)(v20 + 112))
      {
        objc_msgSend(*(id *)(a1 + 40), "flagsForScope:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "valueForFlag:", 25))
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_18636();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = *(_QWORD *)(a1 + 32);
              v24 = *(void **)(v23 + 128);
              v25 = *(_QWORD *)(v23 + 112);
              *(_DWORD *)buf = 138412802;
              v58 = v7;
              v59 = 2112;
              v60 = v24;
              v61 = 2112;
              v62 = v25;
              _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "%@ is staged to %@ but %@ is disabled so the staging zone will just be considered as read-only too", buf, 0x20u);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", 0);
          goto LABEL_27;
        }
        if (objc_msgSend(v21, "valueForFlag:", 25))
        {
          objc_msgSend(v7, "scopeIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "scopeIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("%@ is staged and needs to be cleaned-up but %@ is not usable"), v31, v32);

          objc_msgSend(v6, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);
          v33 = *(void **)(a1 + 32);
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("%@ is inactive and needs to be refreshed"), v7);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "taskDidFinishWithError:", v34);

LABEL_27:
LABEL_48:

          goto LABEL_49;
        }
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_18636();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = *(_QWORD *)(a1 + 32);
            v38 = *(void **)(v37 + 128);
            v39 = *(_QWORD *)(v37 + 112);
            *(_DWORD *)buf = 138412802;
            v58 = v7;
            v59 = 2112;
            v60 = v38;
            v61 = 2112;
            v62 = v39;
            _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_DEFAULT, "%@ is staged to %@ and needs to be cleaned-up to %@ allowing metadata sync", buf, 0x20u);
          }

        }
LABEL_34:

        if (!_dontProcessStagedScopes)
        {
          v40 = *(_QWORD **)(a1 + 32);
          if (v40[16])
          {
            if (v40[14])
            {
              objc_msgSend(v40, "_cleanupStagedScopeInTransaction:store:", v3, *(_QWORD *)(a1 + 48));
              goto LABEL_48;
            }
            if (!_CPLSilentLogging)
            {
              __CPLTaskOSLogDomain_18636();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v7;
                _os_log_impl(&dword_1B03C2000, v54, OS_LOG_TYPE_ERROR, "We should have a destination scope for %@ at this point", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = *(_QWORD *)(a1 + 56);
            v56 = *(_QWORD *)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v55, v56, v53, 402, CFSTR("We should have a destination scope for %@ at this point"), v7);
          }
          else
          {
            if (!_CPLSilentLogging)
            {
              __CPLTaskOSLogDomain_18636();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v7;
                _os_log_impl(&dword_1B03C2000, v50, OS_LOG_TYPE_ERROR, "We should have a staging scope for %@ at this point", buf, 0xCu);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = *(_QWORD *)(a1 + 56);
            v52 = *(_QWORD *)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v51, v52, v53, 401, CFSTR("We should have a staging scope for %@ at this point"), v7);
          }

LABEL_66:
          abort();
        }
        goto LABEL_46;
      }
      objc_msgSend(v7, "scopeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("%@ is staged and needs to be cleaned-up but there is no destination scope to use"), v30);

      objc_msgSend(*(id *)(a1 + 32), "_excludeScopes");
      objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", 0);
LABEL_45:
      if (!_dontProcessStagedScopes)
      {
LABEL_47:
        objc_msgSend(*(id *)(a1 + 32), "_excludeScopes");
        objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", 0);
        goto LABEL_48;
      }
LABEL_46:
      objc_msgSend(v7, "scopeIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("Settings are preventing clean-up of %@"), v42);

      goto LABEL_47;
    }
    objc_msgSend(*(id *)(a1 + 40), "scopeChangeForScope:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_18636();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v58 = v7;
          v59 = 2112;
          v60 = v44;
          v45 = v44;
          _os_log_impl(&dword_1B03C2000, v43, OS_LOG_TYPE_ERROR, "Unexpected scope change class for %@: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(a1 + 56);
      v48 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v47, v48, v49, 370, CFSTR("Unexpected scope change class for %@: %@"), v7, objc_opt_class());

      goto LABEL_66;
    }
    if (objc_msgSend(v21, "isCurrentUserExiting"))
    {
      if (objc_msgSend(v7, "scopeType") == 4)
      {
        objc_msgSend(v21, "exitingUserIdentifiers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (v29 == 1)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v7);
          goto LABEL_34;
        }
        objc_msgSend(v7, "scopeIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("%@ is dismantled and is waiting for some users to be staged before being cleaned-up"), v35);
        goto LABEL_44;
      }
    }
    else
    {
      if (objc_msgSend(v21, "areSomeUsersExiting"))
      {
        objc_msgSend(v7, "scopeIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("Waiting for other participants to exit %@ before allowing metadata sync"), v35);
LABEL_44:

        goto LABEL_45;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_18636();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v7;
          v59 = 2112;
          v60 = v21;
          _os_log_impl(&dword_1B03C2000, v41, OS_LOG_TYPE_ERROR, "%@ needs to be cleaned-up but there is not staging scope available:\n%@", buf, 0x16u);
        }

      }
    }
    objc_msgSend(v7, "scopeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteSyncSessionInformation:", CFSTR("%@ is waiting to be staged and needs to be cleaned-up before allowing metadata sync"), v35);
    goto LABEL_44;
  }
  v26 = *(void **)(a1 + 32);
  +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "taskDidFinishWithError:", v27);

LABEL_49:
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willRunEngineElement:", CPLEngineElementProcessStagedScopes);

  v5 = objc_msgSend(*v2, "isCancelled");
  v6 = *v2;
  if (v5)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskDidFinishWithError:", v27);

  }
  else
  {
    objc_msgSend(*v2, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "createGroupForStagedScopeCleanup");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 184);
    *(_QWORD *)(v10 + 184) = v9;

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__18678;
    v34[4] = __Block_byref_object_dispose__18679;
    v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 1;
    v12 = *(_QWORD **)(a1 + 32);
    v13 = v12[18];
    v14 = v12[14];
    v15 = v12[15];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_42;
    v28[3] = &unk_1E60DCCC8;
    v28[4] = v12;
    v16 = v8;
    v29 = v16;
    v30 = v34;
    v31 = v32;
    objc_msgSend(v16, "getScopeInfoWithTransportScope:scope:previousScopeChange:completionHandler:", v13, v14, v15, v28);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 160);
    *(_QWORD *)(v18 + 160) = v17;

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD **)(a1 + 32);
        v22 = v21[14];
        objc_msgSend(v21, "scope");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(v24 + 128);
        v26 = *(_QWORD *)(v24 + 112);
        *(_DWORD *)buf = 138413058;
        v37 = v22;
        v38 = 2112;
        v39 = v23;
        v40 = 2112;
        v41 = v25;
        v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Checking %@ before clean-up of %@ (%@ -> %@)", buf, 0x2Au);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);

  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_42(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
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
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
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
  v26[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_2;
  v26[3] = &unk_1E60DCCA0;
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[4] = v15;
  v27 = v14;
  v28 = v11;
  v29 = v12;
  v33 = a2;
  v30 = v13;
  v31 = v16;
  v32 = *(_OWORD *)(a1 + 48);
  v19 = v26;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
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

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 160);
  *(_QWORD *)(v2 + 160) = 0;

  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "taskDidFinishWithError:");
  }
  else
  {
    objc_msgSend(v4, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_3;
    v14[3] = &unk_1E60DCC78;
    v7 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 96);
    v14[4] = v7;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    v18 = v5;
    v8 = *(id *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 88);
    v19 = v8;
    v20 = v9;
    v21 = v10;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_49;
    v13[3] = &unk_1E60DDAD0;
    v13[5] = v9;
    v13[6] = v10;
    v13[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = (id)objc_msgSend(v11, "performWriteTransactionWithBlock:completionHandler:", v14, v13);

  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_3(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD *v17;
  void *v18;
  NSObject *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v42 = a1[12];
  v3 = (_QWORD *)a1[4];
  v4 = a1[5];
  v5 = v3[14];
  v6 = v3[18];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a1[8];
  v10 = a1[9];
  v11 = a2;
  objc_msgSend(v3, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLScopeUpdateScopeTask updateScopeWithNewScopeType:scope:updatedScopeChange:updatedFlags:oldTransportScope:updatedTransportScope:shouldUpdateTransportScope:store:transport:session:inTransaction:](CPLScopeUpdateScopeTask, "updateScopeWithNewScopeType:scope:updatedScopeChange:updatedFlags:oldTransportScope:updatedTransportScope:shouldUpdateTransportScope:store:transport:session:inTransaction:", v42, v5, v4, v7, v6, v8, &__block_literal_global_18685, v9, v10, v12, v11);

  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend((id)a1[8], "scopes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "validLocalScopeIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsIndex:", objc_msgSend(*(id *)(a1[4] + 112), "localIndex"));

    v17 = a1;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v14, "flagsForScope:", *(_QWORD *)(a1[4] + 112));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "valueForFlag:", 52))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_18636();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (_QWORD *)v17[4];
            v21 = v20[14];
            objc_msgSend(v20, "scope");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v44 = v21;
            v45 = 2112;
            v46 = v22;
            _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "%@ has become invalid as a destination to clean-up %@", buf, 0x16u);

          }
        }
        objc_msgSend(*(id *)(v17[4] + 112), "scopeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("%@ is not a valid destination for clean-up"), v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(v17[10] + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
      else if (objc_msgSend(v18, "valueForFlag:", 8))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_18636();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (_QWORD *)v17[4];
            v33 = v32[14];
            objc_msgSend(v32, "scope");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v44 = v33;
            v45 = 2112;
            v46 = v34;
            _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_DEFAULT, "%@ is disabled and thus not a good destination to clean-up %@", buf, 0x16u);

          }
        }
        *(_BYTE *)(*(_QWORD *)(v17[11] + 8) + 24) = 0;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_18636();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (_QWORD *)v17[4];
            v37 = v36[14];
            objc_msgSend(v36, "scope");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v44 = v37;
            v45 = 2112;
            v46 = v38;
            _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEFAULT, "%@ is ready to be the destination to clean-up %@", buf, 0x16u);

          }
        }
        objc_msgSend(v14, "scopeChangeForScope:", *(_QWORD *)(v17[4] + 112));
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = v17[4];
        v41 = *(void **)(v40 + 120);
        *(_QWORD *)(v40 + 120) = v39;

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1[4] + 112), "scopeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("%@ has become after updating scope info"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1[10] + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
  }
}

void __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_49(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {

  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_startActualCleanup");
    goto LABEL_7;
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v7, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v4, "taskDidFinishWithError:", v6);

LABEL_7:
}

uint64_t __69__CPLProcessStagedScopesScopeTask__checkDestinationAndProcessCleanup__block_invoke_4()
{
  return 1;
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "createGroupForStagedScopeCleanup");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 184);
    *(_QWORD *)(v7 + 184) = v6;

    objc_msgSend(*(id *)(a1 + 32), "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[16];
    v12 = v10[14];
    v13 = v10[17];
    v23[4] = v10;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2;
    v24[3] = &unk_1E60DCD30;
    v24[4] = v10;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_38;
    v23[3] = &unk_1E60DDB80;
    objc_msgSend(v5, "cleanupStagedScope:stagingScope:destinationScope:transportScopeMapping:progressHandler:completionHandler:", v9, v11, v12, v13, v24, v23);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 168);
    *(_QWORD *)(v15 + 168) = v14;

    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(v19 + 128);
        v21 = *(_QWORD *)(v19 + 112);
        *(_DWORD *)buf = 138412802;
        v26 = v18;
        v27 = 2112;
        v28 = v20;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, "Launching clean-up process of %@ (%@ -> %@)", buf, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));

  }
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[6];
  _QWORD block[4];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_3;
  v8[3] = &unk_1E60D6DF8;
  v8[4] = v2;
  v8[5] = a2;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v10 = v5;
  v6 = v3;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2_39;
  v11[3] = &unk_1E60D6F88;
  v11[4] = v4;
  v12 = v3;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_2_39(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  *(_QWORD *)(v2 + 168) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "isCPLErrorWithCode:", 255))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_18636();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v6;
          _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Clean-up of %@ is not implemented. Disabling metadata sync until some other device actually do the work", buf, 0xCu);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scopeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "noteSyncSessionInformation:", CFSTR("Clean-up of %@ is not implemented. Disabling metadata sync until some other device does the work"), v9);

      objc_msgSend(*(id *)(a1 + 32), "_excludeScopes");
      v10 = *(void **)(a1 + 32);
      v11 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_18636();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "scope");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(a1 + 32);
          v21 = *(_QWORD *)(a1 + 40);
          v22 = *(_QWORD *)(v20 + 128);
          v23 = *(_QWORD *)(v20 + 112);
          *(_DWORD *)buf = 138413058;
          v25 = v19;
          v26 = 2112;
          v27 = v22;
          v28 = 2112;
          v29 = v23;
          v30 = 2112;
          v31 = v21;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Clean-up of %@ (%@ -> %@) failed: %@", buf, 0x2Au);

        }
      }
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
    }
    return objc_msgSend(v10, "taskDidFinishWithError:", v11);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(v14 + 128);
        v16 = *(_QWORD *)(v14 + 112);
        *(_DWORD *)buf = 138413058;
        v25 = v13;
        v26 = 2112;
        v27 = v15;
        v28 = 2112;
        v29 = v16;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Clean-up of %@ (%@ -> %@) finished. Deleting %@ now", buf, 0x2Au);

      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_deleteStagingScopeIfNecessary");
  }
}

void __54__CPLProcessStagedScopesScopeTask__startActualCleanup__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 168))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "scope");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1 + 40);
        v8 = 138412546;
        v9 = v4;
        v10 = 2048;
        v11 = v5;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Estimated remaining count of records to clean-up %@: %lu", (uint8_t *)&v8, 0x16u);

      }
      v2 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v2 + 192))
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend((id)v2, "engineLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEstimatedCountOfRemainingRecordsDuringSharedLibraryExit:", v6);

    }
  }
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  __int128 v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:", v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(_OWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 152);
    v9 = *(_QWORD *)(v7 + 128);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2;
    v14[3] = &unk_1E60DCC10;
    v15 = v6;
    objc_msgSend(v5, "deleteTransportScope:scope:completionHandler:", v8, v9, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 176);
    *(_QWORD *)(v11 + 176) = v10;

    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  }
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 104);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_3;
  v12[3] = &unk_1E60D6E20;
  v12[4] = v4;
  v13 = v3;
  v14 = v5;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18634;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[6];
  _QWORD v15[4];
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestSyncStateAtEndOfSyncSession:reschedule:", 4, 0);

    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "scopes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_24;
    v15[3] = &unk_1E60DD810;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v10;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_28;
    v14[3] = &unk_1E60DCBE8;
    v11 = *(_QWORD *)(a1 + 48);
    v14[4] = v16;
    v14[5] = v11;
    v12 = v10;
    v13 = (id)objc_msgSend(v9, "performWriteTransactionWithBlock:completionHandler:", v15, v14);

  }
}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_24(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2_25;
  v4[3] = &unk_1E60DDA30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "do:", v4);

}

void __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = (void *)objc_opt_class();
        v10 = *(void **)(a1 + 32);
        v11 = v9;
        objc_msgSend(v10, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Delegate of %@ is supposed to be %@ but is %@", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLProcessStagedScopesTask.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, v16, 164, CFSTR("Delegate of %@ is supposed to be %@ but is %@"), v17, v18, v19);

    abort();
  }
  objc_msgSend(*(id *)(a1 + 32), "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didProcessStagedScope:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v20, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taskDidFinishWithError:", v6);

}

uint64_t __65__CPLProcessStagedScopesScopeTask__deleteStagingScopeIfNecessary__block_invoke_2_25(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t result;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_18636();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Marking %@ as deleted", (uint8_t *)&v11, 0xCu);
    }

  }
  result = objc_msgSend(*(id *)(a1 + 40), "setValue:forFlag:forScope:error:", 1, 4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Removing staged flag from %@", (uint8_t *)&v11, 0xCu);
      }

    }
    if (!objc_msgSend(*(id *)(a1 + 40), "setValue:forFlag:forScope:error:", 0, 64, v7, a2))
      goto LABEL_18;
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup tasks for %@", (uint8_t *)&v11, 0xCu);
      }

    }
    if ((objc_msgSend(*(id *)(a1 + 40), "addCleanupTasksForScope:error:", v7, a2) & 1) != 0)
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "setScopeNeedsToBePulledByClient:error:", v7, a2);

      if (v10)
        return objc_msgSend(*(id *)(a1 + 40), "setScopeHasChangesToPullFromTransport:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), a2);
    }
    else
    {
LABEL_18:

    }
    return 0;
  }
  return result;
}

+ (void)initialize
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _dontProcessStagedScopes = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLDontProcessStagedScopes"));

}

@end
