@implementation MPServerObjectDatabaseHLSAsset

- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 playlistURL:(id)a5 keyCertificateURL:(id)a6 keyServerURL:(id)a7 keyServerAdamID:(id)a8 keyServerProtocolType:(id)a9 isiTunesStoreStream:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  MPServerObjectDatabaseHLSAsset *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *hashedPersonID;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v16 = a4;
  v17 = a5;
  v27 = a6;
  v26 = a7;
  v18 = a8;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MPServerObjectDatabaseHLSAsset;
  v20 = -[MPServerObjectDatabaseHLSAsset init](&v29, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v28, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    hashedPersonID = v20->_hashedPersonID;
    v20->_hashedPersonID = (NSString *)v23;

    objc_storeStrong((id *)&v20->_playlistURL, a5);
    objc_storeStrong((id *)&v20->_keyCertificateURL, a6);
    objc_storeStrong((id *)&v20->_keyServerURL, a7);
    objc_storeStrong((id *)&v20->_keyServerAdamID, a8);
    objc_storeStrong((id *)&v20->_keyServerProtocolType, a9);
    v20->_iTunesStoreStream = a10;
  }

  return v20;
}

- (MPServerObjectDatabaseHLSAsset)initWithSQLRowResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MPServerObjectDatabaseHLSAsset *v17;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "stringValueAtColumnIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValueAtColumnIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "stringValueAtColumnIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringValueAtColumnIndex:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v4, "stringValueAtColumnIndex:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v4, "int64ValueAtColumnIndex:", 5);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v4, "stringValueAtColumnIndex:", 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v4, "BOOLValueAtColumnIndex:", 7);
  v17 = -[MPServerObjectDatabaseHLSAsset _initWithIdentifier:hashedPersonID:playlistURL:keyCertificateURL:keyServerURL:keyServerAdamID:keyServerProtocolType:isiTunesStoreStream:](self, "_initWithIdentifier:hashedPersonID:playlistURL:keyCertificateURL:keyServerURL:keyServerAdamID:keyServerProtocolType:isiTunesStoreStream:", v5, v6, v9, v11, v13, v15, v16, v19);

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)hashedPersonID
{
  return self->_hashedPersonID;
}

- (NSURL)playlistURL
{
  return self->_playlistURL;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (NSNumber)keyServerAdamID
{
  return self->_keyServerAdamID;
}

- (NSString)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_keyServerAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_playlistURL, 0);
  objc_storeStrong((id *)&self->_hashedPersonID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
