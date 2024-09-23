@implementation CPLPushRepositoryStorage

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CPLPushRepositoryStorage pushRepository](self, "pushRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLPushRepositoryStorage scopedIdentifierAddingScopeIndexForScopedIdentifier:](self, "scopedIdentifierAddingScopeIndexForScopedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v7, "getRelatedScopedIdentifier:forRecordWithScopedIdentifier:", a3, v8);
  return (char)a3;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLPushRepositoryStorage pushRepository](self, "pushRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLPushRepositoryStorage scopedIdentifierAddingScopeIndexForScopedIdentifier:](self, "scopedIdentifierAddingScopeIndexForScopedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v7, "hasChangesWithRelatedScopedIdentifier:class:", v8, a4);
  return (char)a4;
}

- (CPLPushRepositoryStorage)initWithPushRepository:(id)a3
{
  id v5;
  CPLPushRepositoryStorage *v6;
  CPLPushRepositoryStorage *v7;
  void *v8;
  uint64_t v9;
  CPLEngineScopeStorage *scopes;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLPushRepositoryStorage;
  v6 = -[CPLPushRepositoryStorage init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pushRepository, a3);
    v7->_storageScopeType = -[CPLEnginePushRepository scopeType](v7->_pushRepository, "scopeType");
    objc_msgSend(v5, "engineStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopes");
    v9 = objc_claimAutoreleasedReturnValue();
    scopes = v7->_scopes;
    v7->_scopes = (CPLEngineScopeStorage *)v9;

  }
  return v7;
}

- (id)storageDescription
{
  return -[CPLEngineStorage name](self->_pushRepository, "name");
}

- (id)scopedIdentifierAddingScopeIndexForScopedIdentifier:(id)a3
{
  id v5;
  unint64_t storageScopeType;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(v5, "scopeIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    storageScopeType = self->_storageScopeType;
    if (storageScopeType == 2)
    {
      -[CPLEngineScopeStorage scopedIdentifierForCloudScopedIdentifier:](self->_scopes, "scopedIdentifierForCloudScopedIdentifier:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (storageScopeType != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 44, CFSTR("Invalid scope type for %@: %ld"), self->_pushRepository, self->_storageScopeType);

        abort();
      }
      -[CPLEngineScopeStorage scopedIdentifierForLocalScopedIdentifier:](self->_scopes, "scopedIdentifierForLocalScopedIdentifier:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  CPLEnginePushRepository *pushRepository;
  void *v4;
  void *v5;

  pushRepository = self->_pushRepository;
  -[CPLPushRepositoryStorage scopedIdentifierAddingScopeIndexForScopedIdentifier:](self, "scopedIdentifierAddingScopeIndexForScopedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEnginePushRepository changeWithScopedIdentifier:](pushRepository, "changeWithScopedIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  CPLEnginePushRepository *pushRepository;
  void *v6;
  void *v7;

  pushRepository = self->_pushRepository;
  -[CPLPushRepositoryStorage scopedIdentifierAddingScopeIndexForScopedIdentifier:](self, "scopedIdentifierAddingScopeIndexForScopedIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEnginePushRepository allChangesWithClass:relatedScopedIdentifier:](pushRepository, "allChangesWithClass:relatedScopedIdentifier:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

@end
