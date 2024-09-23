@implementation CDMEmbeddingConfigItem

- (CDMEmbeddingConfigItem)initWithEmbeddingModelPath:(id)a3 isStableEmbeddingModel:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CDMEmbeddingConfigItem *v8;
  NSObject *v9;
  uint64_t v10;
  NSDictionary *embeddingModelMetadata;
  uint64_t v12;
  NSString *embeddingModelVersion;
  uint64_t v14;
  NSNumber *embeddingModelDimension;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMEmbeddingConfigItem;
  v8 = -[CDMEmbeddingConfigItem init](&v17, sel_init);
  if (v8)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[CDMEmbeddingConfigItem initWithEmbeddingModelPath:isStableEmbeddingModel:]";
      v20 = 2112;
      v21 = v7;
      v22 = 1024;
      v23 = v4;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Init with embedding model path: %@, stable embedding model flag: %d.", buf, 0x1Cu);
    }

    objc_storeStrong((id *)&v8->_embeddingModelPath, a3);
    +[CDMAssetsUtils loadAssetMetadataFromAsset:](CDMAssetsUtils, "loadAssetMetadataFromAsset:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    embeddingModelMetadata = v8->_embeddingModelMetadata;
    v8->_embeddingModelMetadata = (NSDictionary *)v10;

    v8->_isStableEmbeddingModel = v4;
    +[CDMAssetsUtils getAssetVersionFromAssetMetadata:](CDMAssetsUtils, "getAssetVersionFromAssetMetadata:", v8->_embeddingModelMetadata);
    v12 = objc_claimAutoreleasedReturnValue();
    embeddingModelVersion = v8->_embeddingModelVersion;
    v8->_embeddingModelVersion = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:](CDMEmbeddingConfigItem, "getEmbeddingDimensionFromEmbeddingModelMetadata:", v8->_embeddingModelMetadata));
    v14 = objc_claimAutoreleasedReturnValue();
    embeddingModelDimension = v8->_embeddingModelDimension;
    v8->_embeddingModelDimension = (NSNumber *)v14;

  }
  return v8;
}

+ (int64_t)getEmbeddingDimensionFromEmbeddingModelMetadata:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  NSObject *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (!v3)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Input model metadata is nil. Return default embedding model dimension.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("EmbeddingDimension"));
  v5 = objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315650;
      v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = CFSTR("EmbeddingDimension");
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model metadata: %@ doesn't have key: %@. Return default embedding model dimension.", (uint8_t *)&v10, 0x20u);
    }

    v5 = 0;
LABEL_11:
    v8 = 192;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "+[CDMEmbeddingConfigItem getEmbeddingDimensionFromEmbeddingModelMetadata:]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Found embedding model dimension config: %@ in embedding model metadata: %@.", (uint8_t *)&v10, 0x20u);
  }

  v8 = -[NSObject integerValue](v5, "integerValue");
LABEL_12:

  return v8;
}

- (BOOL)isStableEmbeddingModel
{
  return self->_isStableEmbeddingModel;
}

- (NSString)embeddingModelVersion
{
  return self->_embeddingModelVersion;
}

- (NSString)embeddingModelPath
{
  return self->_embeddingModelPath;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CDMEmbeddingConfigItem] - Embedding Model Path: %@,\n Embedding Model Version: %@,\n Embedding Model Dimension: %@,\n Embedding Model Metadata: %@,\n Stable Embedding Model Flag: %d."), self->_embeddingModelPath, self->_embeddingModelVersion, self->_embeddingModelDimension, self->_embeddingModelMetadata, self->_isStableEmbeddingModel);
}

- (CDMEmbeddingConfigItem)initWithCoder:(id)a3
{
  id v4;
  CDMEmbeddingConfigItem *v5;
  uint64_t v6;
  NSString *embeddingModelPath;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *embeddingModelMetadata;
  uint64_t v13;
  NSNumber *embeddingModelDimension;
  uint64_t v15;
  NSString *embeddingModelVersion;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDMEmbeddingConfigItem;
  v5 = -[CDMEmbeddingConfigItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingModelPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    embeddingModelPath = v5->_embeddingModelPath;
    v5->_embeddingModelPath = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("embeddingModelMetadata"));
    v11 = objc_claimAutoreleasedReturnValue();
    embeddingModelMetadata = v5->_embeddingModelMetadata;
    v5->_embeddingModelMetadata = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingModelDimension"));
    v13 = objc_claimAutoreleasedReturnValue();
    embeddingModelDimension = v5->_embeddingModelDimension;
    v5->_embeddingModelDimension = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingModelVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    embeddingModelVersion = v5->_embeddingModelVersion;
    v5->_embeddingModelVersion = (NSString *)v15;

    v5->_isStableEmbeddingModel = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStableEmbeddingModel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *embeddingModelPath;
  id v5;

  embeddingModelPath = self->_embeddingModelPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", embeddingModelPath, CFSTR("embeddingModelPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingModelMetadata, CFSTR("embeddingModelMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingModelDimension, CFSTR("embeddingModelDimension"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingModelVersion, CFSTR("embeddingModelVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isStableEmbeddingModel, CFSTR("isStableEmbeddingModel"));

}

- (NSDictionary)embeddingModelMetadata
{
  return self->_embeddingModelMetadata;
}

- (NSNumber)embeddingModelDimension
{
  return self->_embeddingModelDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingModelVersion, 0);
  objc_storeStrong((id *)&self->_embeddingModelDimension, 0);
  objc_storeStrong((id *)&self->_embeddingModelMetadata, 0);
  objc_storeStrong((id *)&self->_embeddingModelPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
