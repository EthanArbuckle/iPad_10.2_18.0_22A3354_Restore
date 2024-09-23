@implementation ENCredentialStore

- (ENCredentialStore)init
{
  ENCredentialStore *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENCredentialStore;
  v2 = -[ENCredentialStore init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentialStore setStore:](v2, "setStore:", v3);

  }
  return v2;
}

- (void)addCredentials:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "saveToKeychain"))
  {
    -[ENCredentialStore store](self, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
}

- (id)credentialsForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ENCredentialStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || objc_msgSend(v6, "areValid")
    && (objc_msgSend(v6, "authenticationToken"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = v6;
  }
  else
  {
    -[ENCredentialStore removeCredentials:](self, "removeCredentials:", v6);
    v8 = 0;
  }

  return v8;
}

- (void)removeCredentials:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "deleteFromKeychain");
  -[ENCredentialStore store](self, "store");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)clearAllCredentials
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ENCredentialStore store](self, "store", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "deleteFromKeychain");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[ENCredentialStore store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENCredentialStore store](self, "store");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("store"));

}

- (ENCredentialStore)initWithCoder:(id)a3
{
  id v4;
  ENCredentialStore *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENCredentialStore;
  v5 = -[ENCredentialStore init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("store"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentialStore setStore:](v5, "setStore:", v6);

  }
  return v5;
}

- (NSMutableDictionary)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

+ (id)loadCredentialsFromAppDefaults
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EvernoteCredentials"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchiveObjectWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
