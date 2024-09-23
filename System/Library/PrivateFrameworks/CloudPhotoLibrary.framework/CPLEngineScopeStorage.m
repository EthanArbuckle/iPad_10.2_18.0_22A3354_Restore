@implementation CPLEngineScopeStorage

- (CPLEngineScopeStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  CPLEngineScopeStorage *v4;
  _CPLEngineScopeCache *v5;
  _CPLEngineScopeCache *scopeCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLEngineScopeStorage;
  v4 = -[CPLEngineStorage initWithEngineStore:name:](&v8, sel_initWithEngineStore_name_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(_CPLEngineScopeCache);
    scopeCache = v4->_scopeCache;
    v4->_scopeCache = v5;

  }
  return v4;
}

- (BOOL)openWithError:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPLEngineScopeStorage;
  v4 = -[CPLEngineStorage openWithError:](&v7, sel_openWithError_, a3);
  if (v4)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_someScopeMightHaveToBePulledByClient = objc_msgSend(v5, "shouldSyncScopeList");

  }
  return v4;
}

- (unint64_t)scopeType
{
  return 0;
}

- (void)_clearScopeCache
{
  _CPLEngineScopeCache *v3;
  _CPLEngineScopeCache *scopeCache;

  v3 = objc_alloc_init(_CPLEngineScopeCache);
  scopeCache = self->_scopeCache;
  self->_scopeCache = v3;

}

- (void)_cacheScope:(id)a3
{
  -[_CPLEngineScopeCache cacheScope:forScopeStorage:](self->_scopeCache, "cacheScope:forScopeStorage:", a3, self);
}

- (void)_removeBrokenScope:(id)a3
{
  id v4;
  NSMutableArray *scopesToRemoveFromBrokenScopes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  v8 = v4;
  if (!scopesToRemoveFromBrokenScopes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_scopesToRemoveFromBrokenScopes;
    self->_scopesToRemoveFromBrokenScopes = v6;

    v4 = v8;
    scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  }
  -[NSMutableArray addObject:](scopesToRemoveFromBrokenScopes, "addObject:", v4);

}

- (id)_scopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CPLEngineScopeCache scopeWithIdentifier:](self->_scopeCache, "scopeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLEngineScopeStorage _cacheScope:](self, "_cacheScope:", v5);
  }

  return v5;
}

- (id)scopeWithLocalScopeIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[_CPLEngineScopeCache scopeWithLocalIndex:](self->_scopeCache, "scopeWithLocalIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeWithLocalIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLEngineScopeStorage _cacheScope:](self, "_cacheScope:", v5);
  }
  return v5;
}

- (id)scopeWithCloudScopeIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[_CPLEngineScopeCache scopeWithCloudIndex:](self->_scopeCache, "scopeWithCloudIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeWithCloudIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLEngineScopeStorage _cacheScope:](self, "_cacheScope:", v5);
  }
  return v5;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[_CPLEngineScopeCache scopeWithStableIndex:](self->_scopeCache, "scopeWithStableIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeWithStableIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPLEngineScopeStorage _cacheScope:](self, "_cacheScope:", v5);
  }
  return v5;
}

- (void)_forceSyncManagerPriorityBoost
{
  self->_shouldChangeSyncManagerPriorityBoost = 1;
  self->_syncManagerPriorityBoost = 1;
}

- (void)_checkSyncManagerPriorityBoost
{
  id v3;

  self->_shouldChangeSyncManagerPriorityBoost = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_syncManagerPriorityBoost = objc_msgSend(v3, "hasScopesNeedingToPushHighPriorityChangesToTransport");

}

- (id)enumeratorForScopesIncludeInactive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorForScopesIncludeInactive:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)enumeratorForDeletedStagedScopes
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForDeletedStagedScopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)enumeratorForScopesNeedingUpdateFromTransport
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingUpdateFromTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingToPushHighPriorityChangesToTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasScopesNeedingToPushHighPriorityChangesToTransport");

  return v3;
}

- (id)enumeratorForScopesNeedingToPushChangesToTransport
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingToPushChangesToTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasScopesNeedingToPushChangesToTransport
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasScopesNeedingToPushChangesToTransport");

  return v3;
}

- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 changeTypes:(unint64_t)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFEFFLL) != 0)
    v9 = a4 & 0xFFFFFFFFFFFFFEFFLL;
  else
    v9 = 122;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flagsForScope:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "valueForFlag:", 0x20000))
  {
    self->_schedulePushHighPriorityToTransportChangeTypes |= v9;
    -[CPLEngineScopeStorage _forceSyncManagerPriorityBoost](self, "_forceSyncManagerPriorityBoost");
  }
  else
  {
    self->_schedulePushToTransportChangeTypes |= v9;
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "setScopeHasChangesToPushToTransport:error:", v8, a5);

  return v13;
}

- (int64_t)pushToTransportTaskForScope:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pushToTransportTaskForScope:", v4);

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setScope:hasCompletedPushToTransportTask:error:", v8, a4, a5);

  if (v10)
    -[CPLEngineScopeStorage _checkSyncManagerPriorityBoost](self, "_checkSyncManagerPriorityBoost");
  return v10;
}

- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeNeedToPushChangesToTransport:", v4);

  return v6;
}

- (id)enumeratorForScopesNeedingToPullChangesFromTransport
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingToPullChangesFromTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasScopesNeedingToPullChangesFromTransport
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasScopesNeedingToPullChangesFromTransport");

  return v3;
}

- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v6))
  {
    v7 = -[CPLEngineScopeStorage setScopeNeedsUpdateFromTransport:error:](self, "setScopeNeedsUpdateFromTransport:error:", v6, a4);
  }
  else
  {
    self->_schedulePullFromTransport = 1;
    -[CPLEngineScopeStorage scopeChangeForScope:](self, "scopeChangeForScope:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "shouldAlwaysUpdateScopeInfoWhenPossible")
      && !-[CPLEngineScopeStorage setScopeNeedsUpdateFromTransport:error:](self, "setScopeNeedsUpdateFromTransport:error:", v6, a4))
    {
      v7 = 0;
    }
    else
    {
      -[CPLEngineStorage platformObject](self, "platformObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "setScopeHasChangesToPullFromTransport:error:", v6, a4);

    }
  }

  return v7;
}

- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3
{
  void *v4;

  self->_schedulePullFromTransport = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "setAllScopesHasChangesToPullFromTransportWithError:", a3);

  return (char)a3;
}

- (int64_t)pullFromTransportTaskForScope:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pullFromTransportTaskForScope:", v4);

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v9, "setScope:hasCompletedPullFromTransportTask:error:", v8, a4, a5);

  if ((_DWORD)a4)
  {
    if (-[CPLEngineScopeStorage shouldTrackAdditionalInitialSyncDatesForScope:](self, "shouldTrackAdditionalInitialSyncDatesForScope:", v8)&& (-[CPLEngineScopeStorage initialMetadataDownloadDateForScope:](self, "initialMetadataDownloadDateForScope:", v8), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412290;
          v17 = v8;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Setting initial metadata download date for %@", (uint8_t *)&v16, 0xCu);
        }

      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "storeInitialMetadataDownloadDate:forScope:error:", v15, v8, a5);

    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeNeedToPullChangesFromTransport:", v4);

  return v6;
}

- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "setPullFromTransportExpirationInterval:scope:error:", v8, a5, a3);

  return (char)a5;
}

- (id)enumeratorForScopesWithMingling
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesWithMingling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)doScopesNeedMetadataSync:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "doScopesNeedMetadataSync:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientPullRepository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "hasUnmingledOrStashedRecordsWithScopeFilter:", v4);

  }
  return v6;
}

- (id)_scopeChangeToBePulledByClientForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagsForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", objc_msgSend(v4, "scopeType"));
  if (objc_msgSend(v6, "valueForFlag:", 4) && (objc_msgSend(v6, "valueForFlag:", 64) & 1) == 0)
  {
    objc_msgSend(v4, "scopeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[objc_class newDeleteScopeChangeWithScopeIdentifier:type:](v7, "newDeleteScopeChangeWithScopeIdentifier:type:", v8, objc_msgSend(v4, "scopeType"));
  }
  else
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopeChangeForScope:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  if (v10)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "clientNeedsToPullTaskForScope:", v4);

    objc_msgSend(v10, "setPullTaskItem:", v12);
    objc_msgSend(v10, "setScope:", v4);
  }

  return v10;
}

- (id)scopeChangesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CPLChangeBatch *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  if (!self->_someScopeMightHaveToBePulledByClient)
    return 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[CPLEngineScopeStorage _scopeChangeToBePulledByClientForScope:](self, "_scopeChangeToBePulledByClientForScope:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_7377();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "scopeIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v27 = v18;
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "failed to create a scope change for %@", buf, 0xCu);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "scopeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v20, 343, CFSTR("failed to create a scope change for %@"), v21);

          abort();
        }
        v15 = (void *)v14;
        if (!v10)
          v10 = objc_alloc_init(CPLChangeBatch);
        -[CPLChangeBatch addRecord:](v10, "addRecord:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);

  }
  else
  {

    v10 = 0;
    self->_clearSomeScopeMightHaveToBePulledByClient = 1;
  }
  return v10;
}

- (BOOL)clientAcknowledgedScopeChanges:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  BOOL v23;
  _BOOL4 v24;
  uint64_t v25;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "isScopeChange");
        v14 = v13;
        if (a4 && (v13 & 1) == 0)
        {
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("incorrect change of class %@ in a batch of scope changes"), objc_opt_class());
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "scope");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
          v16 = 0;
        else
          v16 = v14;
        if (v16 == 1)
        {
          if (a4)
          {
            objc_msgSend(v12, "scopeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("missing inner scope in scope change for %@"), v17);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

          }
LABEL_31:
          v26 = 0;
          goto LABEL_32;
        }
        v17 = (void *)v15;
        if (!v14)
          goto LABEL_30;
        -[CPLEngineStorage platformObject](self, "platformObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "setScope:hasCompletedClientNeedsToPullTask:error:", v17, objc_msgSend(v12, "pullTaskItem"), a4);

        if (!v19)
          goto LABEL_30;
        if ((objc_msgSend(v12, "isDelete") & 1) != 0)
        {
          -[CPLEngineStorage engineStore](self, "engineStore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "libraryOptions");

          if ((v21 & 0x400) != 0
            || -[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v17))
          {
            objc_msgSend(v12, "scopeIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[CPLEngineScopeStorage deleteScopeWithIdentifier:error:](self, "deleteScopeWithIdentifier:error:", v22, a4);

            if (!v23)
              goto LABEL_31;
          }
          else
          {
            v24 = -[CPLEngineScopeStorage setValue:forFlag:forScope:error:](self, "setValue:forFlag:forScope:error:", 1, 16, v17, a4);

            if (!v24)
              goto LABEL_31;
          }
        }
        else
        {

        }
        ++v11;
      }
      while (v9 != v11);
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v9 = v25;
      v26 = 1;
    }
    while (v25);
  }
  else
  {
    v26 = 1;
  }
LABEL_32:

  return v26;
}

- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  self->_someScopeMightHaveToBePulledByClient = 1;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  self->_schedulePullFromClient = 1;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setScopeNeedsToBePulledByClient:error:", v6, a4);

  return (char)a4;
}

- (BOOL)doesScopeNeedToBePulledByClient:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeNeedToBePulledByClient:", v4);

  return v6;
}

- (BOOL)doesScopeSupportToBePulledByClient:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeSupportToBePulledByClient:", v4);

  return v6;
}

- (id)enumeratorForScopesNeedingToUpdateTransport
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingToUpdateTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createScopeFromScopeChange:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v12;

  v6 = a3;
  objc_msgSend(v6, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopeStorage createScopeWithIdentifier:scopeType:flags:transportScope:error:](self, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v7, objc_msgSend(v6, "scopeType"), objc_msgSend(v6, "defaultFlags"), 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = 0;
    -[CPLEngineStorage platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "storeScopeChange:forScope:scopeChangeHasBeenUpdated:error:", v6, v8, &v12, a4);

    if ((v10 & 1) == 0)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)updateScopeWithChange:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  void *v32;
  char v33;
  _QWORD v34[5];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  int buf;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke;
  v37[3] = &unk_1E60DC8F0;
  v39 = v40;
  v37[4] = self;
  v10 = v7;
  v38 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v37);
  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke_2;
  v34[3] = &unk_1E60DC8F0;
  v36 = v40;
  v34[4] = self;
  v12 = v10;
  v35 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x1B5E08DC4](v34);
  if (objc_msgSend(v6, "isDelete"))
  {
    if (!v8 || (v14 = objc_msgSend(v8, "scopeType")) == 0)
      v14 = objc_msgSend(v6, "scopeType");
    if (!v14)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          buf = 138412290;
          v43 = (uint64_t)v12;
          _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Client tried to delete an unknown scope %@", (uint8_t *)&buf, 0xCu);
        }

      }
      if (a4)
        goto LABEL_45;
      goto LABEL_58;
    }
    if (v14 == 1)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          buf = 138412290;
          v43 = (uint64_t)v12;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Client tried to delete library %@", (uint8_t *)&buf, 0xCu);
        }

      }
      if (a4)
      {
LABEL_45:
        +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v12);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_67;
      }
