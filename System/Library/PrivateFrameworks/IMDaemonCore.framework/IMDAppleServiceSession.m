@implementation IMDAppleServiceSession

- (IMDAppleServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  IMDAppleServiceSession *v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)IMDAppleServiceSession;
  v5 = -[IMDServiceSession initWithAccount:service:](&v11, sel_initWithAccount_service_, a3);
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "%@: Initialized!  (Environment: %@)", buf, 0x16u);
    }
    v5->_GUID = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v5->_serviceName = (NSString *)(id)objc_msgSend(a4, "internalName");
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *GUID;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    GUID = self->_GUID;
    *(_DWORD *)buf = 138412290;
    v7 = GUID;
    _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc service session: %@", buf, 0xCu);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)IMDAppleServiceSession;
  -[IMDServiceSession dealloc](&v5, sel_dealloc);
}

- (IDSAccount)idsAccount
{
  IMDAccount *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[IMDServiceSession account](self, "account");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IMDInconsistencyResolved((uint64_t)self);
    return (IDSAccount *)-[IMDAccount idsAccount](v3, "idsAccount");
  }
  else
  {
    if (-[IMDServiceSession isActive](self, "isActive"))
    {
      -[IMDServiceSession accounts](self, "accounts");
      IMDNoticedInconsistency((uint64_t)self, (uint64_t)CFSTR("********** We don't have an IDSAccount, please file a radar ********** State: service session = %@, accounts = %@"), v5, v6, v7, v8, v9, v10, (uint64_t)self);
    }
    return 0;
  }
}

- (id)imdAccountForIDSAccount:(id)a3
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[IMDServiceSession isReplicating](self, "isReplicating"))
    return -[IMDServiceSession account](self, "account");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = -[IMDServiceSession accounts](self, "accounts");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (id)objc_msgSend(v11, "idsAccount") == a3)
        {
          IMDInconsistencyResolved((uint64_t)self);
          return v11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  if (-[IMDServiceSession isActive](self, "isActive"))
  {
    -[IMDServiceSession accounts](self, "accounts");
    IMDNoticedInconsistency((uint64_t)self, (uint64_t)CFSTR("********** We couldn't find an IMDAccount for the IDSAccount, please file a radar ********** State: service session = %@, IDSAccount = %@, accounts = %@"), v12, v13, v14, v15, v16, v17, (uint64_t)self);
  }
  return 0;
}

- (NSArray)registeredURIs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  IMDAppleServiceSession *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "idsAccounts");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = (void *)objc_msgSend(v9, "im_registeredURIs");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "_URIFromFZIDType:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "_FZBestGuessFZIDType"));
              if (objc_msgSend(v15, "length"))
                objc_msgSend(v3, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v12);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
  {
    IMDInconsistencyResolved((uint64_t)v23);
    return (NSArray *)objc_msgSend(v3, "allObjects");
  }
  else
  {
    if (-[IMDServiceSession isActive](v23, "isActive"))
    {
      objc_msgSend((id)objc_opt_class(), "idsAccounts");
      IMDNoticedInconsistency((uint64_t)v23, (uint64_t)CFSTR("********** Requesting registered URIs but we don't have an IDSAccount, please file a radar ********** State: service session = %@, accounts = %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v23);
    }
    return 0;
  }
}

- (BOOL)_isDeviceRegistered
{
  return -[IDSAccount registrationStatus](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "registrationStatus") == 5;
}

- (BOOL)_isDeviceRegisteredForAccount:(id)a3
{
  return objc_msgSend(a3, "canSend");
}

- (void)_updateAccountStatusToUnregistered:(BOOL)a3 withAccount:(id)a4
{
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  if (a3 || objc_msgSend(a4, "registrationStatus") >= 2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0D36F60]);
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x1E0D36F70]);
    objc_msgSend(a4, "writeAccountDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0D36F68]));

    if (v5)
    {
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      objc_msgSend(a4, "writeAccountDefaults:", objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0D36E80]));
    }
  }
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(a4, "writeAccountDefaults:", objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0D36ED0]));
}

