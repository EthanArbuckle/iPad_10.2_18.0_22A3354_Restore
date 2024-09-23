@implementation CPLEngineTransientRepositoryBatchStorage

- (CPLEngineTransientRepositoryBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4
{
  id v7;
  id v8;
  CPLEngineTransientRepositoryBatchStorage *v9;
  CPLEngineTransientRepositoryBatchStorage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineTransientRepositoryBatchStorage;
  v9 = -[CPLEngineTransientRepositoryBatchStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transientRepository, a3);
    objc_storeStrong((id *)&v10->_scope, a4);
  }

  return v10;
}

- (BOOL)stashChange:(id)a3 error:(id *)a4
{
  CPLEngineTransientRepository *transientRepository;
  void *v6;

  transientRepository = self->_transientRepository;
  objc_msgSend(a3, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CPLEngineTransientRepository stashChangeWithScopedIdentifier:error:](transientRepository, "stashChangeWithScopedIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3
{
  return -[CPLEngineTransientRepository hasStashedRecordWithScopedIdentifier:](self->_transientRepository, "hasStashedRecordWithScopedIdentifier:", a3);
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  return -[CPLEngineTransientRepository allUnmingledChangesWithClass:relatedScopedIdentifier:](self->_transientRepository, "allUnmingledChangesWithClass:relatedScopedIdentifier:", a3, a4);
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  id v9;
  CPLEngineTransientRepository *transientRepository;
  void *v11;
  uint64_t v12;
  CPLEngineTransientRepository *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v9 = a4;
  if (a5)
  {
    if (a5 != 1024)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 48, CFSTR("Trying to extract batches using change type %@"), v18);

      abort();
    }
    transientRepository = self->_transientRepository;
    -[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineTransientRepository allUnmingledDeletedChangesWithClass:scopeIdentifier:](transientRepository, "allUnmingledDeletedChangesWithClass:scopeIdentifier:", a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = self->_transientRepository;
    -[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineTransientRepository allUnmingledNonDeletedChangesWithClass:scopeIdentifier:](v13, "allUnmingledNonDeletedChangesWithClass:scopeIdentifier:", a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v12;

  return v14;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 53, CFSTR("Trying to extract batches using unsupported %@"), v10);

  abort();
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 57, CFSTR("Trying to extract batches using unsupported %@"), v9);

  abort();
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  return -[CPLEngineTransientRepository allUnmingledChangesWithScopeIdentifier:](self->_transientRepository, "allUnmingledChangesWithScopeIdentifier:", a3);
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  return -[CPLEngineTransientRepository allUnmingledNonDeletedChangesWithClass:scopeIdentifier:](self->_transientRepository, "allUnmingledNonDeletedChangesWithClass:scopeIdentifier:", a3, a4);
}

- (id)changeWithScopedIdentifier:(id)a3
{
  return -[CPLEngineTransientRepository unmingledChangeWithScopedIdentifier:](self->_transientRepository, "unmingledChangeWithScopedIdentifier:", a3);
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 73, CFSTR("%@ should not be used on %@"), v8, objc_opt_class());

  abort();
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  return -[CPLEngineTransientRepository hasUnmingledNonStashedRecordsForScopeWithIdentifier:](self->_transientRepository, "hasUnmingledNonStashedRecordsForScopeWithIdentifier:", a3);
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  CPLEngineTransientRepository *transientRepository;
  void *v6;

  transientRepository = self->_transientRepository;
  objc_msgSend(a3, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CPLEngineTransientRepository markUnmingledChangeWithScopedIdentifierAsMingled:error:](transientRepository, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v6, a4);

  return (char)a4;
}

- (void)beginExtractingBatch
{
  CPLRecordTargetMapping *v3;
  CPLRecordTargetMapping *targetMapping;

  v3 = objc_alloc_init(CPLRecordTargetMapping);
  targetMapping = self->_targetMapping;
  self->_targetMapping = v3;

  -[CPLRecordTargetMapping startTrackingUpdates](self->_targetMapping, "startTrackingUpdates");
}

- (void)cleanupAfterExtractingBatch
{
  BOOL v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CPLRecordTargetMapping hasUpdatedTargets](self->_targetMapping, "hasUpdatedTargets"))
    v3 = _CPLSilentLogging == 0;
  else
    v3 = 0;
  if (v3)
  {
    __CPLStorageOSLogDomain_487();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLRecordTargetMapping updatedTargetsDescription](self->_targetMapping, "updatedTargetsDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "After extraction, updated targets:\n%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (CPLEngineTransientRepository)transientRepository
{
  return self->_transientRepository;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_transientRepository, 0);
}

@end