LABEL_58:
      v22 = 0;
      goto LABEL_67;
    }
  }
  v16 = v8 != 0;
  if (!v8)
  {
    v11[2](v11);
    -[CPLEngineScopeStorage _createScopeFromScopeChange:error:](self, "_createScopeFromScopeChange:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_58;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        buf = 138412290;
        v43 = (uint64_t)v8;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Client re-created scope %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v8))
  {
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if (!-[CPLEngineScopeStorage deleteScopeWithIdentifier:error:](self, "deleteScopeWithIdentifier:error:", v12, a4))
    goto LABEL_58;
  v11[2](v11);
  -[CPLEngineScopeStorage _createScopeFromScopeChange:error:](self, "_createScopeFromScopeChange:error:", v6, a4);
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v8 = 0;
    goto LABEL_58;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138412290;
      v43 = v17;
      _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Client activated scope %@", (uint8_t *)&buf, 0xCu);
    }
    v8 = (void *)v17;
LABEL_25:

    goto LABEL_27;
  }
  v16 = 1;
  v8 = (void *)v17;
LABEL_27:
  if (!objc_msgSend(v6, "isDelete"))
  {
    if (v16)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          buf = 138412290;
          v43 = (uint64_t)v8;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Client just created %@ - we will try to update it in the cloud", (uint8_t *)&buf, 0xCu);
        }

      }
      v20 = -[CPLEngineScopeStorage setScopeNeedsToUpdateTransport:error:](self, "setScopeNeedsToUpdateTransport:error:", v8, a4);
      goto LABEL_39;
    }
    -[CPLEngineStorage platformObject](self, "platformObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "flagsForScope:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v25, "valueForFlag:", 16) & 1) != 0)
    {
      v22 = 1;
LABEL_66:

      goto LABEL_67;
    }
    -[CPLEngineStorage platformObject](self, "platformObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scopeChangeForScope:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    objc_msgSend(v32, "updateScopeFromScopeChange:direction:didHaveChanges:", v6, 1, &v33);
    if (v33)
    {
      v33 = 0;
      -[CPLEngineStorage platformObject](self, "platformObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "storeScopeChange:forScope:scopeChangeHasBeenUpdated:error:", v32, v8, &v33, a4);

      if (!v28)
        goto LABEL_59;
      if (v33)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            buf = 138412290;
            v43 = (uint64_t)v8;
            _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change for %@ - we may have to update the cloud", (uint8_t *)&buf, 0xCu);
          }

        }
        if (-[CPLEngineScopeStorage setScopeNeedsToUpdateTransport:error:](self, "setScopeNeedsToUpdateTransport:error:", v8, a4, v32))
        {
          v22 = -[CPLEngineScopeStorage setScopeNeedsUpdateFromTransport:error:](self, "setScopeNeedsUpdateFromTransport:error:", v8, a4);
LABEL_65:

          goto LABEL_66;
        }
LABEL_59:
        v22 = 0;
        goto LABEL_65;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          buf = 138412290;
          v43 = (uint64_t)v8;
          _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change for %@ which did not result in an actual change", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    v22 = 1;
    goto LABEL_65;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138412290;
      v43 = (uint64_t)v8;
      _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Client pushed a scope delete for %@ - we will try to delete it in the cloud", (uint8_t *)&buf, 0xCu);
    }

  }
  v20 = -[CPLEngineScopeStorage setValue:forFlag:forScope:error:](self, "setValue:forFlag:forScope:error:", 1, 48, v8, a4);
LABEL_39:
  v22 = v20;
LABEL_67:
  v13[2](v13);

  _Block_object_dispose(v40, 8);
  return v22;
}

- (BOOL)hasScopesNeedingToUpdateTransport
{
  return 0;
}

- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  self->_scheduleATransportUpdate = 1;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setScopeNeedsToUpdateTransport:error:", v6, a4);

  return (char)a4;
}

- (int64_t)transportUpdateTaskForScope:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transportUpdateTaskForScope:", v4);

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "setScope:hasCompletedTransportUpdate:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)doesScopeNeedToUpdateTransport:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeNeedToUpdateTransport:", v4);

  return v6;
}

- (id)enumeratorForScopesNeedingToUploadComputeState
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForScopesNeedingToUploadComputeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasScopesNeedingToUploadComputeState
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasScopesNeedingToUploadComputeState");

  return v3;
}

- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setScopeNeedsToUploadComputeState:error:", v6, a4);

  return (char)a4;
}

- (int64_t)uploadComputeStateTaskForScope:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "uploadComputeStateTaskForScope:", v4);

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "setScope:hasCompletedUploadComputeStateTask:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)doesScopeNeedToUploadComputeState:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesScopeNeedToUploadComputeState:", v4);

  return v6;
}

- (id)allScopeIdentifiersIncludeInactive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CPLEngineScopeStorage _cacheScope:](self, "_cacheScope:", v11);
        objc_msgSend(v11, "scopeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_resetGlobalsForMainScope
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Resetting global status for %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setICloudLibraryHasBeenWiped:", 0);
  objc_msgSend(v6, "setIsExceedingQuota:", 0);
  objc_msgSend(v6, "setIsExceedingSharedLibraryQuota:", 0);
  objc_msgSend(v6, "setExitDeleteTime:", 0);
  objc_msgSend(v6, "updateInitialSyncDate:", 0);
  objc_msgSend(v6, "updateAccountFlagsData:", 0);
  objc_msgSend(v6, "setBusyState:", 0);

}

- (BOOL)_handledDisabledFeaturesForScopeIfNecessary:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disabledFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          +[CPLFeature featureWithName:](CPLFeature, "featureWithName:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[CPLEngineStorage engineStore](self, "engineStore");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "handleScopeWhenFeatureIsDisabled:scopeType:store:error:", v20, a4, v15, a5);

            if (!v16)
            {

              v17 = 0;
              goto LABEL_15;
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
      v17 = 1;
    }
    else
    {
      v17 = 1;
    }
LABEL_15:

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (id)createScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 flags:(int64_t)a5 transportScope:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  CPLEngineScopeFlagsUpdate *v24;
  void *v25;
  int v26;
  CPLEngineScopeFlagsUpdate *v28;
  uint64_t v29;
  int64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (a4 != 2)
  {
    if (!v15)
      goto LABEL_15;
    if (!a4)
    {
LABEL_9:
      -[CPLEngineStorage platformObject](self, "platformObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "flagsForScope:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setValue:forFlag:", 1, a5);
      if ((a5 & 0x10) == 0)
        objc_msgSend(v20, "setValue:forFlag:", 0, 16);
      v21 = -[CPLEngineScopeStorage updateFlags:forScope:error:](self, "updateFlags:forScope:error:", v20, v16, a7);

      if (v14 && v21)
      {
        if (-[CPLEngineScopeStorage setTransportScope:forScope:error:](self, "setTransportScope:forScope:error:", v14, v16, a7))
        {
          goto LABEL_23;
        }
      }
      else if (v21)
      {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
LABEL_8:
    if (!-[CPLEngineScopeStorage _setScopeType:forScope:error:](self, "_setScopeType:forScope:error:", a4, v16, a7))
      goto LABEL_22;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("CPLOwnedMomentSharesAreHighPriority"));

  if (v18)
    a5 |= 0x20000uLL;
  if (v16)
    goto LABEL_8;
LABEL_15:
  -[CPLEngineStorage platformObject](self, "platformObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addScopeWithIdentifier:scopeType:error:", v13, a4, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_23;
  if (!-[CPLEngineScopeStorage _handledDisabledFeaturesForScopeIfNecessary:type:error:](self, "_handledDisabledFeaturesForScopeIfNecessary:type:error:", v16, a4, a7))
  {
LABEL_22:

    v16 = 0;
    goto LABEL_23;
  }
  -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
  v23 = -[CPLEngineScopeStorage setTransportScope:forScope:error:](self, "setTransportScope:forScope:error:", v14, v16, a7);
  if (a5 && v23)
  {
    v24 = -[CPLEngineScopeFlagsUpdate initWithFlags:]([CPLEngineScopeFlagsUpdate alloc], "initWithFlags:", 0);
    -[CPLEngineScopeFlagsUpdate setValue:forFlag:](v24, "setValue:forFlag:", 1, a5);
    -[CPLEngineStorage platformObject](self, "platformObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "updateFlags:forScope:error:", v24, v16, a7);

    -[CPLEngineScopeStorage _notifyScopeObserversForScope:flagsUpdate:](self, "_notifyScopeObserversForScope:flagsUpdate:", v16, v24);
    if (!v26)
      goto LABEL_36;
  }
  else
  {
    if (!v23)
    {
LABEL_36:
      v34 = 0;
      goto LABEL_45;
    }
    if (-[NSMutableDictionary count](self->_scopeObservers, "count"))
    {
      v28 = -[CPLEngineScopeFlagsUpdate initWithFlags:]([CPLEngineScopeFlagsUpdate alloc], "initWithFlags:", 0);
      -[CPLEngineScopeStorage _notifyScopeObserversForScope:flagsUpdate:](self, "_notifyScopeObserversForScope:flagsUpdate:", v16, v28);

    }
  }
  if (overridesFeatureFlag != 1 || isFeatureEnabled)
  {
    v30 = a5 & 0x10;
  }
  else
  {
    v29 = objc_msgSend(v16, "scopeType");
    v30 = a5 & 0x10;
    if ((a5 & 0x10) == 0 && (v29 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v16;
          _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_ERROR, "Trying to create an active shared library scope but the feature is disabled %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v33, 685, CFSTR("Trying to create an active shared library scope but the feature is disabled %@"), v16);

      abort();
    }
  }
  if (v30)
  {
    v34 = 1;
  }
  else
  {
    if (-[CPLEngineScopeStorage _setSharingScopeIdentifier:error:](self, "_setSharingScopeIdentifier:error:", v16, a7))
    {
      -[CPLEngineStorage platformObject](self, "platformObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v35, "storeActivationDate:forScope:error:", v36, v16, a7);

    }
    else
    {
      v34 = 0;
    }
    -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v13, "isEqualToString:", v37);

    if (v38)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "engineLibrary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "noteMainScopeHasBeenActivated");

    }
  }
LABEL_45:
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v13, "isEqualToString:", v41);

  if (v42)
    self->_shouldResetGlobalsForMainScope = 1;
  self->_scheduleAScopeUpdate = 1;
  if ((v34 & 1) == 0)
    goto LABEL_22;
LABEL_23:

  return v16;
}

- (BOOL)_dropSharingScopeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  char v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  NSObject *v32;
  id *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)v6;
  v36 = v7;
  objc_msgSend(v7, "sharingScopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)v9;
  if (v8 && v9)
  {
    v11 = objc_msgSend((id)v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_4:
      v12 = 0;
      v13 = 1;
      goto LABEL_39;
    }
  }
  else
  {

    if (v8 | v10)
      goto LABEL_4;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v8;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Dropping %{public}@ as sharing scope", buf, 0xCu);
    }

  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dropSharingScopeIdentifier:", v8);

  -[CPLEngineStorage engineStore](self, "engineStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "engineLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "supervisor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  objc_msgSend(v18, "scopeStorage:didDropSharingScopeIdentifier:", self, v8);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v20)
  {
    v21 = v20;
    v34 = a4;
    v37 = 0;
    v22 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1B5E08BF0]();
        -[CPLEngineStorage platformObject](self, "platformObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "flagsForScope:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "valueForFlag:", 16)
          && (objc_msgSend(v27, "valueForFlag:", 36) & 1) == 0
          && (objc_msgSend(v24, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 4
          && (objc_msgSend(v24, "scopeIdentifier"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v29 = -[CPLEngineScopeStorage shouldAutoactivateScopeWithIdentifier:scopeType:](self, "shouldAutoactivateScopeWithIdentifier:scopeType:", v28, objc_msgSend(v24, "scopeType")), v28, v29))
        {
          v30 = v24;

          objc_autoreleasePoolPop(v25);
          if (v30)
          {

            -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v8 = v35;
              v7 = v36;
              if (-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v31))
              {
                v12 = 0;
                v13 = 1;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  __CPLStorageOSLogDomain_7377();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v44 = (unint64_t)v30;
                    v45 = 2114;
                    v46 = v35;
                    _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_DEFAULT, "Activating %@ as a new Shared library since %{public}@ has been dropped", buf, 0x16u);
                  }

                }
                objc_msgSend(v27, "setValue:forFlag:", 0, 16);
                v38 = 0;
                v13 = -[CPLEngineScopeStorage updateFlags:forScope:error:](self, "updateFlags:forScope:error:", v27, v30, &v38);
                v12 = v38;
              }
            }
            else
            {
              v12 = 0;
              v13 = 1;
              v8 = v35;
              v7 = v36;
            }

            if (v34 && !v13)
            {
              v12 = objc_retainAutorelease(v12);
              v13 = 0;
              *v34 = v12;
            }
            goto LABEL_39;
          }
          v37 = v27;
        }
        else
        {

          objc_autoreleasePoolPop(v25);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v37 = 0;
  }

  v12 = 0;
  v13 = 1;
  v8 = v35;
  v7 = v36;
LABEL_39:

  return v13;
}

- (BOOL)_setSharingScopeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLEngineScopeStorage _isValidSharingScope:forScopeIdentifier:](self, "_isValidSharingScope:forScopeIdentifier:", v6, v7);

  if (v8)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharingScopeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (objc_msgSend(v11, "isEqualToString:", v10) & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
        v15 = 1;
        goto LABEL_20;
      }
      __CPLStorageOSLogDomain_7377();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is already registered as sharing scope. Ignoring %{public}@", buf, 0x16u);
      }
    }
    else
    {
      -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13 || -[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v13))
      {
        if (a4)
        {
          objc_msgSend(v6, "scopeIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLErrors incorrectMachineStateErrorWithReason:](CPLErrors, "incorrectMachineStateErrorWithReason:", CFSTR("Can't use %@ as sharing scope when iCPL is off"), v14);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v15 = 0;
        goto LABEL_19;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Activating %@ as sharing scope. Informing store", buf, 0xCu);
        }

      }
      -[CPLEngineStorage engineStore](self, "engineStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storeSharingScopeIdentifier:", v10);

      -[CPLEngineStorage engineStore](self, "engineStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "engineLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "supervisor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scopeStorage:didStoreSharingScopeIdentifier:", self, v10);

    }
    v15 = 1;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)addCleanupTasksForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  if (objc_msgSend(v6, "scopeType"))
  {
    objc_msgSend(v6, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStorage engineStore](self, "engineStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cleanupTasks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "localIndex"), v7, 1, a4)&& objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "cloudIndex"), v7, 2, a4))
    {
      v10 = objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "stableIndex"), v7, 3, a4);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  char v17;
  char v18;
  void *v19;
  void *v20;

  v6 = a3;
  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v11 = 1;
    goto LABEL_14;
  }
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) != 0 || objc_msgSend(v7, "scopeType") == 4)
  {

    goto LABEL_5;
  }
  v12 = objc_msgSend(v7, "scopeType");

  if (v12 == 5)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scope deleted, scopeIdentifier: %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CPLEngineScopeStorage clearAllQuotaFlagsForMainScopeWithReason:error:](self, "clearAllQuotaFlagsForMainScopeWithReason:error:", v9, a4);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_14;
    }
  }
  if (-[CPLEngineScopeStorage addCleanupTasksForScope:error:](self, "addCleanupTasksForScope:error:", v7, a4)
    && (-[CPLEngineStorage platformObject](self, "platformObject"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "deleteScopeWithIdentifier:error:", v6, a4),
        v13,
        v14))
  {
    -[CPLEngineScopeStorage _removeBrokenScope:](self, "_removeBrokenScope:", v7);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
LABEL_14:
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isEqualToString:", v15);

  if (v16)
    self->_shouldResetGlobalsForMainScope = 1;
  -[CPLEngineScopeStorage _checkSyncManagerPriorityBoost](self, "_checkSyncManagerPriorityBoost");
  v17 = v11 ^ 1;
  if (!v7)
    v17 = 1;
  if ((v17 & 1) != 0)
  {
    if (!v11)
      goto LABEL_20;
LABEL_22:
    -[CPLEngineStorage engineStore](self, "engineStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "quarantinedRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v20, "resetRejectedRecordsWithError:", a4);

    goto LABEL_23;
  }
  if (-[CPLEngineScopeStorage _dropSharingScopeIdentifier:error:](self, "_dropSharingScopeIdentifier:error:", v6, a4))
    goto LABEL_22;
LABEL_20:
  v18 = 0;
LABEL_23:

  return v18;
}

