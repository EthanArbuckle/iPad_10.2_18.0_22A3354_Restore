@implementation IMDCKSyncTokenStore

- (void)migrateKey:(id)a3 fromDatabase:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "migrateKey:fromDatabase:", v6, v5);

}

- (id)tokenForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "tokenForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)persistToken:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "persistToken:forKey:", v6, v5);

}

+ (void)migrateKey:(id)a3 fromDatabase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-syncStoreVersion"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!IMGetAppIntForKey())
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        v20 = 2048;
        v21 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Migrating sync token {key: %@, db: %@, version: %ld}", buf, 0x20u);
      }

    }
    v9 = objc_alloc(MEMORY[0x1E0D35250]);
    objc_msgSend(v6, "stringByExpandingTildeInPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithPath:storeName:dataProtectionClass:", v10, CFSTR("IMDCKChatSyncController"), 0);

    objc_msgSend(v11, "dataForKey:error:", v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = IMOSLoggingEnabled(v12);
    if (v12)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Found token data, saving to sms.db {key: %@}", buf, 0xCu);
        }

      }
      IMDKVPersistValueForKey();
    }
    else if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "No token data found {key: %@}", buf, 0xCu);
      }

    }
    objc_msgSend(v11, "deleteDatabase");
    IMSetAppValueForKey();

  }
}

+ (id)tokenForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMDKVValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v11);
    v6 = v11;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95100]), "initWithCoder:", v5);
    v8 = (void *)v7;
    if (v6 && IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Failed to unarchive ckserver change token. Error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)persistToken:(id)a3 forKey:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB36F8];
    v6 = a4;
    v7 = (id)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v9, "encodeWithCoder:", v7);
    objc_msgSend(v7, "encodedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMDKVPersistValueForKey();

  }
  else
  {
    v7 = a4;
    IMDKVPersistValueForKey();
  }

}

@end
