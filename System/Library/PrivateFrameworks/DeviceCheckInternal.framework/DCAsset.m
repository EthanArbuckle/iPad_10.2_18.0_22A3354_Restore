@implementation DCAsset

+ (id)assetWithMobileAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  DCAsset *v8;
  void *v9;
  NSObject *v10;
  int v12;
  DCAsset *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "assetProperty:", *MEMORY[0x24BE66A90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 == 1)
  {
    objc_msgSend(v3, "assetProperty:", CFSTR("com.apple.devicecheck.pubvalue"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      v8 = objc_alloc_init(DCAsset);
      -[DCAsset setVersion:](v8, "setVersion:", 1);
      objc_msgSend(v3, "assetProperty:", CFSTR("com.apple.devicecheck.refreshtimer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[DCAsset setPublicKeyRefreshInterval:](v8, "setPublicKeyRefreshInterval:");

      -[DCAsset setPublicKey:](v8, "setPublicKey:", v7);
      _DCLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_224FB2000, v10, OS_LOG_TYPE_DEFAULT, "Returning parsed asset: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      _DCLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[DCAsset assetWithMobileAsset:].cold.1(v7);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - version: %lu, refreshInterval: %f>"), v4, self, self->_version, *(_QWORD *)&self->_publicKeyRefreshInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (double)publicKeyRefreshInterval
{
  return self->_publicKeyRefreshInterval;
}

- (void)setPublicKeyRefreshInterval:(double)a3
{
  self->_publicKeyRefreshInterval = a3;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
}

+ (void)assetWithMobileAsset:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224FB2000, log, OS_LOG_TYPE_ERROR, "Failed to parse asset, required fields are missing!", v1, 2u);
}

@end
