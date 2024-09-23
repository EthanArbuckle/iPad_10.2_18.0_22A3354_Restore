@implementation CPLTransportUpdateTask

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorForScopesNeedingToUpdateTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLTransportUpdateScopeTask *v14;
  void *v15;
  CPLTransportUpdateScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLTransportUpdateScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLEngineScopedTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  return v16;
}

- (BOOL)shouldSkipScopesWithMissingTransportScope
{
  return 0;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.transportupdate");
}

@end
