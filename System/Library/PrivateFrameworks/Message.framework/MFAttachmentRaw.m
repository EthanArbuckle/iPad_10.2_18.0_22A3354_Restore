@implementation MFAttachmentRaw

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5
{
  objc_msgSend(a1, "attachmentData:fileName:mimeType:contentID:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MFAttachmentRaw *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MFAttachmentRaw);
  -[MFAttachmentRaw setData:](v13, "setData:", v9);
  -[MFAttachmentRaw setFileName:](v13, "setFileName:", v10);
  -[MFAttachmentRaw setMimeType:](v13, "setMimeType:", v11);
  -[MFAttachmentRaw setContentID:](v13, "setContentID:", v12);

  return v13;
}

- (MFAttachmentRaw)initWithCoder:(id)a3
{
  id v4;
  MFAttachmentRaw *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *fileName;
  uint64_t v10;
  NSString *mimeType;
  uint64_t v12;
  NSString *contentID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFAttachmentRaw;
  v5 = -[MFAttachmentRaw init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_fileName"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mimeType"));
    v10 = objc_claimAutoreleasedReturnValue();
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contentID"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v12;

  }
  return v5;
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
  id v8;

  v8 = a3;
  -[MFAttachmentRaw data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_data"));

  -[MFAttachmentRaw fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_fileName"));

  -[MFAttachmentRaw mimeType](self, "mimeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_mimeType"));

  -[MFAttachmentRaw contentID](self, "contentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_contentID"));

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
