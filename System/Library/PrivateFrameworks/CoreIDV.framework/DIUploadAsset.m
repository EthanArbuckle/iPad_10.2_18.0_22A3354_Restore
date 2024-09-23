@implementation DIUploadAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DIUploadAsset data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetData"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIUploadAsset type](self, "type"), CFSTR("assetType"));
  -[DIUploadAsset assetID](self, "assetID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetID"));

}

- (DIUploadAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  DIUploadAsset *v9;
  DIUploadAsset *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assetType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = -[DIUploadAsset initWithData:assetType:](self, "initWithData:assetType:", v5, v6);
    -[DIUploadAsset setAssetID:](v9, "setAssetID:", v7);
    self = v9;
    v10 = self;
  }

  return v10;
}

- (DIUploadAsset)initWithData:(id)a3 assetType:(int64_t)a4
{
  id v7;
  DIUploadAsset *v8;
  DIUploadAsset *v9;
  NSUUID *v10;
  NSUUID *assetID;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIUploadAsset;
  v8 = -[DIUploadAsset init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_type = a4;
    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    assetID = v9->_assetID;
    v9->_assetID = v10;

  }
  return v9;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[DIUploadAsset type](self, "type");
  -[DIUploadAsset assetID](self, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIUploadAsset data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DIUploadAsset: type=%ld assetID=%@, data=%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
