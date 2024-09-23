@implementation WCSessionFile

- (WCSessionFile)initWithIdentifier:(id)a3 fileURL:(id)a4 relativePath:(id)a5
{
  id v9;
  id v10;
  id v11;
  WCSessionFile *v12;
  WCSessionFile *v13;
  NSDictionary *metadata;
  uint64_t v15;
  NSDate *creationDate;
  WCUserInfo *v17;
  WCUserInfo *userInfoStorage;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WCSessionFile;
  v12 = -[WCSessionFile init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    metadata = v12->_metadata;
    v12->_metadata = 0;

    objc_storeStrong((id *)&v13->_fileURL, a4);
    objc_storeStrong((id *)&v13->_fileIdentifier, a3);
    objc_storeStrong((id *)&v13->_relativePath, a5);
    v15 = objc_opt_new();
    creationDate = v13->_creationDate;
    v13->_creationDate = (NSDate *)v15;

    v17 = objc_alloc_init(WCUserInfo);
    userInfoStorage = v13->_userInfoStorage;
    v13->_userInfoStorage = v17;

  }
  return v13;
}

- (WCSessionFile)initWithFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WCSessionFile *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WCSessionFile initWithIdentifier:fileURL:relativePath:](self, "initWithIdentifier:fileURL:relativePath:", v6, v4, 0);

  return v7;
}

- (WCSessionFile)initWithIdentifier:(id)a3 relativePath:(id)a4
{
  return -[WCSessionFile initWithIdentifier:fileURL:relativePath:](self, "initWithIdentifier:fileURL:relativePath:", a3, 0, a4);
}

- (NSURL)fileURL
{
  NSURL *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self->_fileURL;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBCF48];
    -[WCSessionFile relativePath](self, "relativePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:relativeToURL:", v8, 0, v6);
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSDictionary)metadata
{
  void *v2;
  void *v3;

  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "updateUserInfo:error:", v6, a4);

  return (char)a4;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "updateUserInfoData:error:", v6, a4);

  return (char)a4;
}

- (NSData)userInfoData
{
  void *v2;
  void *v3;

  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)verifyMetadata
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verifyUserInfo");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  -[WCSessionFile userInfoStorage](self, "userInfoStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[WCSessionFile userInfoStorage](self, "userInfoStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSessionFile fileIdentifier](self, "fileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSessionFile fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = "YES";
  if (!v5)
    v14 = "NO";
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, file: %@, hasMetadata: %s>"), v9, self, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  WCSessionFile *v4;
  WCSessionFile *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WCSessionFile *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCSessionFile fileIdentifier](self, "fileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCSessionFile fileIdentifier](v5, "fileIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WCSessionFile fileIdentifier](self, "fileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WCSessionFile creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *fileSize;
  id v5;

  fileSize = self->_fileSize;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fileSize, CFSTR("fileSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileURL, CFSTR("fileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileDescriptor, CFSTR("fileDescriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileIdentifier, CFSTR("fileIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfoStorage, CFSTR("userInfoStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relativePath, CFSTR("relativePath"));

}

- (WCSessionFile)initWithCoder:(id)a3
{
  id v4;
  WCSessionFile *v5;
  void *v6;
  uint64_t v7;
  NSNumber *fileSize;
  uint64_t v9;
  NSURL *fileURL;
  uint64_t v11;
  NSFileHandle *fileDescriptor;
  void *v13;
  uint64_t v14;
  NSString *fileIdentifier;
  uint64_t v16;
  NSDate *creationDate;
  uint64_t v18;
  WCUserInfo *userInfoStorage;
  void *v20;
  uint64_t v21;
  NSString *relativePath;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WCSessionFile;
  v5 = -[WCSessionFile init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileDescriptor"));
    v11 = objc_claimAutoreleasedReturnValue();
    fileDescriptor = v5->_fileDescriptor;
    v5->_fileDescriptor = (NSFileHandle *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    fileIdentifier = v5->_fileIdentifier;
    v5->_fileIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfoStorage"));
    v18 = objc_claimAutoreleasedReturnValue();
    userInfoStorage = v5->_userInfoStorage;
    v5->_userInfoStorage = (WCUserInfo *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativePath"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v21;

  }
  return v5;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (WCUserInfo)userInfoStorage
{
  return self->_userInfoStorage;
}

- (void)setUserInfoStorage:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoStorage, a3);
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)fileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSFileHandle)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_fileDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDescriptor, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_userInfoStorage, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
