@implementation CPLInvalidBatchStorage

- (CPLInvalidBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4
{
  id v7;
  id v8;
  CPLInvalidBatchStorage *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "hasUnmingledChangesForScope:", v8))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_487();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v8;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ should have no changes to mingle any more", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineTransientRepositoryBatchStorage.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 100, CFSTR("%@ should have no changes to mingle any more"), v8);

    abort();
  }
  v14.receiver = self;
  v14.super_class = (Class)CPLInvalidBatchStorage;
  v9 = -[CPLEngineTransientRepositoryBatchStorage initWithTransientRepository:scope:](&v14, sel_initWithTransientRepository_scope_, v7, v8);

  return v9;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLInvalidBatchStorage;
    v8 = -[CPLEngineTransientRepositoryBatchStorage hasChangesInScopeWithIdentifier:](&v10, sel_hasChangesInScopeWithIdentifier_, v4);
  }

  return v8;
}

@end
