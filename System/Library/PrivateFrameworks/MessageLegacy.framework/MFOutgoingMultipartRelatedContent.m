@implementation MFOutgoingMultipartRelatedContent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMultipartRelatedContent;
  -[MFOutgoingRichtextMessageContent dealloc](&v3, sel_dealloc);
}

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
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
