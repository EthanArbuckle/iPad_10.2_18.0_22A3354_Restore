@implementation MFOutgoingLibraryMessageContent

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
  void *v2;
  void *v3;
  void *v4;

  -[MFOutgoingLibraryMessageContent libraryMessage](self, "libraryMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (void)setLibraryMessage:(id)a3
{
  objc_storeStrong((id *)&self->_libraryMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryMessage, 0);
}

@end
