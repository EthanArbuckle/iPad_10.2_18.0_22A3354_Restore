@implementation MFLocalActionPersistence_iOS

- (MFLocalActionPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MFLocalActionPersistence_iOS *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gmailLabelPersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)MFLocalActionPersistence_iOS;
  v10 = -[EDLocalActionPersistence initWithDatabase:gmailLabelPersistence:](&v12, sel_initWithDatabase_gmailLabelPersistence_, v7, v9);

  if (v10)
    objc_storeWeak((id *)&v10->_library, v6);

  return v10;
}

- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MFLocalActionPersistence_iOS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFLocalActionPersistence_iOS initWithDatabase:gmailLabelPersistence:]", "MFLocalActionPersistence_iOS.m", 24, "0");
}

- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3
{
  id v5;

  v5 = a3;
  -[MFLocalActionPersistence_iOS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFLocalActionPersistence_iOS initWithDatabase:]", "MFLocalActionPersistence_iOS.m", 36, "0");
}

- (id)messageForDatabaseID:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MFLocalActionPersistence_iOS library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithLibraryID:options:inMailbox:", a3, 7346239, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURL:](MailAccount, "accountWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
    v8 = objc_msgSend(v6, "moveSupported");
  else
    v8 = 0;

  return v8;
}

- (id)mailboxURLForDatabaseID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E98];
  -[MFLocalActionPersistence_iOS library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlForMailboxID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)mailboxDatabaseIDForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[MFLocalActionPersistence_iOS library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mailboxIDForURLString:createIfNecessary:", v6, 1);

  return v7;
}

- (id)labelNameForLabelID:(int64_t)a3
{
  -[MFLocalActionPersistence_iOS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFLocalActionPersistence_iOS labelNameForLabelID:]", "MFLocalActionPersistence_iOS.m", 59, "0");
}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

@end
