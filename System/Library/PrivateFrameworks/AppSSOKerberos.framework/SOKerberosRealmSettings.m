@implementation SOKerberosRealmSettings

- (SOKerberosRealmSettings)initWithRealm:(id)a3
{
  id v5;
  NSObject *v6;
  SOKerberosRealmSettings *v7;
  uint64_t v8;
  NSMutableArray *siteCodeCache;
  uint64_t v10;
  NSUserDefaults *defaults;
  NSUserDefaults *v12;
  void *v13;
  uint64_t v14;
  NSString *notificationName;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SOKerberosRealmSettings *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SO_LOG_SOKerberosRealmSettings();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SOKerberosRealmSettings initWithRealm:]";
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_215A1B000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v17.receiver = self;
  v17.super_class = (Class)SOKerberosRealmSettings;
  v7 = -[SOKerberosRealmSettings init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    siteCodeCache = v7->_siteCodeCache;
    v7->_siteCodeCache = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_realm, a3);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    defaults = v7->_defaults;
    v7->_defaults = (NSUserDefaults *)v10;

    v12 = v7->_defaults;
    -[SOKerberosRealmSettings realmKey:](v7, "realmKey:", CFSTR("siteCodeCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v7, v13, 5, 0);

    v7->_notifyToken = -1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.Kerberos.%@"), v5);
    v14 = objc_claimAutoreleasedReturnValue();
    notificationName = v7->_notificationName;
    v7->_notificationName = (NSString *)v14;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)realmKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SOKerberosRealmSettings realm](self, "realm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAllValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[SOKerberosRealmSettings realm](self, "realm", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(":"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "hasPrefix:", v13);

        if (v14)
        {
          -[SOKerberosRealmSettings defaults](self, "defaults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)save
{
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD580]);
}

- (NSString)userPrincipalName
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userPrincipalName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setUserPrincipalName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userPrincipalName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSString)userName
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setUserName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSUUID)credentialUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("credentialUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
  else
    v6 = 0;

  return (NSUUID *)v6;
}

