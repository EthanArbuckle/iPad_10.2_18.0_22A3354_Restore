@implementation CARThemeAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARThemeAsset)initWithBaseURL:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  CARThemeAsset *v9;
  CARThemeAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARThemeAsset;
  v9 = -[CARThemeAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseURL, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (CARThemeAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CARThemeAsset *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CARThemeAsset initWithBaseURL:version:](self, "initWithBaseURL:version:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CARThemeAsset baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseURL"));

  -[CARThemeAsset version](self, "version");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

}

- (BOOL)isEqual:(id)a3
{
  CARThemeAsset *v4;
  BOOL v5;

  v4 = (CARThemeAsset *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CARThemeAsset isEqualToThemeAsset:](self, "isEqualToThemeAsset:", v4);
  }

  return v5;
}

- (BOOL)isEqualToThemeAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CARThemeAsset baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", v8))
  {
    -[CARThemeAsset version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToThemeAssetVersion:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CARThemeAsset;
  -[CARThemeAsset description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAsset version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAsset baseURL](self, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@, baseURL: %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CARThemeAsset version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)layoutURL
{
  void *v2;
  void *v3;

  -[CARThemeAsset baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlayPhone.assets"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)assetsArchiveURL
{
  void *v2;
  void *v3;

  -[CARThemeAsset baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlayAccessory.assets.zip"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)certificateData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  -[CARThemeAsset baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Certificate.chain.pem"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (!v4)
  {
    CarThemeAssetsLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CARThemeAsset certificateData].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)signatureData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  -[CARThemeAsset baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlayAccessory.assets.sha256"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (!v4)
  {
    CarThemeAssetsLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CARThemeAsset signatureData].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)accessoryAdditionsData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v15[8];
  id v16;

  -[CARThemeAsset baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessoryAdditions"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  CarThemeAssetsLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_INFO, "Accessory Additions data available", v15, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[CARThemeAsset accessoryAdditionsData].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v4;
}

- (CARThemeAssetVersion)version
{
  return self->_version;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)certificateData
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "error reading certificate from asset: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)signatureData
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "error reading signature from asset: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryAdditionsData
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "error reading accessory additions from asset: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
