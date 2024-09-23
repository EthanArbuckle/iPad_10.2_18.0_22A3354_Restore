@implementation FCAVEphemeralAssetKeyCache

- (FCAVEphemeralAssetKeyCache)init
{
  FCAVEphemeralAssetKeyCache *v2;
  FCThreadSafeMutableDictionary *v3;
  FCThreadSafeMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCAVEphemeralAssetKeyCache;
  v2 = -[FCAVEphemeralAssetKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (id)assetKeyForURI:(id)a3
{
  if (self)
    self = (FCAVEphemeralAssetKeyCache *)self->_dictionary;
  return (id)-[FCAVEphemeralAssetKeyCache objectForKey:](self, "objectForKey:", a3);
}

- (id)interestTokenForKeyURIs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", &__block_literal_global_44);
}

- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  FCThreadSafeMutableDictionary *dictionary;
  id v19;

  v10 = (objc_class *)MEMORY[0x1E0D62610];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v19 = objc_alloc_init(v10);
  objc_msgSend(v11, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", v15);

  objc_msgSend(v19, "setKeyData:", v14);
  objc_msgSend(v13, "pbDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setCreatedAt:", v16);
  objc_msgSend(v12, "pbDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setExpiresAt:", v17);
  if (self)
    dictionary = self->_dictionary;
  else
    dictionary = 0;
  -[FCThreadSafeMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v19, v11);

}

- (void)importAVAssetKey:(id)a3
{
  FCThreadSafeMutableDictionary *dictionary;
  void *v5;
  FCThreadSafeMutableDictionary *v6;
  id v7;
  void *v8;
  id v9;

  if (self)
    dictionary = self->_dictionary;
  else
    dictionary = 0;
  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = dictionary;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCThreadSafeMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, v8);

}

- (void)removeAllAssetKeys
{
  if (self)
    self = (FCAVEphemeralAssetKeyCache *)self->_dictionary;
  -[FCAVEphemeralAssetKeyCache removeAllObjects](self, "removeAllObjects");
}

- (void)saveKeyServerCertificate:(id)a3
{
  NSData *v4;
  NSData *keyServerCertificate;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  keyServerCertificate = self->_keyServerCertificate;
  self->_keyServerCertificate = v4;

}

- (void)clearKeyServerCertificate
{
  NSData *keyServerCertificate;

  keyServerCertificate = self->_keyServerCertificate;
  self->_keyServerCertificate = 0;

}

- (NSData)keyServerCertificate
{
  return self->_keyServerCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_keyServerCertificate, 0);
}

@end
