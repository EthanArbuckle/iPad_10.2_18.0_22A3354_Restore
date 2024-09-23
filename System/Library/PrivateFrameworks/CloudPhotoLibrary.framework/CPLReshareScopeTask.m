@implementation CPLReshareScopeTask

- (CPLReshareScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12;
  id v13;
  CPLReshareScopeTask *v14;
  uint64_t v15;
  NSDate *cutoffDate;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  CPLTransportScopeMapping *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CPLTransportScopeMapping *transportScopeMapping;
  CPLTransportScopeMapping *v25;
  void *v26;
  objc_super v28;

  v12 = a6;
  v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CPLReshareScopeTask;
  v14 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v28, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, a3, a4, a5, v12, v13);
  if (v14)
  {
    _CPLCutoffDate();
    v15 = objc_claimAutoreleasedReturnValue();
    cutoffDate = v14->_cutoffDate;
    v14->_cutoffDate = (NSDate *)v15;

    CPLCopyDefaultSerialQueueAttributes();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("engine.sync.reshare", v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    v20 = [CPLTransportScopeMapping alloc];
    -[CPLEngineSyncTask engineLibrary](v14, "engineLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transport");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CPLTransportScopeMapping initWithTranslator:](v20, "initWithTranslator:", v22);
    transportScopeMapping = v14->_transportScopeMapping;
    v14->_transportScopeMapping = (CPLTransportScopeMapping *)v23;

    v25 = v14->_transportScopeMapping;
    objc_msgSend(v12, "scopeIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLTransportScopeMapping addTransportScope:forScopeWithIdentifier:](v25, "addTransportScope:forScopeWithIdentifier:", v13, v26);

  }
  return v14;
}

- (void)_bumpIgnoredDatesOfRecords:(id)a3 hasResharedSomeRecords:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  CPLReshareScopeTask *v16;
  BOOL v17;

  v6 = a3;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke;
  v13[3] = &unk_1E60D89C0;
  v14 = v8;
  v15 = v6;
  v17 = a4;
  v16 = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_4;
  v12[3] = &unk_1E60DD838;
  v12[4] = self;
  v9 = v6;
  v10 = v8;
  v11 = (id)objc_msgSend(v10, "performWriteTransactionWithBlock:completionHandler:", v13, v12);

}

- (void)_bumpIgnoredDatesOfRejectedRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke;
  v11[3] = &unk_1E60DD810;
  v12 = v6;
  v13 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_3;
  v10[3] = &unk_1E60DD838;
  v7 = v4;
  v8 = v6;
  v9 = (id)objc_msgSend(v8, "performWriteTransactionWithBlock:completionHandler:", v11, v10);

}

- (void)_doOneIteration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  if (-[CPLEngineSyncTask isCancelled](self, "isCancelled"))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CPLEngineSyncTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v9);

  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "scopes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke;
    v10[3] = &unk_1E60DD2A8;
    v10[4] = self;
    v11 = v5;
    v12 = v4;
    v6 = v4;
    v7 = v5;
    v8 = (id)objc_msgSend(v6, "performReadTransactionWithBlock:", v10);

  }
}

- (void)launch
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
  v9.super_class = (Class)CPLReshareScopeTask;
  -[CPLEngineSyncTask launch](&v9, sel_launch);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CPLReshareScopeTask_launch__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6092;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

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
  v9.super_class = (Class)CPLReshareScopeTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CPLReshareScopeTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6092;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (id)scopesForTask
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (self->_primaryScope)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLReshareScopeTask;
    -[CPLEngineScopedTask scopesForTask](&v7, sel_scopesForTask);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObject:", self->_primaryScope);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLReshareScopeTask;
    -[CPLEngineScopedTask scopesForTask](&v6, sel_scopesForTask);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.reshare");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_reshareTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_primaryScope, 0);
  objc_storeStrong((id *)&self->_cutoffDate, 0);
}

uint64_t __29__CPLReshareScopeTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "cancel");
}

uint64_t __29__CPLReshareScopeTask_launch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doOneIteration");
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke(id *a1, uint64_t a2)
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  NSObject *v41;
  dispatch_block_t v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  _QWORD *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id *v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  _BYTE buf[24];
  void *v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1[4], "isScopeValidInTransaction:", a2);
  v4 = a1[4];
  if ((v3 & 1) == 0)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidFinishWithError:");

    return;
  }
  objc_msgSend(a1[4], "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_QWORD *)a1[4] + 14))
    goto LABEL_3;
  objc_msgSend(a1[5], "scopeForSharingScope:", v5);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = a1[4];
  v45 = (void *)v44[14];
  v44[14] = v43;

  v46 = a1[4];
  if (!v46[14])
    goto LABEL_35;
  if (objc_msgSend(a1[5], "valueForFlag:forScope:", 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_6094();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *((_QWORD *)a1[4] + 14);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v48;
        _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_DEFAULT, "Won't reshare ignored records for %@ as %@ is not available", buf, 0x16u);
      }

    }
    v46 = a1[4];
