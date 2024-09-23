@implementation CPLUnacknowledgedChangeStorage

- (CPLUnacknowledgedChangeStorage)initWithStore:(id)a3
{
  id v5;
  CPLUnacknowledgedChangeStorage *v6;
  CPLUnacknowledgedChangeStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLUnacknowledgedChangeStorage;
  v6 = -[CPLUnacknowledgedChangeStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineStore unacknowledgedChangeWithLocalScopedIdentifier:](self->_store, "unacknowledgedChangeWithLocalScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLUnacknowledgedChangeStorage storageDescription](self, "storageDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 167, CFSTR("%@ on %@ should not be useful here"), v9, v10);

  abort();
}

- (id)storageDescription
{
  return CFSTR("pendingChanges");
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
