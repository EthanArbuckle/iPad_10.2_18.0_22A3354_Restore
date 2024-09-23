@implementation CalCalendarMigrationCalDAVPrincipal

- (CalCalendarMigrationCalDAVPrincipal)initWithUid:(id)a3
{
  id v4;
  CalCalendarMigrationCalDAVPrincipal *v5;
  uint64_t v6;
  NSString *uid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalCalendarMigrationCalDAVPrincipal;
  v5 = -[CalCalendarMigrationCalDAVPrincipal init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uid = v5->_uid;
    v5->_uid = (NSString *)v6;

  }
  return v5;
}

- (id)dictionaryForAccountProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v29;

  -[CalCalendarMigrationCalDAVPrincipal principalURL](self, "principalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal uid](self, "uid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE14180]);

    v6 = (void *)MEMORY[0x24BDD1808];
    -[CalCalendarMigrationCalDAVPrincipal principalURL](self, "principalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQuery:", 0);
    objc_msgSend(v8, "setFragment:", 0);
    -[CalCalendarMigrationCalDAVPrincipal login](self, "login");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUser:", v9);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE14178]);
    -[CalCalendarMigrationCalDAVPrincipal homePath](self, "homePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal _absoluteURLStringWithBaseComponents:andPath:](self, "_absoluteURLStringWithBaseComponents:andPath:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE140E8]);
    -[CalCalendarMigrationCalDAVPrincipal defaultCalendarPath](self, "defaultCalendarPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal _absoluteURLStringWithBaseComponents:andPath:](self, "_absoluteURLStringWithBaseComponents:andPath:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE14130]);
    -[CalCalendarMigrationCalDAVPrincipal inboxPath](self, "inboxPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal _absoluteURLStringWithBaseComponents:andPath:](self, "_absoluteURLStringWithBaseComponents:andPath:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE14100]);
    -[CalCalendarMigrationCalDAVPrincipal outboxPath](self, "outboxPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal _absoluteURLStringWithBaseComponents:andPath:](self, "_absoluteURLStringWithBaseComponents:andPath:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE14118]);
    -[CalCalendarMigrationCalDAVPrincipal notificationCollectionPath](self, "notificationCollectionPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalCalendarMigrationCalDAVPrincipal _absoluteURLStringWithBaseComponents:andPath:](self, "_absoluteURLStringWithBaseComponents:andPath:", v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE14160]);
    -[CalCalendarMigrationCalDAVPrincipal fullName](self, "fullName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE14138]);

    -[CalCalendarMigrationCalDAVPrincipal homePushKey](self, "homePushKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE14120]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationCalDAVPrincipal isWritable](self, "isWritable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE14158]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalCalendarMigrationCalDAVPrincipal isDelegate](self, "isDelegate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE14140]);

    -[CalCalendarMigrationCalDAVPrincipal _packedPreferredCalendarUserAddresses](self, "_packedPreferredCalendarUserAddresses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE14168]);

    -[CalCalendarMigrationCalDAVPrincipal pushTransports](self, "pushTransports");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE14188]);

    v26 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    +[CalMigrationLog calendar](CalMigrationLog, "calendar");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CalCalendarMigrationCalDAVPrincipal dictionaryForAccountProperties].cold.1(self, v27);

    v26 = 0;
  }
  return v26;
}

