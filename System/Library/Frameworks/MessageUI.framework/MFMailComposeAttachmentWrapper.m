@implementation MFMailComposeAttachmentWrapper

+ (id)wrapperWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:mimeType:", v6, v7);

  return v8;
}

+ (id)wrapperWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:mimeType:fileName:", v8, v9, v10);

  return v11;
}

+ (id)wrapperWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemProvider:mimeType:fileName:", v8, v9, v10);

  return v11;
}

- (MFMailComposeAttachmentWrapper)initWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  MFMailComposeAttachmentWrapper *v8;
  uint64_t v9;
  EFSandboxedURLWrapper *fileURLWrapper;
  uint64_t v11;
  NSString *mimeType;
  void *v13;
  uint64_t v14;
  NSString *fileName;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeAttachmentWrapper;
  v8 = -[MFMailComposeAttachmentWrapper init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F068]), "initWithFileURL:readOnly:", v6, 1);
    fileURLWrapper = v8->_fileURLWrapper;
    v8->_fileURLWrapper = (EFSandboxedURLWrapper *)v9;

    v11 = objc_msgSend(v7, "copy");
    mimeType = v8->_mimeType;
    v8->_mimeType = (NSString *)v11;

    objc_msgSend(v6, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    fileName = v8->_fileName;
    v8->_fileName = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v17;

  }
  return v8;
}

- (MFMailComposeAttachmentWrapper)initWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFMailComposeAttachmentWrapper *v12;
  MFMailComposeAttachmentWrapper *v13;
  uint64_t v14;
  NSString *mimeType;
  uint64_t v16;
  NSString *fileName;
  void *v18;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFMailComposeAttachmentWrapper;
  v12 = -[MFMailComposeAttachmentWrapper init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v14 = objc_msgSend(v10, "copy");
    mimeType = v13->_mimeType;
    v13->_mimeType = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    fileName = v13->_fileName;
    v13->_fileName = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v19;

  }
  return v13;
}

- (MFMailComposeAttachmentWrapper)initWithItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFMailComposeAttachmentWrapper *v12;
  MFMailComposeAttachmentWrapper *v13;
  uint64_t v14;
  NSString *mimeType;
  uint64_t v16;
  NSString *fileName;
  void *v18;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFMailComposeAttachmentWrapper;
  v12 = -[MFMailComposeAttachmentWrapper init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemProvider, a3);
    v14 = objc_msgSend(v10, "copy");
    mimeType = v13->_mimeType;
    v13->_mimeType = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    fileName = v13->_fileName;
    v13->_fileName = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v19;

  }
  return v13;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  NSString *mimeType;
  NSString *fileName;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSData length](self->_data, "length");
  mimeType = self->_mimeType;
  fileName = self->_fileName;
  -[EFSandboxedURLWrapper url](self->_fileURLWrapper, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Data Len:%lu\nMIME Type:%@\nFile Name:%@\nFile URL:%@\nID:%@"), v4, mimeType, fileName, v7, self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)fileURL
{
  return (NSURL *)-[EFSandboxedURLWrapper url](self->_fileURLWrapper, "url");
}

- (unint64_t)fileSize
{
  EFSandboxedURLWrapper *fileURLWrapper;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  fileURLWrapper = self->_fileURLWrapper;
  if (!fileURLWrapper)
    return -[NSData length](self->_data, "length");
  -[EFSandboxedURLWrapper url](fileURLWrapper, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
  v16 = 0;
  v6 = *MEMORY[0x1E0C99998];
  v15 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, v6, &v15);
  v7 = v16;
  v8 = v15;
  v9 = objc_msgSend(v7, "integerValue");
  if (v9)
  {
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v12 = objc_msgSend(v11, "mf_sizeForDirectoryAtURL:error:", v4, &v14);
  v13 = v14;

  v9 = v12 & ~(v12 >> 63);
  v8 = v13;
  if (v5)
LABEL_7:
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MFMailComposeAttachmentWrapper data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_data"));

  -[MFMailComposeAttachmentWrapper mimeType](self, "mimeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_mimeType"));

  -[MFMailComposeAttachmentWrapper fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_fileName"));

  -[MFMailComposeAttachmentWrapper identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_identifier"));

  -[MFMailComposeAttachmentWrapper fileURLWrapper](self, "fileURLWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_fileURLWrapper"));

}

- (MFMailComposeAttachmentWrapper)initWithCoder:(id)a3
{
  id v4;
  MFMailComposeAttachmentWrapper *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *mimeType;
  uint64_t v10;
  NSString *fileName;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  EFSandboxedURLWrapper *fileURLWrapper;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeAttachmentWrapper;
  v5 = -[MFMailComposeAttachmentWrapper init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mimeType"));
    v8 = objc_claimAutoreleasedReturnValue();
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_fileName"));
    v10 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_fileURLWrapper"));
    v14 = objc_claimAutoreleasedReturnValue();
    fileURLWrapper = v5->_fileURLWrapper;
    v5->_fileURLWrapper = (EFSandboxedURLWrapper *)v14;

  }
  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (EFSandboxedURLWrapper)fileURLWrapper
{
  return self->_fileURLWrapper;
}

- (void)setFileURLWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_fileURLWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLWrapper, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
