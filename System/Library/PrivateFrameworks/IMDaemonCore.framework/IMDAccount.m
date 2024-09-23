@implementation IMDAccount

- (BOOL)isActive
{
  void *v3;
  void *v4;
  char v5;

  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAccountActive:", v4);

  return v5;
}

- (id)accountInfoToPost
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDAccount accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D37390], v4);

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (const void *)*MEMORY[0x1E0D37380];
    -[IMDAccount accountDefaults](self, "accountDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v3, v7, v8);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IMDServiceSession capabilities](self->_session, "capabilities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D37378], v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDAccount loginStatus](self, "loginStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D37398], v10);

  -[IMDAccount serviceLoginStatusMessage](self, "serviceLoginStatusMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D373A0], v11);

  -[IMDServiceSession buddyProperties](self->_session, "buddyProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  if (objc_msgSend(v13, "count"))
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D37370], v13);
  -[IMDServiceSession groups](self->_session, "groups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (const void *)*MEMORY[0x1E0D37388];
    -[IMDServiceSession groups](self->_session, "groups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v3, v16, v17);

  }
  return v3;
}

- (IMDService)service
{
  return self->_service;
}

- (IMDServiceSession)session
{
  return self->_session;
}

- (NSString)serviceLoginStatusMessage
{
  return self->_serviceLoginStatusMessage;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSDictionary)accountDefaults
{
  return &self->_accountDefaults->super;
}

- (IMDAccount)initWithAccountID:(id)a3 defaults:(id)a4 service:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMDAccount *v12;
  IMDAccount *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *accountDefaults;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)IMDAccount;
  v12 = -[IMDAccount init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v9;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Creating account id: %@    defaults: %@    on service: %@", buf, 0x20u);
      }

    }
    objc_storeStrong((id *)&v13->_accountID, a3);
    objc_storeStrong((id *)&v13->_service, a5);
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addListener:", v13);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = objc_msgSend(v10, "mutableCopy");
      accountDefaults = v13->_accountDefaults;
      v13->_accountDefaults = (NSMutableDictionary *)v16;

    }
    else
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = v13->_accountDefaults;
      v13->_accountDefaults = v19;

      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v27 = v10;
          v28 = 2112;
          v29 = v23;
          v24 = v23;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "IMDAccount: incoming 'defaults' is not a dictionary, %@, %@", buf, 0x16u);

        }
      }
    }
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMDAccount;
  -[IMDAccount dealloc](&v4, sel_dealloc);
}

- (int64_t)accountType
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;

  -[IMDAccount loginID](self, "loginID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("P:"));

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return 2;
  -[IMDAccount service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsAuthorization");

  return v6;
}

- (void)setIsManaged:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0D36F08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v7);

  self->_managed = a3;
}

- (BOOL)canMakeDowngradeRoutingChecks
{
  void *v3;
  char v4;

  if (-[IMDAccount accountType](self, "accountType") != 2)
    return 0;
  -[IMDAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCapability:", *MEMORY[0x1E0D38E98]);

  return v4;
}

- (BOOL)wasDisabledAutomatically
{
  void *v2;
  void *v3;
  char v4;

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AccountManaged"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setWasDisabledAutomatically:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObject:forKey:", v6, CFSTR("AccountManaged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v5);

}

- (BOOL)isDisabled
{
  void *v3;
  void *v4;

  +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentalControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "disableAccount:", self);

  return (char)self;
}

- (void)writeAccountDefaults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  IMDAccount *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      v28 = 2112;
      v29 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%@ - write account defaults: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isNull") & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v12, "length"))
          {
            objc_msgSend(v6, "removeObjectForKey:", v11);
            -[NSMutableDictionary removeObjectForKey:](self->_accountDefaults, "removeObjectForKey:", v11);
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    -[NSMutableDictionary addEntriesFromDictionary:](self->_accountDefaults, "addEntriesFromDictionary:", v6);
  }
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "broadcasterForListenersSupportingService:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount accountID](self, "accountID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount accountDefaults](self, "accountDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v15, "account:defaultsChanged:", v16, v18);

  -[IMDAccount session](self, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accountDefaultsChanged:", v4);

  if (objc_msgSend(v4, "count")
    && !-[IMDAccount isLoading](self, "isLoading")
    && !-[IMDAccount isManaged](self, "isManaged"))
  {
    -[IMDAccount service](self, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delayedSaveSettings");

  }
}

- (void)postAccountCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *context;

  context = (void *)MEMORY[0x1D17EA968](self, a2);
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForListenersSupportingService:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDAccount session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount accountDefaults](self, "accountDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "blockingMode");
  v11 = objc_msgSend(v5, "blockIdleStatus");
  v12 = objc_msgSend(v5, "capabilities");
  v13 = -[IMDAccount loginStatus](self, "loginStatus");
  -[IMDAccount serviceLoginStatusMessage](self, "serviceLoginStatusMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account:defaults:blockList:allowList:blockingMode:blockIdleStatus:status:capabilities:serviceLoginStatus:loginStatusMessage:", v6, v7, v8, v9, v10, v11, 0, v12, v13, v14);

  objc_autoreleasePoolPop(context);
}

- (void)createSessionIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  IMDServiceSession *session;
  void *v10;
  IMDServiceSession *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  IMDServiceSession *v23;
  int v24;
  IMDAccount *v25;
  __int16 v26;
  IMDServiceSession *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[IMDAccount isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEFAULT, "%@: Account is restricted, not creating session", (uint8_t *)&v24, 0xCu);
    }
