@implementation CPLMingleChangesScopeTask

- (CPLMingleChangesScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  CPLMingleChangesScopeTask *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *lock;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *notifyQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CPLMingleChangesScopeTask;
  v7 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](&v15, sel_initWithEngineLibrary_session_clientCacheIdentifier_scope_transportScope_, a3, a4, a5, a6, a7);
  if (v7)
  {
    CPLCopyDefaultSerialQueueAttributes();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cpl.mingling.lock", v8);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_queue *)v9;

    CPLCopyDefaultSerialQueueAttributes();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.cpl.mingling.notify", v11);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  CPLEngineScope *v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  NSObject *v21;
  CPLEngineScope *sharedScope;
  void *v23;
  id v24;
  NSObject *v25;
  objc_super v26;
  uint8_t buf[4];
  CPLEngineScope *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)CPLMingleChangesScopeTask;
  if (!-[CPLEngineScopedTask checkScopeIsValidInTransaction:](&v26, sel_checkScopeIsValidInTransaction_, a3)
    || self->_minglingHasBeenReset)
  {
    return 0;
  }
  if (self->_sharedScope)
  {
    -[CPLEngineScopedTask store](self, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validLocalScopeIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", -[CPLEngineScope localIndex](self->_sharedScope, "localIndex"));

    if ((v9 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          sharedScope = self->_sharedScope;
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v28 = sharedScope;
          v29 = 2112;
          v30 = v23;
          v24 = v23;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Scope %@ is invalid, stopping %@ now", buf, 0x16u);

        }
      }
      -[CPLMingleChangesScopeTask cancel](self, "cancel");
      return 0;
    }
  }
  -[CPLEngineScopedTask store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushRepository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scopeIdentifier");
  v13 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "minimumPriorityForChangesInScopeWithIdentifier:", v13);
  if (v14 >= +[CPLRecordPushContext minimumPriorityForLocalConflictResolution](CPLRecordPushContext, "minimumPriorityForLocalConflictResolution"))goto LABEL_11;
  -[CPLEngineSyncTask session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "allowsLocalConflictResolution");

  if ((v16 & 1) != 0)
    goto LABEL_11;
  -[CPLEngineSyncTask session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "allowsLocalConflictResolutionWhenOverQuota");

  if (!v18)
    goto LABEL_19;
  objc_msgSend(v10, "scopes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "valueForFlag:forScope:", 2, v12);

  if ((v20 & 1) != 0)
  {
LABEL_11:
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_shouldStashRecordsIfNecessary = 0;
      v4 = 1;
    }
    else
    {
      v4 = 1;
      self->_shouldStashRecordsIfNecessary = 1;
    }
  }
  else
  {
LABEL_19:
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "Push repository contains changes for %@, stopping mingle now", buf, 0xCu);
      }

    }
    -[CPLMingleChangesScopeTask cancel](self, "cancel");
    v4 = 0;
  }

  return v4;
}

- (void)_reallyNotifySchedulerPullQueueIsFull
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Notifying scheduler that there is some change in the pull queue", v5, 2u);
    }

  }
  -[CPLEngineSyncTask session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteClientNeedsToPullIfNecessary");

}

- (void)_notifySchedulerPullQueueIsFullInTransaction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke;
  v3[3] = &unk_1E60DDB80;
  v3[4] = self;
  objc_msgSend(a3, "addCleanupBlock:", v3);
}

- (void)_notifySchedulerPullQueueIsFullNowIfNecessary
{
  OS_dispatch_queue *notifyQueue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  notifyQueue = self->_notifyQueue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12187;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = notifyQueue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t minglingCount;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CPLMingleChangesScopeTask *v17;
  _QWORD v18[4];
  id v19;
  CPLMingleChangesScopeTask *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      minglingCount = self->_minglingCount;
      -[CPLEngineScopedTask scope](self, "scope");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = minglingCount;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Mingled %lu changes for %@", buf, 0x16u);

    }
  }
  -[CPLMingleChangesScopeTask _notifySchedulerPullQueueIsFullNowIfNecessary](self, "_notifySchedulerPullQueueIsFullNowIfNecessary");
  -[CPLEngineScopedTask scope](self, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke;
  v18[3] = &unk_1E60DBED0;
  v19 = v9;
  v20 = self;
  v21 = v4;
  v22 = v8;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_31;
  v15[3] = &unk_1E60DD810;
  v16 = v21;
  v17 = self;
  v11 = v21;
  v12 = v8;
  v13 = v9;
  v14 = (id)objc_msgSend(v13, "performWriteTransactionWithBlock:completionHandler:", v18, v15);

}

- (void)_noteBatchWasAddedInPullQueue:(id)a3 fromBatch:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "summaryDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "summaryDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v12;
          v16 = 2114;
          v17 = v13;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to pull queue from %{public}@", (uint8_t *)&v14, 0x16u);