- (BOOL)_setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = objc_msgSend(v8, "scopeType");
  if (v9 == a3)
  {
    LOBYTE(a5) = 1;
  }
  else
  {
    v10 = v9;
    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scopeIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          v28 = 2112;
          v29 = v14;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Trying to change scope type from %@ to %@ for %@", buf, 0x20u);

        }
      }
      if (a5)
      {
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scopeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("Trying to change scope type from %@ to %@ for %@"), v15, v16, v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = 0;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "scopeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v19;
          v26 = 2112;
          v27 = v20;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEFAULT, "Upgrading scope type of %@ to %@", buf, 0x16u);

        }
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "setScopeType:forScope:error:", a3, v8, a5);

      LOBYTE(a5) = v22
                && -[CPLEngineScopeStorage _handledDisabledFeaturesForScopeIfNecessary:type:error:](self, "_handledDisabledFeaturesForScopeIfNecessary:type:error:", v8, a3, a5)&& -[CPLEngineScopeStorage setScopeNeedsToBePulledByClient:error:](self, "setScopeNeedsToBePulledByClient:error:", v8, a5);
      -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
    }
  }

  return (char)a5;
}

- (id)scopedIdentifierForLocalScopedIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "scopeIndex");
  objc_msgSend(v5, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLEngineScopeStorage indexForLocalScopeIdentifier:](self, "indexForLocalScopeIdentifier:", v7);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {

    if (v6 != v8)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Incorrect index for local scoped identifier %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 884, CFSTR("Incorrect index for local scoped identifier %@"), v5);

      abort();
    }
    goto LABEL_11;
  }

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "setScopeIndex:", v8);
LABEL_11:
    v9 = v5;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)scopedIdentifierForCloudScopedIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "scopeIndex");
  objc_msgSend(v5, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLEngineScopeStorage indexForCloudScopeIdentifier:](self, "indexForCloudScopeIdentifier:", v7);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {

    if (v6 != v8)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v5;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Incorrect index for cloud scoped identifier %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 903, CFSTR("Incorrect index for cloud scoped identifier %@"), v5);

      abort();
    }
    goto LABEL_11;
  }

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "setScopeIndex:", v8);
LABEL_11:
    v9 = v5;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (int64_t)indexForLocalScopeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "localIndex");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (int64_t)indexForCloudScopeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "cloudIndex");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)scopeIdentifierForLocalScopeIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[CPLEngineScopeStorage scopeWithLocalScopeIndex:](self, "scopeWithLocalScopeIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[CPLEngineScopeStorage scopeWithCloudScopeIndex:](self, "scopeWithCloudScopeIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)setLocalScopeIndexOnChange:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "scopedIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "invalid record", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 943, CFSTR("invalid record"));

    abort();
  }
  v7 = (void *)v6;
  -[CPLEngineScopeStorage scopedIdentifierForLocalScopedIdentifier:](self, "scopedIdentifierForLocalScopedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && objc_msgSend(v5, "supportsResources")
    && objc_msgSend(v5, "hasChangeType:", 8))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "resources", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setItemScopedIdentifier:", v8);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  return v8 != 0;
}

- (BOOL)setCloudScopeIndexOnChange:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "scopedIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "invalid record", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 960, CFSTR("invalid record"));

    abort();
  }
  v7 = (void *)v6;
  -[CPLEngineScopeStorage scopedIdentifierForCloudScopedIdentifier:](self, "scopedIdentifierForCloudScopedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && objc_msgSend(v5, "supportsResources")
    && objc_msgSend(v5, "hasChangeType:", 8))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "resources", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setItemScopedIdentifier:", v8);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

  }
  return v8 != 0;
}

- (id)validLocalScopeIndexes
{
  void *v3;
  void *v4;

  -[_CPLEngineScopeCache validLocalIndexes](self->_scopeCache, "validLocalIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validLocalIndexes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CPLEngineScopeCache cacheValidLocalIndexes:](self->_scopeCache, "cacheValidLocalIndexes:", v3);
  }
  return v3;
}

- (id)validCloudScopeIndexes
{
  void *v3;
  void *v4;

  -[_CPLEngineScopeCache validCloudIndexes](self->_scopeCache, "validCloudIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validCloudIndexes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CPLEngineScopeCache cacheValidCloudIndexes:](self->_scopeCache, "cacheValidCloudIndexes:", v3);
  }
  return v3;
}

- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "stableIndex");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)_resetLocalSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(v6, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage engineStore](self, "engineStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "forceApplyPendingChangeSessionUpdateWithError:", a4))
    goto LABEL_8;
  objc_msgSend(v8, "derivativesCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "discardCache");

  objc_msgSend(v8, "cloudCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "discardStagedChangesForScopeWithIdentifier:error:", v7, a4);

  if (!v11)
    goto LABEL_8;
  if (-[CPLEngineScopeStorage resetSyncStateForScope:error:](self, "resetSyncStateForScope:error:", v6, a4)
    && -[CPLEngineScopeStorage storeSupportedFeatureVersionInLastSync:forScope:error:](self, "storeSupportedFeatureVersionInLastSync:forScope:error:", 20, v6, a4)&& -[CPLEngineScopeStorage setupResetSyncTransportGroupForScope:error:](self, "setupResetSyncTransportGroupForScope:error:", v6, a4)&& -[CPLEngineScopeStorage resetLocalRecordsForScopeWithIdentifier:error:](self, "resetLocalRecordsForScopeWithIdentifier:error:", v7, a4))
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resetTransientStatusesWithScopeIdentifier:", v7);

    v14 = 1;
  }
  else
  {
LABEL_8:
    v14 = 0;
  }

  return v14;
}

- (BOOL)resetLocalSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0;
  v7 = -[CPLEngineScopeStorage _resetLocalSyncStateForScope:error:](self, "_resetLocalSyncStateForScope:error:", v6, &v15);
  v8 = v15;
  if (v7)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quarantinedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "resetRejectedRecordsWithError:", a4);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "scopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Unable to reset local sync state for %@: %@", buf, 0x16u);

      }
    }
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v11;
}

- (BOOL)_resetCompleteSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = -[CPLEngineScopeStorage _resetLocalSyncStateForScope:error:](self, "_resetLocalSyncStateForScope:error:", v6, a4);
  -[CPLEngineStorage engineStore](self, "engineStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && -[CPLEngineScopeStorage resetCloudRecordsForScopeWithIdentifier:error:](self, "resetCloudRecordsForScopeWithIdentifier:error:", v9, a4))
  {
    objc_msgSend(v8, "idMapping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "resetAllFinalCloudIdentifiersForScopeWithIdentifier:error:", v9, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)resetCompleteSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = -[CPLEngineScopeStorage _resetCompleteSyncStateForScope:error:](self, "_resetCompleteSyncStateForScope:error:", v6, &v12);
  v8 = v12;
  if (!v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "scopeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Unable to reset complete sync state for %@: %@", buf, 0x16u);

      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (BOOL)resetCompleteSyncStateIncludingIDMappingForScope:(id)a3 error:(id *)a4
{
  id v6;
  NSCountedSet *scopeIdentifiersBeingCreated;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
  objc_msgSend(v6, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(scopeIdentifiersBeingCreated) = -[NSCountedSet containsObject:](scopeIdentifiersBeingCreated, "containsObject:", v8);

  if ((scopeIdentifiersBeingCreated & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v17 = 0;
    v10 = -[CPLEngineScopeStorage _resetCompleteSyncStateForScope:error:](self, "_resetCompleteSyncStateForScope:error:", v6, &v17);
    v11 = v17;
    if (v10
      && (objc_msgSend(v6, "scopeIdentifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = -[CPLEngineScopeStorage resetStableRecordsForScopeWithIdentifier:error:](self, "resetStableRecordsForScopeWithIdentifier:error:", v12, a4), v12, v13))
    {
      v9 = 1;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "scopeIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v19 = v15;
          v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Unable to reset complete sync state, including ID mapping, for %@: %@", buf, 0x16u);

        }
      }
      v9 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v11);
    }

  }
  return v9;
}

- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  _BOOL4 v13;
  id v14;
  BOOL v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CPLEngineScopeStorage doesScopeNeedToPushChangesToTransport:](self, "doesScopeNeedToPushChangesToTransport:", v6);
  v23 = 0;
  v8 = -[CPLEngineScopeStorage resetSyncStateForScope:error:](self, "resetSyncStateForScope:error:", v6, &v23);
  v9 = v23;
  v10 = v9;
  if (v8 && v7)
  {
    v22 = v9;
    v11 = -[CPLEngineScopeStorage setScopeHasChangesToPushToTransport:changeTypes:error:](self, "setScopeHasChangesToPushToTransport:changeTypes:error:", v6, 122, &v22);
    v12 = v22;

    v10 = v12;
    if (!v11)
      goto LABEL_10;
  }
  else if (!v8)
  {
    goto LABEL_10;
  }
  v21 = v10;
  v13 = -[CPLEngineScopeStorage setupAnchorResetTransportGroupForScope:error:](self, "setupAnchorResetTransportGroupForScope:error:", v6, &v21);
  v14 = v21;

  if (v13)
  {
    v20 = v14;
    v15 = -[CPLEngineScopeStorage setScopeHasChangesToPullFromTransport:error:](self, "setScopeHasChangesToPullFromTransport:error:", v6, &v20);
    v10 = v20;

    if (v15)
    {
      v16 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v10 = v14;
  }
LABEL_10:
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Unable to reset sync anchor for %@: %@", buf, 0x16u);

    }
  }
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v16 = 0;
    *a4 = v10;
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  return v16;
}

- (BOOL)resetLocalRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;

  v6 = a3;
  v7 = -[CPLEngineScopeStorage indexForLocalScopeIdentifier:](self, "indexForLocalScopeIdentifier:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
    -[CPLEngineStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "bumpLocalIndexForScopeWithIdentifier:error:", v6, a4);

    if (v11)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanupTasks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", v9, v6, 1, a4);

      if (v14)
      {
        -[CPLEngineScopeStorage _checkSyncManagerPriorityBoost](self, "_checkSyncManagerPriorityBoost");
        v8 = 1;
        goto LABEL_8;
      }
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_7;
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v6);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v8;
}

- (BOOL)resetCloudRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = -[CPLEngineScopeStorage indexForCloudScopeIdentifier:](self, "indexForCloudScopeIdentifier:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
    -[CPLEngineStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "bumpCloudIndexForScopeWithIdentifier:error:", v6, a4);

    if (v11)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanupTasks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", v9, v6, 2, a4);

      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v6);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (BOOL)resetStableRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = -[CPLEngineScopeStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
    -[CPLEngineStorage platformObject](self, "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "bumpStableIndexForScopeWithIdentifier:error:", v6, a4);

    if (v11)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanupTasks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", v9, v6, 3, a4);

      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v6);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)status
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  id v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  CPLEngineScopeStorage *v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)CPLEngineScopeStorage;
  -[CPLEngineStorage status](&v52, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSyncScopeList");

  if (v6)
  {
    -[CPLEngineScopeStorage scopeListSyncAnchor](self, "scopeListSyncAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "engineLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transport");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "simpleDescriptionForScopeListSyncAnchor:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" - global sync anchor: %@"), v11);

    }
  }
  if (self->_someScopeMightHaveToBePulledByClient)
    objc_msgSend(v4, "appendString:", CFSTR(" [client needs to pull some scopes]"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (status_onceToken != -1)
    dispatch_once(&status_onceToken, &__block_literal_global_7479);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __31__CPLEngineScopeStorage_status__block_invoke_2;
  v35[3] = &unk_1E60D9330;
  v14 = v13;
  v36 = v14;
  v37 = self;
  v40 = &v47;
  v41 = &v43;
  v42 = v51;
  v28 = v12;
  v38 = v28;
  v29 = v4;
  v39 = v29;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v35);
  -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, v30, 0);
    -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, v16, 0);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1B5E08BF0]();
        objc_msgSend(v21, "scopeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v14, "containsObject:", v23);

        if ((v24 & 1) == 0)
          ((void (**)(_QWORD, void *, uint64_t))v15)[2](v15, v21, 1);
        objc_autoreleasePoolPop(v22);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v53, 16);
    }
    while (v18);
  }

  if (v44[3])
  {
    v25 = v48[3];
    if (v25)
      objc_msgSend(v29, "appendFormat:", CFSTR("\nand %lu more scopes - %lu inactive (use cplctl scope for more info)"), v44[3], v25);
    else
      objc_msgSend(v29, "appendFormat:", CFSTR("\nand %lu more scopes (use cplctl scope for more info)"), v44[3]);
  }
  v26 = v29;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);

  return v26;
}

