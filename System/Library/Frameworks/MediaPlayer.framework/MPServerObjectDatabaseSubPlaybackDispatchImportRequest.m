@implementation MPServerObjectDatabaseSubPlaybackDispatchImportRequest

- (MPServerObjectDatabaseSubPlaybackDispatchImportRequest)initWithIdentifiers:(id)a3 playbackResponse:(id)a4
{
  id v7;
  id *v8;
  MPServerObjectDatabaseSubPlaybackDispatchImportRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPServerObjectDatabaseSubPlaybackDispatchImportRequest;
  v8 = -[MPServerObjectDatabaseImportRequest _initWithPayload:](&v11, sel__initWithPayload_, a4);
  v9 = (MPServerObjectDatabaseSubPlaybackDispatchImportRequest *)v8;
  if (v8)
    objc_storeStrong(v8 + 5, a3);

  return v9;
}

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MPIdentifierSet *identifiers;
  uint64_t v15;
  void *v16;
  void *v17;
  MPIdentifierSet *v19;
  MPIdentifierSet *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  -[MPServerObjectDatabaseImportRequest payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hlsAssetInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "playlistURL");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alternateKeyCertificateURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    if (!v9)
    {
      objc_msgSend(v8, "alternateKeyCertificateURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v5;
    objc_msgSend(v8, "alternateKeyServerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    if (!v10)
    {
      objc_msgSend(v8, "keyServerURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "keyServerAdamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v11, "longLongValue");
    objc_msgSend(v8, "keyServerProtocolType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isiTunesStoreStream");
    identifiers = self->_identifiers;
    objc_msgSend(v6, "expirationDate");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v19 = identifiers;
      v17 = (void *)v23;
      v5 = v24;
      objc_msgSend(v24, "importHLSAssetURL:keyCertificateURL:keyServerURL:redeliveryId:protocolType:isiTunesStoreStream:forIdentifiers:expirationDate:", v23, v26, v25, v22, v12, v13, v19, v15);
    }
    else
    {
      -[MPServerObjectDatabaseImportRequest assetURLExpirationDate](self, "assetURLExpirationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = identifiers;
      v17 = (void *)v23;
      v5 = v24;
      objc_msgSend(v24, "importHLSAssetURL:keyCertificateURL:keyServerURL:redeliveryId:protocolType:isiTunesStoreStream:forIdentifiers:expirationDate:", v23, v26, v25, v22, v12, v13, v20, v21);

    }
    if (!v10)

    if (!v9)
  }

  return v8 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