LABEL_9:
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "summaryDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to pull queue", (uint8_t *)&v14, 0xCu);
        goto LABEL_9;
      }
LABEL_10:

    }
    -[CPLMingleChangesScopeTask _notifySchedulerPullQueueIsFullInTransaction:](self, "_notifySchedulerPullQueueIsFullInTransaction:", v10);
  }

}

- (void)_finishMingling
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  CPLMingleChangesScopeTask *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = self;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }

    }
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = *MEMORY[0x1E0CB28A8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("Not enough disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 640, v6);

    -[CPLMingleChangesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v7);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke;
    v12[3] = &unk_1E60DD810;
    v12[4] = self;
    v13 = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_32;
    v11[3] = &unk_1E60DD838;
    v7 = v9;
    v10 = (id)objc_msgSend(v7, "performWriteTransactionWithBlock:completionHandler:", v12, v11);

  }
}

- (id)_filteredBatchByStashingRecordsIfNecessary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  CPLMingleChangesScopeTask *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  CPLMingleChangesScopeTask *v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  SEL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = self;
  -[CPLEngineScopedTask store](self, "store");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pushRepository");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "cloudCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "idMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopedTask scope](self, "scope");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v32, "localIndex");
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__12200;
  v59 = __Block_byref_object_dispose__12201;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__12200;
  v53 = __Block_byref_object_dispose__12201;
  v30 = v5;
  v54 = v30;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend((id)v50[5], "count"));
  do
  {
    v10 = (void *)v50[5];
    if (!v10 || !objc_msgSend(v10, "count"))
      break;
    v11 = (void *)MEMORY[0x1B5E08BF0]();
    objc_msgSend((id)v50[5], "records");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __78__CPLMingleChangesScopeTask__filteredBatchByStashingRecordsIfNecessary_error___block_invoke;
    v38[3] = &unk_1E60DA800;
    v39 = v6;
    v47 = v7;
    v40 = v35;
    v41 = v36;
    v42 = v9;
    v43 = v37;
    v45 = &v49;
    v14 = v13;
    v48 = a2;
    v44 = v14;
    v46 = &v55;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v38);
    v15 = v50[5];
    if (!v15)
      goto LABEL_8;
    if (objc_msgSend(v14, "count"))
    {
      v16 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v16, "removeObjectsAtIndexes:", v14);
      v17 = objc_msgSend(v16, "count");
      v18 = objc_msgSend(v14, "count");
      if (v18 + v17 != objc_msgSend(v12, "count"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12177();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = objc_msgSend(v14, "count");
            v26 = objc_msgSend(v12, "count");
            v27 = objc_msgSend(v16, "count");
            *(_DWORD *)buf = 134218496;
            v62 = v25;
            v63 = 2048;
            v64 = v26;
            v65 = 2048;
            v66 = v27;
            _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Trying to remove objects at %lu indexes from an array of %lu elements returned %lu elements", buf, 0x20u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleChangesTask.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v37, v29, 430, CFSTR("Trying to remove objects at %lu indexes from an array of %lu elements returned %lu elements"), objc_msgSend(v14, "count"), objc_msgSend(v12, "count"), objc_msgSend(v16, "count"));

        abort();
      }
      objc_msgSend((id)v50[5], "_setRecords:", v16);

      v19 = 0;
    }
    else
    {
LABEL_8:
      v19 = 1;
    }

    objc_autoreleasePoolPop(v11);
    v20 = v19 ^ 1;
    if (!v15)
      v20 = 0;
  }
  while ((v20 & 1) != 0);
  v21 = (void *)v50[5];
  if (a4 && !v21)
  {
    *a4 = objc_retainAutorelease((id)v56[5]);
    v21 = (void *)v50[5];
  }
  v22 = v21;

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v22;
}

- (void)_mingleOtherChanges
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  uint64_t v15;
  const __CFString *v16;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("Not enough disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 640, v5);

    -[CPLMingleChangesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v6);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 1;
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke;
    v12[3] = &unk_1E60DD280;
    v12[4] = self;
    p_buf = &buf;
    v6 = v8;
    v13 = v6;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_55;
    v11[3] = &unk_1E60DDB58;
    v11[4] = self;
    v11[5] = &buf;
    v10 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v12, v11);

    _Block_object_dispose(&buf, 8);
  }

}

- (void)_acknownledgeFixUpTasks:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  CPLMingleChangesScopeTask *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = self;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", buf, 0xCu);
      }

    }
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0CB28A8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("Not enough disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 640, v8);

    -[CPLMingleChangesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v9);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke;
    v15[3] = &unk_1E60DD2A8;
    v15[4] = self;
    v16 = v4;
    v17 = v11;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_4;
    v14[3] = &unk_1E60DD838;
    v14[4] = self;
    v9 = v11;
    v13 = (id)objc_msgSend(v9, "performWriteTransactionWithBlock:completionHandler:", v15, v14);

  }
}

