@implementation FCMutableNotificationData

- (FCMutableNotificationData)init
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
    v8 = "-[FCMutableNotificationData init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    v11 = 1024;
    v12 = 159;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMutableNotificationData init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCMutableNotificationData)initWithDictionary:(id)a3
{
  id v4;
  FCMutableNotificationData *v5;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCMutableNotificationData initWithDictionary:]";
    v11 = 2080;
    v12 = "FCFileCoordinatedNotificationDropbox.m";
    v13 = 1024;
    v14 = 164;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8.receiver = self;
  v8.super_class = (Class)FCMutableNotificationData;
  v5 = -[FCNotificationDropboxData initWithDictionary:](&v8, sel_initWithDictionary_, v4);

  return v5;
}

- (void)setBaseURLString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCNotificationDropboxDataBaseURLDictionaryKey"));

}

- (void)setNotificationUserID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCNotificationDropboxDataNotificationUserIDDictionaryKey"));

}

- (void)setDeviceToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCNotificationDropboxDataDeviceTokenDictionaryKey"));

}

- (void)setStorefrontID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCNotificationDropboxDataStorefrontIDDictionaryKey"));

}

- (void)setDeviceDigestMode:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[FCNotificationDropboxData dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FCNotificationDropboxDataDeviceDigestModeKey"));

}

@end
