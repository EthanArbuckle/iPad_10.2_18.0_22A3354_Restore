@implementation _CPLOptimisticIDMapping

- (_CPLOptimisticIDMapping)initWithIDMapping:(id)a3
{
  id v5;
  _CPLOptimisticIDMapping *v6;
  _CPLOptimisticIDMapping *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CPLOptimisticIDMapping;
  v6 = -[_CPLOptimisticIDMapping init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_idMapping, a3);

  return v7;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  return -[CPLEngineIDMapping addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:](self->_idMapping, "addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", a3, a4, a5, a6, a7);
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[CPLEngineIDMapping firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:](self->_idMapping, "firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  return -[CPLEngineIDMapping firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:](self->_idMapping, "firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:", a3);
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:](self->_idMapping, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:](self->_idMapping, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  return -[CPLEngineIDMapping setupCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:](self->_idMapping, "setupCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", a3, a4, a5, a6, a7);
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idMapping, 0);
}

@end
