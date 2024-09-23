@implementation HMDAsset

- (HMDAsset)initWithIdentifier:(id)a3 metadata:(id)a4 resourceURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAsset *v11;
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
  v19.super_class = (Class)HMDAsset;
  v11 = -[HMDAsset init](&v19, sel_init);
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

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[HMDAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAsset metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAsset metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kAssetMetadataKey"));

  }
  -[HMDAsset resourceURL](self, "resourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDAsset resourceURL](self, "resourceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kAssetURLKey"));

  }
  v11 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v11;
}

- (BOOL)isEqual:(id)a3
{
  HMDAsset *v4;
  HMDAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMDAsset *)a3;
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
      -[HMDAsset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAsset identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        -[HMDAsset metadata](self, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAsset metadata](v5, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (HMFEqualObjects())
        {
          -[HMDAsset resourceURL](self, "resourceURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAsset resourceURL](v5, "resourceURL");
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

- (HMDAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAsset *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.assetMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.assetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[HMDAsset initWithIdentifier:metadata:resourceURL:](self, "initWithIdentifier:metadata:resourceURL:", v5, v6, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HMDAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("HM.identifier"));

  -[HMDAsset metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAsset metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("HM.assetMetadata"));

  }
  -[HMDAsset resourceURL](self, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDAsset resourceURL](self, "resourceURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("HM.assetURL"));

  }
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