- (void)_fixUpPrivateRecordsPointingToRemappedSharedRecords:(id)a3
{
  id v4;
  OS_dispatch_queue *lock;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12187;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = lock;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

- (void)_mingleSharedRemappings
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[7];
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;
  uint64_t v18;
  const __CFString *v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("Not enough disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 640, v5);

    -[CPLMingleChangesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v6);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__12200;
    v23 = __Block_byref_object_dispose__12201;
    v9 = MEMORY[0x1E0C809B0];
    v24 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke;
    v12[3] = &unk_1E60DD438;
    v12[4] = self;
    v6 = v8;
    v13 = v6;
    p_buf = &buf;
    v15 = v16;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_4;
    v11[3] = &unk_1E60DDAD0;
    v11[4] = self;
    v11[5] = &buf;
    v11[6] = v16;
    v10 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v12, v11);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v16, 8);
  }

}

- (void)_mingleRemappings
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  uint64_t v15;
  const __CFString *v16;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineSyncTask diskPressureState](self, "diskPressureState") == 2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "System had not enough disk space to continue %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("Not enough disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 640, v5);

    -[CPLMingleChangesScopeTask taskDidFinishWithError:](self, "taskDidFinishWithError:", v6);
  }
  else
  {
    -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v9 = MEMORY[0x1E0C809B0];
    v19 = 1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke;
    v12[3] = &unk_1E60DD280;
    v12[4] = self;
    v6 = v8;
    v13 = v6;
    p_buf = &buf;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_4;
    v11[3] = &unk_1E60DDB58;
    v11[4] = self;
    v11[5] = &buf;
    v10 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v12, v11);

    _Block_object_dispose(&buf, 8);
  }

}

- (void)_unstashRecordsForScope:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  -[CPLEngineScopedTask store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke;
  v12[3] = &unk_1E60DD280;
  v12[4] = self;
  v13 = v4;
  v14 = v15;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_3;
  v9[3] = &unk_1E60DD280;
  v9[4] = self;
  v11 = v15;
  v7 = v13;
  v10 = v7;
  v8 = (id)objc_msgSend(v5, "performWriteTransactionWithBlock:completionHandler:", v12, v9);

  _Block_object_dispose(v15, 8);
}

- (void)launch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  CPLMingleChangesScopeTask *v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CPLMingleChangesScopeTask;
  -[CPLEngineSyncTask launch](&v24, sel_launch);
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willRunEngineElement:", CPLEngineElementMingling);

  -[CPLEngineScopedTask store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  -[CPLEngineScopedTask scope](self, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientPullRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke;
  v16[3] = &unk_1E60DD230;
  v9 = v7;
  v17 = v9;
  v18 = self;
  v10 = v5;
  v19 = v10;
  v20 = v6;
  v21 = v22;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke_3;
  v13[3] = &unk_1E60DD280;
  v13[4] = self;
  v15 = v22;
  v11 = v20;
  v14 = v11;
  v12 = (id)objc_msgSend(v10, "performWriteTransactionWithBlock:completionHandler:", v16, v13);

  _Block_object_dispose(v22, 8);
}

- (void)cancel
{
  OS_dispatch_queue *lock;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD block[4];
  id v11;

  v9.receiver = self;
  v9.super_class = (Class)CPLMingleChangesScopeTask;
  -[CPLEngineSyncTask cancel](&v9, sel_cancel);
  lock = self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__CPLMingleChangesScopeTask_cancel__block_invoke;
  v8[3] = &unk_1E60D65B8;
  v8[4] = self;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_12187;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = lock;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.mingle");
}

- (void)transientRepository:(id)a3 didResetMingledRecordsForScopesWithFiler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  CPLEngineScope *sharedScope;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!self->_minglingHasBeenReset)
  {
    -[CPLEngineScopedTask scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "filterOnScopeIdentifier:", v7);

    if ((v8 & 1) != 0
      || (sharedScope = self->_sharedScope) != 0
      && (-[CPLEngineScope scopeIdentifier](sharedScope, "scopeIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v5, "filterOnScopeIdentifier:", v10),
          v10,
          (v11 & 1) != 0))
    {
      self->_minglingHasBeenReset = 1;
    }
    else if (!self->_minglingHasBeenReset)
    {
      goto LABEL_12;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Mingling has been reset for %@ - will need to restart", (uint8_t *)&v14, 0xCu);

      }
    }
    -[CPLMingleChangesScopeTask cancel](self, "cancel");
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fixUpTask, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_extractionStrategy, 0);
  objc_storeStrong((id *)&self->_batchStorage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __35__CPLMingleChangesScopeTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "cancel");
}

