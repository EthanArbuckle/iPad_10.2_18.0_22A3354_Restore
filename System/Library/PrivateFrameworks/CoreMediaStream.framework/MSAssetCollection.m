@implementation MSAssetCollection

- (MSAssetCollection)initWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSAssetCollection *v12;
  MSAssetCollection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSAssetCollection;
  v12 = -[MSAssetCollection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_masterAsset, a3);
    objc_storeStrong((id *)&v13->_fileName, a4);
    objc_storeStrong((id *)&v13->_derivedAssets, a5);
  }

  return v13;
}

- (NSData)masterAssetHash
{
  void *v2;
  void *v3;

  -[MSAssetCollection masterAsset](self, "masterAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSArray)derivedAssets
{
  return self->_derivedAssets;
}

- (void)setDerivedAssets:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_derivedAssets, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_derivedAssets;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[MSAsset fileHash](self->_masterAsset, "fileHash", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setMasterAssetHash:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)MSAssetCollection;
  -[MSAssetCollection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_assetCollectionID)
    objc_msgSend(v5, "appendFormat:", CFSTR("  Asset collection ID: %@\n"), self->_assetCollectionID);
  if (self->_ctag)
    objc_msgSend(v5, "appendFormat:", CFSTR(" ctag: %@\n"), self->_ctag);
  if (self->_fileName && (os_trace_get_mode() & 0x1000000) != 0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" File name: %@\n"), self->_fileName);
  if (self->_serverUploadedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR(" Server uploaded date: %@\n"), self->_serverUploadedDate);
  if (self->_masterAsset)
    objc_msgSend(v5, "appendFormat:", CFSTR("  Master asset: %@\n"), self->_masterAsset);
  if (self->_derivedAssets)
    objc_msgSend(v5, "appendFormat:", CFSTR("  Derived assets: %@\n"), self->_derivedAssets);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MSAsset *masterAsset;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    masterAsset = self->_masterAsset;
    objc_msgSend(v4, "masterAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MSAsset isEqual:](masterAsset, "isEqual:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSAssetCollection;
    v7 = -[MSAssetCollection isEqual:](&v9, sel_isEqual_, v4);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *assetCollectionID;
  NSString *ctag;
  MSAsset *masterAsset;
  NSArray *derivedAssets;
  NSString *fileName;
  NSDate *serverUploadedDate;
  id v11;

  v4 = a3;
  assetCollectionID = self->_assetCollectionID;
  v11 = v4;
  if (assetCollectionID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", assetCollectionID, CFSTR("assetCollectionID"));
    v4 = v11;
  }
  ctag = self->_ctag;
  if (ctag)
  {
    objc_msgSend(v11, "encodeObject:forKey:", ctag, CFSTR("ctag"));
    v4 = v11;
  }
  masterAsset = self->_masterAsset;
  if (masterAsset)
  {
    objc_msgSend(v11, "encodeObject:forKey:", masterAsset, CFSTR("masterAsset"));
    v4 = v11;
  }
  derivedAssets = self->_derivedAssets;
  if (derivedAssets)
  {
    objc_msgSend(v11, "encodeObject:forKey:", derivedAssets, CFSTR("derivedAssets"));
    v4 = v11;
  }
  fileName = self->_fileName;
  if (fileName)
  {
    objc_msgSend(v11, "encodeObject:forKey:", fileName, CFSTR("fileName"));
    v4 = v11;
  }
  if (self->_wasDeleted)
  {
    objc_msgSend(v11, "encodeBool:forKey:", 1, CFSTR("wasDeleted"));
    v4 = v11;
  }
  if (self->_initialFailureDate >= 1)
  {
    objc_msgSend(v11, "encodeInt64:forKey:");
    v4 = v11;
  }
  serverUploadedDate = self->_serverUploadedDate;
  if (serverUploadedDate)
  {
    objc_msgSend(v11, "encodeObject:forKey:", serverUploadedDate, CFSTR("serverUploadedDate"));
    v4 = v11;
  }

}

- (MSAssetCollection)initWithCoder:(id)a3
{
  id v4;
  MSAssetCollection *v5;
  uint64_t v6;
  NSString *assetCollectionID;
  uint64_t v8;
  NSString *ctag;
  uint64_t v10;
  MSAsset *masterAsset;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *derivedAssets;
  uint64_t v17;
  NSString *fileName;
  uint64_t v19;
  NSDate *serverUploadedDate;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSAssetCollection;
  v5 = -[MSAssetCollection init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetCollectionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetCollectionID = v5->_assetCollectionID;
    v5->_assetCollectionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctag"));
    v8 = objc_claimAutoreleasedReturnValue();
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("masterAsset"));
    v10 = objc_claimAutoreleasedReturnValue();
    masterAsset = v5->_masterAsset;
    v5->_masterAsset = (MSAsset *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("derivedAssets"));
    v15 = objc_claimAutoreleasedReturnValue();
    derivedAssets = v5->_derivedAssets;
    v5->_derivedAssets = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileName"));
    v17 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v17;

    v5->_wasDeleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasDeleted"));
    v5->_initialFailureDate = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("initialFailureDate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverUploadedDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    serverUploadedDate = v5->_serverUploadedDate;
    v5->_serverUploadedDate = (NSDate *)v19;

  }
  return v5;
}

- (NSString)assetCollectionID
{
  return self->_assetCollectionID;
}

- (void)setAssetCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionID, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (MSAsset)masterAsset
{
  return self->_masterAsset;
}

- (void)setMasterAsset:(id)a3
{
  objc_storeStrong((id *)&self->_masterAsset, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (NSDate)serverUploadedDate
{
  return self->_serverUploadedDate;
}

- (void)setServerUploadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_serverUploadedDate, a3);
}

- (int64_t)initialFailureDate
{
  return self->_initialFailureDate;
}

- (void)setInitialFailureDate:(int64_t)a3
{
  self->_initialFailureDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUploadedDate, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_derivedAssets, 0);
  objc_storeStrong((id *)&self->_masterAsset, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_assetCollectionID, 0);
}

+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMasterAsset:fileName:derivedAssets:", v7, v6, 0);

  return v8;
}

+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMasterAsset:fileName:derivedAssets:", v10, v9, v8);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
