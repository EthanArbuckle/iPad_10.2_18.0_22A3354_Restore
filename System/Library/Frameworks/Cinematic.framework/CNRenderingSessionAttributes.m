@implementation CNRenderingSessionAttributes

- (CNRenderingSessionAttributes)initWithPTGlobalRenderingMetadata:(id)a3
{
  id v5;
  CNRenderingSessionAttributes *v6;
  CNRenderingSessionAttributes *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRenderingSessionAttributes;
  v6 = -[CNRenderingSessionAttributes init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalMetadata, a3);

  return v7;
}

- (int64_t)majorVersion
{
  return -[PTGlobalRenderingMetadata majorVersion](self->_internalMetadata, "majorVersion");
}

- (int64_t)minorVersion
{
  return -[PTGlobalRenderingMetadata minorVersion](self->_internalMetadata, "minorVersion");
}

- (NSInteger)renderingVersion
{
  return -[PTGlobalRenderingMetadata renderingVersion](self->_internalMetadata, "renderingVersion");
}

+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  AVAsset *v6;
  id v7;
  id v8;
  AVAsset *v9;
  _QWORD v10[4];
  AVAsset *v11;
  id v12;

  v6 = asset;
  v7 = completionHandler;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke;
  v10[3] = &unk_25044F798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_loadPTGlobalRenderingMetadataFromAsset:completionHandler:", v9, v10);

}

void __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CNRenderingSessionAttributes *v8;
  void (*v9)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CNLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke_cold_1((uint64_t)v6, a1, v7);

    _CNCinematicError(2, v6);
    v8 = (CNRenderingSessionAttributes *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = -[CNRenderingSessionAttributes initWithPTGlobalRenderingMetadata:]([CNRenderingSessionAttributes alloc], "initWithPTGlobalRenderingMetadata:", v5);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

+ (void)_loadPTGlobalRenderingMetadataFromAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__CNRenderingSessionAttributes__loadPTGlobalRenderingMetadataFromAsset_completionHandler___block_invoke;
  v8[3] = &unk_25044F7C0;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "loadMetadataForFormat:completionHandler:", 0x250450288, v8);

}

void __90__CNRenderingSessionAttributes__loadPTGlobalRenderingMetadataFromAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_PTGlobalRenderingMetadataFromItems:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (id)_PTGlobalRenderingMetadataFromItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", 0x2504502A8);

        if (v10)
        {
          objc_msgSend(v8, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          objc_msgSend(MEMORY[0x24BE74B78], "deserializeMetadataWithType:fromGlobalMetadata:error:", 2, v12, &v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (PTGlobalRenderingMetadata)internalMetadata
{
  return (PTGlobalRenderingMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMetadata, 0);
}

void __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_1_0(&dword_23307F000, a3, (uint64_t)a3, "Error: (%@) Unable to load cinematic global rendering metadata from asset %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
