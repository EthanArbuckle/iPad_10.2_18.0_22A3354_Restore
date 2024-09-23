@implementation CSAttSiriMitigationAssetProvider

- (CSAttSiriMitigationAssetProvider)init
{
  return -[CSAttSiriMitigationAssetProvider initWithAssetHanlder:](self, "initWithAssetHanlder:", 0);
}

- (CSAttSiriMitigationAssetProvider)initWithAssetHanlder:(id)a3
{
  id v5;
  CSAttSiriMitigationAssetProvider *v6;
  CSAttSiriMitigationAssetProvider *v7;
  void **p_assetHandler;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSAttSiriMitigationAssetProvider;
  v6 = -[CSAttSiriMitigationAssetProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    p_assetHandler = (void **)&v6->_assetHandler;
    objc_storeStrong((id *)&v6->_assetHandler, a3);
    if (!v7->_assetHandler)
    {
      +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSAttSiriMitigationAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *p_assetHandler;
      *p_assetHandler = (void *)v9;

    }
  }

  return v7;
}

- (void)getNeuralCombinerConfigFileWithCompletion:(id)a3
{
  id v4;
  CSAttSiriMitigationAssetHandler *assetHandler;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileWithCompletion___block_invoke;
  v7[3] = &unk_1E7C28D20;
  v8 = v4;
  v6 = v4;
  -[CSAttSiriMitigationAssetHandler getMitigationAssetWithEndpointId:completion:](assetHandler, "getMitigationAssetWithEndpointId:completion:", 0, v7);

}

- (void)getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:(id)a3
{
  id v4;
  CSAttSiriMitigationAssetHandler *assetHandler;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion___block_invoke;
  v7[3] = &unk_1E7C28D20;
  v8 = v4;
  v6 = v4;
  -[CSAttSiriMitigationAssetHandler getMitigationAssetWithEndpointId:completion:](assetHandler, "getMitigationAssetWithEndpointId:completion:", 0, v7);

}

- (void)getAllowPhrasesListOverrideFileWithCompletion:(id)a3
{
  id v4;
  CSAttSiriMitigationAssetHandler *assetHandler;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__CSAttSiriMitigationAssetProvider_getAllowPhrasesListOverrideFileWithCompletion___block_invoke;
  v7[3] = &unk_1E7C28D20;
  v8 = v4;
  v6 = v4;
  -[CSAttSiriMitigationAssetHandler getMitigationAssetWithEndpointId:completion:](assetHandler, "getMitigationAssetWithEndpointId:completion:", 0, v7);

}

- (void)getUESConfigFileWithCompletion:(id)a3
{
  id v4;
  CSAttSiriMitigationAssetHandler *assetHandler;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CSAttSiriMitigationAssetProvider_getUESConfigFileWithCompletion___block_invoke;
  v7[3] = &unk_1E7C28D20;
  v8 = v4;
  v6 = v4;
  -[CSAttSiriMitigationAssetHandler getMitigationAssetWithEndpointId:completion:](assetHandler, "getMitigationAssetWithEndpointId:completion:", 0, v7);

}

- (CSAttSiriMitigationAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setAssetHandler:(id)a3
{
  objc_storeStrong((id *)&self->_assetHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetHandler, 0);
}

void __67__CSAttSiriMitigationAssetProvider_getUESConfigFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = &stru_1E7C296E8;
  if (v8 && !v5)
  {
    objc_msgSend(v8, "uesConfigFileForCategory:", *MEMORY[0x1E0D192D8]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);

}

void __82__CSAttSiriMitigationAssetProvider_getAllowPhrasesListOverrideFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = &stru_1E7C296E8;
  if (v8 && !v5)
  {
    objc_msgSend(v8, "allowKeywordsFile");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);

}

void __91__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v9 = &stru_1E7C296E8;
  v10 = 0;
  if (!v5 || v6)
    goto LABEL_24;
  objc_msgSend(v5, "mitigationConfigFileForCategory:", *MEMORY[0x1E0D192D8]);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0D18F30];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D19188], "decodeConfigFrom:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E7C63C80);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(MEMORY[0x1E0D19190], "getCachedIrFromMilFilePath:modelTye:asset:", v13, 3, v5);
    else
      objc_msgSend(MEMORY[0x1E0D19190], "getCachedIrFromConfigPath:modelTye:asset:", v9, 3, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileExistsAtPath:", v10);

    if ((v16 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isReadableFileAtPath:", v10);

      if ((v18 & 1) != 0)
      {
LABEL_13:
        v8 = 0;
        goto LABEL_22;
      }
      v23 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        v28 = 136315394;
        v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
        v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s GetNeuralCombinerConfigFileAndBnnsIrPathWithCompletion cannot read the bnnsIrFile: %@", (uint8_t *)&v28, 0x16u);
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18E80];
      v22 = 2420;
    }
    else
    {
      v19 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        v28 = 136315394;
        v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
        v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s GetNeuralCombinerConfigFileAndBnnsIrPathWithCompletion cannot find the bnnsIrFile: %@", (uint8_t *)&v28, 0x16u);
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18E80];
      v22 = 2419;
    }
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v26 = v14;
      objc_msgSend(v5, "resourcePath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 136315394;
      v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
      v30 = 2112;
      v31 = v27;
      _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Get not fetch config file from asset: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2501, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = 0;
LABEL_22:
  v24 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315394;
    v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s getting irCachePath for getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion: %@", (uint8_t *)&v28, 0x16u);
  }
LABEL_24:
  v25 = *(_QWORD *)(a1 + 32);
  if (v25)
    (*(void (**)(uint64_t, __CFString *, void *, void *))(v25 + 16))(v25, v9, v10, v8);

}

void __78__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = &stru_1E7C296E8;
  if (v8 && !v5)
  {
    objc_msgSend(v8, "mitigationConfigFileForCategory:", *MEMORY[0x1E0D192D8]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);

}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_18520 != -1)
    dispatch_once(&sharedHandler_onceToken_18520, &__block_literal_global_18521);
  return (id)sharedHandler_sharedHandler_18522;
}

void __49__CSAttSiriMitigationAssetProvider_sharedHandler__block_invoke()
{
  CSAttSiriMitigationAssetProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSAttSiriMitigationAssetProvider);
  v1 = (void *)sharedHandler_sharedHandler_18522;
  sharedHandler_sharedHandler_18522 = (uint64_t)v0;

}

@end
