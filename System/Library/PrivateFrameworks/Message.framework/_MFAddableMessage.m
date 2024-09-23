@implementation _MFAddableMessage

- (_MFAddableMessage)initWithLibraryMessage:(id)a3 messageIDHash:(int64_t)a4 mailboxURL:(id)a5
{
  id v9;
  id v10;
  _MFAddableMessage *v11;
  _MFAddableMessage *v12;
  uint64_t v13;
  NSString *urlString;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_MFAddableMessage;
  v11 = -[_MFAddableMessage init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_libraryMessage, a3);
    v12->_messageIDHash = a4;
    v13 = objc_msgSend(v10, "copy");
    urlString = v12->_urlString;
    v12->_urlString = (NSString *)v13;

  }
  return v12;
}

- (int64_t)messageIDHash
{
  uint64_t messageIDHash;
  void *v3;

  messageIDHash = self->_messageIDHash;
  if (!messageIDHash)
  {
    -[_MFAddableMessage libraryMessage](self, "libraryMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    messageIDHash = objc_msgSend(v3, "messageIDHash");

  }
  return messageIDHash;
}

- (ECAngleBracketIDHash)messageIDHeaderHash
{
  void *v2;
  void *v3;

  if (self->_messageIDHash)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", self->_messageIDHash);
  }
  else
  {
    -[_MFAddableMessage libraryMessage](self, "libraryMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageIDHeaderHash");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (ECAngleBracketIDHash *)v2;
}

- (ECMailbox)mailbox
{
  void *v3;
  void *v4;
  void *v5;

  -[_MFAddableMessage urlString](self, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MFAddableMessage urlString](self, "urlString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v4);
  }
  else
  {
    -[_MFAddableMessage libraryMessage](self, "libraryMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailbox");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ECMailbox *)v5;
}

- (id)bestAlternativePart:(BOOL *)a3
{
  void *v4;
  void *v5;

  -[_MFAddableMessage libraryMessage](self, "libraryMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestAlternativePart:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[_MFAddableMessage libraryMessage](self, "libraryMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestAlternativePartAsData:usingEncoding:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[_MFAddableMessage libraryMessage](self, "libraryMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isServerSearchResult
{
  void *v2;
  char v3;

  -[_MFAddableMessage libraryMessage](self, "libraryMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServerSearchResult");

  return v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v3;
  char isKindOfClass;

  -[_MFAddableMessage libraryMessage](self, "libraryMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_libraryMessage, 0);
}

@end
