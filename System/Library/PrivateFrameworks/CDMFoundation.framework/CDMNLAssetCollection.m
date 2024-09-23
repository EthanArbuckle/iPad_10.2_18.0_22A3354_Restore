@implementation CDMNLAssetCollection

- (NSDictionary)assetPaths
{
  return self->_assetPaths;
}

+ (id)assetCollectionWithAssetPaths:(id)a3 withLanguageCode:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CDMNLAssetCollection _initWithAssetPaths:withLanguageCode:]([CDMNLAssetCollection alloc], "_initWithAssetPaths:withLanguageCode:", v6, v5);

  return v7;
}

- (id)_initWithAssetPaths:(id)a3 withLanguageCode:(id)a4
{
  id v7;
  NSString *v8;
  CDMNLAssetCollection *v9;
  CDMNLAssetCollection *v10;
  NSString *languageCode;
  objc_super v13;

  v7 = a3;
  v8 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)CDMNLAssetCollection;
  v9 = -[CDMNLAssetCollection init](&v13, sel_init);
  v10 = v9;
  if (v7)
    objc_storeStrong((id *)&v9->_assetPaths, a3);
  languageCode = v10->_languageCode;
  v10->_languageCode = v8;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPaths, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (id)getAssetForFactorName:(id)a3
{
  void *assetPaths;

  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    objc_msgSend(assetPaths, "objectForKey:", a3);
    assetPaths = (void *)objc_claimAutoreleasedReturnValue();
  }
  return assetPaths;
}

- (id)getAssetBundlePathForFactorName:(id)a3
{
  NSDictionary *assetPaths;
  void *v4;
  void *v5;
  void *v6;

  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    -[NSDictionary objectForKey:](assetPaths, "objectForKey:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAssetPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)getAssetPaths
{
  NSDictionary *assetPaths;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  assetPaths = self->_assetPaths;
  if (!assetPaths)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[CDMNLAssetCollection getAssetPaths]";
      _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Nil Asset Paths", (uint8_t *)&v6, 0xCu);
    }

    assetPaths = self->_assetPaths;
  }
  return assetPaths;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

@end