- (void)sessionDidBecomeActive
{
  NSObject *v3;
  NSObject *v4;
  NSString *v5;
  uint64_t v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[IMDAppleServiceSession sessionDidBecomeActive]";
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v4 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[IMDServiceSession accountID](self, "accountID");
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
    *(_DWORD *)buf = 138412546;
    v9 = (const char *)v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEFAULT, "Session activating: %@ on Environment: %@", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)IMDAppleServiceSession;
  -[IMDServiceSession sessionDidBecomeActive](&v7, sel_sessionDidBecomeActive);
  -[IMDAppleServiceSession refreshRegistration](self, "refreshRegistration");
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSString *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[IMDAppleServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[IMDServiceSession accountID](self, "accountID");
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
    *(_DWORD *)buf = 138412546;
    v11 = (const char *)v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Session deactivating: %@ on Environment: %@", buf, 0x16u);
  }
  IMDInconsistencyResolved((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)IMDAppleServiceSession;
  -[IMDServiceSession sessionWillBecomeInactiveWithAccount:](&v9, sel_sessionWillBecomeInactiveWithAccount_, a3);
  -[IMDAppleServiceSession _updateAccountStatusToUnregistered:withAccount:](self, "_updateAccountStatusToUnregistered:withAccount:", 0, a3);
  -[IMDAppleServiceSession refreshRegistration](self, "refreshRegistration");
}

- (void)loginServiceSessionWithAccount:(id)a3
{
  NSObject *v5;
  int v6;
  IMDAppleServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "AppleServiceSession: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMDServiceSession refreshServiceCapabilities](self, "refreshServiceCapabilities");
  -[IMDServiceSession serviceSessionDidLoginWithAccount:](self, "serviceSessionDidLoginWithAccount:", a3);
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  NSObject *v5;
  int v6;
  IMDAppleServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "AppleServiceSession: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if (objc_msgSend(a3, "loginStatus") != 2)
  {
    objc_msgSend(a3, "setLoginStatus:message:", 0, 0);
    -[IMDServiceSession serviceSessionDidLogoutWithAccount:](self, "serviceSessionDidLogoutWithAccount:", a3);
  }
}

- (void)authenticateAccount:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
    v22 = 2112;
    v23 = a3;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Client requested re-authenticate (Environment: %@) account: %@", buf, 0x16u);
  }
  if (objc_msgSend(a3, "length"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = -[IMDServiceSession accounts](self, "accounts");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v16;
      *(_QWORD *)&v8 = 138412290;
      v14 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v14;
                v21 = (uint64_t)v12;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Found account to re-authenticate account: %@", buf, 0xCu);
              }
              objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "authenticateAccount");
            }
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }
}

- (void)registerAccount:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Client requested re-register (Environment: %@)", buf, 0xCu);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[IMDServiceSession accounts](self, "accounts");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138412290;
    v14 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              v21 = (uint64_t)v12;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Found account to re-register account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "registerAccount");
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

- (void)unregisterAccount:(id)a3
{
  NSObject *v5;
  IMDAccount *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  IMDAccount *v12;
  NSObject *v13;
  IMDAppleServiceSession *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"), "deviceInformationString");
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Client requested de-register (Environment: %@)", buf, 0xCu);
  }
  v6 = -[IMDServiceSession account](self, "account");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = self;
  v7 = -[IMDServiceSession accounts](self, "accounts");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(IMDAccount **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[NSString isEqualToString:](-[IMDAccount accountID](v12, "accountID"), "isEqualToString:", a3))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v21 = (uint64_t)v12;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Found account to de-register account: %@", buf, 0xCu);
            }
            objc_msgSend((id)-[IMDAccount idsAccount](v12, "idsAccount"), "unregisterAccount");
            v6 = v12;
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  -[IMDAppleServiceSession _updateAccountStatusToUnregistered:withAccount:](v14, "_updateAccountStatusToUnregistered:withAccount:", 1, v6);
}

