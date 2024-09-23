@implementation CNFRegController

+ (id)controllerForServiceType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  FTCServiceNameForServiceType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)controllerForServiceType__serviceMap;
    if (!controllerForServiceType__serviceMap)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = (void *)controllerForServiceType__serviceMap;
      controllerForServiceType__serviceMap = (uint64_t)v8;

      v7 = (void *)controllerForServiceType__serviceMap;
    }
    objc_msgSend(v7, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceType:", a3);
      objc_msgSend((id)controllerForServiceType__serviceMap, "setObject:forKey:", v10, v6);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CNFRegController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegController.m"), 103, CFSTR("Do not call init directly. Call +controllerForServices: instead"));

  return 0;
}

- (CNFRegController)initWithServiceType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int64_t v13;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *springboardNetworkFlagQueue;
  void *v19;
  void *v20;
  void *v21;
  CNFRegController *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  uint8_t v28[128];
  uint8_t buf[4];
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)CNFRegController;
  v22 = -[CNFRegController init](&v27, sel_init);
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addListener:", v22);

    v22->_systemAccountType = -1;
    -[CNFRegController setServiceType:](v22, "setServiceType:", a3);
    -[CNFRegController _purgeExcessAccounts](v22, "_purgeExcessAccounts");
    FTCServiceNameForServiceType();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@RegController"), v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListenerID:capabilities:", v20, *MEMORY[0x24BE509E8]);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    objc_msgSend(MEMORY[0x24BE50370], "serviceWithInternalName:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v6, "addObject:");
    }
    else
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (int64_t)v21;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Error loading service with name : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = a3;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Initializing with service type: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          OSLogHandleForIDSCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v13;
            _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "  => Service: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    -[CNFRegController setServices:](v22, "setServices:", v9);
    v15 = -[CNFRegController accounts](v22, "accounts");
    -[CNFRegController connect](v22, "connect");
    -[CNFRegController _startListeningForCallerIDChanges](v22, "_startListeningForCallerIDChanges");
    v16 = dispatch_queue_create("com.apple.conference.regcontroller.springboardnetworkflags", 0);
    springboardNetworkFlagQueue = v22->_springboardNetworkFlagQueue;
    v22->_springboardNetworkFlagQueue = (OS_dispatch_queue *)v16;

  }
  return v22;
}

- (IMServiceImpl)firstService
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNFRegController services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CNFRegController services](self, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (IMServiceImpl *)v6;
}

- (NSSet)serviceNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNFRegController services](self, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "internalName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNFRegController _stopWiFiAlertWatchTimer](self, "_stopWiFiAlertWatchTimer");
  objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  -[CNFRegController stopListeningForAccountChanges](self, "stopListeningForAccountChanges");
  -[CNFRegController _stopListeningForCallerIDChanges](self, "_stopListeningForCallerIDChanges");
  v4.receiver = self;
  v4.super_class = (Class)CNFRegController;
  -[CNFRegController dealloc](&v4, sel_dealloc);
}

- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector
{
  IDSPhoneSubscriptionSelector *phoneSubscriptionSelector;
  IDSPhoneSubscriptionSelector *v4;
  IDSPhoneSubscriptionSelector *v5;

  phoneSubscriptionSelector = self->_phoneSubscriptionSelector;
  if (!phoneSubscriptionSelector)
  {
    v4 = (IDSPhoneSubscriptionSelector *)objc_alloc_init(MEMORY[0x24BE4FC78]);
    v5 = self->_phoneSubscriptionSelector;
    self->_phoneSubscriptionSelector = v4;

    phoneSubscriptionSelector = self->_phoneSubscriptionSelector;
  }
  return phoneSubscriptionSelector;
}

- (NSArray)accounts
{
  NSArray *accounts;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSArray *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  CNFRegController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  accounts = self->_accounts;
  if (!accounts)
  {
    v24 = self;
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CNFRegController firstService](self, "firstService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Reloading the account list for service: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      -[CNFRegController firstService](v24, "firstService");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController firstService](v24, "firstService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsForService:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "count"))
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v23;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            OSLogHandleForIDSCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              CNFRegStringForAccount(v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v31 = v15;
              _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Found account: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              CNFRegStringForAccount(v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            objc_msgSend(v13, "uniqueID", v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PlaceholderAccount"));

            if ((v17 & 1) == 0)
              objc_msgSend(v8, "addObject:", v13);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

      v18 = objc_msgSend(v8, "copy");
      v19 = v24->_accounts;
      v24->_accounts = (NSArray *)v18;

    }
    else
    {
      OSLogHandleForIDSCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "Could not find any accounts to use", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    CNFRegLogOutdent();

    accounts = v24->_accounts;
  }
  return accounts;
}

- (id)firstAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[CNFRegController accounts](self, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accountWithLogin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CNFRegController accounts](self, "accounts", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[CNFRegController loginForAccount:](self, "loginForAccount:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if (v13)
          {
            v14 = v11;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_purgeExcessAccounts
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = -[CNFRegController serviceType](self, "serviceType");
  if (v2)
  {
    if (v2 != 1)
      return;
    objc_msgSend(MEMORY[0x24BE50368], "iMessageService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE50368], "facetimeService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v27)
  {
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "accountsForService:", v27);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v4;
    v5 = (void *)objc_msgSend(v4, "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v9, "accountType") == 2)
            objc_msgSend(v30, "removeObject:", v9);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v6);
    }

    if ((unint64_t)objc_msgSend(v30, "count") < 2)
      goto LABEL_50;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v30;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    if (!v11)
    {

      goto LABEL_32;
    }
    v12 = 0;
    v28 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v36;
LABEL_18:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
      if ((objc_msgSend(v16, "isOperational") & 1) != 0)
        break;
      if ((objc_msgSend(v16, "isRegistered") & 1) != 0)
      {
        v17 = v28;
        v18 = v12;
        v28 = v16;
        goto LABEL_26;
      }
      v17 = v12;
      v18 = v16;
      if (objc_msgSend(v16, "isActive"))
        goto LABEL_26;
LABEL_27:
      if (v11 == ++v15)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        if (!v11)
        {

          if (v13)
          {
            objc_msgSend(v10, "removeObject:", v13);
            goto LABEL_37;
          }
          if (v28)
          {
            objc_msgSend(v10, "removeObject:");
            v13 = 0;
            goto LABEL_37;
          }
          if (v12)
          {
            objc_msgSend(v10, "removeObject:", v12);
            v13 = 0;
            v28 = 0;
LABEL_37:
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v20 = v10;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v32 != v22)
                    objc_enumerationMutation(v20);
                  v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                  OSLogHandleForIDSCategory();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v24;
                    _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "Deleting excess account: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (IMShouldLog())
                    {
                      v26 = v24;
                      IMLogString();
                    }
                  }
                  objc_msgSend(v29, "deleteAccount:", v24, v26);
                }
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
              }
              while (v21);
            }

LABEL_50:
            return;
          }
LABEL_32:
          objc_msgSend(v10, "removeObjectAtIndex:", 0);
          v13 = 0;
          v28 = 0;
          v12 = 0;
          goto LABEL_37;
        }
        goto LABEL_18;
      }
    }
    v17 = v13;
    v18 = v12;
    v13 = v16;
LABEL_26:
    v19 = v16;

    v12 = v18;
    goto LABEL_27;
  }
}

- (BOOL)__ensureSingleAppleIDAccountExistsWithLogin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  CNFRegController *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v22 = self;
    -[CNFRegController appleIDAccounts](self, "appleIDAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Checking for extra Apple ID accounts, found %lu total", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v21 = (void *)objc_msgSend(v6, "count");
      IMLogString();
    }
    CNFRegLogIndent();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "login", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToIgnoringCase:", v4);

          if ((v15 & 1) != 0)
          {
            OSLogHandleForIDSCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              CNFRegStringForAccount(v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v29 = (uint64_t)v17;
              _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "Not nuking account because of matching login: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              CNFRegStringForAccount(v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            v9 = 1;
          }
          else
          {
            OSLogHandleForIDSCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              CNFRegStringForAccount(v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v29 = (uint64_t)v19;
              _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Nuking non-matching account: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              CNFRegStringForAccount(v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            -[CNFRegController _signOutAccount:](v22, "_signOutAccount:", v13, v21);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    CNFRegLogOutdent();
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (id)_createAccountWithLogin:(id)a3 foundExisting:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (!-[CNFRegController isConnected](self, "isConnected"))
      -[CNFRegController connect:](self, "connect:", 1);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v37);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v8;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Creating account with login: '%@'", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v35 = v8;
      IMLogString();
    }
    CNFRegLogIndent();
    if (objc_msgSend(v8, "length"))
    {
      IMGenerateLoginID();
      v36 = objc_claimAutoreleasedReturnValue();

      -[CNFRegController accounts](self, "accounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v44 = v12;
        _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Checking %lu existing accounts for duplicates", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v35 = (void *)objc_msgSend(v10, "count");
        IMLogString();
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v39;
LABEL_18:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
          objc_msgSend(v17, "login", v35);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x2199B88A4]();
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v7, "isEqualToString:", v19))
            break;

          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
            if (v14)
              goto LABEL_18;
            goto LABEL_24;
          }
        }
        OSLogHandleForIDSCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          CNFRegStringForAccount(v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = (uint64_t)v23;
          _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "Re-activating previously dormant account: %@", buf, 0xCu);

        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          CNFRegStringForAccount(v17);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          IMLogString();

        }
        v24 = v17;

        v20 = 1;
        if (v24)
          goto LABEL_55;
      }
      else
      {
LABEL_24:

        v20 = 0;
      }
      OSLogHandleForIDSCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "No existing accounts found. Creating.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      CNFRegLogIndent();
      v26 = objc_alloc(MEMORY[0x24BE50280]);
      -[CNFRegController firstService](self, "firstService");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v26, "initWithService:", v27);

      objc_msgSend(v24, "setLogin:", v36);
      objc_msgSend(v24, "setAutoLogin:", 1);
      OSLogHandleForIDSCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CNFRegStringForAccount(v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = (uint64_t)v29;
        _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "Created account: %@", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        CNFRegStringForAccount(v24);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
      OSLogHandleForIDSCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v30, OS_LOG_TYPE_DEFAULT, "Adding account to controller", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      objc_msgSend(MEMORY[0x24BE50288], "sharedInstance", v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "addAccount:", v24);

      if ((v32 & 1) == 0)
      {
        CNFRegLogIndent();
        OSLogHandleForIDSCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v33, OS_LOG_TYPE_DEFAULT, "WARNING: Failed to add account to controller", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();

        CNFRegLogOutdent();
        v24 = 0;
      }
      CNFRegLogOutdent();
LABEL_55:
      if (a4)
        *a4 = v20;
      -[CNFRegController __ensureSingleAppleIDAccountExistsWithLogin:](self, "__ensureSingleAppleIDAccountExistsWithLogin:", v36, v35);
      objc_msgSend(v24, "removeObjectForKey:", CFSTR("AccountSignedOut"));
      objc_msgSend(v24, "writeSettings");
      CNFRegLogOutdent();
      v21 = v24;

      v8 = (void *)v36;
    }
    else
    {
      CNFRegLogOutdent();
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)beginAccountSetupWithLogin:(id)a3 authID:(id)a4 authToken:(id)a5 regionInfo:(id)a6 foundExisting:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _BYTE *v28;
  _BYTE buf[24];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
    goto LABEL_17;
  v16 = objc_msgSend(v12, "length");
  v17 = 0;
  if (!v13)
    goto LABEL_18;
  if (!v16)
    goto LABEL_18;
  v18 = objc_msgSend(v13, "length");
  v17 = 0;
  if (!v14 || !v18)
    goto LABEL_18;
  if (!objc_msgSend(v14, "length"))
  {
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  -[CNFRegController _createAccountWithLogin:foundExisting:](self, "_createAccountWithLogin:foundExisting:", v12, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLogIndent();
  if (v17)
  {
    OSLogHandleForIDSCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "login");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v30 = v14;
      _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "Setting auth token (authID:'%@'   account:'%@'): %@", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v17, "login");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v14;
      v23 = v13;
      IMLogString();

    }
    objc_msgSend(v17, "updateAuthorizationCredentials:token:", v13, v14, v23, v24, v25);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __89__CNFRegController_beginAccountSetupWithLogin_authID_authToken_regionInfo_foundExisting___block_invoke;
    v26[3] = &unk_24D075578;
    v28 = buf;
    v21 = v17;
    v27 = v21;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v26);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      objc_msgSend(v21, "writeSettings");
    -[CNFRegController activateAccounts](self, "activateAccounts");

    _Block_object_dispose(buf, 8);
  }
  CNFRegLogOutdent();
LABEL_18:

  return v17;
}

uint64_t __89__CNFRegController_beginAccountSetupWithLogin_authID_authToken_regionInfo_foundExisting___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setProfileValue:forKey:", a3, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (id)beginAccountSetupWithLogin:(id)a3 password:(id)a4 foundExisting:(BOOL *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_13;
  v10 = objc_msgSend(v8, "length");
  v11 = 0;
  if (!v9 || !v10)
    goto LABEL_14;
  if (!objc_msgSend(v9, "length"))
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  -[CNFRegController _createAccountWithLogin:foundExisting:](self, "_createAccountWithLogin:foundExisting:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLogIndent();
  if (v11)
  {
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Clearing auth credentials prior to setting password", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(v11, "updateAuthorizationCredentials:token:", 0, 0);
    objc_msgSend(v11, "setTemporaryPassword:", v9);
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateAccount:", v11);

    objc_msgSend(v11, "authenticateAccount");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController activateAccountsExcludingAccounts:](self, "activateAccountsExcludingAccounts:", v14);

  }
  CNFRegLogOutdent();
LABEL_14:

  return v11;
}

