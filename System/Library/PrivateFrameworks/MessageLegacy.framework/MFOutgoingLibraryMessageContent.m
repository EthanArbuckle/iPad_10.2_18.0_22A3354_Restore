@implementation MFOutgoingLibraryMessageContent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingLibraryMessageContent;
  -[MFOutgoingMessageContent dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingLibraryMessageContent;
  v3 = -[MFOutgoingMessageContent copy](&v5, sel_copy);
  objc_msgSend(v3, "setLibraryMessage:", self->_libraryMessage);
  return v3;
}

- (id)headers
{
  return (id)objc_msgSend((id)-[MFLibraryMessage headers](-[MFOutgoingLibraryMessageContent libraryMessage](self, "libraryMessage"), "headers"), "mutableCopy");
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (void)setLibraryMessage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