- (void)passwordUpdatedWithAccount:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a3;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Client requested password updated (account: %@)", buf, 0xCu);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[IMDServiceSession accounts](self, "accounts");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138412290;
    v14 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              v21 = v12;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Found account to update password account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "passwordUpdated");
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5
{
  NSObject *v9;
  NSArray *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a5;
    _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_DEFAULT, "Client updateAuthorizationCredentials (account: %@)", buf, 0xCu);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = -[IMDServiceSession accounts](self, "accounts");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v20;
    *(_QWORD *)&v12 = 138412290;
    v18 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v16, "accountID", v18), "isEqualToString:", a5))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              v25 = v16;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEFAULT, "Found account to updateAuthorizationCredentials: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v16, "idsAccount"), "updateAuthorizationCredentials:token:", a3, a4);
          }
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }
}

- (int64_t)_validationStatusForAlias:(id)a3 onAccount:(id)a4
{
  int64_t result;
  id v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a3, "length");
  if (result)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = -[IMDAppleServiceSession _aliasesForIDSAccount:](self, "_aliasesForIDSAccount:", a4, 0);
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v15;
      v11 = *MEMORY[0x1E0D35148];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(v13, "objectForKey:", v11), "isEqualToString:", a3) & 1) != 0)
            return (int)objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D35150]), "intValue");
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        result = 0;
        if (v9)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)_aliasStringsForIDSAccount:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[IMDAppleServiceSession _aliasesForIDSAccount:](self, "_aliasesForIDSAccount:", a3, 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x1E0D35148];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "objectForKey:", v10);
        if (objc_msgSend(v12, "length"))
        {
          if (MEMORY[0x1D17EA35C](v12))
            v12 = (void *)IMCanonicalizeFormattedString();
          objc_msgSend(v5, "addObject:", v12);
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)_aliases
{
  return -[IMDAppleServiceSession _aliasesForIDSAccount:](self, "_aliasesForIDSAccount:", -[IMDAppleServiceSession idsAccount](self, "idsAccount"));
}

- (id)_aliasesForIDSAccount:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "aliases"), "__imArrayByApplyingBlock:", &unk_1E922F7C8);
}

- (void)removeAliases:(id)a3 account:(id)a4
{
  NSObject *v6;
  IDSAccount *v7;
  IMDAccount *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  IMDAccount *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  IMDAppleServiceSession *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = a3;
    v32 = 2112;
    v33 = a4;
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Client request to remove aliases: %@ account: %@", buf, 0x16u);
  }
  v7 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  v8 = -[IMDServiceSession account](self, "account");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = self;
  v9 = -[IMDServiceSession accounts](self, "accounts");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(IMDAccount **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (-[NSString isEqualToString:](-[IMDAccount accountID](v14, "accountID"), "isEqualToString:", a4))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = (IDSAccount *)-[IMDAccount idsAccount](v14, "idsAccount");
            v15 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v31 = a3;
              v32 = 2112;
              v33 = v14;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "Found account to remove aliases: %@  account: %@", buf, 0x16u);
            }
            v8 = v14;
          }
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }
  v16 = (void *)objc_msgSend(a3, "__imArrayByApplyingBlock:", &unk_1E922F7E8);
  if (objc_msgSend(v16, "count"))
  {
    v17 = objc_msgSend(-[IMDAppleServiceSession _aliasesForIDSAccount:](v23, "_aliasesForIDSAccount:", v7), "count");
    if (v17 - 1 >= 0)
    {
      v18 = v17;
      v19 = *MEMORY[0x1E0D35148];
      v20 = *MEMORY[0x1E0D36ED0];
      while (1)
      {
        v21 = objc_msgSend((id)objc_msgSend(-[IMDAppleServiceSession _aliasesForIDSAccount:](v23, "_aliasesForIDSAccount:", v7), "objectAtIndex:", --v18), "objectForKey:", v19);
        if (objc_msgSend(v16, "containsObject:", v21))
        {
          v22 = -[NSDictionary objectForKey:](-[IMDAccount accountDefaults](v8, "accountDefaults"), "objectForKey:", v20);
          if (objc_msgSend(v22, "length"))
          {
            if (objc_msgSend(v22, "isEqualToString:", v21))
              break;
          }
        }
        if (v18 <= 0)
          goto LABEL_24;
      }
      -[IMDAccount writeAccountDefaults:](v8, "writeAccountDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), v20));
    }
LABEL_24:
    -[IDSAccount removeAliases:](v7, "removeAliases:", v16);
  }
}

