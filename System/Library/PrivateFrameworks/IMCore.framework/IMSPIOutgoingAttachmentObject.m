@implementation IMSPIOutgoingAttachmentObject

- (IMSPIOutgoingAttachmentObject)initWithFileURL:(id)a3 isSensitive:(BOOL)a4
{
  id v7;
  IMSPIOutgoingAttachmentObject *v8;
  IMSPIOutgoingAttachmentObject *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMSPIOutgoingAttachmentObject;
  v8 = -[IMSPIOutgoingAttachmentObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    v9->_isSensitive = a4;
  }

  return v9;
}

- (NSString)fileURL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void)setIsSensitive:(BOOL)a3
{
  self->_isSensitive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
