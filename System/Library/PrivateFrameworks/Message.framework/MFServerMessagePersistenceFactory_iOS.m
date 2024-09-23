@implementation MFServerMessagePersistenceFactory_iOS

- (MFServerMessagePersistenceFactory_iOS)initWithLibrary:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MFServerMessagePersistenceFactory_iOS *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gmailLabelPersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)MFServerMessagePersistenceFactory_iOS;
  v10 = -[EDServerMessagePersistenceFactory initWithDatabase:gmailLabelPersistence:](&v12, sel_initWithDatabase_gmailLabelPersistence_, v7, v9);

  if (v10)
    objc_storeWeak((id *)&v10->_library, v6);

  return v10;
}

- (int64_t)mailboxIDForMailboxURL:(id)a3 useNumericSearch:(BOOL *)a4 supportsLabels:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v8 = a3;
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1DB68]);

  }
  if (a5)
    *a5 = 0;
  -[MFServerMessagePersistenceFactory_iOS library](self, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "mailboxIDForURLString:createIfNecessary:", v12, 1);

  return v13;
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