- (id)beginAccountSetupWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Setting up account: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v13 = v4;
      IMLogString();
    }
    objc_msgSend(v4, "setAutoLogin:", 1, v13);
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Adding account to controller", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "addAccount:", v4);

    v9 = v4;
    if ((v8 & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Failed to add account to controller", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      v9 = 0;
    }
    objc_msgSend(v9, "login");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController __ensureSingleAppleIDAccountExistsWithLogin:](self, "__ensureSingleAppleIDAccountExistsWithLogin:", v11);

    objc_msgSend(v9, "removeObjectForKey:", CFSTR("AccountSignedOut"));
    objc_msgSend(v9, "writeSettings");
    -[CNFRegController activateAccounts](self, "activateAccounts");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_signOutAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Signing out account: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  CNFRegLogIndent();
  if (v4)
  {
    *(_BYTE *)&self->_controllerFlags |= 0x40u;
    -[CNFRegController clearAllCaches](self, "clearAllCaches");
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(v4, "unregisterAccount", v20);
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("AccountSignedOut"));
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "aliases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

    if (objc_msgSend(v4, "accountType") == 1)
    {
      v11 = (void *)*MEMORY[0x24BE50A38];
      objc_msgSend((id)*MEMORY[0x24BE50A38], "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v11, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
    }
    objc_msgSend(v4, "removeAliases:", v10);
    objc_msgSend(v4, "writeSettings");
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Deactivating account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deactivateAccount:", v4);

    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Clearing auth credentials", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(v4, "updateAuthorizationCredentials:token:", 0, 0);
    OSLogHandleForIDSCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Deleting account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deleteAccount:", v4);

    *(_BYTE *)&self->_controllerFlags &= ~0x40u;
  }
  CNFRegLogOutdent();

}

- (id)loginForAccount:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "login");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199B88A4]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_clearAccountCache
{
  NSArray *accounts;

  accounts = self->_accounts;
  self->_accounts = 0;

}

- (void)clearAllCaches
{
  NSObject *v3;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all caches", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogIndent();
  -[CNFRegController _clearAccountCache](self, "_clearAccountCache");
  -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
  CNFRegLogOutdent();
}

- (void)activateAccountsExcludingAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  CNFRegController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = self;
  *(_BYTE *)&self->_controllerFlags |= 0x80u;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Activating all accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (!-[CNFRegController isConnected](v23, "isConnected"))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Not connected, connecting", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegController connect:](v23, "connect:", 1);
  }
  -[CNFRegController setServiceEnabled:](v23, "setServiceEnabled:", 1);
  -[CNFRegController enablePhoneNumberRegistration](v23, "enablePhoneNumberRegistration");
  -[CNFRegController accounts](v23, "accounts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v22, "count"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v22;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v12, v21) & 1) == 0)
          {
            if (objc_msgSend(v12, "CNFRegIsSignedOut"))
            {
              OSLogHandleForIDSCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v34 = v12;
                _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Skipping activation of signed out account: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
              {
                v21 = v12;
                IMLogString();
              }
            }
            else
            {
              objc_msgSend(v7, "addObject:", v12);
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateAccounts:", v7);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          if ((objc_msgSend(v19, "CNFRegSignInComplete", v21) & 1) == 0)
            objc_msgSend(v19, "registerAccount");
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }

  }
  else
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "No accounts to activate", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  *(_BYTE *)&v23->_controllerFlags &= ~0x80u;

}

- (void)enablePhoneNumberRegistration
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Enabling PhoneNumber Registration", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  dispatch_get_global_queue(21, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IDSRegistrationControlEnableRegistrationType();

}

void __49__CNFRegController_enablePhoneNumberRegistration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "PhoneNumber Permission enable failed with error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (void)activateAccounts
{
  -[CNFRegController activateAccountsExcludingAccounts:](self, "activateAccountsExcludingAccounts:", 0);
}

- (void)deactivateAccounts
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)&self->_controllerFlags |= 0x80u;
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Deactivating all accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogBacktrace();
  if (!-[CNFRegController isConnected](self, "isConnected"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "  => Not connected, connecting", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegController connect:](self, "connect:", 1);
  }
  -[CNFRegController accounts](self, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v13;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v8, "CNFRegIsSignedOut") & 1) == 0
            && objc_msgSend(v8, "BOOLForKey:", CFSTR("AccountSignedOut")))
          {
            OSLogHandleForIDSCategory();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v8;
              _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "  => Mismatch of state - clearing signedOut flag on account %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              v12 = v8;
              IMLogString();
            }
            objc_msgSend(v8, "removeObjectForKey:", CFSTR("AccountSignedOut"), v12);
            objc_msgSend(v8, "writeSettings");
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateAccounts:", v4);

  }
  else
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "  => No accounts to deactivate", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  -[CNFRegController setServiceEnabled:](self, "setServiceEnabled:", 0);
  *(_BYTE *)&self->_controllerFlags &= ~0x80u;

}

- (id)_accountForAlias:(id)a3 accounts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v8 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasAlias:", v5))
          {
            v14 = v13;

            v8 = v14;
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)accountForAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController _accountForAlias:accounts:](self, "_accountForAlias:accounts:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_aliasIsDevicePhoneNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const void *active;
  const void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t i;
  const void *v15;
  const void *v16;
  BOOL v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "_appearsToBePhoneNumber"))
  {
    v17 = 0;
    goto LABEL_26;
  }
  v5 = v4;
  _IDSCopyMyPhoneNumbers();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v12 = 0;
    goto LABEL_25;
  }
  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  v20 = v5;
  v8 = (const void *)CFPhoneNumberCreate();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v6;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_21;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v9);
      v15 = (const void *)CFPhoneNumberCreate();
      v16 = v15;
      if (v8 && v15)
      {
        v12 = CFEqual(v8, v15) != 0;
      }
      else if (!v15)
      {
        goto LABEL_14;
      }
      CFRelease(v16);
LABEL_14:
      if (v12)
        goto LABEL_21;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v11);
LABEL_21:

  if (v8)
    CFRelease(v8);
  v6 = v19;
  v5 = v20;
  if (active)
    CFRelease(active);
LABEL_25:

  v17 = v12;
LABEL_26:

  return v17;
}

- (BOOL)_aliasIsTemporaryDeviceAlias:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const void *active;
  const void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const void *v17;
  BOOL v18;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "_appearsToBePhoneNumber"))
  {
    v18 = 0;
    goto LABEL_27;
  }
  v6 = v5;
  -[CNFRegController _temporaryDeviceAliases](self, "_temporaryDeviceAliases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    v13 = 0;
    goto LABEL_26;
  }
  v22 = v5;
  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  v21 = v6;
  v9 = (const void *)CFPhoneNumberCreate();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v7;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v11)
  {
    v13 = 0;
    goto LABEL_21;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "URI");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unprefixedURI");
      v17 = (const void *)CFPhoneNumberCreate();

      if (v9 && v17)
      {
        v13 = CFEqual(v9, v17) != 0;
      }
      else if (!v17)
      {
        goto LABEL_14;
      }
      CFRelease(v17);
LABEL_14:
      if (v13)
        goto LABEL_21;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v12);
LABEL_21:

  if (v9)
    CFRelease(v9);
  v5 = v22;
  v7 = v20;
  if (active)
    CFRelease(active);
  v6 = v21;
LABEL_26:

  v18 = v13;
LABEL_27:

  return v18;
}

- (void)_clearCachedTemporaryDeviceAliases
{
  NSArray *temporaryDeviceAliases;

  temporaryDeviceAliases = self->__temporaryDeviceAliases;
  self->__temporaryDeviceAliases = 0;

}

- (NSArray)_temporaryDeviceAliases
{
  NSArray *temporaryDeviceAliases;
  void *v4;
  NSArray *v5;
  id v6;
  NSArray *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  temporaryDeviceAliases = self->__temporaryDeviceAliases;
  if (!temporaryDeviceAliases)
  {
    -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "unselectedTemporaryPhoneAliasesWithError:", &v10);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = self->__temporaryDeviceAliases;
    self->__temporaryDeviceAliases = v5;

    if (v6)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Error fetching temporary aliases %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }

    temporaryDeviceAliases = self->__temporaryDeviceAliases;
  }
  return temporaryDeviceAliases;
}

- (id)localPhoneNumberSentinelAlias
{
  void *v2;
  void *v3;
  CNFRegAlias *v4;
  CNFRegAlias *v5;
  void *v6;

  -[CNFRegController appleIDAccounts](self, "appleIDAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v3 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = [CNFRegAlias alloc];
  v5 = -[CNFRegAlias initWithAccount:alias:](v4, "initWithAccount:alias:", v3, *MEMORY[0x24BE50A38]);
  CNFRegLocalPhoneNumberDisplayString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAlias setDisplayName:](v5, "setDisplayName:", v6);

LABEL_6:
  return v5;
}

- (BOOL)_shouldFilterOutAlias:(id)a3 onAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "typeForAlias:", v6) == 2
    && objc_msgSend(v7, "accountType") != 2
    && (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "supportsSMSIdentification"),
        v8,
        v9)
    && (-[CNFRegController _aliasIsDevicePhoneNumber:](self, "_aliasIsDevicePhoneNumber:", v6)
     || -[CNFRegController _aliasIsTemporaryDeviceAlias:](self, "_aliasIsTemporaryDeviceAlias:", v6)
     || (objc_msgSend(v6, "isEqualToIgnoringCase:", *MEMORY[0x24BE50A38]) & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "isEqualToIgnoringCase:", *MEMORY[0x24BE50A38]);
  }

  return v10;
}

- (id)_aliasesForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  CNFRegAlias *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  objc_msgSend(v4, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_IDSCopyOrderedAliasStrings();

  if (!v7 || !objc_msgSend(v7, "count"))
  {

LABEL_16:
    v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    goto LABEL_17;
  }
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v14, v5, (_QWORD)v17))
        {
          v15 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v5, v14);
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

- (id)_vettedAliasesForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  CNFRegAlias *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "accountType") != 1)
    goto LABEL_17;
  objc_msgSend(v5, "vettedAliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {

LABEL_17:
    v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    goto LABEL_18;
  }
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v14, v5, (_QWORD)v17))
        {
          v15 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v5, v14);
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (!v8)
    goto LABEL_17;
LABEL_18:

  return v8;
}

- (id)_allAvailableAliasesForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  CNFRegAlias *v41;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
LABEL_49:
    v34 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vettedAliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_IDSCopyOrderedAliasStrings();

  objc_msgSend(v4, "aliases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_IDSCopyOrderedAliasStrings();

  v10 = objc_msgSend(v4, "accountType");
  if (v10 == 1
    || !v10
    && (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isTelephonyDevice"),
        v11,
        (v12 & 1) == 0))
  {
    v43 = v9;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v16 = v7;
    v22 = v7;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v58 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (!-[CNFRegController _aliasIsDevicePhoneNumber:](self, "_aliasIsDevicePhoneNumber:", v27)
            && !-[CNFRegController _aliasIsTemporaryDeviceAlias:](self, "_aliasIsTemporaryDeviceAlias:", v27))
          {
            objc_msgSend(v5, "addObject:", v27);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v24);
    }
    goto LABEL_26;
  }
  v13 = objc_msgSend(v4, "accountType");
  if (v13 == 2
    || !v13
    && (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isTelephonyDevice"),
        v14,
        v15))
  {
    v43 = v9;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v16 = v7;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v54 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v19);
    }
LABEL_26:
    v7 = v16;

    v9 = v43;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v28 = v9;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v50 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k);
        if ((objc_msgSend(v5, "containsObject:", v33) & 1) == 0)
          objc_msgSend(v5, "addObject:", v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v30);
  }

  if (objc_msgSend(v5, "count"))
  {
    v44 = v7;
    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v35 = v5;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v46;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v46 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m);
          if (!-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v40, v4))
          {
            v41 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v4, v40);
            objc_msgSend(v34, "addObject:", v41);

          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
      }
      while (v37);
    }

    v7 = v44;
  }
  else
  {
    v34 = 0;
  }

  if (!v34)
    goto LABEL_49;
LABEL_50:

  return v34;
}

- (id)_aliasesFromAccounts:(id)a3 passingTest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[CNFRegController aliasesForAccounts:](self, "aliasesForAccounts:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || !objc_msgSend(v7, "count")
    || (objc_msgSend(v8, "CNFRegArrayPassingTest:", v6), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_aliasesPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController _aliasesFromAccounts:passingTest:](self, "_aliasesFromAccounts:passingTest:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_aliasComparator
{
  return &__block_literal_global_142;
}

uint64_t __36__CNFRegController__aliasComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "type");
  if (v8 == objc_msgSend(v7, "type"))
  {
    objc_msgSend(v6, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alias");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else if (objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v6, "type") == 2)
    {
      v11 = -1;
    }
    else
    {
      v12 = objc_msgSend(v7, "type");
      if (v12)
        v11 = v12 == 2;
      else
        v11 = -1;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)aliasesForAccounts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[CNFRegController _aliasesForAccount:](self, "_aliasesForAccount:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[CNFRegController _aliasComparator](self, "_aliasComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v12);

  return v5;
}

- (id)vettedAliasesForAccounts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "accountType", (_QWORD)v15) == 1)
        {
          -[CNFRegController _vettedAliasesForAccount:](self, "_vettedAliasesForAccount:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[CNFRegController _aliasComparator](self, "_aliasComparator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v13);

  return v5;
}

- (id)allAvailableAliasesForAccounts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t j;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v28;
  id v29;
  CNFRegController *v30;
  id obj;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CNFRegController _clearCachedTemporaryDeviceAliases](self, "_clearCachedTemporaryDeviceAliases");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        -[CNFRegController _allAvailableAliasesForAccount:](self, "_allAvailableAliasesForAccount:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v8);
  }
  v28 = v6;

  v30 = self;
  -[CNFRegController usableDeviceAliases](self, "usableDeviceAliases");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v42;
    v36 = *MEMORY[0x24BE4FEE8];
    v32 = v5;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v14 = v5;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16, v28);
        if (!v15)
        {

LABEL_25:
          objc_msgSend(v14, "addObject:", v13);
          continue;
        }
        v16 = v15;
        v35 = j;
        v17 = *(_QWORD *)v38;
        while (2)
        {
          for (k = 0; k != v16; ++k)
          {
            if (*(_QWORD *)v38 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
            objc_msgSend(v19, "account");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v36);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "alias");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "alias");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", v23))
            {

LABEL_27:
              v5 = v32;
              j = v35;
              goto LABEL_28;
            }
            objc_msgSend(v13, "deviceAliasIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v21, "isEqualToString:", v24);

            if ((v25 & 1) != 0)
              goto LABEL_27;
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v16)
            continue;
          break;
        }

        v5 = v32;
        j = v35;
        if ((v25 & 1) == 0)
          goto LABEL_25;
LABEL_28:
        ;
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v34);
  }
  -[CNFRegController _aliasComparator](v30, "_aliasComparator", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v26);

  return v5;
}

- (id)useableAliasesForAccounts:(id)a3
{
  return -[CNFRegController _aliasesFromAccounts:passingTest:](self, "_aliasesFromAccounts:passingTest:", a3, &__block_literal_global_144);
}

BOOL __46__CNFRegController_useableAliasesForAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CNFRegSignInComplete");

  v5 = v4 && objc_msgSend(v2, "validationStatus") == 3;
  return v5;
}

