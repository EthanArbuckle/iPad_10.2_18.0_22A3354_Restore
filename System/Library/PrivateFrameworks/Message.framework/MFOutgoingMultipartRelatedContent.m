@implementation MFOutgoingMultipartRelatedContent

- (id)copy
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingMultipartRelatedContent;
  v3 = -[MFOutgoingRichtextMessageContent copy](&v5, sel_copy);
  objc_msgSend(v3, "setHtmlBody:", self->_htmlBody);
  return v3;
}

- (NSString)htmlBody
{
  return self->_htmlBody;
}

- (void)setHtmlBody:(id)a3
{
  objc_storeStrong((id *)&self->_htmlBody, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlBody, 0);
}

@end
