@implementation FCAssetContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = -[NSURL isEqual:](self->_remoteURL, "isEqual:", v6[2]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_remoteURL, "hash");
}

- (id)description
{
  FCDescription *v3;
  void *v4;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("metadata"), self->_asset);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("remoteURL"), self->_remoteURL);
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("filePath"), self->_filePath);
  -[FCDescription descriptionString](v3, "descriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAssetContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCAssetContentArchive *v5;
  uint64_t v6;
  NTPBAsset *asset;
  uint64_t v8;
  NSURL *remoteURL;
  uint64_t v10;
  NSString *filePath;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCAssetContentArchive;
  v5 = -[FCAssetContentArchive init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset"));
    v6 = objc_claimAutoreleasedReturnValue();
    asset = v5->_asset;
    v5->_asset = (NTPBAsset *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBAsset *asset;
  id v5;

  asset = self->_asset;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", asset, CFSTR("asset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteURL, CFSTR("remoteURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filePath, CFSTR("filePath"));

}

- (id)unarchiveIntoContentContext:(id)a3
{
  void *v4;
  NTPBAsset *asset;
  NSURL *remoteURL;
  void *v7;
  void *v8;
  FCContentUnarchiveResult *v9;

  objc_msgSend(a3, "assetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  asset = self->_asset;
  remoteURL = self->_remoteURL;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_filePath);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importAsset:remoteURL:fileURL:", asset, remoteURL, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FCContentUnarchiveResult initWithInterestToken:storageSize:]([FCContentUnarchiveResult alloc], "initWithInterestToken:storageSize:", v8, -[FCAssetContentArchive storageSize](self, "storageSize"));
  return v9;
}

- (id)manifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  v7[0] = self->_remoteURL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithAssetURLs:](v3, "initWithAssetURLs:", v4);

  return v5;
}

- (int64_t)storageSize
{
  return -[NTPBAsset size](self->_asset, "size");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