void __35__CPLMingleChangesScopeTask_launch__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  CPLTransportScopeMapping *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "checkScopeIsValidInTransaction:", v22))
  {
    objc_msgSend(*(id *)(a1 + 48), "scopes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharingScopeForScope:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;

    v7 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v7 + 128))
    {
      v8 = objc_msgSend(v3, "valueForFlag:forScope:", 36);
      v7 = *(_QWORD *)(a1 + 40);
      if (v8)
      {
        v9 = *(void **)(v7 + 128);
        *(_QWORD *)(v7 + 128) = 0;

        v7 = *(_QWORD *)(a1 + 40);
      }
    }
    if (*(_QWORD *)(v7 + 128) && !*(_QWORD *)(v7 + 136))
    {
      v10 = [CPLTransportScopeMapping alloc];
      objc_msgSend(*(id *)(a1 + 40), "engineLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CPLTransportScopeMapping initWithTranslator:](v10, "initWithTranslator:", v12);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(v14 + 136);
      *(_QWORD *)(v14 + 136) = v13;

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __35__CPLMingleChangesScopeTask_launch__block_invoke_2;
      v23[3] = &unk_1E60DD160;
      v23[4] = *(_QWORD *)(a1 + 40);
      v24 = *(id *)(a1 + 56);
      v25 = *(id *)(a1 + 48);
      objc_msgSend(v22, "do:", v23);

    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "scopeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v16, "hasStashedChangesForScopeWithIdentifier:", v17);

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
      if (v18)
      {
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v18, "scopeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v19, "hasStashedChangesForScopeWithIdentifier:", v20);

      }
    }
    if (objc_msgSend(v3, "shouldTrackAdditionalInitialSyncDatesForScope:", *(_QWORD *)(a1 + 56)))
    {
      objc_msgSend(v3, "initialMingleDateForScope:", *(_QWORD *)(a1 + 56));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 184) = v21 == 0;

    }
  }

}

void __35__CPLMingleChangesScopeTask_launch__block_invoke_3(uint64_t a1, void *a2)
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
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(v8, "_unstashRecordsForScope:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_mingleRemappings");
  }

}

uint64_t __35__CPLMingleChangesScopeTask_launch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(*(id *)(a1 + 48), "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v3, v5, 0, 0, a2);

  return v6;
}

void __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transientPullRepository");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_2;
    v9[3] = &unk_1E60DDB30;
    v10 = v4;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v12 = v6;
    v7 = v4;
    objc_msgSend(v8, "do:", v9);

  }
}

void __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (!v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v6 = *(void **)(a1 + 32);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "taskDidFinishWithError:", v7);

      goto LABEL_11;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v8 = *(_QWORD **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
LABEL_7:
      objc_msgSend(v8, "_unstashRecordsForScope:", v9);
      goto LABEL_11;
    }
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);

      if (v12)
      {
        v8 = *(_QWORD **)(a1 + 32);
        v9 = v8[16];
        goto LABEL_7;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_mingleRemappings");
    goto LABEL_11;
  }
  objc_msgSend(v13, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskDidFinishWithError:", v5);

LABEL_11:
}

uint64_t __53__CPLMingleChangesScopeTask__unstashRecordsForScope___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "unstashRecordsForScopeWithIdentifier:maxCount:hasMore:error:", v5, 1000, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, a2);

  return v6;
}

void __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transientPullRepository");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_2;
    v13[3] = &unk_1E60DA8A0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v15 = v5;
    v16 = v6;
    v13[1] = 3221225472;
    v14 = v4;
    v17 = v7;
    v8 = v12;
    v9 = *(_QWORD *)(a1 + 48);
    v18 = v8;
    v19 = v9;
    v10 = v5;
    v11 = v4;
    objc_msgSend(v8, "do:", v13);

  }
}

void __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    objc_msgSend(v3, "taskDidFinishWithError:", v4);

    goto LABEL_6;
  }
  objc_msgSend(v8, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v8, "error");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v7, "_mingleRemappings");
  }
  else if (v7[16])
  {
    objc_msgSend(v7, "_mingleSharedRemappings");
  }
  else
  {
    objc_msgSend(v7, "_mingleOtherChanges");
  }
LABEL_6:

}

BOOL __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "nextBatchOfRemappedRecordsInScope:maximumCount:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "maximumCountOfRecordsInBatches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 176) += objc_msgSend(v4, "count");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_3;
    v9[3] = &unk_1E60DA828;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v9[4] = *(_QWORD *)(a1 + 48);
    v10 = v4;
    v11 = *(id *)(a1 + 64);
    v7 = +[CPLMingleUtility mingleRemappedBatch:scope:forStore:onPutBatchInPullQueue:error:](CPLMingleUtility, "mingleRemappedBatch:scope:forStore:onPutBatchInPullQueue:error:", v10, v5, v6, v9, a2);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v7 = 1;
  }

  return v7;
}

uint64_t __46__CPLMingleChangesScopeTask__mingleRemappings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_noteBatchWasAddedInPullQueue:fromBatch:transaction:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return 1;
}

