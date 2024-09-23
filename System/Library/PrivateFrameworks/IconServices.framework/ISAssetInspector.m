@implementation ISAssetInspector

- (ISAssetInspector)initWithBundleURL:(id)a3
{
  id v4;
  ISAssetInspector *v5;
  uint64_t v6;
  IFBundle *bundle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAssetInspector;
  v5 = -[ISAssetInspector init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v4);
    bundle = v5->_bundle;
    v5->_bundle = (IFBundle *)v6;

  }
  return v5;
}

- (ISAssetCatalogResource)assetCatalogResource
{
  ISAssetCatalogResource *assetCatalogResource;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ISAssetCatalogResource *v12;
  id v13;
  NSObject *v14;
  ISAssetCatalogResource *v15;
  id v17;

  assetCatalogResource = self->_assetCatalogResource;
  if (!assetCatalogResource)
  {
    v4 = objc_alloc(MEMORY[0x1E0D3A7E0]);
    -[ISAssetInspector bundle](self, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithInfoDictionary:", v6);

    objc_msgSend(v7, "catalogAssetName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISAssetInspector bundle](self, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCatalogURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISAssetInspector bundle](self, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v10, v8, objc_msgSend(v11, "platform"), &v17);
    v12 = (ISAssetCatalogResource *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (!v12)
    {
      _ISDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ISAssetInspector assetCatalogResource].cold.1((uint64_t)v8, (uint64_t)v13, v14);

    }
    v15 = self->_assetCatalogResource;
    self->_assetCatalogResource = v12;

    assetCatalogResource = self->_assetCatalogResource;
  }
  return assetCatalogResource;
}

- (IFBundle)bundle
{
  return (IFBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetCatalogResource:(id)a3
{
  objc_storeStrong((id *)&self->_assetCatalogResource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCatalogResource, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (unint64_t)catalogAssetAppearances
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  -[ISAssetInspector assetCatalogResource](self, "assetCatalogResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasResourceWithAppearance:", 0xFFFFLL);

  if (v4)
    v5 = 3;
  else
    v5 = 1;
  -[ISAssetInspector assetCatalogResource](self, "assetCatalogResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasResourceWithAppearance:", 0);

  if (v7)
    v5 |= 4uLL;
  -[ISAssetInspector assetCatalogResource](self, "assetCatalogResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasResourceWithAppearance:", 1);

  if (v9)
    v10 = v5 | 8;
  else
    v10 = v5;
  -[ISAssetInspector assetCatalogResource](self, "assetCatalogResource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasResourceWithAppearance:", 2);

  v13 = v10 | 0x10;
  if (!v12)
    v13 = v10;
  if (v13 == 1)
    return 1;
  else
    return v13 ^ 1;
}

- (void)assetCatalogResource
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Failed to find resource with name '%@'. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end
