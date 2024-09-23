@implementation FCNotificationDropboxData

- (FCNotificationDropboxData)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationDropboxData init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    v11 = 1024;
    v12 = 98;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNotificationDropboxData init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCNotificationDropboxData)initWithDictionary:(id)a3
{
  id v5;
  FCNotificationDropboxData *v6;
  FCNotificationDropboxData *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCNotificationDropboxData initWithDictionary:]";
    v13 = 2080;
    v14 = "FCFileCoordinatedNotificationDropbox.m";
    v15 = 1024;
    v16 = 103;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCNotificationDropboxData;
  v6 = -[FCNotificationDropboxData init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (NSString)baseURLString
{
  void *v2;
  void *v3;

  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCNotificationDropboxDataBaseURLDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)notificationUserID
{
  void *v2;
  void *v3;

  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCNotificationDropboxDataNotificationUserIDDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceToken
{
  void *v2;
  void *v3;

  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCNotificationDropboxDataDeviceTokenDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storefrontID
{
  void *v2;
  void *v3;

  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCNotificationDropboxDataStorefrontIDDictionaryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)deviceDigestMode
{
  void *v2;
  void *v3;

  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FCNotificationDropboxDataDeviceDigestModeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "intValue");
  return (int)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCNotificationDropboxData *v5;
  void *v6;
  void *v7;
  FCNotificationDropboxData *v8;

  v5 = +[FCNotificationDropboxData allocWithZone:](FCNotificationDropboxData, "allocWithZone:");
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[FCNotificationDropboxData initWithDictionary:](v5, "initWithDictionary:", v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCMutableNotificationData *v5;
  void *v6;
  void *v7;
  FCMutableNotificationData *v8;

  v5 = +[FCMutableNotificationData allocWithZone:](FCMutableNotificationData, "allocWithZone:");
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[FCMutableNotificationData initWithDictionary:](v5, "initWithDictionary:", v7);

  return v8;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