void __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v14;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transientPullRepository");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_2;
    v9[3] = &unk_1E60DA878;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v10 = v4;
    v11 = v5;
    v12 = v6;
    v13 = v8;
    v14 = *(_OWORD *)(a1 + 48);
    v7 = v4;
    objc_msgSend(v13, "do:", v9);

  }
}

void __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    objc_msgSend(v3, "taskDidFinishWithError:", v4);

    goto LABEL_6;
  }
  objc_msgSend(v8, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v8, "error");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_fixUpPrivateRecordsPointingToRemappedSharedRecords:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(v7, "_mingleSharedRemappings");
    else
      objc_msgSend(v7, "_mingleOtherChanges");
  }
LABEL_6:

}

BOOL __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "nextBatchOfRemappedRecordsInScope:maximumCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), objc_msgSend(*(id *)(a1 + 32), "maximumCountOfRecordsInBatches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) += objc_msgSend(v4, "count");
    objc_msgSend(*(id *)(a1 + 40), "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(v6 + 128);
    v16 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_3;
    v13[3] = &unk_1E60DA828;
    v13[4] = v6;
    v14 = v4;
    v15 = *(id *)(a1 + 56);
    v9 = +[CPLMingleUtility mingleSharedRemappedBatch:scope:sharedScope:forStore:fixUpTasks:onPutBatchInPullQueue:error:](CPLMingleUtility, "mingleSharedRemappedBatch:scope:sharedScope:forStore:fixUpTasks:onPutBatchInPullQueue:error:", v14, v5, v8, v7, &v16, v13, a2);
    v10 = v16;
    v11 = v16;

    if (v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v9 = 1;
  }

  return v9;
}

uint64_t __52__CPLMingleChangesScopeTask__mingleSharedRemappings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_noteBatchWasAddedInPullQueue:fromBatch:transaction:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return 1;
}

void __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(v4 + 136);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke_2;
  v16 = &unk_1E60DD6F8;
  v17 = v4;
  v18 = v5;
  objc_msgSend(v3, "fixUpSparseRecordsTaskWithTasks:transportScopeMapping:completionHandler:", v18, v6, &v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 144);
  *(_QWORD *)(v8 + 144) = v7;

  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[18];
  objc_msgSend(v3, "createGroupForFixUpTasks", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "launchTransportTask:withTransportGroup:", v11, v12);

}

void __81__CPLMingleChangesScopeTask__fixUpPrivateRecordsPointingToRemappedSharedRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "engineLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteServerHasChanges");

  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Failed to fix %@: %@", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_acknownledgeFixUpTasks:", *(_QWORD *)(a1 + 40));
  }

}

void __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  if (objc_msgSend(a1[4], "checkScopeIsValidInTransaction:"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_2;
    v6[3] = &unk_1E60DDA58;
    v3 = a1[5];
    v4 = a1[4];
    v7 = v3;
    v8 = v4;
    v9 = a1[6];
    v10 = v5;
    objc_msgSend(v10, "do:", v6);

  }
}

void __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(void **)(a1 + 32);
    if (!v5)
    {
      objc_msgSend(v3, "_mingleSharedRemappings");
      goto LABEL_7;
    }
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  objc_msgSend(v3, "taskDidFinishWithError:", v4);

LABEL_7:
}

BOOL __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v9[5];
  id v10;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_3;
  v9[3] = &unk_1E60DA850;
  v6 = *(_QWORD *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v7 = +[CPLMingleUtility applyShareRemapFixUpTasks:scope:store:onPutBatchInPullQueue:error:](CPLMingleUtility, "applyShareRemapFixUpTasks:scope:store:onPutBatchInPullQueue:error:", v4, v5, v6, v9, a2);

  return v7;
}

uint64_t __53__CPLMingleChangesScopeTask__acknownledgeFixUpTasks___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_noteBatchWasAddedInPullQueue:fromBatch:transaction:", a2, 0, *(_QWORD *)(a1 + 40));
  return 1;
}

void __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  uint8_t v26[16];
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "scope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD **)(a1 + 32);
    if (!v5[15])
    {
      objc_msgSend(v5, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transientPullRepository");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "batchStorageForScope:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(_QWORD *)(v9 + 112) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
      objc_msgSend(v4, "scopeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLBatchExtractionStrategy minglingStrategyWithStorage:coveringScopeIdentifier:maximumBatchSize:](CPLBatchExtractionStrategy, "minglingStrategyWithStorage:coveringScopeIdentifier:maximumBatchSize:", v11, v12, objc_msgSend(v7, "maximumCountOfRecordsInBatches"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 120);
      *(_QWORD *)(v14 + 120) = v13;

      v5 = *(_QWORD **)(a1 + 32);
    }
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__12200;
    v33[4] = __Block_byref_object_dispose__12201;
    v34 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_2;
    v27[3] = &unk_1E60DA878;
    v27[4] = v5;
    v31 = v33;
    v32 = *(_QWORD *)(a1 + 48);
    v16 = v4;
    v28 = v16;
    v29 = *(id *)(a1 + 40);
    v17 = v3;
    v30 = v17;
    objc_msgSend(v17, "do:", v27);
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("CPLDisableAutomaticReshare"));

        if ((v20 & 1) != 0)
          goto LABEL_9;
        +[CPLReshareTask cutoffDate](CPLReshareTask, "cutoffDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ignoredRecords");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "scopeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "scopeIdentifier:hasIgnoredRecordsBeforeDate:", v22, v18);

        if (v23)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_12177();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v26 = 0;
              _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "It seems some ignored records will need to be reshared after mingling", v26, 2u);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "session");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "requestSyncStateAtEndOfSyncSession:reschedule:", 9, 1);

        }
      }
      else
      {
        v18 = 0;
      }
    }

