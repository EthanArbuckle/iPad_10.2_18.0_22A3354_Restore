@implementation MFAttachmentRaw

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5
{
  return (id)objc_msgSend(a1, "attachmentData:fileName:mimeType:contentID:", a3, a4, a5, 0);
}

+ (id)attachmentData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  MFAttachmentRaw *v10;

  v10 = objc_alloc_init(MFAttachmentRaw);
  -[MFAttachmentRaw setData:](v10, "setData:", a3);
  -[MFAttachmentRaw setFileName:](v10, "setFileName:", a4);
  -[MFAttachmentRaw setMimeType:](v10, "setMimeType:", a5);
  -[MFAttachmentRaw setContentID:](v10, "setContentID:", a6);
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentRaw;
  -[MFAttachmentRaw dealloc](&v3, sel_dealloc);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
