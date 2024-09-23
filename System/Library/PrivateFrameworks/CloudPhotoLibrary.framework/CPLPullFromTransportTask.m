@implementation CPLPullFromTransportTask

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorForScopesNeedingToPullChangesFromTransport");
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
  CPLPullFromTransportScopeTask *v14;
  void *v15;
  CPLPullFromTransportScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLPullFromTransportScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLPullFromTransportScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  return v16;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.pullfromtransport");
}

@end
