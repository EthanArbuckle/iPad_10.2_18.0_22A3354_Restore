@implementation CPLProcessStagedScopesTask

- (void)didProcessStagedScope:(id)a3
{
  self->_hasProcessedStagedScopes = 1;
}

- (id)enumerateScopesForTaskInTransaction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CPLEngineMultiscopeSyncTask scopes](self, "scopes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_12;
  objc_msgSend(v3, "sharingScopeForScope:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_11:

LABEL_12:
    v7 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_13;
  }
  objc_msgSend(v3, "stagingScopeForScope:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "scopeChangeForScope:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(v8, "areSomeUsersExiting") & 1) != 0)
    {
      v9 = objc_msgSend(v3, "valueForFlag:forScope:", 4, v5);

      if (!v9)
        goto LABEL_4;
    }
    else
    {

    }
    goto LABEL_11;
  }
LABEL_4:
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
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
  CPLProcessStagedScopesScopeTask *v14;
  void *v15;
  CPLProcessStagedScopesScopeTask *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CPLProcessStagedScopesScopeTask alloc];
  -[CPLEngineSyncTask engineLibrary](self, "engineLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLProcessStagedScopesScopeTask initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:](v14, "initWithEngineLibrary:session:clientCacheIdentifier:scope:transportScope:", v15, v12, v10, v13, v11);

  return v16;
}

- (id)taskIdentifier
{
  return CFSTR("engine.sync.processtagedscopes");
}

- (void)taskDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4 || !self->_hasProcessedStagedScopes)
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLProcessStagedScopesTask;
    -[CPLEngineSyncTask taskDidFinishWithError:](&v8, sel_taskDidFinishWithError_, v4);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_18636();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Some staged scopes have been fully processed, we will need to do some cleanup", buf, 2u);
      }

    }
    -[CPLEngineSyncTask session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestSyncStateAtEndOfSyncSession:reschedule:", 2, 1);

    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10000, CFSTR("Need to clean-up staged scopes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)CPLProcessStagedScopesTask;
    -[CPLEngineSyncTask taskDidFinishWithError:](&v9, sel_taskDidFinishWithError_, v7);

  }
}

@end
