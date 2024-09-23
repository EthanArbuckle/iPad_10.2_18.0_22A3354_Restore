@implementation MagnifierModelsManager

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global);
  return (id)shared_Manager;
}

void __32__MagnifierModelsManager_shared__block_invoke()
{
  MagnifierModelsManager *v0;
  void *v1;

  v0 = objc_alloc_init(MagnifierModelsManager);
  v1 = (void *)shared_Manager;
  shared_Manager = (uint64_t)v0;

}

- (MagnifierModelsManager)init
{
  MagnifierModelsManager *v2;
  MagnifierAssetsManager *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MagnifierModelsManager;
  v2 = -[MagnifierModelsManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MagnifierAssetsManager);
    -[MagnifierModelsManager setDownloadManager:](v2, "setDownloadManager:", v3);

    -[MagnifierModelsManager downloadManager](v2, "downloadManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

    -[MagnifierModelsManager downloadManager](v2, "downloadManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshAssets");

    -[MagnifierModelsManager updateAssetURLs](v2, "updateAssetURLs");
  }
  return v2;
}

- (void)updateAssetURLs
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2272F4000, v0, v1, "[%@]: Door Attributes Classifier Model Path : %@");
  OUTLINED_FUNCTION_2();
}

- (NSURL)doorAttributesClassifierModelPath
{
  return self->_doorAttributesClassiferUncompiledModelPath;
}

- (NSDictionary)doorAttributesClassifierProperties
{
  return self->_doorAttributesClassifierAssetProperties;
}

- (NSURL)signDetectorModelPath
{
  return self->_signDetectorUncompiledModelPath;
}

- (NSDictionary)signDetectorProperties
{
  return self->_signDetectorAssetProperties;
}

- (MagnifierAssetsManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_signDetectorAssetProperties, 0);
  objc_storeStrong((id *)&self->_signDetectorUncompiledModelPath, 0);
  objc_storeStrong((id *)&self->_doorAttributesClassifierAssetProperties, 0);
  objc_storeStrong((id *)&self->_doorAttributesClassiferUncompiledModelPath, 0);
}

@end