- (id)usableDeviceAliases
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CNFRegAlias *v12;
  void *v13;
  void *v14;
  void *v15;
  CNFRegAlias *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  CNFRegAlias *v37;
  NSObject *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  __CFString *v47;
  int v48;
  id v49;
  id obj;
  uint64_t v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  uint8_t buf[4];
  const __CFString *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  if (!-[CNFRegController serviceSupportsDeviceAliasEnablement](self, "serviceSupportsDeviceAliasEnablement"))
    return MEMORY[0x24BDBD1A8];
  -[CNFRegController _clearCachedTemporaryDeviceAliases](self, "_clearCachedTemporaryDeviceAliases");
  objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  objc_msgSend(v3, "currentSIMsWithError:", &v67);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (__CFString *)v67;

  if (v47)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v47;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    v5 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend(v7, "selectedSubscriptionsWithError:", &v66);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v66;

    -[CNFRegController _temporaryDeviceAliases](self, "_temporaryDeviceAliases");
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v63 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v12 = [CNFRegAlias alloc];
          objc_msgSend(v11, "URI");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "unprefixedURI");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "valueForKey:", CFSTR("selected"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[CNFRegAlias initWithAlias:type:selected:deviceAliasIdentifier:](v12, "initWithAlias:type:selected:deviceAliasIdentifier:", v14, 2, objc_msgSend(v15, "BOOLValue"), CFSTR("temp"));

          -[CNFRegAlias setIsTemporary:](v16, "setIsTemporary:", 1);
          objc_msgSend(v11, "expirationDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFRegAlias set_expirationDate:](v16, "set_expirationDate:", v17);

          objc_msgSend(v53, "addObject:", v16);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isInDualPhoneIdentityMode") & 1) != 0)
    {
      v48 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE30388], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v19, "isDeviceInManualPhoneSelectionMode");

    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v49 = v46;
    v20 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    if (v20)
    {
      v51 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v59 != v51)
            objc_enumerationMutation(v49);
          v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v23 = v52;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v55;
            while (2)
            {
              for (k = 0; k != v24; ++k)
              {
                if (*(_QWORD *)v55 != v25)
                  objc_enumerationMutation(v23);
                v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                v28 = objc_msgSend(v22, "slot");
                v29 = objc_msgSend(v27, "subscriptionSlot");
                v30 = v29 == 2;
                if (!v29)
                  v30 = 2;
                if (v28 == v30)
                {
                  v31 = 1;
                  goto LABEL_37;
                }
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
              if (v24)
                continue;
              break;
            }
          }
          v31 = 0;
LABEL_37:

          objc_msgSend(v22, "phoneNumber");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "label");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "SIMIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v32;
          if (v32)
            goto LABEL_41;
          v36 = v48;
          if (!v33)
            v36 = 0;
          v35 = v33;
          if (v36 == 1)
          {
LABEL_41:
            v37 = -[CNFRegAlias initWithAlias:type:selected:deviceAliasIdentifier:]([CNFRegAlias alloc], "initWithAlias:type:selected:deviceAliasIdentifier:", v35, 2, v31, v34);
            objc_msgSend(v53, "addObject:", v37);

          }
        }
        v20 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
      }
      while (v20);
    }

    OSLogHandleForIDSCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isInDualPhoneIdentityMode"))
        v40 = CFSTR("YES");
      else
        v40 = CFSTR("NO");
      objc_msgSend(MEMORY[0x24BE30388], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isDeviceInManualPhoneSelectionMode"))
        v42 = CFSTR("YES");
      else
        v42 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v69 = v40;
      v70 = 2112;
      v71 = v42;
      v72 = 2112;
      v73 = v53;
      _os_log_impl(&dword_2138BA000, v38, OS_LOG_TYPE_DEFAULT, "Getting usable device aliases {isInDualPhoneIdentityMode: %@, isDeviceInManualPhoneSelectionMode: %@, aliases: %@}", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "isInDualPhoneIdentityMode");
      objc_msgSend(MEMORY[0x24BE30388], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "isDeviceInManualPhoneSelectionMode");
      IMLogString();

    }
    v5 = v53;

  }
  return v5;
}

- (NSArray)aliases
{
  void *v3;
  void *v4;

  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController aliasesForAccounts:](self, "aliasesForAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)vettedAliases
{
  void *v3;
  void *v4;

  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController vettedAliasesForAccounts:](self, "vettedAliasesForAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)allAvailableAliases
{
  void *v3;
  void *v4;

  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController allAvailableAliasesForAccounts:](self, "allAvailableAliasesForAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)useableAliases
{
  void *v3;
  void *v4;

  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController useableAliasesForAccounts:](self, "useableAliasesForAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)emailAliases
{
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Getting email aliases", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogIndent();
  -[CNFRegController _aliasesPassingTest:](self, "_aliasesPassingTest:", &__block_literal_global_161);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLogOutdent();
  return (NSArray *)v4;
}

BOOL __32__CNFRegController_emailAliases__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (BOOL)hasAliasNamed:(id)a3
{
  void *v3;
  BOOL v4;

  -[CNFRegController accountForAlias:](self, "accountForAlias:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)aliasNamed:(id)a3
{
  id v4;
  void *v5;
  CNFRegAlias *v6;

  v4 = a3;
  -[CNFRegController accountForAlias:](self, "accountForAlias:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v5, v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_addAliases:(id)a3 toAccount:(id)a4 validate:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v32 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v33;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to add aliases: %@ to account: %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v6);
    v28 = v33;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  v9 = objc_msgSend(v33, "count", v28, v30);
  v10 = 0;
  if (v6 && v9)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v33, "count"));
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v33, "count"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v33;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v12)
    {
      v14 = 1;
      goto LABEL_30;
    }
    v13 = *(_QWORD *)v37;
    v14 = 1;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v6, "hasAlias:", v16, v29, v31))
        {
          if (objc_msgSend(v6, "validationStatusForAlias:", v16) != 3)
            objc_msgSend(v34, "addObject:", v16);
        }
        else
        {
          v17 = v6;
          v18 = objc_msgSend(v17, "accountType");
          if (v18)
          {

            if (v18 == 1)
              goto LABEL_18;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isTelephonyDevice");

            if ((v20 & 1) == 0)
            {
LABEL_18:
              objc_msgSend(v35, "addObject:", v16);
              continue;
            }
          }
          OSLogHandleForIDSCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            CNFRegStringForAccount(v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v42 = v16;
            v43 = 2112;
            v44 = v22;
            _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Not allowed to add alias '%@' to phone account: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            CNFRegStringForAccount(v17);
            v29 = v16;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogString();

          }
          v14 = 0;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v12)
      {
LABEL_30:

        if (objc_msgSend(v35, "count"))
        {
          OSLogHandleForIDSCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v35;
            _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, "Adding aliases: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v29 = v35;
            IMLogString();
          }
          if (objc_msgSend(v6, "addAliases:", v35, v29))
          {
            objc_msgSend(v34, "addObjectsFromArray:", v35);
          }
          else
          {
            OSLogHandleForIDSCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              CNFRegStringForAccount(v6);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = v25;
              _os_log_impl(&dword_2138BA000, v24, OS_LOG_TYPE_DEFAULT, "Could not add aliases to account: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              CNFRegStringForAccount(v6);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            v14 = 0;
          }
        }
        if (v32 && objc_msgSend(v34, "count"))
        {
          OSLogHandleForIDSCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v34;
            _os_log_impl(&dword_2138BA000, v26, OS_LOG_TYPE_DEFAULT, "Validating aliases: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v29 = v34;
            IMLogString();
          }
          v14 &= objc_msgSend(v6, "validateAliases:", v34, v29);
        }

        v10 = v14 & 1;
        break;
      }
    }
  }

  return v10;
}

- (BOOL)addAlias:(id)a3 toAccount:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  if (!a3 || !a4)
    return 0;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CNFRegController _addAliases:toAccount:validate:](self, "_addAliases:toAccount:validate:", v8, v7, 1);

  return (char)self;
}

- (BOOL)addAlias:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v6)
    goto LABEL_17;
  v7 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v5);
      v9 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      v10 = v9;
      if (!v9)
        goto LABEL_11;
      v11 = objc_msgSend(v9, "accountType");
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isTelephonyDevice");

        if ((v14 & 1) == 0)
        {

LABEL_16:
          v6 = v10;
          goto LABEL_17;
        }
LABEL_11:

        continue;
      }
      v12 = v11;

      if (v12 == 1)
        goto LABEL_16;
    }
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
      continue;
    break;
  }
LABEL_17:

  v15 = -[CNFRegController addAlias:toAccount:](self, "addAlias:toAccount:", v4, v6);
  if (!v15)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __29__CNFRegController_addAlias___block_invoke;
    v17[3] = &unk_24D075680;
    v18 = v4;
    v19 = v6;
    CNFRegLogIndent();
    __29__CNFRegController_addAlias___block_invoke((uint64_t)v17);
    CNFRegLogOutdent();

  }
  return v15;
}

void __29__CNFRegController_addAlias___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    CNFRegStringForAccount(*(void **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Could not add alias '%@' to account: %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
    {
      CNFRegStringForAccount(*(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
  }
}

- (BOOL)removeAlias:(id)a3 fromAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aliases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v6;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Removing alias: %@ from account: %@ (current aliases: %@)", buf, 0x20u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aliases");
    v21 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v6;
    IMLogString();

  }
  -[CNFRegController accounts](self, "accounts", v20, v21, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v7);

  if (v13)
  {
    v14 = objc_msgSend(v7, "removeAlias:", v6);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v7);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[CNFRegController accounts](self, "accounts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Skipped alias removal from account: %@ because account isn't in list of accounts: %@", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegController accounts](self, "accounts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)canRemoveAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 2)
  {
    LOBYTE(v5) = 0;
  }
  else if (CNFRegSupportsLocalPhoneNumberSentinelAlias())
  {
    v5 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v4, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController vettedAliasesForAccounts:](self, "vettedAliasesForAccounts:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v8, "count") != 0;

  }
  else if (objc_msgSend(v4, "validationStatus") == 3)
  {
    v9 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v4, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController aliasesForAccounts:](self, "aliasesForAccounts:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v12;
    v5 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "alias", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "alias");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToIgnoringCase:", v18);

          if ((v19 & 1) == 0 && objc_msgSend(v16, "type") != 2 && objc_msgSend(v16, "validationStatus") == 3)
          {
            LOBYTE(v5) = 1;
            goto LABEL_19;
          }
        }
        v5 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_19:

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (BOOL)setAliases:(id)a3 onAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t j;
  char v27;
  NSObject *v28;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v46 = v6;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to set aliases: %@ on account: %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v7);
    v30 = v6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  v10 = objc_msgSend(v6, "count", v30, v32);
  v11 = 0;
  if (v7 && v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController aliasesForAccounts:](self, "aliasesForAccounts:", v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    if (objc_msgSend(v35, "count"))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v14 = v35;
      v15 = 0;
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "alias");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19
              && !-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v19, v7))
            {
              if (objc_msgSend(v6, "containsObject:", v19))
              {
                objc_msgSend(v13, "removeObject:", v19);
              }
              else
              {
                if (!v15)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v15, "addObject:", v19);
              }
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v16);
      }

      OSLogHandleForIDSCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v46 = v14;
        v47 = 2112;
        v48 = v13;
        v49 = 2112;
        v50 = v15;
        _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "Account already has aliases: %@\nAdding: %@\nRemoving: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v33 = v13;
        v34 = v15;
        v31 = v14;
        IMLogString();
      }
      if (objc_msgSend(v13, "count", v31, v33, v34))
        v21 = -[CNFRegController _addAliases:toAccount:validate:](self, "_addAliases:toAccount:validate:", v13, v7, 0);
      else
        v21 = 1;
      if (objc_msgSend(v15, "count"))
        objc_msgSend(v7, "removeAliases:", v15);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v22 = v6;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v37;
        LOBYTE(v25) = 1;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v22);
            v25 = (objc_msgSend(v7, "validationStatusForAlias:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j)) == 3) & v25;
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v23);
      }
      else
      {
        v25 = 1;
      }

      v27 = objc_msgSend(v7, "validateAliases:", v22);
      if (v25)
      {
        OSLogHandleForIDSCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "All aliases on account are validated, kicking off a registration", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        objc_msgSend(v7, "registerAccount");
      }

      v11 = v21 & v27;
    }
    else
    {
      v11 = -[CNFRegController _addAliases:toAccount:validate:](self, "_addAliases:toAccount:validate:", v6, v7, 1);
    }

  }
  return v11;
}

- (BOOL)validateAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v4, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "validateAlias:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)unvalidateAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CNFRegController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v4, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "unvalidateAlias:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_phoneSubscriptionSlotMatchingPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v4, "currentSIMsWithError:", &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;

  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Fetched IDSCTSIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v19;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          if (v3)
          {
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x24BE4FE08];
            objc_msgSend(v12, "phoneNumber");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v13) = objc_msgSend(v13, "isPhoneNumber:equivalentToExistingPhoneNumber:", v14, v3);

            if ((v13 & 1) != 0)
            {
              v16 = objc_msgSend(v12, "slot");
              v17 = 1;
              if (v16 == 1)
                v17 = 2;
              if (v16 == 2)
                v15 = 0;
              else
                v15 = v17;

              goto LABEL_29;
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v15 = 0;
LABEL_29:

  return v15;
}

- (int64_t)_phoneSubscriptionSlotMatchingLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v4, "currentSIMsWithError:", &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;

  if (v6)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Fetched IDSCTSIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          if (v3)
          {
            v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v13, "label");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = IMAreObjectsLogicallySame();

            if ((v15 & 1) != 0)
            {
              v17 = objc_msgSend(v13, "slot");
              v18 = 1;
              if (v17 == 1)
                v18 = 2;
              if (v17 == 2)
                v16 = 0;
              else
                v16 = v18;

              goto LABEL_29;
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v16 = 0;
LABEL_29:

  return v16;
}

