@implementation HMAsset

- (HMAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMAsset *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSDictionary *metadata;
  uint64_t v16;
  NSURL *resourceURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMAsset;
  v11 = -[HMAsset init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    resourceURL = v11->_resourceURL;
    v11->_resourceURL = (NSURL *)v16;

  }
  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMAsset identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    -[HMAsset identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, CFSTR("kIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMAsset metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMAsset metadata](self, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kAssetMetadataKey"));

    }
    -[HMAsset resourceURL](self, "resourceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMAsset resourceURL](self, "resourceURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("kAssetURLKey"));

    }
    v12 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v12 = 0;
  }
  return (NSDictionary *)v12;
}

- (BOOL)isEqual:(id)a3
{
  HMAsset *v4;
  HMAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMAsset *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMAsset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAsset identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        -[HMAsset metadata](self, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAsset metadata](v5, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (HMFEqualObjects())
        {
          -[HMAsset resourceURL](self, "resourceURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAsset resourceURL](v5, "resourceURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = HMFEqualObjects();

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (HMAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMAsset *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.assetMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.assetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMAsset initWithIdentifier:metadata:resourceURL:](self, "initWithIdentifier:metadata:resourceURL:", v5, v6, v7);
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
