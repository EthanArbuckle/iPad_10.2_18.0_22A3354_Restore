@implementation SFEntitledAssetConfig

- (SFEntitledAssetConfig)initWithAssetType:(unint64_t)a3 language:(id)a4 regionId:(id)a5
{
  id v8;
  id v9;
  SFEntitledAssetConfig *v10;
  SFEntitledAssetConfig *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *language;
  uint64_t v17;
  NSString *regionId;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFEntitledAssetConfig;
  v10 = -[SFEntitledAssetConfig init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_assetType = a3;
    if (a3 == 7)
    {
      +[SFUtilities languageCodeForLocaleIdentifier:](SFUtilities, "languageCodeForLocaleIdentifier:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SFReplacementLocaleCodeForLocaleIdentifier(v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v8;
      objc_storeStrong((id *)&v11->_language, v15);

      +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v11->_language);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    language = v11->_language;
    v11->_language = (NSString *)v12;

    v17 = objc_msgSend(v9, "copy");
    regionId = v11->_regionId;
    v11->_regionId = (NSString *)v17;

  }
  return v11;
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 assetType:(unint64_t)a4
{
  return -[SFEntitledAssetConfig initWithAssetType:language:regionId:](self, "initWithAssetType:language:regionId:", a4, a3, 0);
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 taskHint:(int64_t)a4
{
  return -[SFEntitledAssetConfig initWithAssetType:language:regionId:](self, "initWithAssetType:language:regionId:", SFEntitledAssetTypeForTaskHint(a4), a3, 0);
}

- (SFEntitledAssetConfig)initWithLanguage:(id)a3 task:(id)a4
{
  return -[SFEntitledAssetConfig initWithAssetType:language:regionId:](self, "initWithAssetType:language:regionId:", 3, a3, 0);
}

- (SFEntitledAssetConfig)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SFEntitledAssetConfig *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SFEntitledAssetConfig::assetType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFEntitledAssetConfig::language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFEntitledAssetConfig::regionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SFEntitledAssetConfig initWithAssetType:language:regionId:](self, "initWithAssetType:language:regionId:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t assetType;
  id v5;

  assetType = self->_assetType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", assetType, CFSTR("SFEntitledAssetConfig::assetType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("SFEntitledAssetConfig::language"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionId, CFSTR("SFEntitledAssetConfig::regionId"));

}

- (BOOL)isEqual:(id)a3
{
  SFEntitledAssetConfig *v4;
  SFEntitledAssetConfig *v5;
  unint64_t assetType;
  void *language;
  void *v8;
  NSString *regionId;
  int v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = (SFEntitledAssetConfig *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      assetType = self->_assetType;
      if (assetType != -[SFEntitledAssetConfig assetType](v5, "assetType"))
      {
        LOBYTE(v10) = 1;
LABEL_16:
        v11 = v10 ^ 1;

        goto LABEL_17;
      }
      language = self->_language;
      -[SFEntitledAssetConfig language](v5, "language");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(language, "isEqualToString:", v8))
      {
        regionId = self->_regionId;
        if (regionId)
        {
          -[SFEntitledAssetConfig regionId](v5, "regionId");
          language = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](regionId, "isEqualToString:", language))
          {
            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        -[SFEntitledAssetConfig regionId](v5, "regionId");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          LOBYTE(v10) = 0;
          if (!regionId)
            goto LABEL_15;
          goto LABEL_14;
        }
        v13 = (void *)v12;
        -[SFEntitledAssetConfig regionId](v5, "regionId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "isEqualToString:", self->_regionId) ^ 1;

        if (regionId)
LABEL_14:

      }
      else
      {
        LOBYTE(v10) = 1;
      }
LABEL_15:

      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionId, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
