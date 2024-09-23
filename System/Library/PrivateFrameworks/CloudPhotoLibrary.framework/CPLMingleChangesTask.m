@implementation CPLMingleChangesTask

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorForScopesWithMingling");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scopeFilterInTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CPLEngineSyncTask session](self, "session", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopeIdentifiersExcludedFromMingling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CPLEngineMultiscopeSyncTask scopes](self, "scopes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterForExcludedScopeIdentifiers:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLMingleChangesScopeTask *v14;
  void *v15;
  CPLMingleChangesScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLMingleChangesScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLMingleChangesScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  return v16;
}

- (BOOL)shouldProcessScope:(id)a3 inTransaction:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLMingleChangesTask;
  if (!-[CPLEngineMultiscopeSyncTask shouldProcessScope:inTransaction:](&v22, sel_shouldProcessScope_inTransaction_, v6, a4))
  {
    -[CPLEngineMultiscopeSyncTask scopes](self, "scopes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = +[CPLScopeChange supportsDirectMinglingForScopeWithType:](CPLScopeChange, "supportsDirectMinglingForScopeWithType:", objc_msgSend(v6, "scopeType"));
  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "valueForFlag:forScope:", 52, v6))
  {
    if (_CPLSilentLogging)
    {
      LOBYTE(v11) = 0;
      goto LABEL_16;
    }
    __CPLTaskOSLogDomain_12177();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring mingling for %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (-[CPLEngineSyncTask forceSync](self, "forceSync"))
    goto LABEL_21;
  objc_msgSend(v9, "transientSyncAnchorForScope:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_21:
    v11 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v9, "engineStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transientPullRepository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasUnmingledChangesForScope:", v6);

  if ((v18 & 1) != 0)
    goto LABEL_21;
  objc_msgSend(v9, "sharingScopeForScope:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v9, "engineStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transientPullRepository");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v21, "hasUnmingledChangesForScope:", v19);

  }
  else
  {
    v11 = 0;
  }

LABEL_10:
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_12177();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      if (v11)
        v13 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "Should mingle changes for %@: %@", buf, 0x16u);
    }

  }
LABEL_16:

  return v11;
}

- (void)launch
{
  objc_super v3;

  -[CPLMingleChangesTask hash](self, "hash");
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLMingleChangesTask;
  -[CPLEngineMultiscopeSyncTask launch](&v3, sel_launch);
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[CPLMingleChangesTask hash](self, "hash");
  kdebug_trace();
  if (!v4)
  {
    -[CPLEngineSyncTask session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteClientNeedsToPullIfNecessary");

  }
  v6.receiver = self;
  v6.super_class = (Class)CPLMingleChangesTask;
  -[CPLEngineSyncTask taskDidFinishWithError:](&v6, sel_taskDidFinishWithError_, v4);

}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.mingle");
}

@end
