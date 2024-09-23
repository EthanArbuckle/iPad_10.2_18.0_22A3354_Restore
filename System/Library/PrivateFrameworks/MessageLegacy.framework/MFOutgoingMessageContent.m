@implementation MFOutgoingMessageContent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessageContent;
  -[MFOutgoingMessageContent dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "setHeaders:", self->_headers);
  objc_msgSend(v3, "setPlaceholders:", self->_placeholders);
  return v3;
}

- (MFOutgoingLibraryMessageContent)libraryContent
{
  return 0;
}

- (MFOutgoingRichtextMessageContent)richtextContent
{
  return 0;
}

- (MFOutgoingMultipartRelatedContent)multipartContent
{
  return 0;
}

- (MFMutableMessageHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)placeholders
{
  return self->_placeholders;
}

- (void)setPlaceholders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