- (void)addDeviceAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isDeviceAlias") & 1) != 0)
  {
    if (objc_msgSend(v5, "isTemporaryPhoneNumberAlias"))
    {
      -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc(MEMORY[0x24BE4FE70]);
      objc_msgSend(v5, "alias");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithUnprefixedURI:", v8);
      v25 = 0;
      objc_msgSend(v6, "enableTemporaryPhoneAlias:withError:", v9, &v25);
      v10 = v25;

      OSLogHandleForIDSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Enabled temp alias after user add {enableError: %@}", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      goto LABEL_28;
    }
    objc_msgSend(v5, "alias");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNFRegController _phoneSubscriptionSlotMatchingPhoneNumber:](self, "_phoneSubscriptionSlotMatchingPhoneNumber:", v13);

    if (v14)
      goto LABEL_22;
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that we can't find the slot for -- trying label {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v23 = v5;
      IMLogString();
    }
    objc_msgSend(v5, "alias", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNFRegController _phoneSubscriptionSlotMatchingLabel:](self, "_phoneSubscriptionSlotMatchingLabel:", v16);

    if (v14)
    {
LABEL_22:
      objc_msgSend(MEMORY[0x24BE4FC70], "phoneSubscriptionWithSubscriptionSlot:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v18, "selectSubscription:withError:", v17, &v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;

      OSLogHandleForIDSCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v20;
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Selected subscriptions after user add {error: %@, currentlySelected: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      goto LABEL_28;
    }
    OSLogHandleForIDSCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that we can't find the slot for -- failing! {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_14:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that didn't belong to this system!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_14;
  }
LABEL_28:

}

- (void)removeDeviceAlias:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  int64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "isPhoneNumberAliasOnPhoneNumberAccount") & 1) != 0
     || (objc_msgSend(v5, "isTemporaryPhoneNumberAlias") & 1) != 0))
  {
    if (objc_msgSend(v5, "isTemporaryPhoneNumberAlias"))
    {
      OSLogHandleForIDSCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Removing a temporary alias {alias: %@}", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v26 = v5;
        IMLogString();
      }
      -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector", v26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x24BE4FE70]);
      objc_msgSend(v5, "alias");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithUnprefixedURI:", v9);
      v28 = 0;
      v11 = objc_msgSend(v7, "removeTemporaryPhoneAlias:withError:", v10, &v28);
      v12 = v28;

      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v30 = v5;
        v31 = 2112;
        if (v11)
          v14 = CFSTR("YES");
        v32 = v14;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Removed a temporary alias {alias: %@, success: %@, error: %@}", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      goto LABEL_36;
    }
    objc_msgSend(v5, "alias");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNFRegController _phoneSubscriptionSlotMatchingPhoneNumber:](self, "_phoneSubscriptionSlotMatchingPhoneNumber:", v16);

    if (v17)
      goto LABEL_30;
    OSLogHandleForIDSCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that we can't find the slot for -- trying label {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v26 = v5;
      IMLogString();
    }
    objc_msgSend(v5, "alias", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNFRegController _phoneSubscriptionSlotMatchingLabel:](self, "_phoneSubscriptionSlotMatchingLabel:", v19);

    if (v17)
    {
LABEL_30:
      objc_msgSend(MEMORY[0x24BE4FC70], "phoneSubscriptionWithSubscriptionSlot:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v21, "unselectSubscription:withError:", v20, &v27);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = v27;

      OSLogHandleForIDSCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v23;
        v31 = 2112;
        v32 = v22;
        _os_log_impl(&dword_2138BA000, v24, OS_LOG_TYPE_DEFAULT, "Selected subscriptions after user remove {error: %@, currentlySelected: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      goto LABEL_36;
    }
    OSLogHandleForIDSCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that we can't find the slot for -- failing! {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_22:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that didn't belong to this system!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_22;
  }
LABEL_36:

}

- (void)disableDeviceAlias:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "isPhoneNumberAliasOnPhoneNumberAccount")
    && (objc_msgSend(v5, "isTemporaryPhoneNumberAlias") & 1) != 0)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Disabling a temporary alias {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v16 = v5;
      IMLogString();
    }
    -[CNFRegController phoneSubscriptionSelector](self, "phoneSubscriptionSelector", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE4FE70]);
    objc_msgSend(v5, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUnprefixedURI:", v9);
    v17 = 0;
    v11 = objc_msgSend(v7, "disableTemporaryPhoneAlias:withError:", v10, &v17);
    v12 = v17;

    OSLogHandleForIDSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v19 = v5;
      v20 = 2112;
      if (v11)
        v14 = CFSTR("YES");
      v21 = v14;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Disabled a temporary alias {alias: %@, success: %@, error: %@}", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();

  }
  else
  {
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Tried disable an alias that can't be disabled!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (id)aliasSummaryString:(BOOL *)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CNFRegController _aliasesPassingTest:](self, "_aliasesPassingTest:", &__block_literal_global_217);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "type") == 2)
          ++v9;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v5 == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v16 = CFSTR("ALIAS_SUMMARY_ADDRESSES_COUNT");
      else
        v16 = CFSTR("ALIAS_SUMMARY_EMAIL_ADDRESSES_COUNT");
      objc_msgSend(v12, "localizedStringForKey:value:table:", v16, &stru_24D077260, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v17, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CommunicationsSetupUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ALIAS_SUMMARY_NO_ADDRESSES"), &stru_24D077260, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (a3)
    *a3 = 0;

  return v14;
}

BOOL __39__CNFRegController_aliasSummaryString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOperational") && objc_msgSend(v2, "validationStatus") == 3;

  return v4;
}

- (BOOL)_accountIsAuthenticated:(id)a3
{
  return a3 && objc_msgSend(a3, "registrationStatus") > 2;
}

- (BOOL)_accountHasValidatedLocale:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  if (objc_msgSend(v3, "accountType") == 2
    || objc_msgSend(v4, "accountType") == 1 && objc_msgSend(v4, "profileValidationStatus") == 3)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(v4, "accountType");
  if (v6 == 2)
    goto LABEL_3;
  if (v6 == 1)
  {
LABEL_10:
    v5 = objc_msgSend(v4, "profileValidationStatus") == 3;
    goto LABEL_12;
  }
  if (v6)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTelephonyDevice");

  if ((v8 & 1) == 0)
    goto LABEL_10;
LABEL_3:
  v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)accountState:(id)a3
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  id obj;
  uint64_t v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a3;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v36)
  {
    v3 = 0;
    v34 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v5, "CNFRegIsSignedOut", v28, v29, v30, v31, v32))
        {
          OSLogHandleForIDSCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            CNFRegStringForAccount(v5);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v42 = v7;
            _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring account state for signed out account: {%@}", buf, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            CNFRegStringForAccount(v5);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogString();

          }
        }
        else
        {
          v8 = -[CNFRegController _accountIsAuthenticated:](self, "_accountIsAuthenticated:", v5);
          v9 = -[CNFRegController _accountHasValidatedLocale:](self, "_accountHasValidatedLocale:", v5);
          v10 = objc_msgSend(v5, "CNFRegSignInComplete");
          OSLogHandleForIDSCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            CNFRegStringForAccount(v5);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v5, "isActive");
            if (v10)
              v14 = CFSTR("YES");
            else
              v14 = CFSTR("NO");
            *(_DWORD *)buf = 138413314;
            v42 = v12;
            if (v9)
              v15 = CFSTR("YES");
            else
              v15 = CFSTR("NO");
            v43 = 2112;
            if (v8)
              v16 = CFSTR("YES");
            else
              v16 = CFSTR("NO");
            v44 = v16;
            if (v13)
              v17 = CFSTR("YES");
            else
              v17 = CFSTR("NO");
            v45 = 2112;
            v46 = v15;
            v47 = 2112;
            v48 = v14;
            v49 = 2112;
            v50 = v17;
            _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Account state for account: {%@}   authenticated:%@   validLocale:%@   signInComplete:%@   active:%@", buf, 0x34u);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            CNFRegStringForAccount(v5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              v19 = CFSTR("YES");
            else
              v19 = CFSTR("NO");
            if (v9)
              v20 = CFSTR("YES");
            else
              v20 = CFSTR("NO");
            if (v10)
              v21 = CFSTR("YES");
            else
              v21 = CFSTR("NO");
            v22 = objc_msgSend(v5, "isActive");
            v23 = CFSTR("NO");
            if (v22)
              v23 = CFSTR("YES");
            v31 = v21;
            v32 = v23;
            v29 = v19;
            v30 = v20;
            v28 = v18;
            IMLogString();

          }
          v24 = v3 | v8;
          if (v9)
            v24 |= 2uLL;
          if (v10)
            v3 = v24 | 4;
          else
            v3 = v24;
          if ((v10 & v9) == 1)
          {
            v25 = objc_msgSend(v5, "isActive");
            v26 = 1610612736;
            if (v25)
              v26 = 0x40000000;
            v3 |= v26;
          }
        }
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v36);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)accountStateForAccount:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  unint64_t v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDBCE30];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  }
  else
  {
    v6 = 0;
  }
  v7 = -[CNFRegController accountState:](self, "accountState:", v6);

  return v7;
}

- (unint64_t)accountState
{
  void *v3;
  unint64_t v4;

  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFRegController accountState:](self, "accountState:", v3);

  return v4;
}

- (BOOL)accountIsAuthenticating
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CNFRegController accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "registrationStatus") == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasFailedLogin
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNFRegController accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "registrationStatus") == -1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)hasFailedLoginDueToBadLogin
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[CNFRegController hasFailedLogin](self, "hasFailedLogin");
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CNFRegController accounts](self, "accounts", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "registrationStatus") == -1 && objc_msgSend(v10, "registrationFailureReason") == 3)
            v7 = 1;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    LOBYTE(v3) = v7 & 1;
  }
  return v3;
}

- (BOOL)iMessageAccountMatchesiCloudAccount:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CNFRegController accounts](self, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "authorizationID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        OSLogHandleForIDSCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "login");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v24 = v4;
          v25 = 2112;
          v26 = v10;
          v27 = 2112;
          v28 = v12;
          _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Check DSID of account, iCloud DSID: %@, iMessage account DSID : %@ for %@", buf, 0x20u);

        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          objc_msgSend(v9, "login");
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v4;
          IMLogString();

        }
        v13 = objc_msgSend(v10, "isEqualToString:", v4, v15, v16, v17);

        v5 |= v13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v6);
  }

  return v5 & 1;
}

- (BOOL)shouldShowAlertForError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "code") == 20 || objc_msgSend(v5, "code") == 26)
    {
      OSLogHandleForIDSCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Suppresssing alert for error %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
        goto LABEL_16;
    }
    else
    {
      if (objc_msgSend(v5, "code") != 14)
      {
        v7 = !-[CNFRegController isAccountKeyCDPSyncingOrWaitingForUser](self, "isAccountKeyCDPSyncingOrWaitingForUser");
        goto LABEL_17;
      }
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Suppresssing alert for error %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
        goto LABEL_16;
    }
    IMLogString();
LABEL_16:
    LOBYTE(v7) = 0;
    goto LABEL_17;
  }
  LOBYTE(v7) = 1;
LABEL_17:

  return v7;
}

- (void)startListeningForAccountChanges
{
  id v3;

  if ((*(_BYTE *)&self->_controllerFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountAdded_, *MEMORY[0x24BE50028], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountRemoved_, *MEMORY[0x24BE50030], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountRegistrationChanged_, *MEMORY[0x24BE500B8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_callerIdChanged_, *MEMORY[0x24BE50040], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_aliasesChanged_, *MEMORY[0x24BE50008], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_vettedAliasesChanged_, *MEMORY[0x24BE500C0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_aliasStatusChanged_, *MEMORY[0x24BE4FFB8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_profileChanged_, *MEMORY[0x24BE50058], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_profileValidationStateChanged_, *MEMORY[0x24BE50068], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_authorizationCredentialsChanged_, *MEMORY[0x24BE50018], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_authorizationCredentialsChanged_, *MEMORY[0x24BE50020], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountActivationStateChanged_, *MEMORY[0x24BE4FFA8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_accountActivationStateChanged_, *MEMORY[0x24BE50038], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_deviceCapabilityChanged_, *MEMORY[0x24BE30328], 0);
    *(_BYTE *)&self->_controllerFlags |= 1u;

  }
}

- (void)stopListeningForAccountChanges
{
  id v3;

  if ((*(_BYTE *)&self->_controllerFlags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50030], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50028], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE500B8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50040], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50008], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE500C0], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFB8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50218], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50220], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50058], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50068], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50018], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50020], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE4FFA8], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50038], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE30328], 0);
    *(_BYTE *)&self->_controllerFlags &= ~1u;

  }
}

- (BOOL)shouldHandleAccountNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CNFRegController services](self, "services", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v4, "service");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == v9)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)accountAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5)
    && (*(_BYTE *)&self->_controllerFlags & 0x40) == 0)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account added : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    -[CNFRegController clearAllCaches](self, "clearAllCaches");
    -[CNFRegController accountAddedBlock](self, "accountAddedBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[CNFRegController accountAddedBlock](self, "accountAddedBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD, _QWORD))objc_msgSend(v10, "copy");

      ((void (**)(_QWORD, void *))v11)[2](v11, v5);
    }
    CNFRegLogOutdent();
  }

}

- (void)accountRemoved:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account removed : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    -[CNFRegController clearAllCaches](self, "clearAllCaches");
    -[CNFRegController accountRemovedBlock](self, "accountRemovedBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[CNFRegController accountRemovedBlock](self, "accountRemovedBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD, _QWORD))objc_msgSend(v10, "copy");

      ((void (**)(_QWORD, void *))v11)[2](v11, v5);
    }
    CNFRegLogOutdent();
  }

}

