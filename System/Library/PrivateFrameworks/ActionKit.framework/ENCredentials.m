@implementation ENCredentials

- (ENCredentials)initWithHost:(id)a3 edamUserId:(id)a4 noteStoreUrl:(id)a5 webApiUrlPrefix:(id)a6 authenticationToken:(id)a7 expirationDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ENCredentials *v20;
  ENCredentials *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ENCredentials;
  v20 = -[ENCredentials init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[ENCredentials setHost:](v20, "setHost:", v14);
    -[ENCredentials setEdamUserId:](v21, "setEdamUserId:", v15);
    -[ENCredentials setNoteStoreUrl:](v21, "setNoteStoreUrl:", v16);
    -[ENCredentials setWebApiUrlPrefix:](v21, "setWebApiUrlPrefix:", v17);
    -[ENCredentials setAuthenticationToken:](v21, "setAuthenticationToken:", v18);
    -[ENCredentials setExpirationDate:](v21, "setExpirationDate:", v19);
  }

  return v21;
}

- (ENCredentials)initWithHost:(id)a3 authenticationResult:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ENCredentials *v17;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "id");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v9, "intValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteStoreUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webApiUrlPrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticationToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v6, "expiration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v15, "longLongValue") / 1000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ENCredentials initWithHost:edamUserId:noteStoreUrl:webApiUrlPrefix:authenticationToken:expirationDate:](self, "initWithHost:edamUserId:noteStoreUrl:webApiUrlPrefix:authenticationToken:expirationDate:", v7, v10, v11, v12, v13, v16);

  return v17;
}

- (BOOL)saveToKeychain
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v8;

  -[ENCredentials keychainQuery](self, "keychainQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPassword:", self->_authenticationToken);
  v8 = 0;
  v4 = objc_msgSend(v3, "save:", &v8);
  v5 = v8;
  v6 = v5;
  if ((v4 & 1) == 0)
    NSLog(CFSTR("Error saving to keychain: %@ %ld"), v5, objc_msgSend(v5, "code"));

  return v4;
}

- (void)deleteFromKeychain
{
  id v2;

  -[ENCredentials keychainQuery](self, "keychainQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItem:", 0);

}

- (NSString)authenticationToken
{
  void *v2;
  id v3;
  void *v4;
  id v6;

  -[ENCredentials keychainQuery](self, "keychainQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "fetch:", &v6);
  v3 = v6;
  objc_msgSend(v2, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("Error getting password from keychain: %@"), v3);

  return (NSString *)v4;
}

- (BOOL)areValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[ENCredentials expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCredentials expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

- (id)keychainQuery
{
  ENSSKeychainQuery *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[ENSSKeychain setAccessibilityType:](ENSSKeychain, "setAccessibilityType:", *MEMORY[0x24BDE8F70]);
  v3 = objc_alloc_init(ENSSKeychainQuery);
  -[ENCredentials host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSSKeychainQuery setService:](v3, "setService:", v4);

  -[ENCredentials edamUserId](self, "edamUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSSKeychainQuery setAccount:](v3, "setAccount:", v5);

  +[ENSession keychainAccessGroup](ENSession, "keychainAccessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[ENSession keychainAccessGroup](ENSession, "keychainAccessGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENSSKeychainQuery setAccessGroup:](v3, "setAccessGroup:", v7);

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ENCredentials host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("host"));

  -[ENCredentials edamUserId](self, "edamUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("edamUserId"));

  -[ENCredentials noteStoreUrl](self, "noteStoreUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("noteStoreUrl"));

  -[ENCredentials webApiUrlPrefix](self, "webApiUrlPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("webApiUrlPrefix"));

  -[ENCredentials expirationDate](self, "expirationDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("expirationDate"));

}

- (ENCredentials)initWithCoder:(id)a3
{
  id v4;
  ENCredentials *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENCredentials;
  v5 = -[ENCredentials init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("host"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentials setHost:](v5, "setHost:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("edamUserId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentials setEdamUserId:](v5, "setEdamUserId:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("noteStoreUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentials setNoteStoreUrl:](v5, "setNoteStoreUrl:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("webApiUrlPrefix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentials setWebApiUrlPrefix:](v5, "setWebApiUrlPrefix:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("expirationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCredentials setExpirationDate:](v5, "setExpirationDate:", v10);

  }
  return v5;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)edamUserId
{
  return self->_edamUserId;
}

- (void)setEdamUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setWebApiUrlPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_edamUserId, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
