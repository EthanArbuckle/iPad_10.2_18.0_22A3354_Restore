@implementation CPLReshareTask

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

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_msgSend(v4, "valueForFlag:forScope:", 24, v5) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "sharingScopeForScope:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if ((objc_msgSend(v4, "valueForFlag:forScope:", 262232, v6) & 1) != 0)
    goto LABEL_7;
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ignoredRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CPLCutoffDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "scopeIdentifier:hasIgnoredRecordsBeforeDate:", v10, v11);

  if ((v12 & 1) == 0)
  {
LABEL_7:

LABEL_8:
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_9;
  }
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (id)newScopedTaskWithScope:(id)a3 session:(id)a4 transportScope:(id)a5 clientCacheIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLReshareScopeTask *v14;
  void *v15;
  CPLReshareScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLReshareScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLReshareScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  return v16;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.reshare");
}

@end