LABEL_35:
    objc_msgSend(v46, "taskDidFinishWithError:", 0);
    goto LABEL_44;
  }
  objc_msgSend(a1[5], "transportScopeForScope:", *((_QWORD *)a1[4] + 14));
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    v52 = a1[4];
    v53 = (void *)*((_QWORD *)v52 + 15);
    objc_msgSend(*((id *)v52 + 14), "scopeIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addTransportScope:forScopeWithIdentifier:", v51, v54);

    objc_msgSend(a1[4], "engineLibrary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "transport");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "createGroupForReshare");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = a1[4];
    v59 = (void *)v58[18];
    v58[18] = v57;

LABEL_3:
    objc_msgSend(a1[6], "ignoredRecords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v8 = v7[13];
    objc_msgSend(v7, "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ignoredRecordsBeforeDate:scopeIdentifier:maximumCount:", v8, v10, 100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v66 = v5;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
      objc_msgSend(a1[6], "cloudCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = a1;
      objc_msgSend(a1[6], "remappedRecords");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v65 = v11;
      v14 = v11;
      v71 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      if (!v71)
        goto LABEL_25;
      v15 = *(_QWORD *)v78;
      v68 = *(_QWORD *)v78;
      v69 = v14;
      while (1)
      {
        for (i = 0; i != v71; i = (char *)i + 1)
        {
          if (*(_QWORD *)v78 != v15)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i), "record");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "scopedIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "targetForRecordWithSharedCloudScopedIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "targetState"))
          {
            if (objc_msgSend(v19, "targetState") == 1)
            {
              objc_msgSend(v19, "scopedIdentifier");
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v20);
            }
            else
            {
              if (_CPLSilentLogging)
                goto LABEL_23;
              __CPLTaskOSLogDomain_6094();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v17, "scopedIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "scopedIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v28;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v29;
                *(_WORD *)&buf[22] = 2112;
                v83 = v19;
                _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Skipping ignored record %@ as %@ target is not direct: %@", buf, 0x20u);

              }
            }
          }
          else
          {
            v21 = v13;
            v22 = v12;
            objc_msgSend(v19, "scopedIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "realScopedIdentifierForRemappedScopedIdentifier:", v23);
            v20 = objc_claimAutoreleasedReturnValue();

            -[NSObject identifier](v20, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scopedIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "isEqualToString:", v26);

            if ((v27 & 1) != 0)
            {
              v12 = v22;
              v13 = v21;
              v15 = v68;
              v14 = v69;
            }
            else
            {
              v12 = v22;
              v13 = v21;
              v15 = v68;
              if (!_CPLSilentLogging)
              {
                __CPLTaskOSLogDomain_6094();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v19, "scopedIdentifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v31;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v17;
                  _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_DEFAULT, "Will delete old remapped %@ to expose %@", buf, 0x16u);

                }
              }
              v32 = (void *)objc_opt_class();
              objc_msgSend(v17, "scopedIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)objc_msgSend(v32, "newDeleteChangeWithScopedIdentifier:", v33);
              objc_msgSend(v19, "scopedIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, v35);

              v14 = v69;
            }
          }

LABEL_23:
        }
        v71 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
        if (!v71)
        {
LABEL_25:

          v36 = objc_msgSend(v12, "count");
          v37 = v67[4];
          if (v36)
          {
            v38 = (void *)v37[16];
            v39 = MEMORY[0x1E0C809B0];
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_18;
            v73[3] = &unk_1E60D6FB0;
            v73[4] = v37;
            v74 = v12;
            v5 = v66;
            v75 = v66;
            v76 = v14;
            v40 = v73;
            *(_QWORD *)buf = v39;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_6092;
            v83 = &unk_1E60D71F8;
            v84 = v40;
            v41 = v38;
            v42 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
            dispatch_async(v41, v42);

          }
          else
          {
            objc_msgSend(v37, "_bumpIgnoredDatesOfRecords:hasResharedSomeRecords:", v14, 0);
            v5 = v66;
          }
          v11 = v65;

          goto LABEL_43;
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_6094();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_DEFAULT, "All eligible ignored records have been process", buf, 2u);
      }

    }
    objc_msgSend(a1[4], "taskDidFinishWithError:", 0);