- (void)writeTransactionDidSucceed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *scopesToRemoveFromBrokenScopes;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  NSDictionary *assetCountsToUpdate;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)CPLEngineScopeStorage;
  -[CPLEngineStorage writeTransactionDidSucceed](&v49, sel_writeTransactionDidSucceed);
  if (self->_shouldResetGlobalsForMainScope)
  {
    -[CPLEngineScopeStorage _resetGlobalsForMainScope](self, "_resetGlobalsForMainScope");
    self->_shouldResetGlobalsForMainScope = 0;
  }
  if (self->_scheduleATransportUpdate)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteTransportNeedsUpdate");

    self->_scheduleATransportUpdate = 0;
  }
  if (self->_scheduleAScopeUpdate)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "engineLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteScopeNeedsUpdate");

    self->_scheduleAScopeUpdate = 0;
  }
  if (self->_schedulePushHighPriorityToTransportChangeTypes)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "engineLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "noteScopeNeedsToPushHighPriorityToTransport");

    self->_schedulePushHighPriorityToTransportChangeTypes = 0;
  }
  if (self->_schedulePushToTransportChangeTypes)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "engineLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "noteScopeNeedsToPushToTransportWithChangeTypes:", self->_schedulePushToTransportChangeTypes);

    self->_schedulePushToTransportChangeTypes = 0;
  }
  if (self->_schedulePullFromTransport)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "engineLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "noteScopeNeedsToPullFromTransport");

    self->_schedulePullFromTransport = 0;
  }
  if (self->_schedulePullFromClient)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "engineLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "notifyAttachedObjectsPullQueueIsFull");

    self->_schedulePullFromClient = 0;
  }
  if (self->_shouldChangeSyncManagerPriorityBoost)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "engineLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "syncManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBoostPriority:", self->_syncManagerPriorityBoost);

    self->_shouldChangeSyncManagerPriorityBoost = 0;
  }
  if (self->_clearSomeScopeMightHaveToBePulledByClient)
  {
    self->_someScopeMightHaveToBePulledByClient = 0;
    self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  }
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  if (scopesToRemoveFromBrokenScopes)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v24 = scopesToRemoveFromBrokenScopes;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[CPLEngineStorage engineStore](self, "engineStore");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "engineLibrary");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "syncManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeBrokenScope:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v26);
    }

    v33 = self->_scopesToRemoveFromBrokenScopes;
    self->_scopesToRemoveFromBrokenScopes = 0;

  }
  if (self->_shouldUpdateAssetCountsAtEndOfTransaction)
  {
    self->_shouldUpdateAssetCountsAtEndOfTransaction = 0;
    -[CPLEngineStorage engineStore](self, "engineStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "engineLibrary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "updateAssetCountsFromServer:", self->_assetCountsToUpdate);

    assetCountsToUpdate = self->_assetCountsToUpdate;
    self->_assetCountsToUpdate = 0;

  }
  if (-[NSCountedSet count](self->_scopeIdentifiersBeingCreated, "count"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        -[NSCountedSet allObjects](self->_scopeIdentifiersBeingCreated, "allObjects");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR(", "));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v39;
        _os_log_impl(&dword_1B03C2000, v37, OS_LOG_TYPE_ERROR, "Missing calls to -endCreatingScopeWithIdentifier: for %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet allObjects](self->_scopeIdentifiersBeingCreated, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v41, 1372, CFSTR("Missing calls to -endCreatingScopeWithIdentifier: for %@"), v43);

    abort();
  }
}

- (void)writeTransactionDidFail
{
  NSMutableArray *scopesToRemoveFromBrokenScopes;
  NSDictionary *assetCountsToUpdate;
  NSCountedSet *scopeIdentifiersBeingCreated;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLEngineScopeStorage;
  -[CPLEngineStorage writeTransactionDidFail](&v6, sel_writeTransactionDidFail);
  self->_shouldResetGlobalsForMainScope = 0;
  self->_scheduleATransportUpdate = 0;
  self->_scheduleAScopeUpdate = 0;
  self->_schedulePushHighPriorityToTransportChangeTypes = 0;
  self->_schedulePushToTransportChangeTypes = 0;
  self->_schedulePullFromTransport = 0;
  self->_schedulePullFromClient = 0;
  self->_shouldChangeSyncManagerPriorityBoost = 0;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  self->_scopesToRemoveFromBrokenScopes = 0;

  self->_shouldUpdateAssetCountsAtEndOfTransaction = 0;
  assetCountsToUpdate = self->_assetCountsToUpdate;
  self->_assetCountsToUpdate = 0;

  scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
  self->_scopeIdentifiersBeingCreated = 0;

  -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
}

- (id)flagsForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagsForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isValidSharingScopeIdentifier:(id)a3 scopeType:(int64_t)a4 forScopeIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 4)
    return 0;
  v7 = a5;
  v8 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsSharingScopeWithIdentifier:forScopeWithIdentifier:", v8, v7);

  return v10;
}

- (BOOL)_isValidSharingScope:(id)a3 forScopeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "scopeType");

  LOBYTE(v7) = -[CPLEngineScopeStorage _isValidSharingScopeIdentifier:scopeType:forScopeIdentifier:](self, "_isValidSharingScopeIdentifier:scopeType:forScopeIdentifier:", v8, v9, v6);
  return (char)v7;
}

- (void)_notifyScopeObserversForScope:(id)a3 flagsUpdate:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *scopeObservers;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  scopeObservers = self->_scopeObservers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CPLEngineScopeStorage__notifyScopeObserversForScope_flagsUpdate___block_invoke;
  v11[3] = &unk_1E60D9358;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](scopeObservers, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;
  unsigned __int8 v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  NSObject *v42;
  int v43;
  int v44;
  uint64_t v45;
  void *v46;
  BOOL v47;
  NSObject *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v76;
  int v77;
  id *v78;
  uint8_t buf[4];
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "updatedFlagsMask");
  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v78 = a5;
  if ((v10 & 0x10) != 0)
  {
    if ((objc_msgSend(v8, "valueForFlag:", 16) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      if (!-[CPLEngineScopeStorage resetDidCheckAssetWithServerWhenOverQuotaForScope:error:](self, "resetDidCheckAssetWithServerWhenOverQuotaForScope:error:", v9, a5))goto LABEL_117;
      -[CPLEngineStorage platformObject](self, "platformObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "storeActivationDate:forScope:error:", v16, v9, a5);

      if (!v17)
        goto LABEL_117;
      objc_msgSend(v9, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "isEqualToString:", v19);

    }
    v14 = (v10 & 4) == 0;
    v20 = v8;
  }
  else
  {
    v13 = 0;
    if ((v10 & 4) == 0)
    {
      v77 = 0;
      v14 = 1;
      goto LABEL_26;
    }
    v20 = (void *)v11;
    v14 = 0;
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "libraryOptions");

  v23 = objc_msgSend(v8, "valueForFlag:", 0x10000);
  v24 = objc_msgSend(v20, "valueForFlag:", 16);
  if (v14)
    v25 = v12;
  else
    v25 = v8;
  v26 = objc_msgSend(v25, "valueForFlag:", 4);
  if (v24 && v26)
  {
    if ((v23 & ((v22 & 0x400) != 0)) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "scopeIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v80 = v49;
          _os_log_impl(&dword_1B03C2000, v48, OS_LOG_TYPE_DEFAULT, "Deleting inactive scope %@", buf, 0xCu);

        }
      }
      objc_msgSend(v9, "scopeIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = -[CPLEngineScopeStorage deleteScopeWithIdentifier:error:](self, "deleteScopeWithIdentifier:error:", v50, v78);
      goto LABEL_122;
    }
    v77 = v13;
    objc_msgSend(v9, "scopeIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[CPLEngineScopeStorage resetCloudRecordsForScopeWithIdentifier:error:](self, "resetCloudRecordsForScopeWithIdentifier:error:", v27, v78);
    goto LABEL_25;
  }
  v77 = v13;
  if (v24)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activationDateForScope:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v9;
          _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_DEFAULT, "Clearing activation date for %@", buf, 0xCu);
        }

      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "storeActivationDate:forScope:error:", 0, v9, v78);
LABEL_25:
      v32 = v28;

      goto LABEL_27;
    }
  }
LABEL_26:
  v32 = 1;
LABEL_27:
  objc_msgSend(v9, "scopeIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if (v35)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "engineLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend(v37, "setICloudLibraryHasBeenWiped:", objc_msgSend(v8, "valueForFlag:", 4));
    v38 = v78;
    if ((v10 & 2) != 0)
      objc_msgSend(v37, "setIsExceedingQuota:", objc_msgSend(v8, "valueForFlag:", 2));
  }
  else
  {
    -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[CPLEngineScopeStorage _isValidSharingScope:forScopeIdentifier:](self, "_isValidSharingScope:forScopeIdentifier:", v9, v39);

    v38 = v78;
    if (!v40)
      goto LABEL_36;
    -[CPLEngineStorage engineStore](self, "engineStore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "engineLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v10 & 2) != 0)
      objc_msgSend(v37, "setIsExceedingSharedLibraryQuota:", objc_msgSend(v8, "valueForFlag:", 2));
  }

LABEL_36:
  if (!v32 || (v10 & 0x40) == 0)
    goto LABEL_39;
  if ((objc_msgSend(v12, "valueForFlag:", 64) & 1) != 0)
  {
    v32 = 1;
LABEL_39:
    if (!v32)
      goto LABEL_51;
    goto LABEL_46;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v9;
      _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_DEFAULT, "%@ has been staged - reset sync anchor", buf, 0xCu);
    }

  }
  v32 = -[CPLEngineScopeStorage resetSyncAnchorForScope:error:](self, "resetSyncAnchorForScope:error:", v9, v38);
  if (!v32)
  {
LABEL_51:
    if ((v10 & 0x10) == 0)
      goto LABEL_75;
LABEL_52:
    if (!v32)
      goto LABEL_75;
    v43 = objc_msgSend(v8, "valueForFlag:", 16);
    v44 = objc_msgSend(v12, "valueForFlag:", 16);
    if (!v43 || (v44 & 1) != 0)
    {
      if (((v43 | v44 ^ 1) & 1) != 0)
      {
LABEL_60:
        v32 = 1;
LABEL_72:
        objc_msgSend(v9, "scopeIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v54, "isEqualToString:", v55);

        if (v56)
          self->_shouldResetGlobalsForMainScope = 1;
        -[CPLEngineScopeStorage _clearScopeCache](self, "_clearScopeCache");
        v38 = v78;
        goto LABEL_75;
      }
      if (-[CPLEngineScopeStorage _setSharingScopeIdentifier:error:](self, "_setSharingScopeIdentifier:error:", v9, v38)&& -[CPLEngineScopeStorage setScopeHasChangesToPullFromTransport:error:](self, "setScopeHasChangesToPullFromTransport:error:", v9, v38)&& -[CPLEngineScopeStorage setScopeNeedsToBePulledByClient:error:](self, "setScopeNeedsToBePulledByClient:error:", v9, v38))
      {
        if (-[CPLEngineScopeStorage _doesScopeContributeToAssetCounts:](self, "_doesScopeContributeToAssetCounts:", v9))
        {
          -[CPLEngineStorage platformObject](self, "platformObject");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "scopeChangeForScope:", v9);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          -[CPLEngineScopeStorage _updateAssetCountsWithScopeChange:forScope:](self, "_updateAssetCountsWithScopeChange:forScope:", v53, v9);
        }
        goto LABEL_60;
      }
    }
    else if (-[CPLEngineScopeStorage resetCompleteSyncStateIncludingIDMappingForScope:error:](self, "resetCompleteSyncStateIncludingIDMappingForScope:error:", v9, v38))
    {
      -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v9);
      v45 = objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        objc_msgSend(v9, "scopeIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[CPLEngineScopeStorage _dropSharingScopeIdentifier:error:](self, "_dropSharingScopeIdentifier:error:", v76, v38);

        if (!v32)
          goto LABEL_72;
        goto LABEL_125;
      }
      v46 = (void *)v45;
      v47 = -[CPLEngineScopeStorage setValue:forFlag:forScope:error:](self, "setValue:forFlag:forScope:error:", 1, 16, v45, v38);

      if (v47)
      {
LABEL_125:
        if (-[CPLEngineScopeStorage _doesScopeContributeToAssetCounts:](self, "_doesScopeContributeToAssetCounts:", v9))
          -[CPLEngineScopeStorage _updateAssetCountsWithScopeChange:forScope:](self, "_updateAssetCountsWithScopeChange:forScope:", 0, v9);
        goto LABEL_60;
      }
    }
    v32 = 0;
    goto LABEL_72;
  }
