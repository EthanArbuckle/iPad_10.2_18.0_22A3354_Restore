@implementation MLModelAssetModelVendor

- (MLModelAssetModelVendor)initWithResourceFactory:(id)a3
{
  id v5;
  MLModelAssetModelVendor *v6;
  MLModelAssetModelVendor *v7;
  MLModelConfiguration *cachedConfiguration;
  MLModel *cachedModel;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLModelAssetModelVendor;
  v6 = -[MLModelAssetModelVendor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceFactory, a3);
    cachedConfiguration = v7->_cachedConfiguration;
    v7->_cachedConfiguration = 0;

    cachedModel = v7->_cachedModel;
    v7->_cachedModel = 0;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[MLModelAssetModelVendor cachedConfiguration](self, "cachedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[MLModelAssetModelVendor cachedModel](self, "cachedModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MLModelAssetModelVendor resourceFactory](self, "resourceFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelWithConfiguration:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MLModelAssetModelVendor setCachedModel:](self, "setCachedModel:", v9);
      -[MLModelAssetModelVendor setCachedConfiguration:](self, "setCachedConfiguration:", v6);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[MLModelAssetModelVendor cachedConfiguration](self, "cachedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  -[MLModelAssetModelVendor cachedModel](self, "cachedModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v10)
  {
LABEL_5:
    -[MLModelAssetModelVendor resourceFactory](self, "resourceFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__MLModelAssetModelVendor_modelWithConfiguration_completionHandler___block_invoke;
    v12[3] = &unk_1E3D66B80;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v11, "modelWithConfiguration:completionHandler:", v13, v12);

    v10 = 0;
    goto LABEL_6;
  }
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v10, 0);
LABEL_6:

}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelConfiguration)cachedConfiguration
{
  return self->_cachedConfiguration;
}

- (void)setCachedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MLModel)cachedModel
{
  return self->_cachedModel;
}

- (void)setCachedModel:(id)a3
{
  objc_storeStrong((id *)&self->_cachedModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModel, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

void __68__MLModelAssetModelVendor_modelWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "setCachedModel:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setCachedConfiguration:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