- (void)setCredentialUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("credentialUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (NSData)pkinitPersistientRef
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("pkinitPersistientRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setPkinitPersistientRef:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("pkinitPersistientRef"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSString)smartCardTokenID
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("smartCardTokenID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setSmartCardTokenID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("smartCardTokenID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateLastLogin
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLastLogin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateLastLogin:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLastLogin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)datePasswordLastChanged
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordLastChanged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDatePasswordLastChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordLastChanged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)datePasswordLastChangedAtLogin
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordLastChangedAtLogin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDatePasswordLastChangedAtLogin:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordLastChangedAtLogin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateNextPacRefresh
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateNextPacRefresh"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateNextPacRefresh:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateNextPacRefresh"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateADPasswordCanChange
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordCanChange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateADPasswordCanChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordCanChange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateLocalPasswordLastChanged
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLocalPasswordLastChanged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateLocalPasswordLastChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLocalPasswordLastChanged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateADPasswordLastChangedWhenSynced
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateADPasswordLastChangedWhenSynced"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateADPasswordLastChangedWhenSynced:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateADPasswordLastChangedWhenSynced"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateLocalPasswordLastChangedWhenSynced
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLocalPasswordLastChangedWhenSynced"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateLocalPasswordLastChangedWhenSynced:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLocalPasswordLastChangedWhenSynced"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)datePasswordExpires
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordExpires"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDatePasswordExpires:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("datePasswordExpires"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (BOOL)passwordNeverExpires
{
  void *v3;
  void *v4;
  char v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("passwordNeverExpires"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setPasswordNeverExpires:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("passwordNeverExpires"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (NSDate)dateExpirationNotificationSent
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateExpirationNotificationSent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateExpirationNotificationSent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateExpirationNotificationSent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSDate)dateExpirationChecked
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateExpirationChecked"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateExpirationChecked:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateExpirationChecked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (NSNumber)daysUntilExpiration
{
  void *v2;
  double v3;
  double v4;

  -[SOKerberosRealmSettings datePasswordExpires](self, "datePasswordExpires");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4 / 86400.0);
}

- (NSString)networkHomeDirectory
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("networkHomeDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setNetworkHomeDirectory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("networkHomeDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (BOOL)delayUserSetupCleared
{
  void *v3;
  void *v4;
  char v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("delayUserSetupCleared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setDelayUserSetupCleared:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("delayUserSetupCleared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (BOOL)networkAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("networkAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setNetworkAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("networkAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (BOOL)userCancelledLogin
{
  void *v3;
  void *v4;
  char v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userCancelledLogin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setUserCancelledLogin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("userCancelledLogin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (NSDate)dateLoginCancelled
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLoginCancelled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateLoginCancelled:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateLoginCancelled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (BOOL)passwordChangeInProgress
{
  void *v3;
  void *v4;
  char v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("passwordChangeInProgress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setPasswordChangeInProgress:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("passwordChangeInProgress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (NSDate)dateUserSignedOut
{
  void *v3;
  void *v4;
  void *v5;

  -[SOKerberosRealmSettings defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateUserSignedOut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDateUserSignedOut:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SOKerberosRealmSettings defaults](self, "defaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("dateUserSignedOut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (OS_dispatch_semaphore)platformSSOLoginSemaphore
{
  SOKerberosRealmSettings *v2;
  OS_dispatch_semaphore *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_platformSSOLoginSemaphore;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)platformSSOLoginInProgress
{
  int notifyToken;
  int *p_notifyToken;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  uint64_t state64;

  p_notifyToken = &self->_notifyToken;
  notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    if (notify_register_check(-[NSString UTF8String](self->_notificationName, "UTF8String"), p_notifyToken))
    {
      SO_LOG_SOKerberosRealmSettings();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SOKerberosRealmSettings platformSSOLoginInProgress].cold.3();

    }
    notifyToken = *p_notifyToken;
    state64 = 0;
    if (notifyToken == -1)
    {
      SO_LOG_SOKerberosRealmSettings();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SOKerberosRealmSettings platformSSOLoginInProgress].cold.1(v6);
      goto LABEL_13;
    }
  }
  else
  {
    state64 = 0;
  }
  if (notify_get_state(notifyToken, &state64))
  {
    SO_LOG_SOKerberosRealmSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SOKerberosRealmSettings platformSSOLoginInProgress].cold.2();
LABEL_13:

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", state64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setPlatformSSOLoginInProgress:(BOOL)a3
{
  _BOOL4 v3;
  int notifyToken;
  int *p_notifyToken;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  v3 = a3;
  p_notifyToken = &self->_notifyToken;
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    goto LABEL_17;
  if (notify_register_check(-[NSString UTF8String](self->_notificationName, "UTF8String"), p_notifyToken))
  {
    SO_LOG_SOKerberosRealmSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosRealmSettings platformSSOLoginInProgress].cold.3();

  }
  notifyToken = *p_notifyToken;
  if (*p_notifyToken != -1)
  {
LABEL_17:
    if (notify_set_state(notifyToken, v3))
    {
      SO_LOG_SOKerberosRealmSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SOKerberosRealmSettings setPlatformSSOLoginInProgress:].cold.2();

    }
  }
  if (notify_post(-[NSString UTF8String](self->_notificationName, "UTF8String")))
  {
    SO_LOG_SOKerberosRealmSettings();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOKerberosRealmSettings setPlatformSSOLoginInProgress:].cold.1();

  }
}

- (void)startListeningForPlatformSSOTGTChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "notify_register_dispatch failed: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOKerberosRealmSettings_startListeningForPlatformSSOTGTChanges__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = objc_msgSend(*(id *)(a1 + 32), "platformSSOLoginInProgress");
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    if (!v3)
    {
      v4 = dispatch_semaphore_create(0);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;
LABEL_6:

    }
  }
  else if (v3)
  {
    dispatch_semaphore_signal(v3);
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;
    goto LABEL_6;
  }
  objc_sync_exit(obj);

}

- (id)dumpSiteCodeCache
{
  SOKerberosRealmSettings *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[SOKerberosRealmSettings siteCodeCache](v2, "siteCodeCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (void)cacheSiteCode:(id)a3
{
  id v4;
  SOKerberosRealmSettings *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SOKerberosRealmSettings siteCodeCache](v5, "siteCodeCache", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "networkFingerprint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "networkFingerprint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
          -[NSMutableArray removeObject:](v5->_siteCodeCache, "removeObject:", v11);
        objc_msgSend(v11, "age");
        if (v15 > 432000.0)
          -[NSMutableArray removeObject:](v5->_siteCodeCache, "removeObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  SO_LOG_SOKerberosRealmSettings();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "code");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosRealmSettings cacheSiteCode:].cold.1(v17, (uint64_t)v22, v16);
  }

  -[NSMutableArray addObject:](v5->_siteCodeCache, "addObject:", v4);
  -[SOKerberosRealmSettings saveSiteCodes](v5, "saveSiteCodes");
  objc_sync_exit(v5);

}

- (id)siteCodeForNetworkFingerprint:(id)a3
{
  id v4;
  SOKerberosRealmSettings *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SOKerberosRealmSettings siteCodeCache](v5, "siteCodeCache", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "networkFingerprint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          SO_LOG_SOKerberosRealmSettings();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "code");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SOKerberosRealmSettings siteCodeForNetworkFingerprint:].cold.1(v14, (uint64_t)v20, v13);
          }

          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v5);
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  SOKerberosRealmSettings *v17;
  void *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  OS_dispatch_semaphore *platformSSOLoginSemaphore;
  void *v22;
  NSObject *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  SO_LOG_SOKerberosRealmSettings();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:].cold.3();

  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("siteCodeCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isEqualToString:", v13);

  if (v14)
    -[SOKerberosRealmSettings loadSiteCodes](self, "loadSiteCodes");
  -[SOKerberosRealmSettings realmKey:](self, "realmKey:", CFSTR("platformSSOLoginInProgress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqualToString:", v15);

  if (v16)
  {
    v17 = self;
    objc_sync_enter(v17);
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      SO_LOG_SOKerberosRealmSettings();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:].cold.2();

      v20 = dispatch_semaphore_create(0);
      platformSSOLoginSemaphore = v17->_platformSSOLoginSemaphore;
      v17->_platformSSOLoginSemaphore = (OS_dispatch_semaphore *)v20;

    }
    else
    {
      -[SOKerberosRealmSettings platformSSOLoginSemaphore](v17, "platformSSOLoginSemaphore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        SO_LOG_SOKerberosRealmSettings();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:].cold.1();

        dispatch_semaphore_signal((dispatch_semaphore_t)v17->_platformSSOLoginSemaphore);
      }
    }
    objc_sync_exit(v17);

  }
}

- (void)loadSiteCodes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "Error deserializing plist: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveSiteCodes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "Error archiving site code cache: error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSMutableArray)siteCodeCache
{
  return self->_siteCodeCache;
}

- (void)setSiteCodeCache:(id)a3
{
  objc_storeStrong((id *)&self->_siteCodeCache, a3);
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRealm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_notificationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_siteCodeCache, 0);
  objc_storeStrong((id *)&self->_platformSSOLoginSemaphore, 0);
}

- (void)platformSSOLoginInProgress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setPlatformSSOLoginInProgress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setPlatformSSOLoginInProgress:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cacheSiteCode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a3, (uint64_t)a3, "caching site code: %@", (uint8_t *)a2);

}

- (void)siteCodeForNetworkFingerprint:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a3, (uint64_t)a3, "found cached site code: %@", (uint8_t *)a2);

}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "signaling sem: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "Creating sem: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_215A1B000, v1, OS_LOG_TYPE_DEBUG, "Defaults updated: %@, %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