- (void)addAliases:(id)a3 account:(id)a4
{
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = a3;
    v24 = 2112;
    v25 = a4;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Client request to add aliases: %@  account: %@", buf, 0x16u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[IMDServiceSession accounts](self, "accounts");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    *(_QWORD *)&v10 = 138412546;
    v16 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              v23 = a3;
              v24 = 2112;
              v25 = v14;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "Found account to add aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "addAliases:", a3);
          }
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

- (void)validateAliases:(id)a3 account:(id)a4
{
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = a3;
    v24 = 2112;
    v25 = a4;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Client request to validate: %@  account: %@", buf, 0x16u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[IMDServiceSession accounts](self, "accounts");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    *(_QWORD *)&v10 = 138412546;
    v16 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              v23 = a3;
              v24 = 2112;
              v25 = v14;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "Found account to validate aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "validateAliases:", a3);
          }
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

- (void)unvalidateAliases:(id)a3 account:(id)a4
{
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = a3;
    v24 = 2112;
    v25 = a4;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Client request to unvalidate: %@  account: %@", buf, 0x16u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[IMDServiceSession accounts](self, "accounts");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    *(_QWORD *)&v10 = 138412546;
    v16 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v14, "accountID", v16), "isEqualToString:", a4))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              v23 = a3;
              v24 = 2112;
              v25 = v14;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_DEFAULT, "Found account to unvalidate aliases: %@  account: %@", buf, 0x16u);
            }
            objc_msgSend((id)objc_msgSend(v14, "idsAccount"), "unvalidateAliases:", a3);
          }
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
}

- (void)validateProfileWithAccount:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a3;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Client request to validate profile info: %@", buf, 0xCu);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[IMDServiceSession accounts](self, "accounts");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138412290;
    v14 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "accountID", v14), "isEqualToString:", a3))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              v21 = v12;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Found account to validate profile info account: %@", buf, 0xCu);
            }
            objc_msgSend((id)objc_msgSend(v12, "idsAccount"), "validateProfile");
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

- (void)resetCallerIDForIDSAccount:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[IMDAppleServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:")
    && objc_msgSend((id)objc_msgSend(a3, "vettedAliases"), "count"))
  {
    v5 = (void *)objc_msgSend(a3, "accountInfo");
    v6 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D35170]);
    v7 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = objc_msgSend(a3, "uniqueID");
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Checking specified caller ID: %@ on account: %@, accountDefaults: %@", (uint8_t *)&v14, 0x20u);
    }
    if (!objc_msgSend(v6, "length"))
    {
      v13 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v14) = 0;
      v11 = "No caller ID specified, moving along";
      v12 = v13;
      goto LABEL_11;
    }
    v8 = -[IMDAppleServiceSession validationStatusForAlias:onAccount:](self, "validationStatusForAlias:onAccount:", v6, a3);
    v9 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == 3)
    {
      if (!v10)
        return;
      LOWORD(v14) = 0;
      v11 = " Caller ID is valid, registered and in good shape, moving along";
      v12 = v9;
LABEL_11:
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 2u);
      return;
    }
    if (v10)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_DEFAULT, "Caller ID isn't validated, try repair if we find another account with the same caller id. clearing caller ID settings for current account", (uint8_t *)&v14, 2u);
    }
    -[IMDAppleServiceSession tryToRepairCallerID:forIDSAccount:](self, "tryToRepairCallerID:forIDSAccount:", v6, a3);
    objc_msgSend(a3, "setDisplayName:", 0);
  }
}