LABEL_46:
  if ((v10 & 8) == 0)
    goto LABEL_51;
  if ((objc_msgSend(v8, "valueForFlag:", 8) & 1) != 0
    || !objc_msgSend(v12, "valueForFlag:", 8)
    || (objc_msgSend(v12, "valueForFlag:", 16) & 1) != 0)
  {
    v32 = 1;
    goto LABEL_51;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "scopeIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v80 = v71;
      _os_log_impl(&dword_1B03C2000, v70, OS_LOG_TYPE_ERROR, "%@ has been re-enabled - triggering a reset sync", buf, 0xCu);

    }
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "resetLocalSyncStateWithCause:error:", CFSTR("scope has been re-enabled"), v38);

  if (!v73)
    goto LABEL_117;
  v32 = 1;
  self->_schedulePullFromClient = 1;
  if ((v10 & 0x10) != 0)
    goto LABEL_52;
LABEL_75:
  if (v32 && (v10 & 0x44) != 0)
  {
    if (objc_msgSend(v12, "valueForFlag:", 4))
      v57 = objc_msgSend(v12, "valueForFlag:", 64) ^ 1;
    else
      v57 = 0;
    v32 = !objc_msgSend(v8, "valueForFlag:", 4)
       || ((v57 | objc_msgSend(v8, "valueForFlag:", 64)) & 1) != 0
       || -[CPLEngineScopeStorage addCleanupTasksForScope:error:](self, "addCleanupTasksForScope:error:", v9, v38);
  }
  if (!v14 && v32 && objc_msgSend(v8, "valueForFlag:", 4))
  {
    v32 = -[CPLEngineScopeStorage setScopeNeedsToBePulledByClient:error:](self, "setScopeNeedsToBePulledByClient:error:", v9, v38);
    if (v32)
      -[CPLEngineScopeStorage _removeBrokenScope:](self, "_removeBrokenScope:", v9);
    -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v9);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
      v32 = -[CPLEngineScopeStorage setValue:forFlag:forScope:error:](self, "setValue:forFlag:forScope:error:", 1, 16, v58, v38);

  }
  if (v32 && (v10 & 0x20) != 0)
  {
    if (objc_msgSend(v8, "valueForFlag:", 32))
    {
      if (!-[CPLEngineScopeStorage setScopeNeedsToUpdateTransport:error:](self, "setScopeNeedsToUpdateTransport:error:", v9, v38))goto LABEL_117;
      -[CPLEngineScopeStorage _removeBrokenScope:](self, "_removeBrokenScope:", v9);
    }
    v32 = 1;
  }
  if (v32 && (v10 & 0x20000) != 0)
  {
    if (objc_msgSend(v8, "valueForFlag:", 0x20000))
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "pushRepository");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scopeIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "hasChangesInScopeWithIdentifier:", v61);

      v38 = v78;
      if (v62)
      {
        self->_schedulePushHighPriorityToTransportChangeTypes = 122;
        goto LABEL_103;
      }
    }
  }
  if (!v32)
  {
LABEL_117:
    LOBYTE(v51) = 0;
    goto LABEL_123;
  }
LABEL_103:
  -[CPLEngineStorage platformObject](self, "platformObject");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "updateFlags:forScope:error:", v8, v9, v38);

  -[CPLEngineScopeStorage _notifyScopeObserversForScope:flagsUpdate:](self, "_notifyScopeObserversForScope:flagsUpdate:", v9, v8);
  if (!v64)
    goto LABEL_117;
  -[CPLEngineScopeStorage _checkSyncManagerPriorityBoost](self, "_checkSyncManagerPriorityBoost");
  objc_msgSend(v9, "scopeIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v65, "isEqualToString:", v66) & 1) != 0)
  {

    v67 = v77;
    if ((v10 & 0x7C) != 0)
      goto LABEL_106;
LABEL_109:
    v51 = 1;
    goto LABEL_120;
  }
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v77;
  if (!-[CPLEngineScopeStorage _isValidSharingScope:forScopeIdentifier:](self, "_isValidSharingScope:forScopeIdentifier:", v9, v69))
  {

    v51 = 1;
    goto LABEL_119;
  }

  v38 = v78;
  if ((v10 & 0x7C) == 0)
    goto LABEL_109;
LABEL_106:
  v68 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "scopeIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "stringWithFormat:", CFSTR("updated scope flags: %@, scopeIdentifier: %@"), v8, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[CPLEngineScopeStorage clearAllQuotaFlagsForMainScopeWithReason:error:](self, "clearAllQuotaFlagsForMainScopeWithReason:error:", v66, v38);
LABEL_119:

LABEL_120:
  if ((v51 & v67) == 1)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "engineLibrary");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "noteMainScopeHasBeenActivated");

    LOBYTE(v51) = 1;
LABEL_122:

  }
LABEL_123:

  return v51;
}

- (BOOL)setValue:(BOOL)a3 forFlag:(int64_t)a4 forScope:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v10 = a5;
  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "valueForFlag:", a4) == v8)
    {
      LOBYTE(a6) = 1;
    }
    else
    {
      objc_msgSend(v12, "setValue:forFlag:", v8, a4);
      LOBYTE(a6) = -[CPLEngineScopeStorage updateFlags:forScope:error:](self, "updateFlags:forScope:error:", v12, v10, a6);
    }
  }
  else if (a6)
  {
    objc_msgSend(v10, "scopeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (BOOL)valueForFlag:(int64_t)a3 forScope:(id)a4
{
  void *v5;

  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "valueForFlag:", a3);

  return a3;
}

- (BOOL)clearAllQuotaFlagsForMainScopeWithReason:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Clearing all over-quota flags for main scope optimistically, reason: %{public}@", (uint8_t *)&v19, 0xCu);
    }

  }
  -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_11:
    -[CPLEngineStorage engineStore](self, "engineStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "engineLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setIsExceedingQuota:", 0);
    objc_msgSend(v9, "setIsExceedingSharedLibraryQuota:", 0);
    goto LABEL_12;
  }
  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forFlag:", 0, 2);
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "updateFlags:forScope:error:", v9, v8, a4);

  -[CPLEngineScopeStorage _notifyScopeObserversForScope:flagsUpdate:](self, "_notifyScopeObserversForScope:flagsUpdate:", v8, v9);
  if (v11)
  {
    -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setValue:forFlag:", 0, 2);
      -[CPLEngineStorage platformObject](self, "platformObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "updateFlags:forScope:error:", v14, v13, a4);

      -[CPLEngineScopeStorage _notifyScopeObserversForScope:flagsUpdate:](self, "_notifyScopeObserversForScope:flagsUpdate:", v13, v14);
      if (!v16)
        goto LABEL_13;
    }
    else
    {

    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return 1;
}

- (id)disabledDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disabledDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "setDisabledDate:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (id)deleteDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "engineLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExitDeleteTime:", v8);

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "setDeleteDate:forScope:error:", v8, v9, a5);

  return v16;
}

- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resetSyncStateForScope:error:", v6, a4);

  if (!v8)
    goto LABEL_8;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Disabling initial queries for %@ after a reset of sync anchor", (uint8_t *)&v16, 0xCu);

    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setClassNameOfRecordsForInitialQuery:forScope:error:", &stru_1E60DF6B8, v6, a4);

  if (v12)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "setHasFetchedInitialSyncAnchor:forScope:error:", 1, v6, a4);

  }
  else
  {
LABEL_8:
    v14 = 0;
  }

  return v14;
}

- (id)uploadTransportGroupForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadTransportGroupForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)downloadTransportGroupForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadTransportGroupForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setupInitialSyncTransportGroupsForScope:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineScopeStorage uploadTransportGroupForScope:](self, "uploadTransportGroupForScope:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    if (_CPLSilentLogging)
    {
      v10 = 1;
      goto LABEL_22;
    }
    __CPLStorageOSLogDomain_7377();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Initial upload group has already been set", (uint8_t *)&v26, 2u);
    }
    v10 = 1;
  }
  else
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "engineLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transport");
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject createGroupForInitialUpload](v9, "createGroupForInitialUpload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CPLEngineScopeStorage estimatedSizeForScope:](self, "estimatedSizeForScope:", v6);
    v15 = -[CPLEngineScopeStorage estimatedAssetCountForScope:](self, "estimatedAssetCountForScope:", v6);
    if (v14)
      objc_msgSend(v13, "setRoughCPLUploadEstimatedSize:", v14);
    if (v15)
      objc_msgSend(v13, "setRoughCPLRecordCount:", v15);
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "scopeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cplDebugDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Set up initial upload transport group for %@ to %@", (uint8_t *)&v26, 0x16u);

      }
    }
    -[CPLEngineStorage platformObject](self, "platformObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "storeUploadTransportGroup:forScope:error:", v13, v6, a4);

    if (v20)
    {
      -[NSObject createGroupForInitialDownload](v9, "createGroupForInitialDownload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "scopeIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "cplDebugDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138412546;
          v27 = v22;
          v28 = 2112;
          v29 = v23;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEFAULT, "Set up initial download transport group for %@ to %@", (uint8_t *)&v26, 0x16u);

        }
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v24, "storeDownloadTransportGroup:forScope:error:", v8, v6, a4);

    }
    else
    {
      v10 = 0;
      v8 = v13;
    }
  }

LABEL_22:
  return v10;
}

- (BOOL)updateInitialSyncTransportGroupEstimatedSize:(unint64_t)a3 assetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[CPLEngineScopeStorage uploadTransportGroupForScope:](self, "uploadTransportGroupForScope:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "scopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Updating upload transfer group estimated upload sizes for %@", (uint8_t *)&v17, 0xCu);

      }
    }
    objc_msgSend(v11, "setRoughCPLRecordCount:", a4);
    objc_msgSend(v11, "setRoughCPLUploadEstimatedSize:", a3);
    -[CPLEngineStorage platformObject](self, "platformObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "storeUploadTransportGroup:forScope:error:", v11, v10, a6);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)setupResetSyncTransportGroupForScope:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CPLEngineScopeStorage hasFinishedInitialSyncForScope:](self, "hasFinishedInitialSyncForScope:", v6))
  {
    -[CPLEngineScopeStorage uploadTransportGroupForScope:](self, "uploadTransportGroupForScope:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = 1;
    }
    else
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "engineLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "createGroupForResetSync");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "scopeIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cplDebugDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412546;
          v25 = v15;
          v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Set up reset sync upload transport group for %@ to %@", (uint8_t *)&v24, 0x16u);

        }
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "storeUploadTransportGroup:forScope:error:", v13, v6, a4);

      if (v18)
      {
        objc_msgSend(v12, "createGroupForInitialDownload");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "scopeIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "cplDebugDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138412546;
            v25 = v20;
            v26 = 2112;
            v27 = v21;
            _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Set up reset sync download transport group for %@ to %@", (uint8_t *)&v24, 0x16u);

          }
        }
        -[CPLEngineStorage platformObject](self, "platformObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v22, "storeDownloadTransportGroup:forScope:error:", v8, v6, a4);

      }
      else
      {
        v9 = 0;
        v8 = v13;
      }

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)setupAnchorResetTransportGroupForScope:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CPLEngineScopeStorage hasFinishedInitialSyncForScope:](self, "hasFinishedInitialSyncForScope:", v6))
  {
    -[CPLEngineScopeStorage downloadTransportGroupForScope:](self, "downloadTransportGroupForScope:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = 1;
    }
    else
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "engineLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createGroupForInitialDownload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "scopeIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "cplDebugDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v14;
          v20 = 2112;
          v21 = v15;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Set up anchor reset download transport group for %@ to %@", (uint8_t *)&v18, 0x16u);

        }
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "storeDownloadTransportGroup:forScope:error:", v8, v6, a4);

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)clearTransportGroupsForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "storeUploadTransportGroup:forScope:error:", 0, v6, a4);

  if (v8)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "storeDownloadTransportGroup:forScope:error:", 0, v6, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  self->_scheduleAScopeUpdate = 1;
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setScopeNeedsUpdateFromTransport:error:", v6, a4);

  return (char)a4;
}

