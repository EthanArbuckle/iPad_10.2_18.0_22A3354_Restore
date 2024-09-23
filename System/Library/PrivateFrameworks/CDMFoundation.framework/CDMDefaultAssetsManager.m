@implementation CDMDefaultAssetsManager

- (id)initManager
{
  CDMDefaultAssetsManager *v2;
  NSObject *v3;
  NSFileManager *v4;
  NSFileManager *fileManager;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)CDMDefaultAssetsManager;
  v2 = -[CDMDefaultAssetsManager init](&v7, sel_init);
  if (v2)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CDMDefaultAssetsManager initManager]";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Initialize CDMDefaultAssetsManager", buf, 0xCu);
    }

    v4 = (NSFileManager *)objc_alloc_init(MEMORY[0x24BDD1580]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v4;

  }
  return v2;
}

- (id)getAbsolutePathForServiceAssetFolders:(id)a3 assetDirPath:(id)a4 locale:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CustomAsset *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  +[CDMDefaultAssetsManager getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:locale:](CDMDefaultAssetsManager, "getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:locale:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:](CDMAssetsUtils, "findExistFolderInAssetFolders:underBasePath:useFileManager:", v8, v9, self->_fileManager);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "-[CDMDefaultAssetsManager getAbsolutePathForServiceAssetFolders:assetDirPath:locale:]";
      v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Asset is available under custom asset path %@.", (uint8_t *)&v15, 0x16u);
    }

    v13 = -[CustomAsset initWithPath:]([CustomAsset alloc], "initWithPath:", v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

+ (id)getAbsolutePathForAssetsRootFolderForAssetDirPath:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Existing asset dir path to be: %@.", (uint8_t *)&v9, 0x16u);
  }

  if (!v3)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Asset dir path is nil. Use value from CDMUserDefaultsUtils instead.", (uint8_t *)&v9, 0xCu);
    }

    +[CDMUserDefaultsUtils readCustomAssetsRootPath](CDMUserDefaultsUtils, "readCustomAssetsRootPath");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Updated Asset dir path: %@.", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("assets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:(id)a3 locale:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:](CDMDefaultAssetsManager, "getAbsolutePathForAssetsRootFolderForAssetDirPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR(".loc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
