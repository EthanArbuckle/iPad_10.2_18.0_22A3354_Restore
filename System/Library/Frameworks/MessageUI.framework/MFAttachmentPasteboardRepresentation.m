@implementation MFAttachmentPasteboardRepresentation

- (MFAttachmentPasteboardRepresentation)initWithAttachment:(id)a3
{
  id v4;
  MFAttachmentPasteboardRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFAttachmentPasteboardRepresentation;
  v5 = -[MFAttachmentPasteboardRepresentation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "fileWrapperForcingDownload:", objc_msgSend(v4, "hasBeenDownloaded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regularFileContents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setData:](v5, "setData:", v7);

    objc_msgSend(v6, "preferredFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setName:](v5, "setName:", v8);

    objc_msgSend(v6, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setMimeType:](v5, "setMimeType:", v9);

  }
  return v5;
}

- (MFAttachmentPasteboardRepresentation)initWithMFAttachment:(id)a3
{
  id v4;
  MFAttachmentPasteboardRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFAttachmentPasteboardRepresentation;
  v5 = -[MFAttachmentPasteboardRepresentation init](&v10, sel_init);
  if (v5 && objc_msgSend(v4, "isDataAvailableLocally"))
  {
    objc_msgSend(v4, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setName:](v5, "setName:", v6);

    objc_msgSend(v4, "mimeType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setMimeType:](v5, "setMimeType:", v7);

    objc_msgSend(v4, "fetchLocalData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setData:](v5, "setData:", v8);

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
  id v7;

  v7 = a3;
  -[MFAttachmentPasteboardRepresentation data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("data"));

  -[MFAttachmentPasteboardRepresentation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("name"));

  -[MFAttachmentPasteboardRepresentation mimeType](self, "mimeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("mimeType"));

}

- (MFAttachmentPasteboardRepresentation)initWithCoder:(id)a3
{
  id v4;
  MFAttachmentPasteboardRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFAttachmentPasteboardRepresentation;
  v5 = -[MFAttachmentPasteboardRepresentation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setData:](v5, "setData:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setName:](v5, "setName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mimeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentPasteboardRepresentation setMimeType:](v5, "setMimeType:", v8);

  }
  return v5;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[MFAttachmentPasteboardRepresentation data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
