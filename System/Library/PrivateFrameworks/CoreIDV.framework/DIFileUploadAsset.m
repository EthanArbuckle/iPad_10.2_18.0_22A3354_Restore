@implementation DIFileUploadAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIFileUploadAsset;
  v4 = a3;
  -[DIUploadAsset encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("assetURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileHandle, CFSTR("assetFileHandle"));

}

- (DIFileUploadAsset)initWithCoder:(id)a3
{
  id v4;
  DIFileUploadAsset *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSFileHandle *fileHandle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIFileUploadAsset;
  v5 = -[DIUploadAsset initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetFileHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v8;

  }
  return v5;
}

- (DIFileUploadAsset)initWithURL:(id)a3 assetType:(int64_t)a4
{
  id v7;
  id v8;
  DIFileUploadAsset *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSFileHandle *fileHandle;
  objc_super v15;

  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v15.receiver = self;
  v15.super_class = (Class)DIFileUploadAsset;
  v9 = -[DIUploadAsset initWithData:assetType:](&v15, sel_initWithData_assetType_, v8, a4);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v10 = (void *)MEMORY[0x24BDD1578];
    -[NSURL path](v9->_url, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileHandleForUpdatingAtPath:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    fileHandle = v9->_fileHandle;
    v9->_fileHandle = (NSFileHandle *)v12;

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
  void *v10;
  void *v11;

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
  -[DIFileUploadAsset url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DIFileUploadAsset: type=%ld assetID=%@, data=%@ url=%@"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
