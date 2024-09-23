@implementation CRKOpenFileRequestItem

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKOpenFileRequestItem fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOpenFileRequestItem fileData](self, "fileData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { fileName = %@, fileData = %ld bytes }>"), v4, self, v5, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenFileRequestItem)initWithCoder:(id)a3
{
  id v4;
  CRKOpenFileRequestItem *v5;
  void *v6;
  uint64_t v7;
  NSData *fileData;
  void *v9;
  uint64_t v10;
  NSString *fileName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKOpenFileRequestItem;
  v5 = -[CRKOpenFileRequestItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("fileData"));
    v7 = objc_claimAutoreleasedReturnValue();
    fileData = v5->_fileData;
    v5->_fileData = (NSData *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("fileName"));
    v10 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRKOpenFileRequestItem fileData](self, "fileData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fileData"));

  -[CRKOpenFileRequestItem fileName](self, "fileName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fileName"));

}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
}

@end