- (void)tryToRepairCallerID:(id)a3 forIDSAccount:(id)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[IMDAppleServiceSession isiMessageServiceIDSAccount:](self, "isiMessageServiceIDSAccount:", a4))
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)IMPreferredAccountMap(), "objectForKey:", *MEMORY[0x1E0D38F68]), "objectForKey:", CFSTR("guid"));
    v8 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = (uint64_t)v7;
      v29 = 2112;
      v30 = objc_msgSend(a4, "uniqueID");
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Current preferred account: [%@], account to repair: [%@]", buf, 0x16u);
    }
    if (objc_msgSend(v7, "isEqualToString:", objc_msgSend(a4, "uniqueID")))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = (void *)objc_msgSend((id)objc_opt_class(), "idsAccounts");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
      {
        v12 = v10;
        v13 = *(_QWORD *)v23;
        *(_QWORD *)&v11 = 138412546;
        v21 = v11;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isEqual:", a4, v21, (_QWORD)v22) & 1) == 0
              && -[IMDAppleServiceSession isiMessageServiceIDSAccount:](self, "isiMessageServiceIDSAccount:", v15))
            {
              v16 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = objc_msgSend(v15, "uniqueID");
                v18 = objc_msgSend(v15, "displayName");
                *(_DWORD *)buf = v21;
                v28 = v17;
                v29 = 2112;
                v30 = v18;
                _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Found another iMessage account: [%@], displayName: [%@]", buf, 0x16u);
              }
              if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v15, "displayName")))
              {
                IMRegisterForPreferredAccountChangeNotificationsInternal();
                v19 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = objc_msgSend(v15, "uniqueID");
                  *(_DWORD *)buf = v21;
                  v28 = (uint64_t)a3;
                  v29 = 2112;
                  v30 = v20;
                  _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_DEFAULT, "CallerID Repair - Found a match for callerID: [%@], update preferred account to: [%@] for iMessage", buf, 0x16u);
                }
                objc_msgSend(v15, "uniqueID");
                IMUpdatePreferredAccountForService();
              }
            }
          }
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }
    }
  }
}

- (BOOL)isiMessageServiceIDSAccount:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "serviceName"), "isEqualToString:", CFSTR("com.apple.madrid"));
}

- (void)refreshRegistration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "idsAccounts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[IMDAppleServiceSession resetCallerIDForIDSAccount:](self, "resetCallerIDForIDSAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)reregister
{
  IDSAccount *v2;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  MEMORY[0x1E0DE7D20](v2, sel__reregisterAndReidentify_);
}

- (void)reIdentify
{
  IDSAccount *v2;

  v2 = -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  MEMORY[0x1E0DE7D20](v2, sel__reregisterAndReidentify_);
}

- (NSArray)vettedAliases
{
  return (NSArray *)-[IDSAccount vettedAliases](-[IMDAppleServiceSession idsAccount](self, "idsAccount"), "vettedAliases");
}

- (NSArray)aliases
{
  return (NSArray *)-[IMDAppleServiceSession _aliasStringsForIDSAccount:](self, "_aliasStringsForIDSAccount:", -[IMDAppleServiceSession idsAccount](self, "idsAccount"));
}

- (int64_t)validationStatusForAlias:(id)a3
{
  -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  return MEMORY[0x1E0DE7D20](self, sel__validationStatusForAlias_onAccount_);
}

- (int64_t)validationStatusForAlias:(id)a3 onAccount:(id)a4
{
  return MEMORY[0x1E0DE7D20](self, sel__validationStatusForAlias_onAccount_);
}

- (NSString)callerURI
{
  -[IMDAppleServiceSession idsAccount](self, "idsAccount");
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel_callerURIForIDSAccount_);
}