- (id)transportScopeForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportScopeForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "scopeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412290;
        v30 = v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "%@ transport scope exists", (uint8_t *)&v29, 0xCu);

      }
    }
    -[CPLEngineStorage engineStore](self, "engineStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "engineLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setICloudLibraryExists:", v8 != 0);

  }
  if (!v8)
    goto LABEL_12;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transportScopeForScope:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_11:

LABEL_12:
    -[CPLEngineStorage platformObject](self, "platformObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "setTransportScope:forScope:error:", v8, v9, a5);

    if (v8 || !v23)
    {
      v24 = v23 ^ 1;
      if (!v8)
        v24 = 1;
      if ((v24 & 1) == 0)
      {
        LOBYTE(v23) = 1;
        if (-[CPLEngineScopeStorage doesScopeNeedToUpdateTransport:](self, "doesScopeNeedToUpdateTransport:", v9))
          self->_scheduleATransportUpdate = 1;
      }
    }
    else
    {
      self->_scheduleAScopeUpdate = 1;
    }
    goto LABEL_25;
  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "engineLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v21, "isNewTransportScope:compatibleWithOldTransportScope:", v8, v18) & 1) != 0)
  {

    goto LABEL_11;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "descriptionForTransportScope:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "descriptionForTransportScope:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "Trying to change a transport scope %@ to an incompatible one (%@) - ignoring", (uint8_t *)&v29, 0x16u);

    }
  }

  LOBYTE(v23) = 1;
LABEL_25:

  return v23;
}

- (id)scopeChangeForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeChangeForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_doesScopeContributeToAssetCounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend(v4, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CPLEngineScopeStorage _isValidSharingScope:forScopeIdentifier:](self, "_isValidSharingScope:forScopeIdentifier:", v4, v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateAssetCountsWithScopeChange:(id)a3 forScope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  NSDictionary *assetCountsToUpdate;
  NSDictionary *v26;
  void *v27;
  id obj;
  _QWORD v29[4];
  NSDictionary *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = v6;
  objc_msgSend(v6, "libraryInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSDictionary *)objc_msgSend(v9, "mutableCopy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorForScopesIncludeInactive:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v17, "scopeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "scopeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) == 0)
        {
          v20 = -[CPLEngineScopeStorage _doesScopeContributeToAssetCounts:](self, "_doesScopeContributeToAssetCounts:", v17);

          if (!v20)
            continue;
          -[CPLEngineStorage platformObject](self, "platformObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scopeChangeForScope:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "libraryInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "assetCounts");
          v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v10)
          {

            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __68__CPLEngineScopeStorage__updateAssetCountsWithScopeChange_forScope___block_invoke;
            v29[3] = &unk_1E60DD138;
            v10 = v10;
            v30 = v10;
            -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", v29);
            v24 = v30;
            v19 = v23;
          }
          else
          {
            v10 = (NSDictionary *)-[NSDictionary mutableCopy](v22, "mutableCopy");
            v24 = v23;
          }

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  assetCountsToUpdate = self->_assetCountsToUpdate;
  self->_assetCountsToUpdate = v10;
  v26 = v10;

  self->_shouldUpdateAssetCountsAtEndOfTransaction = 1;
}

- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  char v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[CPLEngineScopeStorage _doesScopeContributeToAssetCounts:](self, "_doesScopeContributeToAssetCounts:", v9))
    -[CPLEngineScopeStorage _updateAssetCountsWithScopeChange:forScope:](self, "_updateAssetCountsWithScopeChange:forScope:", v8, v9);
  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "engineLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "libraryInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountFlagsData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v14, "updateAccountFlagsData:", v16);
    objc_msgSend(v14, "setICloudLibraryClientVersionTooOld:", 0);
    objc_msgSend(v14, "setIsStuckInExitForSharedLibrary:", objc_msgSend(v8, "hasProblematicFormerSharedScope"));

  }
  v31 = 0;
  v17 = objc_msgSend(v8, "scopeType");
  if (v17 != objc_msgSend(v9, "scopeType")
    && !-[CPLEngineScopeStorage _setScopeType:forScope:error:](self, "_setScopeType:forScope:error:", objc_msgSend(v8, "scopeType"), v9, a5))
  {
    goto LABEL_21;
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v18, "storeScopeChange:forScope:scopeChangeHasBeenUpdated:error:", v8, v9, &v31, a5);

  if ((_DWORD)v19 && v31)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "flagsForScope:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "valueForFlag:", 0x10000);

    if (!v22)
      goto LABEL_25;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v10;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "Scope change for %@ has been updated, notifying client: %@", buf, 0x16u);
      }

    }
    if (-[CPLEngineScopeStorage setScopeNeedsToBePulledByClient:error:](self, "setScopeNeedsToBePulledByClient:error:", v9, a5))
    {
LABEL_25:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_20;
      if (!objc_msgSend(v8, "isCurrentUserExiting"))
        goto LABEL_20;
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "scopeIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("scope change with current user exiting, scopeIdentifier: %@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[CPLEngineScopeStorage clearAllQuotaFlagsForMainScopeWithReason:error:](self, "clearAllQuotaFlagsForMainScopeWithReason:error:", v26, a5);

      if (v27)
      {
LABEL_20:
        -[CPLEngineStorage engineStore](self, "engineStore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "engineLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "supervisor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "scopeStorage:didUpdateScopeChange:forScope:", self, v8, v9);

        LOBYTE(v19) = 1;
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v19) = 0;
  }
LABEL_22:

  return (char)v19;
}

- (BOOL)didDropSomeRecordsForScope:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "didDropSomeRecordsForScope:", v4);

  return v6;
}

- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setDidDropSomeRecordsForScope:error:", v6, a4);

  return (char)a4;
}

- (id)syncAnchorForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncAnchorForScope:isCommitted:", v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "setSyncAnchor:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "commitSyncAnchorForScope:error:", v6, a4);

  return (char)a4;
}

- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "discardStagedSyncAnchorForScope:error:", v6, a4);

  return (char)a4;
}

- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "discardStagedSyncAnchorWithScopeFilter:error:", v6, a4);

  return (char)a4;
}

- (BOOL)hasStagedSyncAnchorForScope:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasStagedSyncAnchorForScope:", v4);

  return v6;
}

- (BOOL)hasStagedSyncAnchors
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasStagedSyncAnchors");

  return v3;
}

- (id)transientSyncAnchorForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientSyncAnchorForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "storeTransientSyncAnchor:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)disableInitialQueriesForScope:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "scopeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Disabling initial queries for %@. Moving to regular changes fetch", (uint8_t *)&v16, 0xCu);

    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setClassNameOfRecordsForInitialQuery:forScope:error:", &stru_1E60DF6B8, v6, a4);

  if (v10
    && (-[CPLEngineStorage platformObject](self, "platformObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "storeTransientSyncAnchor:forScope:error:", 0, v6, a4),
        v11,
        v12))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "setHasFetchedInitialSyncAnchor:forScope:error:", 1, v6, a4);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)_indexOfCurrentClassForInitialQueriesForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  Class v8;
  Class v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ClassesForInitialQueries(objc_msgSend(v4, "scopeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classNameOfRecordsForInitialQueryForScope:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!objc_msgSend(v7, "length"))
      {
LABEL_17:
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_18;
      }
      v8 = NSClassFromString((NSString *)v7);
      if (!v8)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v16 = 138412290;
            *(_QWORD *)&v16[4] = v7;
            v12 = "Unable to find a class named '%@' for initial queries. Marking store as corrupted";
            goto LABEL_14;
          }
LABEL_15:

        }
LABEL_16:
        -[CPLEngineStorage engineStore](self, "engineStore", *(_OWORD *)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "engineLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reportLibraryCorrupted");

        goto LABEL_17;
      }
      v9 = v8;
      v10 = objc_msgSend(v5, "indexOfObject:", v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v16 = 138412290;
            *(_QWORD *)&v16[4] = v9;
            v12 = "Incorrect class %@ for initial queries. Marking store as corupted";
LABEL_14:
            _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, v12, v16, 0xCu);
            goto LABEL_15;
          }
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  return v10;
}

- (Class)classOfRecordsForInitialQueryForScope:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[CPLEngineScopeStorage _indexOfCurrentClassForInitialQueriesForScope:](self, "_indexOfCurrentClassForInitialQueriesForScope:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    _ClassesForInitialQueries(objc_msgSend(v4, "scopeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v6;
}

- (BOOL)markInitialQueryIsDoneForRecordsOfClass:(Class)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  objc_class *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint8_t buf[4];
  Class v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  _ClassesForInitialQueries(objc_msgSend(v8, "scopeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v21 = 1;
    goto LABEL_21;
  }
  v10 = -[CPLEngineScopeStorage _indexOfCurrentClassForInitialQueriesForScope:](self, "_indexOfCurrentClassForInitialQueriesForScope:", v8);
  v11 = objc_msgSend(v9, "indexOfObject:", a3);
  if (v11 != v10)
  {
    if (!_CPLSilentLogging)
    {
      v22 = v11;
      __CPLStorageOSLogDomain_7377();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v32 = a3;
        v33 = 2048;
        v34 = v22;
        v35 = 2048;
        v36 = v10;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Incorrect class passed for initial queries %@ (class index %lu instead of %lu)", buf, 0x20u);
      }

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Incorrect class %@ passed for initial queries"), a3);
    if (a5)
    {
      +[CPLErrors invalidCloudCacheErrorWithReason:](CPLErrors, "invalidCloudCacheErrorWithReason:", v24);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_20;
  }
  if (v10 + 1 != objc_msgSend(v9, "count"))
  {
    v26 = (objc_class *)objc_msgSend(v9, "objectAtIndex:", v10 + 1);
    -[CPLEngineStorage platformObject](self, "platformObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "setClassNameOfRecordsForInitialQuery:forScope:error:", v28, v8, a5);

    if (v29)
    {
      -[CPLEngineStorage platformObject](self, "platformObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v30, "storeTransientSyncAnchor:forScope:error:", 0, v8, a5);

      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "scopeIdentifier");
      v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "All classes have been retrieved as part of the initial queries for %@. Moving to regular changes fetch", buf, 0xCu);

    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "setClassNameOfRecordsForInitialQuery:forScope:error:", &stru_1E60DF6B8, v8, a5);

  if (!v15
    || -[CPLEngineScopeStorage shouldTrackAdditionalInitialSyncDatesForScope:](self, "shouldTrackAdditionalInitialSyncDatesForScope:", v8)&& (-[CPLEngineStorage platformObject](self, "platformObject"), v16 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E0C99D68], "date"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "storeInitialMetadataQueriesDate:forScope:error:", v17, v8, a5), v17, v16, !v18))
  {
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  -[CPLEngineScopeStorage initialSyncAnchorForScope:](self, "initialSyncAnchorForScope:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage platformObject](self, "platformObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "storeTransientSyncAnchor:forScope:error:", v19, v8, a5);

LABEL_21:
  return v21;
}

- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasScopeFetchedInitialSyncAnchor:", v4);

  return v6;
}

- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;

  v6 = a3;
  v8 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "setHasFetchedInitialSyncAnchor:forScope:error:", v6, v8, a5);

  return (char)a5;
}

- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "setInitialSyncAnchor:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (id)initialSyncAnchorForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialSyncAnchorForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)resetInitialSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setInitialSyncAnchor:forScope:error:", 0, v6, a4);

  if (v8
    && (-[CPLEngineStorage platformObject](self, "platformObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "setClassNameOfRecordsForInitialQuery:forScope:error:", 0, v6, a4),
        v9,
        v10))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "setHasFetchedInitialSyncAnchor:forScope:error:", 0, v6, a4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)remainingClassesForInitialQueryForScope:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[CPLEngineScopeStorage _indexOfCurrentClassForInitialQueriesForScope:](self, "_indexOfCurrentClassForInitialQueriesForScope:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    _ClassesForInitialQueries(objc_msgSend(v4, "scopeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", v7, objc_msgSend(v8, "count") - v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)hasFinishedInitialSyncForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialSyncDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)hasFinishedInitialDownloadForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialSyncDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialDownloadDateForScope:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 != 0;

  }
  return v7;
}

- (BOOL)setHasFinishedInitialDownloadForScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setInitialDownloadDate:forScope:error:", v8, v6, a4);

  return (char)a4;
}

- (BOOL)hasFinishedAFullSyncForScope:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasFinishedAFullSyncForScope:", v4);

  return v6;
}

- (id)lastDateOfClearedPushRepositoryForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastDateOfClearedPushRepositoryForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "storeLastDateOfClearedPushRepository:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastDateOfCompletedPullFromTransportForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportedFeatureVersionInLastSyncForScope:", v4);

  return v6;
}

- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  int v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v8;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Set last supported feature version for %@ to %lu", (uint8_t *)&v13, 0x16u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "storeSupportedFeatureVersionInLastSync:forScope:error:", a3, v8, a5);

  return v11;
}

- (BOOL)supportedFeatureVersionIsMostRecentForScope:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportedFeatureVersionInLastSyncForScope:", v4);

  return v6 > 0x13;
}

- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "scopeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a3, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2048;
      v23 = a4;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Updating estimated size for %@ to %@ / %lu assets", (uint8_t *)&v18, 0x20u);

    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "storeEstimatedSize:estimatedAssetCount:forScope:error:", a3, a4, v10, a6);

  if (v15)
    v16 = -[CPLEngineScopeStorage updateInitialSyncTransportGroupEstimatedSize:assetCount:forScope:error:](self, "updateInitialSyncTransportGroupEstimatedSize:assetCount:forScope:error:", a3, a4, v10, a6);
  else
    v16 = 0;

  return v16;
}

- (unint64_t)estimatedSizeForScope:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "estimatedSizeForScope:", v4);

  return v6;
}

- (unint64_t)estimatedAssetCountForScope:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "estimatedAssetCountForScope:", v4);

  return v6;
}

- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  void *v6;

  if (!a3)
    return 1;
  self->_someScopeMightHaveToBePulledByClient = 1;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  self->_schedulePullFromClient = 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "upgradeScopesWithNewLibraryOptions:error:", a3, a4);

  return (char)a4;
}

- (id)statusDictionaryForScope:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CPLEngineScopeStorage *v49;
  void *v50;
  CPLEngineScopeStorage *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];

  v73[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", objc_msgSend(v4, "scopeType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("scope type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "localIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "cloudIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "stableIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("indexes"));

  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __50__CPLEngineScopeStorage_statusDictionaryForScope___block_invoke;
  v71[3] = &unk_1E60D9390;
  v69 = v5;
  v72 = v69;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v71);
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage engineStore](self, "engineStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engineLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("creation date"), v16);

  objc_msgSend(v12, "flagsForScope:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("flags"), v18);
  v19 = objc_msgSend(v12, "busyStateForScope:", v4);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("busyState"), v20);

  }
  objc_msgSend(v12, "transportScopeForScope:", v4);
  v21 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v21;
  if (v21)
  {
    objc_msgSend(v15, "scopeNameForTransportScope:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("zone"), v22);

  }
  else
  {
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v11)[2](v11, CFSTR("zone"), CFSTR("not fetched yet"));
  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v12, "doesScopeNeedToPushChangesToTransport:", v4))
    objc_msgSend(v23, "addObject:", CFSTR("push-to-transport"));
  if (objc_msgSend(v12, "doesScopeNeedToPullChangesFromTransport:", v4))
    objc_msgSend(v23, "addObject:", CFSTR("pull-from-transport"));
  if (objc_msgSend(v12, "doesScopeNeedToBePulledByClient:", v4))
    objc_msgSend(v23, "addObject:", CFSTR("client-must-pull"));
  if (objc_msgSend(v12, "doesScopeNeedToUpdateTransport:", v4))
    objc_msgSend(v23, "addObject:", CFSTR("must-update-transport"));
  if (objc_msgSend(v12, "doesScopeNeedToUploadComputeState:", v4))
    objc_msgSend(v23, "addObject:", CFSTR("upload-compute-states"));
  if (objc_msgSend(v23, "count"))
    ((void (**)(_QWORD, const __CFString *, id))v11)[2](v11, CFSTR("todo"), v23);
  v66 = v23;
  v68 = v18;
  objc_msgSend(v12, "disabledDateForScope:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("disabled date"), v24);

  objc_msgSend(v12, "deleteDateForScope:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("delete date"), v25);

  objc_msgSend(v12, "initialSyncDateForScope:", v4);
  v26 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v26;
  if (v26)
  {
    ((void (**)(_QWORD, const __CFString *, uint64_t))v11)[2](v11, CFSTR("initial sync"), v26);
  }
  else
  {
    v27 = -[CPLEngineScopeStorage estimatedSizeForScope:](self, "estimatedSizeForScope:", v4);
    v28 = -[CPLEngineScopeStorage estimatedAssetCountForScope:](self, "estimatedAssetCountForScope:", v4);
    if (v27 | v28)
    {
      v29 = v28;
      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v27, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%@ for %lu assets"), v31, v29);
      ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("init. est. size"), v32);

    }
  }
  objc_msgSend(v12, "initialDownloadDateForScope:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), const __CFString *))v11[2])(v11, CFSTR("initial client download"));
  objc_msgSend(v12, "activationDateForScope:", v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), const __CFString *))v11[2])(v11, CFSTR("activation"));
  objc_msgSend(v12, "initialMetadataQueriesDateForScope:", v4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), const __CFString *))v11[2])(v11, CFSTR("initial metadata queries"));
  objc_msgSend(v12, "initialMetadataDownloadDateForScope:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), const __CFString *))v11[2])(v11, CFSTR("initial metadata download"));
  -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v4);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(v12, "initialMetadataDownloadDateForScope:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("initial shared metadata download"), v34);

  }
  objc_msgSend(v12, "initialMingleDateForScope:", v4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), const __CFString *))v11[2])(v11, CFSTR("initial mingle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CPLEngineScopeStorage supportedFeatureVersionInLastSyncForScope:](self, "supportedFeatureVersionInLastSyncForScope:", v4));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("last supported feature version"), v35);

  objc_msgSend(v12, "lastScopeChangeUpdateDateForScope:", v4);
  v36 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v36;
  if (v36)
  {
    ((void (**)(_QWORD, const __CFString *, uint64_t))v11)[2](v11, CFSTR("scope info"), v36);
  }
  else
  {
    objc_msgSend(v12, "scopeChangeForScope:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "libraryInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      v39 = CFSTR("needs update");
    else
      v39 = CFSTR("none");
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v11)[2](v11, CFSTR("scope info"), v39);

  }
  v70 = 0;
  objc_msgSend(v12, "syncAnchorForScope:isCommitted:", v4, &v70);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = v15;
    objc_msgSend(v15, "simpleDescriptionForSyncAnchor:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v70)
      v44 = "";
    else
      v44 = " uncommitted";
    v45 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR(" %@%s"), v42, v44);
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("anch"), v45);

  }
  else
  {
    v41 = v15;
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v11)[2](v11, CFSTR("anch"), CFSTR("none"));
  }
  -[CPLEngineScopeStorage remainingClassesForInitialQueryForScope:](self, "remainingClassesForInitialQueryForScope:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "count"))
  {
    objc_msgSend(v46, "valueForKey:", CFSTR("description"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("queries"), v47);

  }
  v60 = (void *)v33;
  objc_msgSend(v12, "transientSyncAnchorForScope:", v4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend(v41, "simpleDescriptionForSyncAnchor:", v48);
    v49 = self;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("transient"), v50);

    self = v49;
  }
  -[CPLEngineScopeStorage uploadTransportGroupForScope:](self, "uploadTransportGroupForScope:", v4);
  v51 = self;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "cplDebugDescription");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("upload group"), v53);

  -[CPLEngineScopeStorage downloadTransportGroupForScope:](v51, "downloadTransportGroupForScope:", v4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "cplDebugDescription");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v11)[2](v11, CFSTR("download group"), v55);

  v56 = v69;
  return v56;
}

- (id)primaryScope
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_activateSharedScopeIfPresentWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingScopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = 1;
  -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 4)
        {
          objc_msgSend(v13, "scopeIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CPLEngineScopeStorage shouldAutoactivateScopeWithIdentifier:scopeType:](self, "shouldAutoactivateScopeWithIdentifier:scopeType:", v14, objc_msgSend(v13, "scopeType"));

          if (v15)
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain_7377();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v23 = v13;
                _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_DEFAULT, "Auto-activating %@ after iCPL has been turned on", buf, 0xCu);
              }

            }
            v7 = -[CPLEngineScopeStorage activateScope:error:](self, "activateScope:error:", v13, a3);
            goto LABEL_18;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v10)
        continue;
      break;
    }
    v7 = 1;
  }
LABEL_18:

  return v7;
}

- (BOOL)enablePrimaryScopeWithError:(id *)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "libraryOptions");

  if ((v6 & 1) != 0)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!-[CPLEngineScopeStorage activateScope:error:](self, "activateScope:error:", v10, a3))
      {
LABEL_10:
        v8 = 0;
LABEL_18:

        return v8;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7377();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412290;
          v17 = v12;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v16, 0xCu);

        }
      }
      -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineScopeStorage createScopeWithIdentifier:scopeType:flags:transportScope:error:](self, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v13, 1, 0, 0, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_10;
    }
    v8 = -[CPLEngineScopeStorage _activateSharedScopeIfPresentWithError:](self, "_activateSharedScopeIfPresentWithError:", a3);
    goto LABEL_18;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7377();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Client tried to enable main scope manually while the option is not set", (uint8_t *)&v16, 2u);
    }

  }
  if (!a3)
    return 0;
  +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("libraryOptions"));
  v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (BOOL)disablePrimaryScopeWithError:(id *)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "libraryOptions");

  if ((v6 & 1) != 0)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v8 = -[CPLEngineScopeStorage deactivateScope:error:](self, "deactivateScope:error:", v10, a3);
    else
      v8 = 1;

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Client tried to disable main scope manually while the option is not set", v12, 2u);
      }

    }
    if (a3)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("libraryOptions"));
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (BOOL)_forceClientToPullScopeIfNecessary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __int16 v8;
  BOOL v9;

  v6 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "libraryOptions");

  v9 = (v8 & 0x400) == 0
    || -[CPLEngineScopeStorage setScopeNeedsToBePulledByClient:error:](self, "setScopeNeedsToBePulledByClient:error:", v6, a4);

  return v9;
}

- (BOOL)activateScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "valueForFlag:", 16))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v11, 0xCu);
      }

    }
    objc_msgSend(v7, "setValue:forFlag:", 0, 16);
    v9 = 0;
    if (-[CPLEngineScopeStorage updateFlags:forScope:error:](self, "updateFlags:forScope:error:", v7, v6, a4))
    {
      if (-[CPLEngineScopeStorage setTransportScope:forScope:error:](self, "setTransportScope:forScope:error:", 0, v6, a4))
      {
        v9 = -[CPLEngineScopeStorage _forceClientToPullScopeIfNecessary:error:](self, "_forceClientToPullScopeIfNecessary:error:", v6, a4);
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)deactivateScope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "valueForFlag:", 16) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Deactivating %@", (uint8_t *)&v11, 0xCu);
      }

    }
    objc_msgSend(v7, "setValue:forFlag:", 1, 16);
    if (-[CPLEngineScopeStorage updateFlags:forScope:error:](self, "updateFlags:forScope:error:", v7, v6, a4))
      v8 = -[CPLEngineScopeStorage _forceClientToPullScopeIfNecessary:error:](self, "_forceClientToPullScopeIfNecessary:error:", v6, a4);
    else
      v8 = 0;
  }

  return v8;
}

- (BOOL)shouldAutoactivateScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!+[CPLScopeChange shouldAutoActivateScopeWithType:](CPLScopeChange, "shouldAutoActivateScopeWithType:", a4))
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1)
    dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_1_21468);
  v7 = 1;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4 && !CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope)
  {
    -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CPLEngineScopeStorage _isValidSharingScopeIdentifier:scopeType:forScopeIdentifier:](self, "_isValidSharingScopeIdentifier:scopeType:forScopeIdentifier:", v6, a4, v8);

    if (v9)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharingScopeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && (objc_msgSend(v11, "isEqualToString:", v6) & 1) == 0)
      {
        if (_CPLSilentLogging)
        {
          v7 = 0;
          goto LABEL_22;
        }
        __CPLStorageOSLogDomain_7377();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138543618;
          v16 = v6;
          v17 = 2114;
          v18 = v11;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Won't auto-activate %{public}@ as %{public}@ is already in use", (uint8_t *)&v15, 0x16u);
        }
      }
      else
      {
        -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12 && !-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v12))
          goto LABEL_21;
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 138543362;
            v16 = v6;
            _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Won't auto-activate %{public}@ as iCPL is off", (uint8_t *)&v15, 0xCu);
          }

        }
      }
      v7 = 0;
LABEL_21:

LABEL_22:
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

- (id)scopeListSyncAnchor
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scopeListSyncAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "storeScopeListSyncAnchor:error:", v6, a4);

  if (!v6 && v8)
  {
    self->_someScopeMightHaveToBePulledByClient = 1;
    self->_clearSomeScopeMightHaveToBePulledByClient = 0;
    self->_schedulePullFromClient = 1;
  }
  return v8;
}

- (id)_realScopeIdentifiersFromScopeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingScopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_16:

      return v4;
    }
    -[CPLEngineScopeStorage sharingScopeForScope:](self, "sharingScopeForScope:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "containsObject:", v9) & 1) != 0)
      {
        objc_msgSend(v8, "scopeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v8, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "arrayByAddingObject:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v16 = (id)v13;

LABEL_15:
          v4 = v16;
          goto LABEL_16;
        }
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = v7;
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        obj = v4;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v18)
        {
          v19 = v18;
          v20 = 0;
          v21 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v32 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v16, "addObject:", v23, v29);
              -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "isEqualToString:", v24);

              if (v25)
              {
                if ((v20 & 1) == 0)
                {
                  objc_msgSend(v8, "scopeIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "addObject:", v26);

                }
                v20 = 1;
              }
              else
              {
                objc_msgSend(v8, "scopeIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v23, "isEqualToString:", v27);

                v20 |= v28;
              }
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v19);
        }

        v7 = v29;
        goto LABEL_15;
      }
      -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "containsObject:", v9) & 1) != 0)
      {
        objc_msgSend(v8, "scopeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "containsObject:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v8, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setByAddingObject:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_14:
        v16 = v4;
        goto LABEL_15;
      }
    }

    goto LABEL_14;
  }
  return v4;
}

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineScopeStorage _realScopeIdentifiersFromScopeIdentifiers:](self, "_realScopeIdentifiersFromScopeIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterForIncludedScopeIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterForExcludedScopeIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updatedScopeFilter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a3;
  objc_msgSend(v5, "includedScopeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[CPLEngineScopeStorage _realScopeIdentifiersFromScopeIdentifiers:](self, "_realScopeIdentifiersFromScopeIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7377();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Unexpected new scope identifiers list", v14, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 2595, CFSTR("Unexpected new scope identifiers list"));

        abort();
      }
      if ((objc_msgSend(v6, "isEqualToSet:", v7) & 1) == 0)
      {
        -[CPLEngineStorage platformObject](self, "platformObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "filterForIncludedScopeIdentifiers:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v9;
      }
    }

  }
  return v5;
}

