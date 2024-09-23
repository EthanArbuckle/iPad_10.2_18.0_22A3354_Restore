@implementation FTRegAccountMonitor

- (FTRegAccountMonitor)initWithServiceType:(int64_t)a3
{
  FTRegAccountMonitor *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  FTRegConnectionHandler *v8;
  FTRegConnectionHandler *connectionHandler;
  FTRegAccountMonitor *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)FTRegAccountMonitor;
  v4 = -[FTRegAccountMonitor init](&v12, sel_init);
  if (v4)
  {
    FTCServiceNameForServiceType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE50370], "serviceWithInternalName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      v10 = 0;
      goto LABEL_11;
    }
    -[FTRegAccountMonitor setServiceType:](v4, "setServiceType:", a3);
    -[FTRegAccountMonitor setService:](v4, "setService:", v6);
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Creating monitor with service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v8 = -[FTRegConnectionHandler initWithServiceType:name:]([FTRegConnectionHandler alloc], "initWithServiceType:name:", a3, CFSTR("AccountMonitor"));
    connectionHandler = v4->_connectionHandler;
    v4->_connectionHandler = v8;

    -[FTRegAccountMonitor _startListeningForNotifications](v4, "_startListeningForNotifications");
    -[FTRegAccountMonitor _updateAccountState:](v4, "_updateAccountState:", 0);

  }
  v10 = v4;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FTRegAccountMonitor;
  -[FTRegAccountMonitor dealloc](&v4, sel_dealloc);
}

- (id)logName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FTRegAccountMonitor service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AccountMonitor[%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_activeAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTRegAccountMonitor service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

uint64_t __38__FTRegAccountMonitor__activeAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (objc_msgSend(v2, "CNFRegSignInComplete")
    && (objc_msgSend(v2, "accountType") != 1 || objc_msgSend(v2, "profileValidationStatus") == 3))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(v2, "aliases", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if (objc_msgSend(v2, "validationStatusForAlias:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) == 3)
          {
            v4 = 1;
            goto LABEL_15;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateAccountState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  NSArray *v13;
  NSArray *accounts;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating account state", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogIndent();
  if (-[FTRegConnectionHandler isConnectedToDaemon](self->_connectionHandler, "isConnectedToDaemon"))
  {
    -[FTRegAccountMonitor _activeAccounts](self, "_activeAccounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7 == -[NSArray count](self->_accounts, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = self->_accounts;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v9)
      {
        v10 = 0;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v10 |= objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)) ^ 1;
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        }
        while (v9);

        if ((v10 & 1) != 0)
          goto LABEL_16;
      }
      else
      {

      }
      OSLogHandleForIDSCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "No change in accounts", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      goto LABEL_36;
    }
LABEL_16:
    v13 = (NSArray *)objc_msgSend(v6, "copy");
    accounts = self->_accounts;
    self->_accounts = v13;

    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      if (v3)
        v16 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Accounts changed, posting: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("FTRegActiveAccountsChangedNotification"), self, 0);

    }
LABEL_36:

    goto LABEL_37;
  }
  OSLogHandleForIDSCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Not updating because we aren't connected", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
LABEL_37:
  CNFRegLogOutdent();
}

- (BOOL)_shouldHandleAccountNofication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTRegAccountMonitor service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_startListeningForNotifications
{
  id v3;

  if ((*(_BYTE *)&self->_monitorFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonConnected_, *MEMORY[0x24BE50118], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50028], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50030], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE500B8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50008], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE4FFB8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50058], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50068], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50018], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50020], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE4FFA8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50038], 0);
    *(_BYTE *)&self->_monitorFlags |= 1u;

  }
}

- (void)_stopListeningForNotifications
{
  id v3;

  if ((*(_BYTE *)&self->_monitorFlags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50118], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50028], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50030], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE500B8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50008], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFB8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50058], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50068], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50018], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50020], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFA8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50038], 0);
    *(_BYTE *)&self->_monitorFlags &= ~1u;

  }
}

- (void)_handleAccountNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[FTRegAccountMonitor _shouldHandleAccountNofication:](self, "_shouldHandleAccountNofication:", v4))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating account due to notification: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    -[FTRegAccountMonitor _updateAccountState:](self, "_updateAccountState:", 1);
    CNFRegLogOutdent();
  }

}

- (void)_handleDaemonConnected:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Connected to daemon", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[FTRegAccountMonitor _updateAccountState:](self, "_updateAccountState:", 1);

}

- (IMServiceImpl)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSArray)activeAccounts
{
  return self->_accounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
