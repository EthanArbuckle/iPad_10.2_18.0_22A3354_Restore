@implementation DSArchivedItemDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DSArchivedItemDescriptor)initWithCoder:(id)a3
{
  id v4;
  DSArchivedItemDescriptor *v5;
  uint64_t v6;
  NSString *filePath;
  uint64_t v8;
  NSNumber *fileSize;
  uint64_t v10;
  NSString *typeIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DSArchivedItemDescriptor;
  v5 = -[DSArchivedItemDescriptor init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileSize"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_filePath, CFSTR("filePath"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileSize, CFSTR("fileSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("typeIdentifier"));

}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
