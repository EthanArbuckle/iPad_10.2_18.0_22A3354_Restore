@implementation ASDJobAsset

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobAsset *v5;
  uint64_t v6;
  NSString *assetType;
  uint64_t v8;
  NSString *assetURL;
  uint64_t v10;
  NSNumber *bytesTotal;
  uint64_t v12;
  NSData *dPInfo;
  uint64_t v14;
  NSNumber *expectedDiskspace;
  uint64_t v16;
  NSData *hashArrayData;
  uint64_t v18;
  NSNumber *hashType;
  uint64_t v20;
  NSNumber *initialODRSize;
  uint64_t v22;
  NSNumber *numberOfBytesToHash;
  uint64_t v24;
  NSData *sinfs;
  uint64_t v26;
  NSString *storeDownloadKey;
  uint64_t v28;
  NSString *variantID;

  v5 = -[ASDJobAsset init](+[ASDJobAsset allocWithZone:](ASDJobAsset, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_assetType, "copyWithZone:", a3);
  assetType = v5->_assetType;
  v5->_assetType = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_assetURL, "copyWithZone:", a3);
  assetURL = v5->_assetURL;
  v5->_assetURL = (NSString *)v8;

  v10 = -[NSNumber copyWithZone:](self->_bytesTotal, "copyWithZone:", a3);
  bytesTotal = v5->_bytesTotal;
  v5->_bytesTotal = (NSNumber *)v10;

  v12 = -[NSData copyWithZone:](self->_dPInfo, "copyWithZone:", a3);
  dPInfo = v5->_dPInfo;
  v5->_dPInfo = (NSData *)v12;

  v14 = -[NSNumber copyWithZone:](self->_expectedDiskspace, "copyWithZone:", a3);
  expectedDiskspace = v5->_expectedDiskspace;
  v5->_expectedDiskspace = (NSNumber *)v14;

  v16 = -[NSData copyWithZone:](self->_hashArrayData, "copyWithZone:", a3);
  hashArrayData = v5->_hashArrayData;
  v5->_hashArrayData = (NSData *)v16;

  v18 = -[NSNumber copyWithZone:](self->_hashType, "copyWithZone:", a3);
  hashType = v5->_hashType;
  v5->_hashType = (NSNumber *)v18;

  v20 = -[NSNumber copyWithZone:](self->_initialODRSize, "copyWithZone:", a3);
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = (NSNumber *)v20;

  v5->_isExternal = self->_isExternal;
  v5->_isLocallyCacheable = self->_isLocallyCacheable;
  v5->_isZipStreamable = self->_isZipStreamable;
  v22 = -[NSNumber copyWithZone:](self->_numberOfBytesToHash, "copyWithZone:", a3);
  numberOfBytesToHash = v5->_numberOfBytesToHash;
  v5->_numberOfBytesToHash = (NSNumber *)v22;

  v24 = -[NSData copyWithZone:](self->_sinfs, "copyWithZone:", a3);
  sinfs = v5->_sinfs;
  v5->_sinfs = (NSData *)v24;

  v26 = -[NSString copyWithZone:](self->_storeDownloadKey, "copyWithZone:", a3);
  storeDownloadKey = v5->_storeDownloadKey;
  v5->_storeDownloadKey = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_variantID, "copyWithZone:", a3);
  variantID = v5->_variantID;
  v5->_variantID = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobAsset)initWithCoder:(id)a3
{
  id v4;
  ASDJobAsset *v5;
  uint64_t v6;
  NSString *assetType;
  uint64_t v8;
  NSString *assetURL;
  uint64_t v10;
  NSNumber *bytesTotal;
  uint64_t v12;
  NSData *dPInfo;
  uint64_t v14;
  NSNumber *expectedDiskspace;
  uint64_t v16;
  NSData *hashArrayData;
  uint64_t v18;
  NSNumber *hashType;
  uint64_t v20;
  NSNumber *initialODRSize;
  uint64_t v22;
  NSNumber *numberOfBytesToHash;
  uint64_t v24;
  NSData *sinfs;
  uint64_t v26;
  NSString *storeDownloadKey;
  uint64_t v28;
  NSString *variantID;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASDJobAsset;
  v5 = -[ASDJobAsset init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetURL = v5->_assetURL;
    v5->_assetURL = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bytesTotal"));
    v10 = objc_claimAutoreleasedReturnValue();
    bytesTotal = v5->_bytesTotal;
    v5->_bytesTotal = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetDPInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    dPInfo = v5->_dPInfo;
    v5->_dPInfo = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedDiskspace"));
    v14 = objc_claimAutoreleasedReturnValue();
    expectedDiskspace = v5->_expectedDiskspace;
    v5->_expectedDiskspace = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashArrayData"));
    v16 = objc_claimAutoreleasedReturnValue();
    hashArrayData = v5->_hashArrayData;
    v5->_hashArrayData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashType"));
    v18 = objc_claimAutoreleasedReturnValue();
    hashType = v5->_hashType;
    v5->_hashType = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialODRSize"));
    v20 = objc_claimAutoreleasedReturnValue();
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v20;

    v5->_isExternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExternal"));
    v5->_isLocallyCacheable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZipStreamable"));
    v5->_isZipStreamable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZipStreamable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfBytesToHash"));
    v22 = objc_claimAutoreleasedReturnValue();
    numberOfBytesToHash = v5->_numberOfBytesToHash;
    v5->_numberOfBytesToHash = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sinfs"));
    v24 = objc_claimAutoreleasedReturnValue();
    sinfs = v5->_sinfs;
    v5->_sinfs = (NSData *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeDownloadKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    storeDownloadKey = v5->_storeDownloadKey;
    v5->_storeDownloadKey = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantID"));
    v28 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[ASDJobAsset assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetType"));

  -[ASDJobAsset assetURL](self, "assetURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetURL"));

  -[ASDJobAsset bytesTotal](self, "bytesTotal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bytesTotal"));

  -[ASDJobAsset dPInfo](self, "dPInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("assetDPInfo"));

  -[ASDJobAsset expectedDiskspace](self, "expectedDiskspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("expectedDiskspace"));

  -[ASDJobAsset hashArrayData](self, "hashArrayData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("hashArrayData"));

  -[ASDJobAsset hashType](self, "hashType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("hashType"));

  -[ASDJobAsset initialODRSize](self, "initialODRSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("initialODRSize"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isExternal](self, "isExternal"), CFSTR("isExternal"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isLocallyCacheable](self, "isLocallyCacheable"), CFSTR("isLocallyCacheable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isZipStreamable](self, "isZipStreamable"), CFSTR("isZipStreamable"));
  -[ASDJobAsset numberOfBytesToHash](self, "numberOfBytesToHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("numberOfBytesToHash"));

  -[ASDJobAsset sinfs](self, "sinfs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("sinfs"));

  -[ASDJobAsset storeDownloadKey](self, "storeDownloadKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("storeDownloadKey"));

  -[ASDJobAsset variantID](self, "variantID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("variantID"));

}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)bytesTotal
{
  return self->_bytesTotal;
}

- (void)setBytesTotal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)dPInfo
{
  return self->_dPInfo;
}

- (void)setDPInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)expectedDiskspace
{
  return self->_expectedDiskspace;
}

- (void)setExpectedDiskspace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)hashArrayData
{
  return self->_hashArrayData;
}

- (void)setHashArrayData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)hashType
{
  return self->_hashType;
}

- (void)setHashType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isExternal
{
  return self->_isExternal;
}

- (void)setIsExternal:(BOOL)a3
{
  self->_isExternal = a3;
}

- (BOOL)isLocallyCacheable
{
  return self->_isLocallyCacheable;
}

- (void)setIsLocallyCacheable:(BOOL)a3
{
  self->_isLocallyCacheable = a3;
}

- (BOOL)isZipStreamable
{
  return self->_isZipStreamable;
}

- (void)setIsZipStreamable:(BOOL)a3
{
  self->_isZipStreamable = a3;
}

- (NSNumber)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)storeDownloadKey
{
  return self->_storeDownloadKey;
}

- (void)setStoreDownloadKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_storeDownloadKey, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_numberOfBytesToHash, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_hashType, 0);
  objc_storeStrong((id *)&self->_hashArrayData, 0);
  objc_storeStrong((id *)&self->_expectedDiskspace, 0);
  objc_storeStrong((id *)&self->_dPInfo, 0);
  objc_storeStrong((id *)&self->_bytesTotal, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