- (void)accountRegistrationChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v5;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account registration changed : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v40 = v5;
    IMLogString();
  }
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5, v40))
  {
    CNFRegLogIndent();
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegNonLocStringForRegistrationStatus(objc_msgSend(v5, "registrationStatus"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "registrationFailureReason"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v8;
      v55 = 2112;
      v56 = v9;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Registration status: %@ failureReason: %@", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegNonLocStringForRegistrationStatus(objc_msgSend(v5, "registrationStatus"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "registrationFailureReason"));
      v41 = v10;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    if (objc_msgSend(v5, "registrationStatus", v41, v47) == -1)
    {
      objc_msgSend(v4, "userInfo");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE500B0]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegLogIndent();
      objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE500A0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Server error message : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v42 = v12;
        IMLogString();
      }
      objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE500A8], v42);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v51;
        _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Server error title : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v43 = v51;
        IMLogString();
      }
      objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE50098], v43);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v50;
        _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Server error button : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v44 = v50;
        IMLogString();
      }
      objc_msgSend(v52, "objectForKey:", *MEMORY[0x24BE50080], v44);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v16;
        _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Server error action dictionary : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v45 = v16;
        IMLogString();
      }
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BE50088], v45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue") == 1;

      if (v19)
      {
        objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BE50078]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BE50090]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        OSLogHandleForIDSCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v20;
          v55 = 2112;
          v56 = v21;
          _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "Server error action button title : %@  url string : %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v46 = v20;
          v48 = v21;
          IMLogString();
        }
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      CNFRegLogOutdent();
      v23 = v12;
      v24 = v23;
      if (!v23 || (v25 = v23, !objc_msgSend(v23, "length")))
      {
        v26 = objc_msgSend(v49, "integerValue", v46, v48);
        -[CNFRegController loginForAccount:](self, "loginForAccount:", v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringForRegistrationFailure(v26, v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        OSLogHandleForIDSCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v25;
          _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "Using CNFRegStringForRegistrationFailure string : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v46 = v25;
          IMLogString();
        }
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v46);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v25, *MEMORY[0x24BDD0FC8]);
      if (v51 && objc_msgSend(v51, "length"))
        objc_msgSend(v29, "setObject:forKey:", v51, CFSTR("cnf-customTitle"));
      if (v50 && objc_msgSend(v50, "length"))
        objc_msgSend(v29, "setObject:forKey:", v50, CFSTR("cnf-customButton"));
      if (v20 && objc_msgSend(v20, "length") && v21 && objc_msgSend(v21, "length"))
      {
        objc_msgSend(v29, "setObject:forKey:", v20, CFSTR("cnf-customActionTitle"));
        objc_msgSend(v29, "setObject:forKey:", v21, CFSTR("cnf-customActionURLString"));
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.conference.registration"), objc_msgSend(v49, "integerValue"), v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    if (!objc_msgSend(v5, "CNFRegSignInComplete"))
      goto LABEL_69;
    v30 = v5;
    v31 = v30;
    if (!v30)
      goto LABEL_68;
    v32 = objc_msgSend(v30, "accountType");
    if (v32)
    {

      if (v32 != 1)
        goto LABEL_69;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isTelephonyDevice");

      if ((v34 & 1) != 0)
      {
LABEL_68:

LABEL_69:
        -[CNFRegController accountRegistrationBlock](self, "accountRegistrationBlock");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36 == 0;

        if (!v37)
        {
          -[CNFRegController accountRegistrationBlock](self, "accountRegistrationBlock");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v38, "copy");

          ((void (**)(_QWORD, void *, void *))v39)[2](v39, v5, v11);
        }
        CNFRegLogOutdent();

        goto LABEL_72;
      }

    }
    v35 = (void *)MEMORY[0x24BDBCF50];
    -[CNFRegController loginForAccount:](self, "loginForAccount:", v31);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCNFRegSavedAccountName:", v31);
    goto LABEL_68;
  }
LABEL_72:

}

- (void)callerIdChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account display name changed to: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v5, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    -[CNFRegController callerIdChangedBlock](self, "callerIdChangedBlock", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[CNFRegController callerIdChangedBlock](self, "callerIdChangedBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD))objc_msgSend(v10, "copy");

      v11[2](v11);
    }
  }

}

- (void)profileChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account profile changed : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "profileValueForKey:", *MEMORY[0x24BE50060]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "  Region ID : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v5, "profileValueForKey:", *MEMORY[0x24BE50060]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "profileValueForKey:", *MEMORY[0x24BE50050]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "  Base number : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v5, "profileValueForKey:", *MEMORY[0x24BE50050]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    -[CNFRegController profileChangedBlock](self, "profileChangedBlock", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      -[CNFRegController profileChangedBlock](self, "profileChangedBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void (**)(_QWORD, _QWORD))objc_msgSend(v14, "copy");

      ((void (**)(_QWORD, void *))v15)[2](v15, v5);
    }
  }

}

- (void)profileValidationStateChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    v6 = objc_msgSend(v5, "profileValidationStatus");
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Account profile validation state changed : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegNonLocStringForProfileValidationStatus(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Profile status changed to %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegNonLocStringForProfileValidationStatus(v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    if (v6 == -1)
    {
      v12 = (id)*MEMORY[0x24BE50070];
      objc_msgSend(v4, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "integerValue");
      CNFRegStringForProfileValidationFailure(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v16, *MEMORY[0x24BDD0FC8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.conference.registration"), v15, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Profile error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v23 = v16;
        IMLogString();
      }

    }
    else
    {
      v11 = 0;
    }
    -[CNFRegController profileStatusChangedBlock](self, "profileStatusChangedBlock", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (!v20)
    {
      -[CNFRegController profileStatusChangedBlock](self, "profileStatusChangedBlock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v21, "copy");

      ((void (**)(_QWORD, void *, void *))v22)[2](v22, v5, v11);
    }
    CNFRegLogOutdent();

  }
}

- (void)authorizationCredentialsChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account authorization credentials changed : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache", v12);
    -[CNFRegController accountAuthorizationChangedBlock](self, "accountAuthorizationChangedBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[CNFRegController accountAuthorizationChangedBlock](self, "accountAuthorizationChangedBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v10, "copy");

      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v5, 0);
    }
  }

}

- (void)accountActivationStateChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "isActive");
      CNFRegStringForAccount(v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("NO");
      if (v7)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account activation state changed (isActive:%@): %@", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v5, "isActive");
      CNFRegStringForAccount(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
    -[CNFRegController accountActivationChangedBlock](self, "accountActivationChangedBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      -[CNFRegController accountActivationChangedBlock](self, "accountActivationChangedBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void (**)(_QWORD, _QWORD))objc_msgSend(v13, "copy");

      ((void (**)(_QWORD, void *))v14)[2](v14, v5);
    }
    CNFRegLogOutdent();
  }

}

- (void)aliasStatusChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CNFRegAlias *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Received alias status change for account: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    CNFRegLogIndent();
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FFB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
    if (v9)
    {
      v10 = objc_msgSend(v5, "validationStatusForAlias:", v9);
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE50048]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (!v12 && v10 == 1)
        goto LABEL_56;
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        CNFRegNonLocStringForAliasValidationStatus(v12);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        CNFRegNonLocStringForAliasValidationStatus(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = v9;
        v48 = 2112;
        v49 = v14;
        v50 = 2112;
        v51 = v15;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Alias {%@} status changed from [%@] to [%@]", buf, 0x20u);

      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        CNFRegNonLocStringForAliasValidationStatus(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegNonLocStringForAliasValidationStatus(v10);
        v36 = v16;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v9;
        IMLogString();

      }
      if (v10 == -1)
      {
        objc_msgSend(v4, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE4FFF8]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FFE8]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FFF0]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FFE0]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE4FFC8]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        OSLogHandleForIDSCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v44;
          _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Server error action dictionary : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v34 = v44;
          IMLogString();
        }
        objc_msgSend(v44, "objectForKey:", *MEMORY[0x24BE4FFD0], v34, v36, v38);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue") == 1;

        if (v23)
        {
          objc_msgSend(v44, "objectForKey:", *MEMORY[0x24BE4FFC0]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKey:", *MEMORY[0x24BE4FFD8]);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          OSLogHandleForIDSCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v47 = v24;
            v48 = 2112;
            v49 = v41;
            _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "Server error action button title : %@  url string : %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v35 = v24;
            v37 = v41;
            IMLogString();
          }
        }
        else
        {
          v24 = 0;
          v41 = 0;
        }
        if (!v43 && !v45 && !v20)
          goto LABEL_40;
        CNFRegLogIndent();
        OSLogHandleForIDSCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v47 = v43;
          v48 = 2112;
          v49 = v45;
          v50 = 2112;
          v51 = v20;
          v52 = 2112;
          v53 = v24;
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v39 = v20;
          v40 = v24;
          v35 = v43;
          v37 = v45;
          IMLogString();
        }
        CNFRegLogOutdent();
        v27 = v43;
        if (!v27 || (v28 = v27, !objc_msgSend(v27, "length")))
        {
LABEL_40:
          CNFRegStringForAliasValidationFailure(objc_msgSend(v42, "integerValue", v35, v37, v39, v40));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v28, *MEMORY[0x24BDD0FC8]);
        if (v45 && objc_msgSend(v45, "length"))
          objc_msgSend(v29, "setObject:forKey:", v45, CFSTR("cnf-customTitle"));
        if (v20 && objc_msgSend(v20, "length"))
          objc_msgSend(v29, "setObject:forKey:", v20, CFSTR("cnf-customButton"));
        if (v24 && objc_msgSend(v24, "length") && v41 && objc_msgSend(v41, "length"))
        {
          objc_msgSend(v29, "setObject:forKey:", v24, CFSTR("cnf-customActionTitle"));
          objc_msgSend(v29, "setObject:forKey:", v41, CFSTR("cnf-customActionURLString"));
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.conference.registration"), objc_msgSend(v42, "integerValue", v35), v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      v18 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v5, v9);
      -[CNFRegController aliasStatusChangedBlock](self, "aliasStatusChangedBlock");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (!v31)
      {
        -[CNFRegController aliasStatusChangedBlock](self, "aliasStatusChangedBlock");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v32, "copy");

        ((void (**)(_QWORD, CNFRegAlias *, void *))v33)[2](v33, v18, v17);
      }
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    CNFRegLogOutdent();

LABEL_56:
  }

}

- (void)handleAliasAdded:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CNFRegController aliasAddedBlock](self, "aliasAddedBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNFRegController aliasAddedBlock](self, "aliasAddedBlock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(v5, "copy");

      ((void (**)(_QWORD, id))v6)[2](v6, v7);
    }
  }

}

- (void)handleAliasRemoved:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CNFRegController aliasRemovedBlock](self, "aliasRemovedBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNFRegController aliasRemovedBlock](self, "aliasRemovedBlock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(v5, "copy");

      ((void (**)(_QWORD, id))v6)[2](v6, v7);
    }
  }

}

- (void)aliasesChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CNFRegAlias *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  CNFRegAlias *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(v22, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v4))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Aliases changed for account : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v20 = v4;
      IMLogString();
    }
    CNFRegLogIndent();
    -[CNFRegController _clearFilterCache](self, "_clearFilterCache");
    objc_msgSend(v22, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x24BE50000]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x24BE50010]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!v6 || !objc_msgSend(v6, "count")) && (!v23 || !objc_msgSend(v23, "count")))
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "WARNING: Received alias changed notification but did not have any changed aliases", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v12 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v4, v11);
          OSLogHandleForIDSCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v11;
            _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "  Added : %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v20 = v11;
            IMLogString();
          }
          -[CNFRegController handleAliasAdded:](self, "handleAliasAdded:", v12, v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = v23;
    v14 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v24);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v18 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v4, v17);
          OSLogHandleForIDSCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v17;
            _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "  Removed : %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v20 = v17;
            IMLogString();
          }
          -[CNFRegController handleAliasRemoved:](self, "handleAliasRemoved:", v18, v20);

        }
        v14 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v14);
    }

    CNFRegLogOutdent();
  }

}

- (void)vettedAliasesChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Vetted aliases changed for: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      CNFRegStringForAccount(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
    -[CNFRegController vettedAliasesChangedBlock](self, "vettedAliasesChangedBlock", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[CNFRegController vettedAliasesChangedBlock](self, "vettedAliasesChangedBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void (**)(_QWORD, _QWORD))objc_msgSend(v10, "copy");

      ((void (**)(_QWORD, void *))v11)[2](v11, v5);
    }
  }

}

- (void)removeAllHandlers
{
  -[CNFRegController setAccountRegistrationBlock:](self, "setAccountRegistrationBlock:", 0);
  -[CNFRegController setAccountAddedBlock:](self, "setAccountAddedBlock:", 0);
  -[CNFRegController setAccountRemovedBlock:](self, "setAccountRemovedBlock:", 0);
  -[CNFRegController setCallerIdChangedBlock:](self, "setCallerIdChangedBlock:", 0);
  -[CNFRegController setAliasStatusChangedBlock:](self, "setAliasStatusChangedBlock:", 0);
  -[CNFRegController setAliasAddedBlock:](self, "setAliasAddedBlock:", 0);
  -[CNFRegController setAliasRemovedBlock:](self, "setAliasRemovedBlock:", 0);
  -[CNFRegController setVettedAliasesChangedBlock:](self, "setVettedAliasesChangedBlock:", 0);
  -[CNFRegController setResetBlock:](self, "setResetBlock:", 0);
  -[CNFRegController setServiceDidBecomeUnsupportedBlock:](self, "setServiceDidBecomeUnsupportedBlock:", 0);
  -[CNFRegController setProfileChangedBlock:](self, "setProfileChangedBlock:", 0);
  -[CNFRegController setProfileStatusChangedBlock:](self, "setProfileStatusChangedBlock:", 0);
  -[CNFRegController setAccountAuthorizationChangedBlock:](self, "setAccountAuthorizationChangedBlock:", 0);
  -[CNFRegController setAccountActivationChangedBlock:](self, "setAccountActivationChangedBlock:", 0);
}

- (void)setServiceEnabled:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if ((*(_BYTE *)&self->_controllerFlags & 0x80000000) == 0)
  {
    if (a3)
    {
      -[CNFRegController activateAccounts](self, "activateAccounts");
    }
    else
    {
      OSLogHandleForIDSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating all accounts due to serviceEnabled being set to NO", v5, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
      -[CNFRegController deactivateAccounts](self, "deactivateAccounts");
    }
  }
}

- (BOOL)isServiceEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  _BYTE v31[14];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CNFRegController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v27;
    v5 = *MEMORY[0x24BE50A38];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v7, "accountType") == 2)
        {
          OSLogHandleForIDSCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v31 = v7;
            _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "Using account %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
LABEL_31:
          v14 = 1;
          goto LABEL_33;
        }
        if (objc_msgSend(v7, "accountType") == 1)
        {
          if (!objc_msgSend(v7, "canSendMessages"))
            goto LABEL_31;
          if ((objc_msgSend(v7, "isRegistered") & 1) != 0)
            goto LABEL_31;
          if (objc_msgSend(v7, "isActive"))
          {
            objc_msgSend(v7, "aliases");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "count") == 0;

            if (v9)
              goto LABEL_31;
          }
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v7, "aliases");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v10);
                if (!objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "isEqualToIgnoringCase:", v5)
                  || objc_msgSend(v7, "isActive"))
                {
                  OSLogHandleForIDSCategory();
                  v15 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v31 = v7;
                    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Using account %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
                    IMLogString();

                  goto LABEL_31;
                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
              if (v11)
                continue;
              break;
            }
          }

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      v14 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_33:

  OSLogHandleForIDSCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[CNFRegController activeAccounts](self, "activeAccounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v31 = v14;
    *(_WORD *)&v31[4] = 2112;
    *(_QWORD *)&v31[6] = v17;
    _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "isServiceEnabled = %d (based on accounts %@)", buf, 0x12u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    -[CNFRegController activeAccounts](self, "activeAccounts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  return v14;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNFRegController failedAccounts](self, "failedAccounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isAccountKeyCDPSyncingOrWaitingForUser");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isServiceSupported
{
  void *v3;
  int64_t v4;
  char v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFRegController serviceType](self, "serviceType");
  if (v4)
  {
    if (v4 == 2)
    {
      v5 = objc_msgSend(v3, "callingAvailable");
    }
    else
    {
      if (v4 != 1)
      {
        v6 = 0;
        goto LABEL_9;
      }
      v5 = objc_msgSend(v3, "iMessageAvailable");
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "faceTimeAvailable");
  }
  v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)serviceSupportsDeviceAliasEnablement
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSMS");

  return v3;
}

