@implementation CPLTransientRepositoryStorage

- (CPLTransientRepositoryStorage)initWithTransientRepository:(id)a3
{
  id v5;
  CPLTransientRepositoryStorage *v6;
  CPLTransientRepositoryStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLTransientRepositoryStorage;
  v6 = -[CPLTransientRepositoryStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transientRepository, a3);

  return v7;
}

- (id)storageDescription
{
  return -[CPLEngineStorage name](self->_transientRepository, "name");
}

- (id)changeWithScopedIdentifier:(id)a3
{
  return -[CPLEngineTransientRepository changeWithScopedIdentifier:](self->_transientRepository, "changeWithScopedIdentifier:", a3);
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 79, CFSTR("%@ is not implemented on %@"), v9, objc_opt_class());

  abort();
}

- (CPLEngineTransientRepository)transientRepository
{
  return self->_transientRepository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientRepository, 0);
}

@end