LABEL_9:
    _Block_object_dispose(v33, 8);

  }
}

void __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_55(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    objc_msgSend(v3, "taskDidFinishWithError:", v4);

    goto LABEL_6;
  }
  objc_msgSend(v8, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v8, "error");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(v7, "_mingleOtherChanges");
  else
    objc_msgSend(v7, "_finishMingling");
LABEL_6:

}

BOOL __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;
  int v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id obj;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  obj = 0;
  v6 = objc_msgSend(v4, "extractBatch:maximumResourceSize:error:", &obj, -1, a2);
  objc_storeStrong(v5, obj);
  if (!v6)
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "batch");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v7, "count") != 0;
  if (v7
    && (v8 = *(_BYTE **)(a1 + 32), v8[152])
    && (objc_msgSend(v8, "_filteredBatchByStashingRecordsIfNecessary:error:", v7, a2),
        v9 = objc_claimAutoreleasedReturnValue(),
        v7,
        (v7 = (id)v9) == 0))
  {
    v12 = 0;
  }
  else if (objc_msgSend(v7, "count"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) += objc_msgSend(v7, "count");
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_3;
    v14[3] = &unk_1E60DA828;
    v14[4] = *(_QWORD *)(a1 + 32);
    v7 = v7;
    v15 = v7;
    v16 = *(id *)(a1 + 56);
    v12 = +[CPLMingleUtility mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:](CPLMingleUtility, "mingleChangeBatch:scope:forStore:onPutBatchInPullQueue:error:", v7, v11, v10, v14, a2);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __48__CPLMingleChangesScopeTask__mingleOtherChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_noteBatchWasAddedInPullQueue:fromBatch:transaction:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return 1;
}

void __78__CPLMingleChangesScopeTask__filteredBatchByStashingRecordsIfNecessary_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  char v41;
  NSObject *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  _BYTE *v53;
  void *v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char v61;
  uint8_t v62[128];
  uint8_t buf[4];
  id v64;
  __int16 v65;
  NSObject *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  objc_msgSend(*(id *)(a1 + 32), "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v61);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = objc_msgSend(v8, "copy");
  -[NSObject setScopeIndex:](v9, "setScopeIndex:", *(_QWORD *)(a1 + 96));
  if (objc_msgSend(v7, "isDelete"))
  {
    if (objc_msgSend(v7, "isMasterChange"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_67;
        *(_DWORD *)buf = 138412290;
        v64 = v7;
        v11 = "%@ is a master delete - stashing change";
        v12 = v10;
        v13 = 12;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_67;
      }
      goto LABEL_92;
    }
    objc_msgSend(*(id *)(a1 + 40), "changeWithScopedIdentifier:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v14)
    {
      if ((-[NSObject isDelete](v14, "isDelete") & 1) == 0)
      {
        if ((objc_msgSend(v7, "isFullRecord") & 1) == 0)
        {
          if (_CPLSilentLogging)
          {
            v27 = 0;
            LOBYTE(v19) = 1;
            goto LABEL_71;
          }
          __CPLTaskOSLogDomain_12177();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v64 = v7;
            v65 = 2112;
            v66 = v9;
            _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_DEFAULT, "%@ conflicts with update on change %@ in push repository - deleting the local change", buf, 0x16u);
          }
          v27 = 0;
          LOBYTE(v19) = 1;
LABEL_56:

          goto LABEL_71;
        }
        if (_CPLSilentLogging)
          goto LABEL_67;
        __CPLTaskOSLogDomain_12177();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_43:
          LOBYTE(v19) = 0;
          v27 = 1;
          goto LABEL_56;
        }
        *(_DWORD *)buf = 138412546;
        v64 = v7;
        v65 = 2112;
        v66 = v9;
        v16 = "%@ conflicts with non-delete change %@ in push repository - stashing change";
        v17 = v15;
        v18 = 22;
LABEL_42:
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_43;
      }
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "hasAnyRecordWithRelatedScopedIdentifier:", v8) & 1) != 0
        || objc_msgSend(*(id *)(a1 + 40), "hasAnyChangeWithRelatedScopedIdentifier:", v9))
      {
        if (_CPLSilentLogging)
        {
          v10 = 0;
          goto LABEL_67;
        }
        __CPLTaskOSLogDomain_12177();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
        *(_DWORD *)buf = 138412290;
        v64 = v7;
        v16 = "%@ has a conflicting change pointing to that record in the cloud cache or push repository - stashing change";
        v17 = v15;
        v18 = 12;
        goto LABEL_42;
      }
      v10 = 0;
    }
    LOBYTE(v19) = 0;