- (NSString)principalPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1808];
  -[CalCalendarMigrationCalDAVPrincipal principalURL](self, "principalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_absoluteURLStringWithBaseComponents:(id)a3 andPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = a4;
  if (a4)
  {
    v5 = a3;
    objc_msgSend(v5, "setPath:", v4);
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_packedPreferredCalendarUserAddresses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CalCalendarMigrationCalDAVPrincipal preferredCalendarUserAddresses](self, "preferredCalendarUserAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCEB8];
    -[CalCalendarMigrationCalDAVPrincipal preferredCalendarUserAddresses](self, "preferredCalendarUserAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[CalCalendarMigrationCalDAVPrincipal preferredCalendarUserAddresses](self, "preferredCalendarUserAddresses", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x24BE12398], "packCalDAVUserAdress:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v3;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && -[CalCalendarMigrationCalDAVPrincipal _anyCalendarUserAddressIsEquivalentToURL:](self, "_anyCalendarUserAddressIsEquivalentToURL:", v5))
    {
      v6 = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mailto:%@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9
        && -[CalCalendarMigrationCalDAVPrincipal _anyCalendarUserAddressIsEquivalentToURL:](self, "_anyCalendarUserAddressIsEquivalentToURL:", v9))
      {
        v6 = 1;
      }
      else
      {
        v10 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tel:%@"), v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v12
          && -[CalCalendarMigrationCalDAVPrincipal _anyCalendarUserAddressIsEquivalentToURL:](self, "_anyCalendarUserAddressIsEquivalentToURL:", v12);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CalCalendarMigrationCalDAVPrincipal addressIsAccountOwner:](self, "addressIsAccountOwner:", v4);

  return (char)self;
}

- (BOOL)_anyCalendarUserAddressIsEquivalentToURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CalCalendarMigrationCalDAVPrincipal preferredCalendarUserAddresses](self, "preferredCalendarUserAddresses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isSameAsUserAddressURL:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)ownerUid
{
  return self->_ownerUid;
}

- (void)setOwnerUid:(id)a3
{
  objc_storeStrong((id *)&self->_ownerUid, a3);
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_principalURL, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)homePushKey
{
  return self->_homePushKey;
}

- (void)setHomePushKey:(id)a3
{
  objc_storeStrong((id *)&self->_homePushKey, a3);
}

- (NSString)homePath
{
  return self->_homePath;
}

- (void)setHomePath:(id)a3
{
  objc_storeStrong((id *)&self->_homePath, a3);
}

- (NSString)defaultCalendarPath
{
  return self->_defaultCalendarPath;
}

- (void)setDefaultCalendarPath:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCalendarPath, a3);
}

- (NSString)inboxPath
{
  return self->_inboxPath;
}

- (void)setInboxPath:(id)a3
{
  objc_storeStrong((id *)&self->_inboxPath, a3);
}

- (NSString)outboxPath
{
  return self->_outboxPath;
}

- (void)setOutboxPath:(id)a3
{
  objc_storeStrong((id *)&self->_outboxPath, a3);
}

- (NSString)notificationCollectionPath
{
  return self->_notificationCollectionPath;
}

- (void)setNotificationCollectionPath:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCollectionPath, a3);
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (void)setWritable:(BOOL)a3
{
  self->_writable = a3;
}

- (BOOL)isDelegate
{
  return self->_delegate;
}

- (void)setDelegate:(BOOL)a3
{
  self->_delegate = a3;
}

- (BOOL)isExpandPropertyReportSupported
{
  return self->_expandPropertyReportSupported;
}

- (void)setExpandPropertyReportSupported:(BOOL)a3
{
  self->_expandPropertyReportSupported = a3;
}

- (NSArray)preferredCalendarUserAddresses
{
  return self->_preferredCalendarUserAddresses;
}

- (void)setPreferredCalendarUserAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_preferredCalendarUserAddresses, a3);
}

- (NSDictionary)pushTransports
{
  return self->_pushTransports;
}

- (void)setPushTransports:(id)a3
{
  objc_storeStrong((id *)&self->_pushTransports, a3);
}

- (NSString)login
{
  return self->_login;
}

- (void)setLogin:(id)a3
{
  objc_storeStrong((id *)&self->_login, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_login, 0);
  objc_storeStrong((id *)&self->_pushTransports, 0);
  objc_storeStrong((id *)&self->_preferredCalendarUserAddresses, 0);
  objc_storeStrong((id *)&self->_notificationCollectionPath, 0);
  objc_storeStrong((id *)&self->_outboxPath, 0);
  objc_storeStrong((id *)&self->_inboxPath, 0);
  objc_storeStrong((id *)&self->_defaultCalendarPath, 0);
  objc_storeStrong((id *)&self->_homePath, 0);
  objc_storeStrong((id *)&self->_homePushKey, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_ownerUid, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

- (void)dictionaryForAccountProperties
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_215A53000, a2, OS_LOG_TYPE_ERROR, "Cannot create dictionary for CalDAVPrincipal %{public}@ because it has no principal URL", (uint8_t *)&v4, 0xCu);

}

@end
