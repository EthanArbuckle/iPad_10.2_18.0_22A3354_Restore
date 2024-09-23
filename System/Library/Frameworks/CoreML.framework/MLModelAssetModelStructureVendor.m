@implementation MLModelAssetModelStructureVendor

- (MLModelAssetModelStructureVendor)initWithResourceFactory:(id)a3
{
  id v5;
  MLModelAssetModelStructureVendor *v6;
  MLModelAssetModelStructureVendor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelAssetModelStructureVendor;
  v6 = -[MLModelAssetModelStructureVendor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resourceFactory, a3);

  return v7;
}

- (void)_modelStructureWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[MLModelAssetModelStructureVendor modelStructure](self, "modelStructure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    -[MLModelAssetModelStructureVendor resourceFactory](self, "resourceFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__MLModelAssetModelStructureVendor__modelStructureWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3D66C98;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "modelStructureWithCompletionHandler:", v7);

  }
}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__MLModelAssetModelStructureVendor_modelStructureWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3D66CC0;
  v7 = v4;
  v5 = v4;
  -[MLModelAssetModelStructureVendor _modelStructureWithCompletionHandler:](self, "_modelStructureWithCompletionHandler:", v6);

}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelStructure)modelStructure
{
  return (MLModelStructure *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModelStructure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStructure, 0);
  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

uint64_t __72__MLModelAssetModelStructureVendor_modelStructureWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__MLModelAssetModelStructureVendor__modelStructureWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setModelStructure:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