LABEL_70:
    v27 = 0;
    goto LABEL_71;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasSomeChangeWithScopedIdentifier:", v9))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_67;
      *(_DWORD *)buf = 138412546;
      v64 = v7;
      v65 = 2112;
      v66 = v9;
      v11 = "%@ conflicts with change %@ in push repository - stashing change";
      v12 = v10;
      v13 = 22;
      goto LABEL_12;
    }
LABEL_92:
    LOBYTE(v19) = 0;
    goto LABEL_72;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v7, "scopedIdentifiersForMapping");
  v10 = objc_claimAutoreleasedReturnValue();
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (!v19)
    goto LABEL_70;
  v53 = a4;
  v54 = a3;
  v52 = v9;
  v20 = *(_QWORD *)v58;
LABEL_21:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v58 != v20)
      objc_enumerationMutation(v10);
    v22 = *(NSObject **)(*((_QWORD *)&v57 + 1) + 8 * v21);
    if ((-[NSObject isEqual:](v22, "isEqual:", v8) & 1) != 0)
      goto LABEL_33;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v24 = objc_claimAutoreleasedReturnValue();
        a3 = v54;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v7;
          v65 = 2112;
          v66 = v22;
          v28 = "%@ points to %@ which has been stashed in the same batch - stashing change";
LABEL_50:
          _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
        }
LABEL_51:
        v9 = v52;
        a4 = v53;
        goto LABEL_66;
      }
LABEL_98:
      LOBYTE(v19) = 0;
      v27 = 1;
LABEL_36:
      v9 = v52;
      a4 = v53;
      a3 = v54;
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 112), "isRecordWithScopedIdentifierStashed:", v22))
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v24 = objc_claimAutoreleasedReturnValue();
        a3 = v54;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v7;
          v65 = 2112;
          v66 = v22;
          v28 = "%@ points to %@ which has been stashed - stashing change";
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      goto LABEL_98;
    }
    objc_msgSend(*(id *)(a1 + 32), "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v22);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      v24 = -[NSObject copy](v22, "copy");
    -[NSObject setScopeIndex:](v24, "setScopeIndex:", *(_QWORD *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "changeWithScopedIdentifier:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      break;
LABEL_32:

LABEL_33:
    if (v19 == ++v21)
    {
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v19)
        goto LABEL_21;
      v27 = 0;
      goto LABEL_36;
    }
  }
  if (!-[NSObject isDelete](v25, "isDelete"))
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "hasRecordWithScopedIdentifier:", v22) & 1) == 0)
    {
      v9 = v52;
      a4 = v53;
      a3 = v54;
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v7;
          v65 = 2112;
          v66 = v26;
          v30 = "%@ points to %@ which is in push repository and has not yet been uploaded - stashing change";
LABEL_63:
          _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
        }
        goto LABEL_64;
      }
      goto LABEL_65;
    }
    goto LABEL_32;
  }
  v9 = v52;
  a4 = v53;
  a3 = v54;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v7;
      v65 = 2112;
      v66 = v24;
      v30 = "%@ points to a deleted %@ in push repository - stashing change";
      goto LABEL_63;
    }
LABEL_64:

  }
LABEL_65:

LABEL_66:
LABEL_67:
  LOBYTE(v19) = 0;
  v27 = 1;
LABEL_71:

  if (v27)
  {
LABEL_72:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v7, v8);
      objc_msgSend(*(id *)(a1 + 72), "addIndex:", a3);
      if (!objc_msgSend(*(id *)(a1 + 72), "count"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12177();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v64 = a3;
            _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_ERROR, "Adding %lu to index set failed", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *(_QWORD *)(a1 + 104);
        v50 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleChangesTask.m");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v49, v50, v51, 407, CFSTR("Adding %lu to index set failed"), a3);

        abort();
      }
      v31 = *(void **)(*(_QWORD *)(a1 + 64) + 112);
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      obj = *(id *)(v32 + 40);
      v33 = objc_msgSend(v31, "stashChange:error:", v7, &obj);
      objc_storeStrong((id *)(v32 + 40), obj);
      if ((v33 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_12177();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v64 = v7;
            v65 = 2112;
            v66 = v35;
            _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_ERROR, "Failed to stash %@ : %@", buf, 0x16u);
          }

        }
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = 0;

      }
    }
  }
  v38 = v19 ^ 1;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    v38 = 1;
  if ((v38 & 1) == 0)
  {
    v39 = *(void **)(a1 + 40);
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v55 = *(id *)(v40 + 40);
    v41 = objc_msgSend(v39, "discardChangeWithScopedIdentifier:error:", v9, &v55);
    objc_storeStrong((id *)(v40 + 40), v55);
    if ((v41 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_12177();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v64 = v43;
          v65 = 2112;
          v66 = v9;
          v44 = v43;
          _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_ERROR, "Failed to discard local change <%@ %@>", buf, 0x16u);

        }
      }
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v46 = *(void **)(v45 + 40);
      *(_QWORD *)(v45 + 40) = 0;

    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    *a4 = 1;

}