- (BOOL)isConnected
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (void)connect:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[CNFRegController startListeningForAccountChanges](self, "startListeningForAccountChanges");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blockUntilConnected");

  }
}

- (void)connect
{
  -[CNFRegController connect:](self, "connect:", 0);
}

- (void)deviceCapabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  if (!-[CNFRegController isServiceSupported](self, "isServiceSupported", a3))
  {
    -[CNFRegController serviceDidBecomeUnsupportedBlock](self, "serviceDidBecomeUnsupportedBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNFRegController serviceDidBecomeUnsupportedBlock](self, "serviceDidBecomeUnsupportedBlock");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void (**)(void))objc_msgSend(v5, "copy");

      v6[2]();
    }
  }
}

- (void)_postCallerIDChanged
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Posting caller ID change notification", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.ft.CallerID.changed"), 0, 0, 1u);
}

- (void)_handleCallerIDChangedForResume:(id)a3
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
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Application resumed, nuking caller ID caches", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegController _nukeCallerIDCache](self, "_nukeCallerIDCache");

}

- (void)_handleCallerIDChanged
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD);
  uint8_t v7[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Caller ID changed remotely, nuking caches", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegController _nukeCallerIDCache](self, "_nukeCallerIDCache");
  -[CNFRegController callerIdChangedBlock](self, "callerIdChangedBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNFRegController callerIdChangedBlock](self, "callerIdChangedBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void (**)(_QWORD))objc_msgSend(v5, "copy");

    v6[2](v6);
  }
}

- (void)nukeAllCallerIDSettings
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetPreferredAccountForService();

  objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetPreferredAccountForService();

  objc_msgSend(MEMORY[0x24BE50370], "callService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetPreferredAccountForService();

  -[CNFRegController _nukeCallerIDCache](self, "_nukeCallerIDCache");
  -[CNFRegController _postCallerIDChanged](self, "_postCallerIDChanged");
}

- (void)_startListeningForCallerIDChanges
{
  void *v3;
  void *v4;

  if ((*(_BYTE *)&self->_controllerFlags & 2) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleCallerIDChangedForResume_, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleCallerIDChanged, *MEMORY[0x24BE501C8], 0);

    *(_BYTE *)&self->_controllerFlags |= 2u;
  }
}

- (void)_stopListeningForCallerIDChanges
{
  void *v3;
  void *v4;

  if ((*(_BYTE *)&self->_controllerFlags & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE501C8], 0);

    *(_BYTE *)&self->_controllerFlags &= ~2u;
  }
}

- (id)displayAccount
{
  void *v2;
  void *v3;

  -[CNFRegController firstService](self, "firstService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredAccountForService();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayAlias
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CNFRegAlias *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CNFRegController firstService](self, "firstService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredAccountForService();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "displayName"), (v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v7 = (void *)v6,
        v8 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v5, v6), v7, !v8))
  {
    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController firstService](self, "firstService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operationalAccountsForService:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      -[CNFRegController guessedDisplayAlias](self, "guessedDisplayAlias");
      v8 = (CNFRegAlias *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  -[CNFRegAlias account](v8, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAlias alias](v8, "alias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisplayName:", v13);

  return v8;
}

- (BOOL)setDisplayAlias:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Request to set the display alias: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogIndent();
  -[CNFRegController accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(v4, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetPreferredAccountForService();

    -[CNFRegController _postCallerIDChanged](self, "_postCallerIDChanged");
    objc_msgSend(v4, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alias");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayName:", v13);

  }
  else
  {
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Not setting because the alias's account is not in our list of managed accounts", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  CNFRegLogOutdent();

  return 0;
}

- (id)_logName
{
  NSString *logName;
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  logName = self->_logName;
  if (!logName)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CNFRegController serviceType](self, "serviceType");
    FTCServiceNameForServiceType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("Controller[%@]"), v5);
    v7 = self->_logName;
    self->_logName = v6;

    logName = self->_logName;
  }
  return logName;
}

- (id)_logSpace
{
  __CFString *v3;
  unint64_t v4;

  if (self->_logIndent)
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * self->_logIndent);
    if (self->_logIndent)
    {
      v4 = 0;
      do
      {
        -[__CFString appendString:](v3, "appendString:", CFSTR("  "));
        ++v4;
      }
      while (v4 < self->_logIndent);
    }
    -[__CFString appendString:](v3, "appendString:", CFSTR("=> "));
  }
  else
  {
    v3 = &stru_24D077260;
  }
  return v3;
}

- (void)_incrementLogIndent
{
  ++self->_logIndent;
}

- (void)_decrementLogIndent
{
  unint64_t logIndent;

  logIndent = self->_logIndent;
  if (logIndent)
    self->_logIndent = logIndent - 1;
}

- (id)accountRegistrationBlock
{
  return self->_accountRegistrationBlock;
}

- (void)setAccountRegistrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)accountAddedBlock
{
  return self->_accountAddedBlock;
}

- (void)setAccountAddedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)accountRemovedBlock
{
  return self->_accountRemovedBlock;
}

- (void)setAccountRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)callerIdChangedBlock
{
  return self->_callerIdChangedBlock;
}

- (void)setCallerIdChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)aliasStatusChangedBlock
{
  return self->_aliasStatusChangedBlock;
}

- (void)setAliasStatusChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)aliasAddedBlock
{
  return self->_aliasAddedBlock;
}

- (void)setAliasAddedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)aliasRemovedBlock
{
  return self->_aliasRemovedBlock;
}

- (void)setAliasRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)vettedAliasesChangedBlock
{
  return self->_vettedAliasesChangedBlock;
}

- (void)setVettedAliasesChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)resetBlock
{
  return self->_resetBlock;
}

- (void)setResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)serviceDidBecomeUnsupportedBlock
{
  return self->_serviceDidBecomeUnsupportedBlock;
}

- (void)setServiceDidBecomeUnsupportedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)profileChangedBlock
{
  return self->_profileChangedBlock;
}

- (void)setProfileChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)profileStatusChangedBlock
{
  return self->_profileStatusChangedBlock;
}

- (void)setProfileStatusChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)accountAuthorizationChangedBlock
{
  return self->_accountAuthorizationChangedBlock;
}

- (void)setAccountAuthorizationChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (id)accountActivationChangedBlock
{
  return self->_accountActivationChangedBlock;
}

- (void)setAccountActivationChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)willLaunchURLBlock
{
  return self->_willLaunchURLBlock;
}

- (void)setWillLaunchURLBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setPhoneSubscriptionSelector:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, a3);
}

- (void)set_temporaryDeviceAliases:(id)a3
{
  objc_storeStrong((id *)&self->__temporaryDeviceAliases, a3);
}

- (NSDictionary)cachedCallerIDMap
{
  return self->_cachedCallerIDMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCallerIDMap, 0);
  objc_storeStrong((id *)&self->__temporaryDeviceAliases, 0);
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, 0);
  objc_storeStrong((id *)&self->_systemAccount, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_wifiAlertWatchTimer, 0);
  objc_storeStrong(&self->_serviceDidBecomeUnsupportedBlock, 0);
  objc_storeStrong(&self->_resetBlock, 0);
  objc_storeStrong((id *)&self->_springboardNetworkFlagQueue, 0);
  objc_storeStrong(&self->_willLaunchURLBlock, 0);
  objc_storeStrong(&self->_accountActivationChangedBlock, 0);
  objc_storeStrong(&self->_accountAuthorizationChangedBlock, 0);
  objc_storeStrong(&self->_profileStatusChangedBlock, 0);
  objc_storeStrong(&self->_profileChangedBlock, 0);
  objc_storeStrong(&self->_vettedAliasesChangedBlock, 0);
  objc_storeStrong(&self->_aliasAddedBlock, 0);
  objc_storeStrong(&self->_aliasRemovedBlock, 0);
  objc_storeStrong(&self->_aliasStatusChangedBlock, 0);
  objc_storeStrong(&self->_accountRemovedBlock, 0);
  objc_storeStrong(&self->_accountAddedBlock, 0);
  objc_storeStrong(&self->_callerIdChangedBlock, 0);
  objc_storeStrong(&self->_accountRegistrationBlock, 0);
  objc_storeStrong((id *)&self->_accountFilterCache, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)showSetupFaceTimeOverCellularAlertWithCompletion:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (const __CFString *)*MEMORY[0x24BDBD590];
  v5 = (const __CFString *)*MEMORY[0x24BDBD570];
  v6 = (void *)CFPreferencesCopyValue(CFSTR("CarrierName"), CFSTR("com.apple.carrier"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v7 = (void *)CFPreferencesCopyValue(CFSTR("TetheringPhoneNumber"), CFSTR("com.apple.carrier"), v4, v5);
  v8 = (void *)CFPreferencesCopyValue(CFSTR("TetheringURL"), CFSTR("com.apple.carrier"), v4, v5);
  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v8);
  else
    v9 = 0;
  -[CNFRegController showSetupFaceTimeOverCellularAlertForServiceProviderName:serviceProviderPhoneNumber:serviceProviderURL:completion:](self, "showSetupFaceTimeOverCellularAlertForServiceProviderName:serviceProviderPhoneNumber:serviceProviderURL:completion:", v6, v7, v9, v10);

}

- (void)showSetupFaceTimeOverCellularAlertForServiceProviderName:(id)a3 serviceProviderPhoneNumber:(id)a4 serviceProviderURL:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
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
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CNFRegController *v59;
  void *v60;
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;

  v61 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v59 = self;
  CNFRegSetStringTableForServiceType(-[CNFRegController serviceType](self, "serviceType"));
  CommunicationsSetupUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v10, "length");
  v60 = v11;
  if (v11 || v16)
  {
    v28 = objc_msgSend(v10, "length");
    if (v11)
    {
      v26 = v10;
      v27 = (void *)v15;
      if (!v28)
      {
        v33 = (void *)MEMORY[0x24BDD17C8];
        CommunicationsSetupUIBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CNFStringKeyForNetwork(CFSTR("FACETIME_SETTINGS_SETUP_CELLULAR_NO_NUMBER"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D077260, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", v30, v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      objc_msgSend(v26, "length");
    }
    else
    {
      v26 = v10;
      v27 = (void *)v15;
      if (v28)
      {
        v29 = (void *)MEMORY[0x24BDD17C8];
        CommunicationsSetupUIBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CNFStringKeyForNetwork(CFSTR("FACETIME_SETTINGS_SETUP_CELLULAR_NO_URL"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D077260, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", v30, v61, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
    }
    v31 = (void *)MEMORY[0x24BDD17C8];
    CommunicationsSetupUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CNFStringKeyForNetwork(CFSTR("FACETIME_SETTINGS_SETUP_CELLULAR_ALL_INFO"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D077260, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v30, v61, v26, v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  CommunicationsSetupUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CNFStringKeyForNetwork(CFSTR("FACETIME_SETTINGS_SETUP_CELLULAR_NO_INFO"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_24D077260, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v21, v61);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v24);
  v25 = (void *)v15;
  v26 = v10;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  v35 = (void *)MEMORY[0x24BEBD3B0];
  CommunicationsSetupUIBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_SETUP_CELLULAR_TITLE"), &stru_24D077260, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "alertControllerWithTitle:message:preferredStyle:", v38, v22, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x24BEBD3A8];
  v41 = MEMORY[0x24BDAC760];
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke;
  v68[3] = &unk_24D0756C8;
  v42 = v12;
  v69 = v42;
  objc_msgSend(v40, "actionWithTitle:style:handler:", v27, 1, v68);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addAction:", v43);

  if (objc_msgSend(v26, "length"))
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isTelephonyDevice");

    if (v45)
    {
      v46 = (void *)MEMORY[0x24BEBD3A8];
      CommunicationsSetupUIBundle();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_MAKE_PHONE_CALL"), &stru_24D077260, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v41;
      v65[1] = 3221225472;
      v65[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_2;
      v65[3] = &unk_24D0756F0;
      v65[4] = v59;
      v66 = v26;
      v67 = v42;
      objc_msgSend(v46, "actionWithTitle:style:handler:", v49, 0, v65);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAction:", v50);

    }
  }
  if (v60)
  {
    v51 = (void *)MEMORY[0x24BEBD3A8];
    CommunicationsSetupUIBundle();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_VISIT_WEBSITE"), &stru_24D077260, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v41;
    v62[1] = 3221225472;
    v62[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_3;
    v62[3] = &unk_24D0756F0;
    v62[4] = v59;
    v63 = v60;
    v64 = v42;
    objc_msgSend(v51, "actionWithTitle:style:handler:", v54, 0, v62);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAction:", v55);

  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "keyWindow");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rootViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "presentViewController:animated:completion:", v39, 1, 0);
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDBCF48], "telephonyURLWithDestinationID:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:", v3);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "openURL:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)__filter_appleIDAccountPredicate
{
  if (__filter_appleIDAccountPredicate_once != -1)
    dispatch_once(&__filter_appleIDAccountPredicate_once, &__block_literal_global_3);
  return (id)MEMORY[0x2199B8E98](__filter_appleIDAccountPredicate_predicate);
}

void __63__CNFRegController_Filtering____filter_appleIDAccountPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_29, "copy");
  v1 = (void *)__filter_appleIDAccountPredicate_predicate;
  __filter_appleIDAccountPredicate_predicate = v0;

}

BOOL __63__CNFRegController_Filtering____filter_appleIDAccountPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "accountType");
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTelephonyDevice");

      if (v6)
        v4 = 2;
      else
        v4 = 1;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4 == 1;
}

- (id)__filter_phoneAccountPredicate
{
  if (__filter_phoneAccountPredicate_once != -1)
    dispatch_once(&__filter_phoneAccountPredicate_once, &__block_literal_global_30);
  return (id)MEMORY[0x2199B8E98](__filter_phoneAccountPredicate_predicate);
}

void __61__CNFRegController_Filtering____filter_phoneAccountPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_31, "copy");
  v1 = (void *)__filter_phoneAccountPredicate_predicate;
  __filter_phoneAccountPredicate_predicate = v0;

}

BOOL __61__CNFRegController_Filtering____filter_phoneAccountPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "accountType");
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTelephonyDevice");

      if (v6)
        v4 = 2;
      else
        v4 = 1;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4 == 2;
}

