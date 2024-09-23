@implementation MLModelAssetDescriptionVendor

- (MLModelAssetDescriptionVendor)initWithResourceFactory:(id)a3
{
  id v5;
  MLModelAssetDescriptionVendor *v6;
  MLModelAssetDescriptionVendor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelAssetDescriptionVendor;
  v6 = -[MLModelAssetDescriptionVendor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resourceFactory, a3);

  return v7;
}

- (void)_modelAssetDescriptionWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[MLModelAssetDescriptionVendor modelAssetDescription](self, "modelAssetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    -[MLModelAssetDescriptionVendor resourceFactory](self, "resourceFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__MLModelAssetDescriptionVendor__modelAssetDescriptionWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3D66A80;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "modelAssetDescriptionWithCompletionHandler:", v7);

  }
}

- (void)functionNamesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__MLModelAssetDescriptionVendor_functionNamesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3D66AA8;
  v7 = v4;
  v5 = v4;
  -[MLModelAssetDescriptionVendor _modelAssetDescriptionWithCompletionHandler:](self, "_modelAssetDescriptionWithCompletionHandler:", v6);

}

- (void)modelDescriptionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__MLModelAssetDescriptionVendor_modelDescriptionWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3D66AA8;
  v7 = v4;
  v5 = v4;
  -[MLModelAssetDescriptionVendor _modelAssetDescriptionWithCompletionHandler:](self, "_modelAssetDescriptionWithCompletionHandler:", v6);

}

- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MLModelAssetDescriptionVendor_modelDescriptionOfFunctionNamed_completionHandler___block_invoke;
  v10[3] = &unk_1E3D66A80;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MLModelAssetDescriptionVendor _modelAssetDescriptionWithCompletionHandler:](self, "_modelAssetDescriptionWithCompletionHandler:", v10);

}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelAssetDescription)modelAssetDescription
{
  return (MLModelAssetDescription *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModelAssetDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelAssetDescription, 0);
  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

void __83__MLModelAssetDescriptionVendor_modelDescriptionOfFunctionNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "modelDescriptionOfFunctionNamed:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__MLModelAssetDescriptionVendor_modelDescriptionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "defaultModelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__MLModelAssetDescriptionVendor_functionNamesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "functionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__MLModelAssetDescriptionVendor__modelAssetDescriptionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setModelAssetDescription:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