void __44__CPLMingleChangesScopeTask__finishMingling__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_2;
    v6[3] = &unk_1E60DDA30;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v7 = v3;
    v8 = v4;
    objc_msgSend(v5, "do:", v6);

  }
}

void __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(void **)(a1 + 32);
    if (!v5)
    {
      objc_msgSend(v3, "taskDidFinishWithError:", 0);
      goto LABEL_7;
    }
    objc_msgSend(v7, "error");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  objc_msgSend(v3, "taskDidFinishWithError:", v4);

LABEL_7:
}

uint64_t __44__CPLMingleChangesScopeTask__finishMingling__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientSyncAnchorForScope:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "cplSyncAnchorDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "New sync anchor for %@: %@", (uint8_t *)&v15, 0x16u);

    }
  }
  if (!v6)
    goto LABEL_13;
  if (!objc_msgSend(v4, "setSyncAnchor:forScope:error:", v6, v5, a2))
    goto LABEL_14;
  if ((objc_msgSend(v4, "hasStagedSyncAnchorForScope:", v5) & 1) != 0)
    goto LABEL_13;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "No changes or staged sync anchor for %@ after mingling - discarding transient sync anchor", (uint8_t *)&v15, 0xCu);

    }
  }
  if (objc_msgSend(v4, "storeTransientSyncAnchor:forScope:error:", 0, v5, a2))
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "idMapping");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scopeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "markAllPendingIdentifiersForScopeWithIdentifier:asFinalWithError:", v12, a2);

  }
  else
  {
LABEL_14:
    v13 = 0;
  }

  return v13;
}

void __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BYTE *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transientPullRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 40));

  if (!*(_QWORD *)(a1 + 48))
  {
    v4 = *(_BYTE **)(a1 + 40);
    if (v4[184])
    {
      if (objc_msgSend(v4, "isScopeValidInTransaction:", v5))
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_2;
        v6[3] = &unk_1E60DD160;
        v7 = *(id *)(a1 + 32);
        v8 = *(id *)(a1 + 56);
        v9 = v5;
        objc_msgSend(v9, "do:", v6);

      }
    }
  }

}

void __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = v6;
  v8.super_class = (Class)CPLMingleChangesScopeTask;
  objc_msgSendSuper2(&v8, sel_taskDidFinishWithError_, v7);
  if (!v5)

}

uint64_t __52__CPLMingleChangesScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  v6 = objc_msgSend(v4, "setScope:hasCompletedInitialMinglingWithError:", v5, &v14);
  v7 = v14;

  if ((v6 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Stored initial mingling date for %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_12177();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to store initial mingling date for %@: %@", buf, 0x16u);

      }
    }
    if (a2)
      *a2 = objc_retainAutorelease(v7);
  }

  return v6;
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 169))
  {
    v2 = (void *)MEMORY[0x1B5E08BF0]();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_reallyNotifySchedulerPullQueueIsFull");
    objc_autoreleasePoolPop(v2);
  }
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  _QWORD block[4];
  id v12;

  v3 = a2;
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 168))
    {
      v5 = *(void **)(v4 + 160);
      v6 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_2;
      v10[3] = &unk_1E60D65B8;
      v10[4] = v4;
      v7 = v10;
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_12187;
      block[3] = &unk_1E60D71F8;
      v12 = v7;
      v8 = v5;
      v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v8, v9);

    }
    else
    {
      objc_msgSend((id)v4, "_reallyNotifySchedulerPullQueueIsFull");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 1;
    }
  }

}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 169))
  {
    *(_BYTE *)(v1 + 169) = 1;
    objc_msgSend(*(id *)(a1 + 32), "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetNoteClientNeedsToPull");

    v4 = dispatch_time(0, 10000000000);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 160);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_3;
    block[3] = &unk_1E60D65B8;
    block[4] = v5;
    dispatch_after(v4, v6, block);
  }
}

void __74__CPLMingleChangesScopeTask__notifySchedulerPullQueueIsFullInTransaction___block_invoke_3(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 169))
  {
    v2 = (void *)MEMORY[0x1B5E08BF0]();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_reallyNotifySchedulerPullQueueIsFull");
    objc_autoreleasePoolPop(v2);
  }
}

@end