- (id)__filter_activeAccountsPredicate
{
  if (__filter_activeAccountsPredicate_once != -1)
    dispatch_once(&__filter_activeAccountsPredicate_once, &__block_literal_global_32);
  return (id)MEMORY[0x2199B8E98](__filter_activeAccountsPredicate_predicate);
}

void __63__CNFRegController_Filtering____filter_activeAccountsPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_33, "copy");
  v1 = (void *)__filter_activeAccountsPredicate_predicate;
  __filter_activeAccountsPredicate_predicate = v0;

}

uint64_t __63__CNFRegController_Filtering____filter_activeAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (id)__filter_inactiveAccountsPredicate
{
  if (__filter_inactiveAccountsPredicate_once != -1)
    dispatch_once(&__filter_inactiveAccountsPredicate_once, &__block_literal_global_34);
  return (id)MEMORY[0x2199B8E98](__filter_inactiveAccountsPredicate_predicate);
}

void __65__CNFRegController_Filtering____filter_inactiveAccountsPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_35, "copy");
  v1 = (void *)__filter_inactiveAccountsPredicate_predicate;
  __filter_inactiveAccountsPredicate_predicate = v0;

}

uint64_t __65__CNFRegController_Filtering____filter_inactiveAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive") ^ 1;
}

- (id)__filter_failedAccountsPredicate
{
  if (__filter_failedAccountsPredicate_once != -1)
    dispatch_once(&__filter_failedAccountsPredicate_once, &__block_literal_global_36);
  return (id)MEMORY[0x2199B8E98](__filter_failedAccountsPredicate_predicate);
}

void __63__CNFRegController_Filtering____filter_failedAccountsPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_37, "copy");
  v1 = (void *)__filter_failedAccountsPredicate_predicate;
  __filter_failedAccountsPredicate_predicate = v0;

}

BOOL __63__CNFRegController_Filtering____filter_failedAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registrationStatus") == -1;
}

- (id)__filter_validatedAliasPredicate
{
  if (__filter_validatedAliasPredicate_once != -1)
    dispatch_once(&__filter_validatedAliasPredicate_once, &__block_literal_global_38);
  return (id)MEMORY[0x2199B8E98](__filter_validatedAliasPredicate_predicate);
}

void __63__CNFRegController_Filtering____filter_validatedAliasPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_39, "copy");
  v1 = (void *)__filter_validatedAliasPredicate_predicate;
  __filter_validatedAliasPredicate_predicate = v0;

}

uint64_t __63__CNFRegController_Filtering____filter_validatedAliasPredicate__block_invoke_2(uint64_t a1, void *a2)
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
  if (objc_msgSend(v2, "canSendMessages"))
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
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)__filter_signInCompletePredicate
{
  if (__filter_signInCompletePredicate_once != -1)
    dispatch_once(&__filter_signInCompletePredicate_once, &__block_literal_global_40);
  return (id)MEMORY[0x2199B8E98](__filter_signInCompletePredicate_predicate);
}

void __63__CNFRegController_Filtering____filter_signInCompletePredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_41, "copy");
  v1 = (void *)__filter_signInCompletePredicate_predicate;
  __filter_signInCompletePredicate_predicate = v0;

}

uint64_t __63__CNFRegController_Filtering____filter_signInCompletePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "CNFRegSignInComplete");
}

- (id)__filter_validatedProfilePredicate
{
  if (__filter_validatedProfilePredicate_once != -1)
    dispatch_once(&__filter_validatedProfilePredicate_once, &__block_literal_global_42);
  return (id)MEMORY[0x2199B8E98](__filter_validatedProfilePredicate_predicate);
}

void __65__CNFRegController_Filtering____filter_validatedProfilePredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_43, "copy");
  v1 = (void *)__filter_validatedProfilePredicate_predicate;
  __filter_validatedProfilePredicate_predicate = v0;

}

BOOL __65__CNFRegController_Filtering____filter_validatedProfilePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  _BOOL8 v7;

  v2 = a2;
  v3 = v2;
  v7 = !v2
    || (v4 = objc_msgSend(v2, "accountType"), v4 != 1)
    && (v4
     || (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = objc_msgSend(v5, "isTelephonyDevice"),
         v5,
         (v6 & 1) != 0))
    || objc_msgSend(v3, "profileValidationStatus") == 3;

  return v7;
}

- (id)__filter_signedInPredicate
{
  if (__filter_signedInPredicate_once != -1)
    dispatch_once(&__filter_signedInPredicate_once, &__block_literal_global_44);
  return (id)MEMORY[0x2199B8E98](__filter_signedInPredicate_predicate);
}

void __57__CNFRegController_Filtering____filter_signedInPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_46, "copy");
  v1 = (void *)__filter_signedInPredicate_predicate;
  __filter_signedInPredicate_predicate = v0;

}

uint64_t __57__CNFRegController_Filtering____filter_signedInPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "CNFRegIsSignedOut") ^ 1;
}

- (id)__filter_operationalPredicate
{
  if (__filter_operationalPredicate_once != -1)
    dispatch_once(&__filter_operationalPredicate_once, &__block_literal_global_47);
  return (id)MEMORY[0x2199B8E98](__filter_operationalPredicate_predicate);
}

void __60__CNFRegController_Filtering____filter_operationalPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&__block_literal_global_48, "copy");
  v1 = (void *)__filter_operationalPredicate_predicate;
  __filter_operationalPredicate_predicate = v0;

}

uint64_t __60__CNFRegController_Filtering____filter_operationalPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isOperational") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "canSendMessages") ^ 1;

  return v3;
}

- (void)_clearFilterCache
{
  NSMutableDictionary *accountFilterCache;

  accountFilterCache = self->_accountFilterCache;
  self->_accountFilterCache = 0;

}

- (id)accountsWithFilter:(int64_t)a3 message:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *accountFilterCache;
  void *v10;
  void *v11;

  v6 = a4;
  -[CNFRegController _predicatesWithFilter:](self, "_predicatesWithFilter:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_accountFilterCache)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accountFilterCache = self->_accountFilterCache;
    self->_accountFilterCache = v8;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_accountFilterCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[CNFRegController _accountsPassingTests:message:](self, "_accountsPassingTests:message:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKey:](self->_accountFilterCache, "setObject:forKey:", v11, v10);
  }

  return v11;
}

- (id)accountsWithFilter:(int64_t)a3
{
  return -[CNFRegController accountsWithFilter:message:](self, "accountsWithFilter:message:", a3, 0);
}

- (id)_accountsPassingTests:(id)a3 message:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[CNFRegController accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || !objc_msgSend(v6, "count")
    || (objc_msgSend(v7, "CNFRegArrayPassingTests:", v5), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_predicatesWithFilter:(int64_t)a3
{
  int v3;
  id v5;
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

  if (!a3)
  {
    v5 = 0;
    return v5;
  }
  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((v3 & 4) != 0)
  {
    -[CNFRegController __filter_appleIDAccountPredicate](self, "__filter_appleIDAccountPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    if ((v3 & 8) == 0)
    {
LABEL_4:
      if ((v3 & 1) == 0)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_4;
  }
  -[CNFRegController __filter_phoneAccountPredicate](self, "__filter_phoneAccountPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  -[CNFRegController __filter_activeAccountsPredicate](self, "__filter_activeAccountsPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  -[CNFRegController __filter_inactiveAccountsPredicate](self, "__filter_inactiveAccountsPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  if ((v3 & 0x2000) == 0)
  {
LABEL_7:
    if ((v3 & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  -[CNFRegController __filter_failedAccountsPredicate](self, "__filter_failedAccountsPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  if ((v3 & 0x4000) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  -[CNFRegController __filter_validatedAliasPredicate](self, "__filter_validatedAliasPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0)
      goto LABEL_10;
LABEL_21:
    -[CNFRegController __filter_validatedProfilePredicate](self, "__filter_validatedProfilePredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    if ((v3 & 0x8000) == 0)
    {
LABEL_11:
      if ((v3 & 0x10000) == 0)
        return v5;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_20:
  -[CNFRegController __filter_signInCompletePredicate](self, "__filter_signInCompletePredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  if ((v3 & 0x800) != 0)
    goto LABEL_21;
LABEL_10:
  if ((v3 & 0x8000) == 0)
    goto LABEL_11;
LABEL_22:
  -[CNFRegController __filter_signedInPredicate](self, "__filter_signedInPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  if ((v3 & 0x10000) != 0)
  {
LABEL_23:
    -[CNFRegController __filter_operationalPredicate](self, "__filter_operationalPredicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  return v5;
}

- (NSArray)phoneAccounts
{
  return (NSArray *)-[CNFRegController accountsWithFilter:message:](self, "accountsWithFilter:message:", 8, CFSTR("Getting list of phone accounts"));
}

- (NSArray)appleIDAccounts
{
  return (NSArray *)-[CNFRegController accountsWithFilter:message:](self, "accountsWithFilter:message:", 4, CFSTR("Getting list of apple ID accounts"));
}

- (id)activeAccounts
{
  return -[CNFRegController accountsWithFilter:message:](self, "accountsWithFilter:message:", 1, CFSTR("Getting list of active accounts"));
}

- (NSArray)failedAccounts
{
  return (NSArray *)-[CNFRegController accountsWithFilter:message:](self, "accountsWithFilter:message:", 0x2000, CFSTR("Getting list of failed accounts"));
}

- (id)guessedAccountName
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  const __CFString *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithEffectiveBundleID:", CFSTR("com.apple.account.Madrid"));
  objc_msgSend(v3, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = CFSTR("CNFRegAccountTypeIdentifieriMessage");
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithEffectiveBundleID:", CFSTR("com.apple.account.FaceTime"));
    objc_msgSend(v6, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CFSTR("CNFRegAccountTypeIdentifierFaceTime");
  }
  v22 = v5;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CNFRegController accounts](self, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        if (!v4)
        {
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (v11)
          {
            v12 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "accountType");
            if (v12 == 1
              || !v12
              && (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
                  v13 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14 = objc_msgSend(v13, "isTelephonyDevice"),
                  v13,
                  (v14 & 1) == 0))
            {
              -[CNFRegController loginForAccount:](self, "loginForAccount:", v11);
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
              {

                v22 = CFSTR("a previous login");
                v4 = (void *)v15;
                goto LABEL_22;
              }
            }
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (v4)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x24BDBCF50], "CNFRegSavedAccountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = CFSTR("a previously successful account name");
LABEL_20:
    v22 = v16;
LABEL_22:
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v4;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Guessed account name (%@) from %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    return v4;
  }
  if (CNFRegGetSSAccountStoreClass())
  {
    objc_msgSend(CNFRegGetSSAccountStoreClass(), "defaultStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "accountName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v16 = CFSTR("iTunes");
      goto LABEL_20;
    }
  }
  OSLogHandleForIDSCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Could not guess account name", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  return 0;
}

- (id)guessedAlias
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[CNFRegController accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[CNFRegController aliases](self, "aliases");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v8, "type") == 1 && objc_msgSend(v8, "validationStatus") != 3)
          {
            objc_msgSend(v8, "alias");
            v5 = objc_claimAutoreleasedReturnValue();
            v9 = CFSTR("an un-registered alias");
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v5)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_14:

  }
  else
  {
    v9 = 0;
    v5 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        if (!v5)
        {
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (v14)
          {
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "accountType");
            if (v15 == 1
              || !v15
              && (objc_msgSend(MEMORY[0x24BE30338], "sharedInstance"),
                  v16 = (void *)objc_claimAutoreleasedReturnValue(),
                  v17 = objc_msgSend(v16, "isTelephonyDevice"),
                  v16,
                  (v17 & 1) == 0))
            {
              objc_msgSend(v14, "login");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              MEMORY[0x2199B88A4]();
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19 && objc_msgSend(v19, "length"))
              {
                v9 = CFSTR("an account login");
                goto LABEL_32;
              }

            }
          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (v11)
        continue;
      break;
    }
  }
  v19 = (void *)v5;
LABEL_32:

  if (v9 && v19)
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v19;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "Guessed alias (%@) from %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_43:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Could not guess alias", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_43;
  }

  return v19;
}

- (BOOL)_isValidCallerIDAlias:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v6, "hasAlias:", v5))
      v8 = objc_msgSend(v7, "validationStatusForAlias:", v5) == 3;
    else
      v8 = 0;
  }

  return v8;
}

- (id)_guessedDisplayAliasFromAccounts:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  int v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  CNFRegAlias *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
        {
          v5 = v4;
          objc_enumerationMutation(obj);
          v4 = v5;
        }
        v27 = v4;
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v4);
        if (objc_msgSend(v6, "isActive"))
        {
          objc_msgSend(v6, "aliases");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v10)
          {
            v11 = 0;
            v12 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v30 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                if (-[CNFRegController _isValidCallerIDAlias:forAccount:](self, "_isValidCallerIDAlias:forAccount:", v14, v6))
                {
                  if (objc_msgSend(v6, "typeForAlias:", v14) == 2)
                  {
                    v20 = v14;

                    v11 = v20;
                    goto LABEL_28;
                  }
                  objc_msgSend(v6, "loginDisplayString");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v15, "isEqualToString:", v14);

                  if (v11)
                    v17 = v16;
                  else
                    v17 = 1;
                  if (v17 == 1)
                  {
                    v18 = v14;

                    v11 = v18;
                  }
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v10)
                continue;
              break;
            }
LABEL_28:

            if (v11)
            {
              v22 = -[CNFRegAlias initWithAccount:alias:]([CNFRegAlias alloc], "initWithAccount:alias:", v6, v11);

              goto LABEL_39;
            }
          }
          else
          {

          }
        }
        else
        {
          OSLogHandleForIDSCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "Account is inactive. Skipping.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
        }
        OSLogHandleForIDSCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Could not find an alias", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        v4 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }
  v22 = 0;
LABEL_39:

  return v22;
}

