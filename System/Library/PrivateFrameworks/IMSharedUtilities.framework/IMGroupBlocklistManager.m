@implementation IMGroupBlocklistManager

+ (id)groupsBlocklistFilename
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  IMSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1EE501510, "stringByExpandingTildeInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/com.apple.messages.group-blacklist.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E311900;
  block[3] = &unk_1E3FB6278;
  block[4] = a1;
  if (qword_1ECFC74E0 != -1)
    dispatch_once(&qword_1ECFC74E0, block);
  return (id)qword_1EE5045D8;
}

- (IMGroupBlocklistManager)init
{
  IMGroupBlocklistManager *v2;
  id v3;
  void *v4;
  IMGroupBlocklistManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMGroupBlocklistManager;
  v2 = -[IMGroupBlocklistManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)qword_1EE506670;
    qword_1EE506670 = (uint64_t)v3;

    v5 = v2;
  }

  return v2;
}

- (id)initFromFile:(id)a3
{
  id v4;
  IMGroupBlocklistManager *v5;
  IMGroupBlocklistManager *v6;
  IMGroupBlocklistManager *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMGroupBlocklistManager;
  v5 = -[IMGroupBlocklistManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMGroupBlocklistManager loadFromFile:](v5, "loadFromFile:", v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)hasFileChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  char v12;
  uint64_t v13;

  -[IMGroupBlocklistManager lastModifiedDate](self, "lastModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMGroupBlocklistManager groupsBlocklistFilename](IMGroupBlocklistManager, "groupsBlocklistFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!v7)
    {
      if (v8)
      {
        -[IMGroupBlocklistManager lastModifiedDate](self, "lastModifiedDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "compare:", v8) != 0;

      }
    }

    return v9;
  }
  else
  {
    v12 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    return v12;
  }
}

- (void)blocklistGroupId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMGroupBlocklistManager isFeatureDisabled](self, "isFeatureDisabled"))
  {
    -[IMGroupBlocklistManager reloadIfNeeded](self, "reloadIfNeeded");
    objc_msgSend((id)qword_1EE506670, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Already blocklisted groupId: %@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
    else
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v4;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Blocklisting groupId: %@", (uint8_t *)&v11, 0xCu);
        }

      }
      v9 = (void *)qword_1EE506670;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v10, v4);

      -[IMGroupBlocklistManager save](self, "save");
    }
  }

}

- (BOOL)isGroupInBlocklist:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[IMGroupBlocklistManager isFeatureDisabled](self, "isFeatureDisabled"))
  {
    v5 = 0;
  }
  else
  {
    -[IMGroupBlocklistManager reloadIfNeeded](self, "reloadIfNeeded");
    objc_msgSend((id)qword_1EE506670, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)isFeatureDisabled
{
  void *v2;
  void *v3;
  NSObject *v4;
  char v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("md-group-blacklist-disable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Checking if feature is disabled by bag key: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  v5 = objc_msgSend(v3, "BOOLValue");

  return v5;
}

- (void)save
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[IMGroupBlocklistManager groupsBlocklistFilename](IMGroupBlocklistManager, "groupsBlocklistFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1EE506670;
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("file://"), "stringByAppendingString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "writeToURL:error:", v7, &v12);
  v8 = v12;

  v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v3;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Failed to save to %@: Error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Saved to %@", buf, 0xCu);
      }

    }
    -[IMGroupBlocklistManager _updateLastModifiedDate:](self, "_updateLastModifiedDate:", v3);
  }

}

- (void)loadData
{
  id v3;

  +[IMGroupBlocklistManager groupsBlocklistFilename](IMGroupBlocklistManager, "groupsBlocklistFilename");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMGroupBlocklistManager loadFromFile:](self, "loadFromFile:", v3);

}

- (void)loadFromFile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("file://"), "stringByAppendingString:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = objc_msgSend(v5, "initWithContentsOfURL:error:", v8, &v17);
  v10 = v17;
  v11 = (void *)qword_1EE506670;
  qword_1EE506670 = v9;

  LOBYTE(v7) = qword_1EE506670 == 0;
  v12 = IMOSLoggingEnabled();
  if ((v7 & 1) != 0)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = (uint64_t)v10;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Failed to load blocklist from file(%@). Error: %@", buf, 0x16u);
      }

    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = (void *)qword_1EE506670;
    qword_1EE506670 = (uint64_t)v15;

  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = qword_1EE506670;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Loaded blocklist from file(%@) %@.", buf, 0x16u);
      }

    }
    -[IMGroupBlocklistManager _updateLastModifiedDate:](self, "_updateLastModifiedDate:", v4);
  }

}

- (void)_updateLastModifiedDate:(id)a3
{
  NSDate *v4;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *v8;
  void *v9;
  NSObject *v10;
  NSDate *lastModifiedDate;
  NSObject *v12;
  NSDate *v13;
  id v14;
  uint8_t buf[4];
  NSDate *v16;
  __int16 v17;
  NSDate *v18;
  __int16 v19;
  NSDate *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NSDate *)a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDate *)v14;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2A88]);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMGroupBlocklistManager setLastModifiedDate:](self, "setLastModifiedDate:", v9);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        lastModifiedDate = self->_lastModifiedDate;
        *(_DWORD *)buf = 138412802;
        v16 = v4;
        v17 = 2112;
        v18 = v7;
        v19 = 2112;
        v20 = lastModifiedDate;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Failed to get date of last update from file(%@): %@. Set to %@.", buf, 0x20u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_lastModifiedDate;
        *(_DWORD *)buf = 138412802;
        v16 = v8;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Setting lastModifiedDate to %@ from %@ file(%@).", buf, 0x20u);
      }

    }
    -[IMGroupBlocklistManager setLastModifiedDate:](self, "setLastModifiedDate:", v8);
  }

}

- (void)reloadIfNeeded
{
  if (-[IMGroupBlocklistManager hasFileChanged](self, "hasFileChanged"))
    MEMORY[0x1E0DE7D20](self, sel_loadData);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

@end