LABEL_43:

    goto LABEL_44;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_6094();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = *((_QWORD *)a1[4] + 14);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v61;
      _os_log_impl(&dword_1B03C2000, v60, OS_LOG_TYPE_ERROR, "%@ has no transport scope", buf, 0xCu);
    }

  }
  v62 = (id *)a1[4];
  objc_msgSend(v62[14], "scopeIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "taskDidFinishWithError:", v64);

LABEL_44:
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_18(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  CFAbsoluteTime Current;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CFAbsoluteTime v19;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "taskDidFinishWithError:", v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    Current = CFAbsoluteTimeGetCurrent();
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(v8 + 112);
    v10 = *(_QWORD *)(v8 + 120);
    v11 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_2;
    v16[3] = &unk_1E60DD990;
    v16[4] = v8;
    v17 = v7;
    v19 = Current;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v5, "reshareRecordsTaskWithRecords:sourceScope:destinationScope:transportScopeMapping:completionHandler:", v17, v9, v11, v10, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 136);
    *(_QWORD *)(v13 + 136) = v12;

    objc_msgSend(*(id *)(a1 + 32), "launchTransportTask:withTransportGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  }
}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 128);
  v12[2] = __38__CPLReshareScopeTask__doOneIteration__block_invoke_3;
  v12[3] = &unk_1E60D6F60;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[4] = v4;
  v13 = v3;
  v14 = v5;
  v16 = *(_QWORD *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6092;
  block[3] = &unk_1E60D71F8;
  v18 = v8;
  v9 = v6;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __38__CPLReshareScopeTask__doOneIteration__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  CFAbsoluteTime v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  CFAbsoluteTime v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "isCPLErrorWithCode:", 18))
    {
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CPLErrorRejectedRecordIdentifiersAndReasons"));
      v6 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      if (objc_msgSend(*(id *)&v6, "count"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_6094();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            v8 = objc_msgSend(*(id *)(a1 + 48), "count");
            v18 = 134218242;
            v19 = v8;
            v20 = 2114;
            v21 = v6;
            _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Failed to reshare %lu records - some records have been rejected: %{public}@", (uint8_t *)&v18, 0x16u);
          }

        }
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)&v6, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_bumpIgnoredDatesOfRejectedRecords:", v10);

        return;
      }

    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_6094();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(*(id *)(a1 + 48), "count");
        v17 = *(double *)(a1 + 40);
        v18 = 134218242;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Failed to reshare %lu records: %@", (uint8_t *)&v18, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_6094();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(*(id *)(a1 + 48), "count");
        v13 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 48), "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218498;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Reshared %lu records successfully in %.1fs:\n%{public}@", (uint8_t *)&v18, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_bumpIgnoredDatesOfRecords:hasResharedSomeRecords:", *(_QWORD *)(a1 + 56), 1);
  }
}

void __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_2;
  v4[3] = &unk_1E60DDA30;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "do:", v4);

}

void __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskDidFinishWithError:", v6);

  }
  else
  {
    v7 = (void *)v5[16];
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_4;
    v12[3] = &unk_1E60D65B8;
    v12[4] = v5;
    v9 = v12;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6092;
    block[3] = &unk_1E60D71F8;
    v14 = v9;
    v10 = v7;
    v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v10, v11);

  }
}

uint64_t __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doOneIteration");
}

uint64_t __58__CPLReshareScopeTask__bumpIgnoredDatesOfRejectedRecords___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ignoredRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 21600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v17 = v12;
        v14 = objc_msgSend(v4, "setIgnoredDate:forRecordWithScopedIdentifier:error:", v5, v13, &v17);
        v9 = v17;

        if (!v14)
        {

          if (a2)
          {
            v9 = objc_retainAutorelease(v9);
            v15 = 0;
            *a2 = v9;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_15;
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v15 = 1;
LABEL_15:

  return v15;
}

void __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_2;
  v11[3] = &unk_1E60DDA30;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v7, "do:", v11);
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (!*(_BYTE *)(v4 + 152))
    {
      *(_BYTE *)(v4 + 152) = 1;
      v8[0] = v3;
      v8[1] = 3221225472;
      v8[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_3;
      v8[3] = &unk_1E60DDA30;
      v5 = *(id *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 48);
      v9 = v5;
      v10 = v6;
      objc_msgSend(v7, "do:", v8);

    }
  }

}

void __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskDidFinishWithError:", v6);

  }
  else
  {
    v7 = (void *)v5[16];
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_5;
    v12[3] = &unk_1E60D65B8;
    v12[4] = v5;
    v9 = v12;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_6092;
    block[3] = &unk_1E60D71F8;
    v14 = v9;
    v10 = v7;
    v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v10, v11);

  }
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doOneIteration");
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  _QWORD *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ignoredRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 7200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v17 = a2;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "record");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scopedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v11;
        v14 = objc_msgSend(v4, "setIgnoredDate:forRecordWithScopedIdentifier:error:", v5, v13, &v19);
        v8 = v19;

        if (!v14)
        {

          if (v17)
          {
            v8 = objc_retainAutorelease(v8);
            v15 = 0;
            *v17 = v8;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_15;
        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v15 = 1;
LABEL_15:

  return v15;
}

uint64_t __73__CPLReshareScopeTask__bumpIgnoredDatesOfRecords_hasResharedSomeRecords___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "setScopeHasChangesToPullFromTransport:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), a2))
  {
    objc_msgSend(*(id *)(a1 + 40), "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "setScopeHasChangesToPullFromTransport:error:", v5, a2);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