- (BOOL)doesScopeAllowCourtesyMingling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingScopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)sharingScopeForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "scopeType") == 1)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharingScopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (objc_msgSend(v4, "scopeIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          v7,
          v9))
    {
      -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineScopeStorage scopeWithIdentifier:](self, "scopeWithIdentifier:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "valueForFlag:", 16) & 1) != 0)
        {
          v13 = 0;
        }
        else if (!objc_msgSend(v12, "valueForFlag:", 4)
               || (-[CPLEngineScopeStorage stagingScopeForScope:](self, "stagingScopeForScope:", v11),
                   v13 = (id)objc_claimAutoreleasedReturnValue(),
                   v13,
                   v13))
        {
          v13 = v11;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)scopeForSharingScope:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "scopeType") - 6) >= 0xFFFFFFFFFFFFFFFELL)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingScopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v4, "scopeIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", v7),
          v8,
          v9))
    {
      -[CPLEngineScopeStorage primaryScope](self, "primaryScope");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v10)
        || -[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 16, v4))
      {
        v5 = 0;
      }
      else
      {
        v5 = v10;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stagingScopeForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[CPLEngineScopeStorage valueForFlag:forScope:](self, "valueForFlag:forScope:", 64, v4))
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stagingScopeForScope:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)rewindSyncAnchorsForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rewindSyncAnchorsForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "storeRewindSyncAnchors:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)addRewindSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rewindSyncAnchorsForScope:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  v13 = v12;
  if (v12)
  {
    if ((objc_msgSend(v12, "containsObject:", v8) & 1) != 0)
    {
LABEL_8:
      v17 = 1;
      v14 = v13;
      goto LABEL_10;
    }
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "addObject:", v8);

  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
  }
  if (v14 == v13)
    goto LABEL_8;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "storeRewindSyncAnchors:forScope:error:", v14, v9, a5);

  if (v16)
    v17 = -[CPLEngineScopeStorage setScopeHasChangesToPullFromTransport:error:](self, "setScopeHasChangesToPullFromTransport:error:", v9, a5);
  else
    v17 = 0;
LABEL_10:

  return v17;
}

- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v8 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "storeBusyState:forScope:error:", a3, v8, a5);

  if (v10)
  {
    objc_msgSend(v8, "scopeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineStorage mainScopeIdentifier](self, "mainScopeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v13)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "engineLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBusyState:", a3);

    }
  }

  return v10;
}

- (int64_t)busyStateForScope:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "busyStateForScope:", v4);

  return v6;
}

- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "storeSupervisorInfo:forScope:error:", v9, v8, a5);

  return (char)a5;
}

- (id)supervisorInfoForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supervisorInfoForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mostCurrentChangesSyncAnchorForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v9;

  v4 = a3;
  if (-[CPLEngineScopeStorage classOfRecordsForInitialQueryForScope:](self, "classOfRecordsForInitialQueryForScope:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transientSyncAnchorForScope:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v9 = 0;
      -[CPLEngineStorage platformObject](self, "platformObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "syncAnchorForScope:isCommitted:", v4, &v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (void)beginCreatingScopeWithIdentifier:(id)a3
{
  id v5;
  NSCountedSet *v6;
  NSCountedSet *scopeIdentifiersBeingCreated;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = v5;
  if (!self->_scopeIdentifiersBeingCreated)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
    self->_scopeIdentifiersBeingCreated = v6;

    v5 = v12;
  }
  -[CPLEngineScopeStorage _scopeWithIdentifier:](self, "_scopeWithIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Begin creation of %@ but it is already present", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 2753, CFSTR("Begin creation of %@ but it is already present"), v12);

    abort();
  }
  -[NSCountedSet addObject:](self->_scopeIdentifiersBeingCreated, "addObject:", v12);

}

- (void)endCreatingScopeWithIdentifier:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((-[NSCountedSet containsObject:](self->_scopeIdentifiersBeingCreated, "containsObject:") & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7377();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = v6;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Trying to call %@ for %@ too many times", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 2759, CFSTR("Trying to call %@ for %@ too many times"), v9, v10);

    abort();
  }
  -[NSCountedSet removeObject:](self->_scopeIdentifiersBeingCreated, "removeObject:", v10);

}

- (BOOL)shouldCheckAssetsWithServerWhenOverQuotaForScope:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(a3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PrimarySync"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("_CPLLastAssetCheckOverQuotaDateForPrimarySync"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("CPLMinimumIntervalBetweenOverQuotaRechecks"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
        }
        else
        {
          -[CPLEngineStorage engineStore](self, "engineStore");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "engineLibrary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "configuration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("over_quota.minimum_interval_between_rechecks.seconds"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "doubleValue");
            v11 = v17;
          }
          else
          {
            v11 = 604800.0;
          }

        }
        objc_msgSend(v7, "timeIntervalSinceNow");
        v19 = -v18;

        if (v11 > v19)
        {
          v12 = 0;
          goto LABEL_14;
        }
      }
    }
    else
    {

      v7 = 0;
    }
    v12 = 1;
LABEL_14:

    return v12;
  }
  return 1;
}

- (BOOL)noteDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PrimarySync"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("_CPLLastAssetCheckOverQuotaDateForPrimarySync"));

  }
  return 1;
}

- (BOOL)resetDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a3, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PrimarySync"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("_CPLLastAssetCheckOverQuotaDateForPrimarySync"));

  }
  return 1;
}

- (void)addScopeFlagsObserver:(id)a3 withIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *scopeObservers;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_scopeObservers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scopeObservers = self->_scopeObservers;
    self->_scopeObservers = v7;

  }
  v9 = (void *)objc_msgSend(v11, "copy");
  v10 = (void *)MEMORY[0x1B5E08DC4]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scopeObservers, "setObject:forKeyedSubscript:", v10, v6);

}

- (void)removeScopeFlagsObserverWithIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_scopeObservers, "removeObjectForKey:", a3);
}

- (BOOL)hasScopeFlagsObservers
{
  return -[NSMutableDictionary count](self->_scopeObservers, "count") != 0;
}

- (BOOL)shouldTrackAdditionalInitialSyncDatesForScope:(id)a3
{
  void *v3;
  BOOL v4;

  -[CPLEngineScopeStorage activationDateForScope:](self, "activationDateForScope:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)activationDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)initialMetadataQueriesDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialMetadataQueriesDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)initialMetadataDownloadDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialMetadataDownloadDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedInitialMinglingWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeInitialMingleDate:forScope:error:", v8, v6, a4);

  return (char)a4;
}

- (id)initialMingleDateForScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialMingleDateForScope:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldDropAllUploadsForScope:(id)a3 dropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5
{
  id v8;
  BOOL v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  BOOL v16;

  v8 = a3;
  if ((CPLIsInTestReadonlyMode() & 1) != 0)
  {
    v9 = 0;
    v10 = CFSTR("test read-only mode");
  }
  else
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "engineLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "iCloudLibraryClientVersionTooOld");

    if ((v13 & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("client version is too old");
    }
    else
    {
      -[CPLEngineScopeStorage flagsForScope:](self, "flagsForScope:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "flags");

      if ((v15 & 4) != 0)
      {
        v9 = 0;
        v10 = CFSTR("scope has been deleted");
      }
      else if ((v15 & 0x10) != 0)
      {
        v9 = 0;
        v10 = CFSTR("scope has been de-activated");
      }
      else if ((v15 & 1) != 0)
      {
        v9 = 1;
        v10 = CFSTR("scope is read-only");
      }
      else
      {
        if ((v15 & 8) == 0)
        {
          v16 = 0;
          goto LABEL_17;
        }
        v9 = 1;
        v10 = CFSTR("scope has been disabled");
      }
    }
  }
  if (a5)
    *a5 = v9;
  *a4 = v10;
  v16 = 1;
LABEL_17:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeObservers, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersBeingCreated, 0);
  objc_storeStrong((id *)&self->_assetCountsToUpdate, 0);
  objc_storeStrong((id *)&self->_scopesToRemoveFromBrokenScopes, 0);
  objc_storeStrong((id *)&self->_scopeCache, 0);
}

uint64_t __50__CPLEngineScopeStorage_statusDictionaryForScope___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a3, a2);
  return result;
}

void __68__CPLEngineScopeStorage__updateAssetCountsWithScopeChange_forScope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v12, "integerValue");
  v10 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v5, "numberWithInteger:", v10 + v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v8);

}

uint64_t __67__CPLEngineScopeStorage__notifyScopeObserversForScope_flagsUpdate___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a3 + 16))(a3, a1[4], a1[5], a1[6]);
}

void __31__CPLEngineScopeStorage_status__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 40), "flagsForScope:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "valueForFlag:", 16);

  if (!a3)
    goto LABEL_10;
  if (!v9)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) >= 3uLL)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 40), "platformObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastScopeChangeUpdateDateForScope:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", v11);
      if (v12 > 600.0)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
LABEL_11:

        goto LABEL_12;
      }
    }

LABEL_10:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "statusDictionaryForScope:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "appendString:", CFSTR("\n\t"));
    v13 = objc_msgSend(v5, "scopeType");
    v14 = MEMORY[0x1E0C809B0];
    v15 = (v13 < 6) & (0x32u >> v13);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __31__CPLEngineScopeStorage_status__block_invoke_3;
    v29[3] = &unk_1E60D9290;
    v30 = *(id *)(a1 + 48);
    v16 = (void *)MEMORY[0x1B5E08DC4](v29);
    objc_msgSend(v5, "scopeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __31__CPLEngineScopeStorage_status__block_invoke_4;
    v27[3] = &unk_1E60D92B8;
    v28 = *(id *)(a1 + 56);
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __31__CPLEngineScopeStorage_status__block_invoke_5;
    v24[3] = &unk_1E60D92E0;
    v25 = *(id *)(a1 + 56);
    v26 = v16;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __31__CPLEngineScopeStorage_status__block_invoke_6;
    v19[3] = &unk_1E60D9308;
    v22 = v15;
    v23 = v9;
    v20 = *(id *)(a1 + 56);
    v21 = v26;
    v18 = v26;
    +[CPLEngineScope formatStatusDictionary:forScopeWithIdentifier:appendString:appendTopLevelStatus:appendLineStatus:](CPLEngineScope, "formatStatusDictionary:forScopeWithIdentifier:appendString:appendTopLevelStatus:appendLineStatus:", v11, v17, v27, v24, v19);

    goto LABEL_11;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
LABEL_5:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
LABEL_12:

}

id __31__CPLEngineScopeStorage_status__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CPLEngineScope separatorForStatusKey:](CPLEngineScope, "separatorForStatusKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("scope info")))
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("updated %@"), v11);

        goto LABEL_9;
      }
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, *(_QWORD *)(a1 + 32));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "description");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = v7;
LABEL_9:

  return v8;
}

uint64_t __31__CPLEngineScopeStorage_status__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

void __31__CPLEngineScopeStorage_status__block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:", v2);

}

void __31__CPLEngineScopeStorage_status__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(uint64_t, __CFString *, id);
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v13 = a2;
  v5 = a3;
  if ((*(_BYTE *)(a1 + 48) || (objc_msgSend((id)status_avoidKeyIfNotLibrary, "containsObject:", v13) & 1) == 0)
    && (!*(_BYTE *)(a1 + 49) || (objc_msgSend((id)status_avoidKeysIfInactive, "containsObject:", v13) & 1) == 0))
  {
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("scope info")))
    {
      v6 = CFSTR("library info");
      if (!*(_BYTE *)(a1 + 48))
        v6 = v13;
      v8 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = *(void (**)(uint64_t, __CFString *, id))(v7 + 16);
      v10 = v6;
      v9(v7, v13, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("\n\t\t%@: %@"), v10, v11);

    }
    else
    {
      v12 = *(void **)(a1 + 32);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("\n\t\t%@: %@"), v13, v11);
    }

  }
}

void __31__CPLEngineScopeStorage_status__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("init. est. size"), CFSTR("last supported feature version"), CFSTR("anch"), CFSTR("queries"), CFSTR("transient"), CFSTR("upload group"), CFSTR("download group"), CFSTR("initial sync"), 0);
  v1 = (void *)status_avoidKeysIfInactive;
  status_avoidKeysIfInactive = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("init. est. size"), CFSTR("last supported feature version"), 0);
  v3 = (void *)status_avoidKeyIfNotLibrary;
  status_avoidKeyIfNotLibrary = v2;

}

uint64_t __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "beginCreatingScopeWithIdentifier:", *(_QWORD *)(result + 40));
  }
  return result;
}

uint64_t __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "endCreatingScopeWithIdentifier:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 0;
  }
  return result;
}

@end