- (id)guessedDisplayAlias
{
  void *v3;
  void *v4;
  void *v5;

  -[CNFRegController accountsWithFilter:](self, "accountsWithFilter:", 65544);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController _guessedDisplayAliasFromAccounts:](self, "_guessedDisplayAliasFromAccounts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNFRegController accountsWithFilter:](self, "accountsWithFilter:", 65540);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegController _guessedDisplayAliasFromAccounts:](self, "_guessedDisplayAliasFromAccounts:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)openURL:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  -[CNFRegController willLaunchURLBlock](self, "willLaunchURLBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNFRegController willLaunchURLBlock](self, "willLaunchURLBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(v5, "copy");

    ((void (**)(_QWORD, id))v6)[2](v6, v8);
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, 0);

}

- (BOOL)deviceHasSaneNetworkConnection
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkReachable");
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Device has reachable network : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (v3)
  {
    v3 = objc_msgSend(v2, "networkActive");
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Device has active network : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

  return v3;
}

- (BOOL)deviceCanTakeNetworkAction
{
  int v3;
  NSObject *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v27;
  const __CFString *v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[CNFRegController deviceHasSaneNetworkConnection](self, "deviceHasSaneNetworkConnection"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "- (BOOL)deviceCanTakeNetworkAction: Network not enabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v5 = -[CNFRegController serviceType](self, "serviceType");
    if (v5 > 2)
      v6 = 0;
    else
      v6 = off_24D075A68[v5];
    objc_msgSend(MEMORY[0x24BE508B0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isWiFiEnabled");
    v9 = objc_msgSend(v7, "isDataSwitchEnabled");
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v8)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v30 = v12;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "isWifiEnabled: %@, isCellularEnabled %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v13 = CFSTR("NO");
      if (v8)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      if (v9)
        v13 = CFSTR("YES");
      v27 = v14;
      v28 = v13;
      IMLogString();
    }
    if ((v8 | v9) == 1)
    {
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "wifiAllowedForBundleId:", v6);

      if (-[CNFRegController serviceType](self, "serviceType") == 1)
      {
        v17 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "nonWifiAvailableForBundleId:", v6);

      }
      objc_msgSend(MEMORY[0x24BE30338], "sharedInstance", v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "wifiAllowedForBundleId:", CFSTR("com.apple.Preferences"));

      v3 = (v16 | v17) & (v20 ^ 1);
      OSLogHandleForIDSCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFSTR("NO");
        if (v3)
          v23 = CFSTR("YES");
        else
          v23 = CFSTR("NO");
        if (v16)
          v24 = CFSTR("YES");
        else
          v24 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        v30 = v23;
        if (v17)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        v31 = 2112;
        v32 = v24;
        v33 = 2112;
        v34 = v25;
        if (v20)
          v22 = CFSTR("YES");
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "- (BOOL)deviceCanTakeNetworkAction networkEnabled: %@, wifiAllowedForBundle %@, nonWifiAllowedForBundle %@, wifiAllowedForPreferences %@", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (id)networkSettingsURLAllowingCellular:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  int v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t SIMStatus;
  int v18;
  int v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;

  v3 = a3;
  v4 = -[CNFRegController serviceType](self, "serviceType");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = off_24D075A68[v4];
  objc_msgSend(MEMORY[0x24BE508B0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MGGetBoolAnswer();
  v8 = CFSTR("prefs:root=WIFI");
  if (v7)
  {
    v9 = objc_msgSend(v6, "isWiFiEnabled");
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "wifiAllowedForBundleId:", v5);

    v12 = CFSTR("prefs:root=WIFI&path=WIRELESS_APP_DATA_USAGE_ID");
    if (v11)
      v12 = CFSTR("prefs:root=WIFI");
    if (v9)
      v8 = v12;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsCellularData");

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BE508B0], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isAirplaneModeEnabled");

      SIMStatus = CTSIMSupportGetSIMStatus();
      if (SIMStatus == *MEMORY[0x24BDC2CD0])
        v18 = 1;
      else
        v18 = v16;
      if (!v18)
        v8 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID");
      if (v7 && SIMStatus != *MEMORY[0x24BDC2CD0])
      {
        v19 = objc_msgSend(v6, "isDataSwitchEnabled");
        objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "nonWifiAvailableForBundleId:", v5);

        v22 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID&path=WIRELESS_APP_DATA_USAGE_ID");
        if (v21)
          v22 = v8;
        if (v19)
          v8 = v22;
        else
          v8 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID");
      }
    }
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v8);

  return v23;
}

- (void)_showNetworkAlertWithMessage:(id)a3 andViewController:(id)a4
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v6 = a4;
  v7 = a3;
  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_NETWORK_ERROR_TITLE"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_NETWORK_SETTINGS_BUTTON"), &stru_24D077260, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v7, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __76__CNFRegController_Network___showNetworkAlertWithMessage_andViewController___block_invoke;
  v22[3] = &unk_24D075A28;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v19);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyWindow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "presentViewController:animated:completion:", v17, 1, 0);

}

void __76__CNFRegController_Network___showNetworkAlertWithMessage_andViewController___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "networkSettingsURLAllowingCellular:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:", v2);

}

- (void)showNetworkAlert:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsCellularData");
  v7 = objc_msgSend(v5, "supportsWiFi");
  v8 = objc_msgSend(v5, "supportsWLAN");
  v9 = v8;
  if (v6)
  {
    if ((v7 & 1) == 0)
    {
      objc_msgSend(CFSTR("FACETIME_NETWORK_ERROR_CELL"), "stringByAppendingString:", CFSTR("_NO_WIFI"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (v8)
    {
      objc_msgSend(CFSTR("FACETIME_NETWORK_ERROR_CELL"), "stringByAppendingString:", CFSTR("_WLAN"));
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = (__CFString *)v10;
      goto LABEL_11;
    }
    v11 = CFSTR("FACETIME_NETWORK_ERROR_CELL");
  }
  else if (v8)
  {
    v11 = CFSTR("FACETIME_NETWORK_ERROR_WLAN");
  }
  else
  {
    v11 = CFSTR("FACETIME_NETWORK_ERROR_WIFI");
  }
LABEL_11:
  OSLogHandleForIDSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v11;
    _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Showing network alert with key: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v6)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v23 = (__CFString *)v14;
    _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "    isCellular:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("NO");
    if (v7)
      v16 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v23 = (__CFString *)v16;
    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "  supportsWifi:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("NO");
    if (v9)
      v18 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v23 = (__CFString *)v18;
    _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "  supportsWLAN:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CommunicationsSetupUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v11, &stru_24D077260, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegController _showNetworkAlertWithMessage:andViewController:](self, "_showNetworkAlertWithMessage:andViewController:", v21, v4);

  *(_BYTE *)&self->_controllerFlags |= 0x20u;
}

- (void)showNetworkAlertIfNecessary:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CNFRegController deviceCanTakeNetworkAction](self, "deviceCanTakeNetworkAction"))
    -[CNFRegController showNetworkAlert:](self, "showNetworkAlert:", v4);

}

- (void)showNetworkFirstRunAlert:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if ((*(_BYTE *)&self->_controllerFlags & 0x20) == 0)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Showing first-run wifi alert", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegController showNetworkAlertIfNecessary:](self, "showNetworkAlertIfNecessary:", v4);
    *(_BYTE *)&self->_controllerFlags |= 0x20u;
  }

}

- (void)resetNetworkFirstRunAlert
{
  char controllerFlags;

  controllerFlags = *(_BYTE *)&self->_controllerFlags & 0xDF;
  *(_BYTE *)&self->_controllerFlags = controllerFlags;
  if (self->_requiredWifiCount >= 1)
  {
    -[CNFRegController _startWiFiAlertWatchTimer](self, "_startWiFiAlertWatchTimer");
    controllerFlags = (char)self->_controllerFlags;
  }
  *(_BYTE *)&self->_controllerFlags = controllerFlags & 0xEF;
}

- (void)_wifiAlertWatchTimerFired:(id)a3
{
  NSTimer *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  NSTimer *wifiAlertWatchTimer;
  const __CFString *v15;
  const __CFString *v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (NSTimer *)a3;
  if (self->_wifiAlertWatchTimer == v4)
  {
    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "validNetworkEnabled");
    v7 = objc_msgSend(v5, "willSearchForNetwork");
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = CFSTR("NO");
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (v7)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEBUG, "Network alert timer fired, enabled=%@, searching=%@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v11 = CFSTR("NO");
      if (v6)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v7)
        v11 = CFSTR("YES");
      v15 = v12;
      v16 = v11;
      IMLogString();
    }
    if ((v6 & v7 & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Stopping wifi alert watch timer due to completion", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      -[NSTimer invalidate](self->_wifiAlertWatchTimer, "invalidate", v15, v16);
      wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
      self->_wifiAlertWatchTimer = 0;

      -[CNFRegController showNetworkFirstRunAlert:](self, "showNetworkFirstRunAlert:", 0);
    }

  }
}

- (void)_startWiFiAlertWatchTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *wifiAlertWatchTimer;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_wifiAlertWatchTimer)
    return;
  if ((*(_BYTE *)&self->_controllerFlags & 0x10) != 0)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Not starting wifi alert because we're already responding to a WiFi picker", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_14;
  }
  else if (-[CNFRegController deviceCanTakeNetworkAction](self, "deviceCanTakeNetworkAction"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Not starting wifi alert watch timer due to valid network route", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_14:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting wifi alert watch timer", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__wifiAlertWatchTimerFired_, 0, 1, 1.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
    self->_wifiAlertWatchTimer = v6;

    *(_BYTE *)&self->_controllerFlags |= 0x10u;
  }
}

- (void)_stopWiFiAlertWatchTimer
{
  NSObject *v3;
  NSTimer *wifiAlertWatchTimer;
  uint8_t v5[16];

  if (self->_wifiAlertWatchTimer)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Stopping wifi alert watch timer", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[NSTimer invalidate](self->_wifiAlertWatchTimer, "invalidate");
    wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
    self->_wifiAlertWatchTimer = 0;

  }
  *(_BYTE *)&self->_controllerFlags &= ~0x10u;
}

- (void)startRequiringWifi
{
  NSObject *v3;
  int64_t requiredWifiCount;
  int64_t v5;
  NSObject *v6;
  uint64_t v7;
  id *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requiredWifiCount = self->_requiredWifiCount;
    *(_DWORD *)buf = 134217984;
    v10 = requiredWifiCount;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Turning on wifi requirement with state [%ld]", buf, 0xCu);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && IMShouldLog())
    IMLogString();
  v5 = self->_requiredWifiCount;
  if (!v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "  Saving original network state for later", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v7 = SBSSpringBoardServerPort();
    MEMORY[0x2199B89DC](v7, &self->_originalCellFlag, &self->_originalWifiFlag);
    v8 = (id *)MEMORY[0x24BEBDF78];
    self->_originalUsesBackgroundNetwork = objc_msgSend((id)*MEMORY[0x24BEBDF78], "usesBackgroundNetwork");
    dispatch_async((dispatch_queue_t)self->_springboardNetworkFlagQueue, &__block_literal_global_4);
    objc_msgSend(*v8, "setUsesBackgroundNetwork:", 1);
    -[CNFRegController _startWiFiAlertWatchTimer](self, "_startWiFiAlertWatchTimer");
    v5 = self->_requiredWifiCount;
  }
  self->_requiredWifiCount = v5 + 1;
}

uint64_t __47__CNFRegController_Network__startRequiringWifi__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v0, OS_LOG_TYPE_DEFAULT, "Async setting app network flags: 1, 1", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v1 = SBSSpringBoardServerPort();
  return MEMORY[0x2199B8A00](v1, 1, 1);
}

- (void)stopRequiringWifi
{
  NSObject *v3;
  int64_t requiredWifiCount;
  int64_t v5;
  NSObject *v6;
  NSObject *springboardNetworkFlagQueue;
  BOOL v8;
  int64_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requiredWifiCount = self->_requiredWifiCount;
    *(_DWORD *)buf = 134217984;
    v12 = requiredWifiCount;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Turning off wifi requirement with state [%ld]", buf, 0xCu);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && IMShouldLog())
    IMLogString();
  v5 = self->_requiredWifiCount;
  if (v5 == 1)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "  Setting network back to its original state", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    springboardNetworkFlagQueue = self->_springboardNetworkFlagQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__CNFRegController_Network__stopRequiringWifi__block_invoke;
    block[3] = &unk_24D075180;
    block[4] = self;
    dispatch_async(springboardNetworkFlagQueue, block);
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "setUsesBackgroundNetwork:", self->_originalUsesBackgroundNetwork);
    -[CNFRegController _stopWiFiAlertWatchTimer](self, "_stopWiFiAlertWatchTimer");
    v5 = self->_requiredWifiCount;
  }
  v8 = v5 < 1;
  v9 = v5 - 1;
  if (!v8)
    self->_requiredWifiCount = v9;
}

uint64_t __46__CNFRegController_Network__stopRequiringWifi__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(v3 + 185);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 184);
    *(_DWORD *)buf = 67109376;
    v8 = v4;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Async setting app network flags: %d %d", buf, 0xEu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v5 = SBSSpringBoardServerPort();
  return MEMORY[0x2199B8A00](v5, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 185), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 184));
}

- (void)__updateSystemAccount
{
  void *v3;
  uint64_t v4;
  IMAccount *v5;
  int64_t v6;
  void *v7;
  void *v8;
  IMAccount *systemAccount;

  if (self->_systemAccountType == -1)
  {
    -[CNFRegController appleIDAccounts](self, "appleIDAccounts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegController firstService](self, "firstService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "__iCloudSystemAccountForService:", v8);
      v5 = (IMAccount *)objc_claimAutoreleasedReturnValue();

      v6 = v5 != 0;
    }
    self->_systemAccountType = v6;
    systemAccount = self->_systemAccount;
    self->_systemAccount = v5;

  }
}

- (BOOL)hasSystemAccount
{
  -[CNFRegController __updateSystemAccount](self, "__updateSystemAccount");
  return self->_systemAccountType > 0;
}

- (IMAccount)systemAccount
{
  -[CNFRegController __updateSystemAccount](self, "__updateSystemAccount");
  return self->_systemAccount;
}

- (int64_t)systemAccountType
{
  -[CNFRegController __updateSystemAccount](self, "__updateSystemAccount");
  return self->_systemAccountType;
}

- (void)refreshSystemAccount
{
  IMAccount *systemAccount;

  systemAccount = self->_systemAccount;
  self->_systemAccount = 0;

  self->_systemAccountType = -1;
}

- (void)accountRegistrationChanged:(void *)a1 .cold.1(void *a1)
{

  objc_end_catch();
}

- (void)accountRegistrationChanged:(void *)a1 .cold.7(void *a1)
{

  objc_end_catch();
}

@end
