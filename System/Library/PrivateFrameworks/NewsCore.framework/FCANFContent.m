@implementation FCANFContent

- (id)fetchANFDocumentDataProviderWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[FCANFContent mainDocumentAssetHandle](self, "mainDocumentAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCANFContent mainDocumentAssetHandle](self, "mainDocumentAssetHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchDataProviderWithPriority:flags:completion:", a3, 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke;
    v11[3] = &unk_1E4646018;
    v11[4] = self;
    v12 = v6;
    __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke((uint64_t)v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
  }

  return v9;
}

- (NSArray)fontResourceIDs
{
  return self->_fontResourceIDs;
}

- (FCANFContent)initWithIdentifier:(id)a3 mainDocumentAssetHandle:(id)a4 fontResourceIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCANFContent *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCANFContent;
  v11 = -[FCANFContent init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_mainDocumentAssetHandle, a4);
    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_fontResourceIDs, v16);

  }
  return v11;
}

- (NSArray)anfDocumentAssetHandles
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__FCANFContent_anfDocumentAssetHandles__block_invoke;
  v3[3] = &unk_1E463AA30;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

void __39__FCANFContent_anfDocumentAssetHandles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mainDocumentAssetHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v4);

}

- (FCAssetHandle)mainDocumentAssetHandle
{
  return self->_mainDocumentAssetHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentAssetHandle, 0);
  objc_storeStrong((id *)&self->_fontResourceIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isANFDocumentCached
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FCANFContent mainDocumentAssetHandle](self, "mainDocumentAssetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)fetchANFDocumentDataProviderWithCompletion:(id)a3
{
  return -[FCANFContent fetchANFDocumentDataProviderWithPriority:completion:](self, "fetchANFDocumentDataProviderWithPriority:completion:", 0, a3);
}

uint64_t __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  id v4;
  _QWORD v6[5];
  id v7;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke_2;
    v6[3] = &unk_1E463B2D0;
    v4 = v1;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v4;
    dispatch_async(v3, v6);

  }
  return 0;
}

void __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_missingANFDocumentErrorForArticleID:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

}

@end
