@implementation CSAttSiriAttentionAssetsStatusProvider

- (CSAttSiriAttentionAssetsStatusProvider)initWithMitigationAssetHandler:(id)a3
{
  id v4;
  CSAttSiriAttentionAssetsStatusProvider *v5;
  NSObject *v6;
  _QWORD v8[4];
  CSAttSiriAttentionAssetsStatusProvider *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriAttentionAssetsStatusProvider;
  v5 = -[CSAttSiriAttentionAssetsStatusProvider init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "registerObserver:", v5);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__CSAttSiriAttentionAssetsStatusProvider_initWithMitigationAssetHandler___block_invoke;
      v8[3] = &unk_1E7C28D98;
      v9 = v5;
      objc_msgSend(v4, "getMitigationAssetWithEndpointId:completion:", 0, v8);

    }
    v6 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSAttSiriAttentionAssetsStatusProvider initWithMitigationAssetHandler:]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v5;
}

- (CSAttSiriAttentionAssetsStatusProvider)init
{
  void *v3;
  CSAttSiriAttentionAssetsStatusProvider *v4;

  +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSAttSiriMitigationAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CSAttSiriAttentionAssetsStatusProvider initWithMitigationAssetHandler:](self, "initWithMitigationAssetHandler:", v3);

  return v4;
}

- (void)_updateWithAsset:(id)a3
{
  CSAttSiriAttentionAssetsStatusProviderDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9 || !objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bestSupportedLanguageCodeForLanguageCode:", 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }
      if (a3 && v10)
      {
        v21 = v10;
        v22[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;
      v15 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v15, "attentionAssetStatus:", v14);

      v16 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315394;
        v18 = "-[CSAttSiriAttentionAssetsStatusProvider _updateWithAsset:]";
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Sent attention asset update status: %@", (uint8_t *)&v17, 0x16u);
      }

    }
  }
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  -[CSAttSiriAttentionAssetsStatusProvider _updateWithAsset:](self, "_updateWithAsset:", a5, a4);
}

- (CSAttSiriAttentionAssetsStatusProviderDelegate)delegate
{
  return (CSAttSiriAttentionAssetsStatusProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __73__CSAttSiriAttentionAssetsStatusProvider_initWithMitigationAssetHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
      return objc_msgSend(*(id *)(result + 32), "_updateWithAsset:", a2);
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_47 != -1)
    dispatch_once(&sharedInstance_onceToken_47, &__block_literal_global_48);
  return (id)sharedInstance_sharedPolicy;
}

void __56__CSAttSiriAttentionAssetsStatusProvider_sharedInstance__block_invoke()
{
  CSAttSiriAttentionAssetsStatusProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSAttSiriAttentionAssetsStatusProvider);
  v1 = (void *)sharedInstance_sharedPolicy;
  sharedInstance_sharedPolicy = (uint64_t)v0;

}

@end