LABEL_27:

    return;
  }
  if (-[IMDAccount wasDisabledAutomatically](self, "wasDisabledAutomatically"))
    -[IMDAccount setWasDisabledAutomatically:](self, "setWasDisabledAutomatically:", 0);
  -[IMDAccount session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[IMDAccount service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainService");
    v3 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject supportsOneSessionForAllAccounts](v3, "supportsOneSessionForAllAccounts"))
    {
      +[IMDServiceSession existingServiceSessionForService:](IMDServiceSession, "existingServiceSessionForService:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDAccount setSession:](self, "setSession:", v6);

    }
    if (self->_session)
    {
      -[IMDAccount session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAccount:", self);

      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        v24 = 138412546;
        v25 = self;
        v26 = 2112;
        v27 = session;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEFAULT, "%@: Reused existing session: %@", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc((Class)-[NSObject sessionClass](v3, "sessionClass")), "initWithAccount:service:", self, v3);
      -[IMDAccount setSession:](self, "setSession:", v10);

      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_session;
        -[NSObject internalName](v3, "internalName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass((Class)-[NSObject sessionClass](v3, "sessionClass"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138413058;
        v25 = self;
        v26 = 2112;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEFAULT, "%@: Created active session: %@ of service type: %@   (Session class: %@)", (uint8_t *)&v24, 0x2Au);

      }
    }

    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = self;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "%@: Telling session it became active", (uint8_t *)&v24, 0xCu);
      }

    }
    -[IMDAccount session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionDidBecomeActive");

    -[IMDAccount service](self, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldForceAccountsConnected");

    if (v18)
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = self;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "%@: Forcing login", (uint8_t *)&v24, 0xCu);
        }

      }
      -[IMDAccount session](self, "session");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "login");

    }
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[IMDAccount session](self, "session");
      v23 = (IMDServiceSession *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_DEFAULT, "%@: Done setting up session: %@", (uint8_t *)&v24, 0x16u);

    }
    goto LABEL_27;
  }
}

- (void)_createReplicationSessionsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSArray *v26;
  NSArray *replicationSessions;
  __int128 v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  IMDAccount *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_replicationSessions)
  {
    -[IMDAccount session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[IMDAccount service](self, "service");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mainService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replicationServices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[IMDAccount service](self, "service");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mainService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "replicationServices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        obj = v10;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
        {
          v13 = *(_QWORD *)v32;
          *(_QWORD *)&v12 = 138412802;
          v28 = v12;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
              +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController", v28);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "activeAccountsForService:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              -[IMDAccount session](self, "session");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "preferredAccountForReplicationOnService:eligibleAccounts:", v15, v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                v21 = objc_alloc((Class)objc_msgSend(v15, "sessionClass"));
                -[IMDAccount session](self, "session");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (void *)objc_msgSend(v21, "initWithAccount:service:replicatingForSession:", v19, v15, v22);

                objc_msgSend(v23, "sessionDidBecomeActive");
                objc_msgSend(v30, "addObject:", v23);

              }
              else if (IMOSLoggingEnabled(v20))
              {
                OSLogHandleForIMFoundationCategory();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  -[IMDAccount loginID](self, "loginID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v28;
                  v36 = self;
                  v37 = 2112;
                  v38 = v15;
                  v39 = 2112;
                  v40 = v25;
                  _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Cannot create replication session for %@, no account found for %@ (loginID: %@)", buf, 0x20u);

                }
              }

              ++v14;
            }
            while (v11 != v14);
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          }
          while (v11);
        }

        v26 = (NSArray *)objc_msgSend(v30, "copy");
        replicationSessions = self->_replicationSessions;
        self->_replicationSessions = v26;

      }
    }
  }
}

- (void)releaseSession
{
  void *v3;

  -[IMDAccount session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWillBecomeInactiveWithAccount:", self);

  -[IMDAccount setSession:](self, "setSession:", 0);
}

- (NSArray)replicationSessions
{
  -[IMDAccount createSessionIfNecessary](self, "createSessionIfNecessary");
  -[IMDAccount _createReplicationSessionsIfNecessary](self, "_createReplicationSessionsIfNecessary");
  return self->_replicationSessions;
}

- (void)resetReplicationSessions
{
  NSObject *v3;
  NSArray *replicationSessions;
  void *v5;
  int v6;
  IMDAccount *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting replication session for %@", (uint8_t *)&v6, 0xCu);
    }

  }
  replicationSessions = self->_replicationSessions;
  self->_replicationSessions = 0;

  -[IMDAccount session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_replicationSessionsChanged");

}

- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5
{
  uint64_t v5;
  __CFDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  id value;

  v5 = *(_QWORD *)&a4;
  value = a5;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F70], v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F60], v10);

  if (value)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F58], value);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0D36F68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v11);

}

- (NSString)loginID
{
  void *v3;
  void *v4;
  NSString **p_loginID;
  NSString *loginID;
  NSString *v7;

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D36F00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  loginID = self->_loginID;
  p_loginID = &self->_loginID;
  if (!-[NSString isEqualToString:](loginID, "isEqualToString:", v4))
    objc_storeStrong((id *)p_loginID, v4);
  v7 = *p_loginID;

  return v7;
}

- (NSArray)aliases
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMDAccount accountDefaults](self, "accountDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D36E80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0D36E60];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "objectForKeyedSubscript:", v9, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "trimmedString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "addObject:", v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (id)_registrationInfo
{
  void *v2;
  void *v3;

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)registrationStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDAccount _registrationInfo](self, "_registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (int)registrationError
{
  void *v2;
  void *v3;
  int v4;

  -[IMDAccount _registrationInfo](self, "_registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  return (-[IMDAccount registrationError](self, "registrationError") & 0xFFFFFFFE) == 28;
}

- (NSDictionary)registrationAlertInfo
{
  void *v2;
  void *v3;

  -[IMDAccount _registrationInfo](self, "_registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v14 = a4;
  v10 = a6;
  if (-[IMDAccount loginStatus](self, "loginStatus") != a3
    || -[IMDAccount serviceDisconnectReason](self, "serviceDisconnectReason") != (_DWORD)v7)
  {
    goto LABEL_5;
  }
  -[IMDAccount serviceLoginStatusMessage](self, "serviceLoginStatusMessage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v14)
  {

    goto LABEL_6;
  }
  -[IMDAccount serviceLoginStatusMessage](self, "serviceLoginStatusMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v14, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
LABEL_5:
    -[IMDAccount _forceSetLoginStatus:message:reason:properties:](self, "_forceSetLoginStatus:message:reason:properties:", a3, v14, v7, v10);
LABEL_6:

}

- (void)setLoginStatus:(unint64_t)a3 message:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setLoginStatus_message_reason_properties_);
}

- (void)_forceSetLoginStatus:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  IMDAccount *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[IMDAccount session](self, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413570;
      v20 = self;
      v21 = 2048;
      v22 = a3;
      v23 = 2112;
      v24 = v10;
      v25 = 1024;
      v26 = v7;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "-[%@ _forceSetLoginStatus:%lu message:%@ reason:%d properties:%@] session=%@", (uint8_t *)&v19, 0x3Au);

    }
  }
  v14 = -[IMDAccount loginStatus](self, "loginStatus");
  -[IMDAccount setLoginStatus:](self, "setLoginStatus:", a3);
  -[IMDAccount setServiceDisconnectReason:](self, "setServiceDisconnectReason:", v7);
  -[IMDAccount serviceLoginStatusMessage](self, "serviceLoginStatusMessage");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15 == v10;

  if (!v16)
  {
    v17 = (void *)objc_msgSend(v10, "copy");
    -[IMDAccount setServiceLoginStatusMessage:](self, "setServiceLoginStatusMessage:", v17);

  }
  -[IMDAccount session](self, "session");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "__forceSetLoginStatus:oldStatus:message:reason:properties:account:", a3, v14, v10, v7, v11, self);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDAccount accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccount service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMDAccount:%p, ID:%@, Service:%@ >"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)profileInfo
{
  void *v2;
  void *v3;

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)profileValidationStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isRegistered
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0D39648], sel_isAccountRegistered_);
}

- (BOOL)isSMSRelayCapable
{
  void *v2;
  void *v3;
  char v4;

  -[IMDAccount accountDefaults](self, "accountDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_isUsableForSending
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D39648];
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isAccountUsableForSendingWithAllAccounts:account:", v5, self);

  return (char)self;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLoginID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_loginStatus = a3;
}

- (int)serviceDisconnectReason
{
  return self->_serviceDisconnectReason;
}

- (void)setServiceDisconnectReason:(int)a3
{
  self->_serviceDisconnectReason = a3;
}

- (void)setServiceLoginStatusMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)shouldPublishNowPlaying
{
  return self->_shouldPublishNowPlaying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoginStatusMessage, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_replicationSessions, 0);
  objc_storeStrong((id *)&self->_accountDefaults, 0);
}

@end