- (id)callerURIForIDSAccount:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "accountType")
    || (v22 = (void *)objc_msgSend((id)objc_msgSend(a3, "loginID"), "_URIFromCanonicalizedPhoneNumber"),
        !objc_msgSend(v22, "length")))
  {
    v5 = (void *)objc_msgSend(a3, "im_registeredURIs");
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(a3, "accountInfo");
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D35170]);
      v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_1E922F808);
      v8 = (id)_IDSCopyCallerID();
      if (IMOSLoggingEnabled(v8))
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v31 = self;
          v32 = 2112;
          v33 = (uint64_t)v8;
          v34 = 2112;
          v35 = v7;
          v36 = 2112;
          v37 = a3;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "%@ callerID - choosing %@ from %@, idsAccount %@", buf, 0x2Au);
        }
      }
      v10 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v31 = self;
        v32 = 2112;
        v33 = (uint64_t)v8;
        v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "%@ callerID - choosing %@ from %@", buf, 0x20u);
      }
      v11 = (void *)objc_msgSend(v8, "lowercaseString");
      v12 = -[IMDAppleServiceSession _aliasStringsForIDSAccount:](self, "_aliasStringsForIDSAccount:", a3);
      v13 = objc_msgSend(v11, "length");
      v14 = (uint64_t *)MEMORY[0x1E0D35208];
      if (v13
        && objc_msgSend(v12, "containsObject:", v11)
        && !objc_msgSend(v11, "_appearsToBeDSID")
        || (v27 = 0u,
            v28 = 0u,
            v25 = 0u,
            v26 = 0u,
            (v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16)) == 0))
      {
LABEL_20:
        v19 = v11;
      }
      else
      {
        v16 = *(_QWORD *)v26;
        v17 = *v14;
LABEL_13:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "isEqualToIgnoringCase:", v17) & 1) == 0
            && !objc_msgSend(v19, "_appearsToBeDSID"))
          {
            break;
          }
          if (v15 == ++v18)
          {
            v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v15)
              goto LABEL_13;
            goto LABEL_20;
          }
        }
      }
      if ((objc_msgSend(v5, "containsObject:", v19) & 1) == 0)
      {
        v20 = objc_msgSend(0, "isEqualToIgnoringCase:", *v14);
        if ((_DWORD)v20)
        {
          if (IMOSLoggingEnabled(v20))
          {
            v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v31 = 0;
              v32 = 2112;
              v33 = (uint64_t)v5;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, " ** Selected display ID: %@  was not in URIs set: %@", buf, 0x16u);
            }
          }
        }
        v19 = (void *)objc_msgSend(v5, "__imFirstObject");
      }
      return (id)objc_msgSend(v19, "_URIFromFZIDType:", objc_msgSend(v19, "_FZBestGuessFZIDType"));
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v31 = a3;
          v32 = 2112;
          v33 = objc_msgSend(a3, "registeredURIs");
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "callerURI - No bindings !!, idsAccount %@ registeredURIs %@", buf, 0x16u);
        }
      }
      return 0;
    }
  }
  return v22;
}

+ (id)idsAccounts
{
  void *v2;

  if (qword_1ED9360D0 != -1)
    dispatch_once(&qword_1ED9360D0, &unk_1E922F828);
  v2 = (void *)objc_msgSend((id)qword_1ED9360C0, "accounts");
  if (objc_msgSend((id)objc_msgSend((id)qword_1ED9360C8, "accounts"), "count"))
    return (id)MEMORY[0x1E0DE7D20](v2, sel_setByAddingObjectsFromSet_);
  else
    return v2;
}

- (id)idsAccountForURI:(id)a3 IDSServiceName:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "idsAccounts");
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412546;
    v19 = v9;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend((id)objc_msgSend(v12, "serviceName", v19), "isEqualToString:", a4);
        if ((_DWORD)v13
          && (v14 = (void *)objc_msgSend(v12, "im_registeredURIs"),
              objc_msgSend(a3, "_stripFZIDPrefix"),
              v13 = objc_msgSend(v14, "containsObject:", IMCanonicalizeFormattedString()),
              (_DWORD)v13))
        {
          v15 = objc_msgSend(v12, "canSend");
          if ((v15 & 1) != 0)
            return v12;
          if (IMOSLoggingEnabled(v15))
          {
            v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v19;
              v25 = v12;
              v26 = 2112;
              v27 = a3;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "IDS Account (%@) registered for: %@ but registration status was wrong. Saving for later", buf, 0x16u);
            }
          }
          v7 = v12;
        }
        else if (IMOSLoggingEnabled(v13))
        {
          v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v25 = v7;
            v26 = 2112;
            v27 = a3;
            v28 = 2112;
            v29 = a4;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "IDS Account (%@) not registered for: %@, serviceName: %@, moving on", buf, 0x20u);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  return v7;
}

- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_idsAccountForURI_IDSServiceName_);
}

- (NSString)GUID
{
  return self->_GUID;
}

@end
