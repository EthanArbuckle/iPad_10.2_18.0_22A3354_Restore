@implementation IMDSMSAttachmentPart

- (IMDSMSAttachmentPart)initWithContentLocation:(id)a3
{
  id v4;
  IMDSMSAttachmentPart *v5;
  uint64_t v6;
  NSString *contentLocation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDSMSAttachmentPart;
  v5 = -[IMDSMSAttachmentPart init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = (NSString *)v6;

  }
  return v5;
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end
