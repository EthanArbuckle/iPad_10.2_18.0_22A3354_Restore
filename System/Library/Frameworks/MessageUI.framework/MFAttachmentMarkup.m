@implementation MFAttachmentMarkup

+ (id)attachmentMarkupWithProperties:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6 contextID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MFAttachmentMarkup *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MFAttachmentMarkup);
  -[MFAttachmentMarkup setAttachmentData:](v16, "setAttachmentData:", v11);
  -[MFAttachmentMarkup setContentID:](v16, "setContentID:", v12);
  -[MFAttachmentMarkup setMimeType:](v16, "setMimeType:", v13);
  -[MFAttachmentMarkup setFilename:](v16, "setFilename:", v14);
  -[MFAttachmentMarkup setContextID:](v16, "setContextID:", v15);

  return v16;
}

- (NSData)attachmentData
{
  return self->_attachmentData;
}

- (void)setAttachmentData:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentData, a3);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_attachmentData, 0);
}

@end
