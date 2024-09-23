@implementation IMDIDSService

- (void)_loadIDSAccountController
{
  IDSAccountController *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_accountController)
  {
    v3 = (IDSAccountController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D342A0]), "initWithService:", sub_1D15EFFBC(self));
    self->_accountController = v3;
    -[IDSAccountController addDelegate:queue:](v3, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = (void *)-[IDSAccountController accounts](self->_accountController, "accounts");
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v5)
      {
        v7 = v5;
        v8 = *(_QWORD *)v15;
        *(_QWORD *)&v6 = 138412290;
        v13 = v6;
        v9 = MEMORY[0x1E0C80D38];
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v4);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
            v12 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", v13);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v13;
              v19 = v11;
              _os_log_debug_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "Adding registration delegate for account %@", buf, 0xCu);
            }
            objc_msgSend(v11, "addRegistrationDelegate:queue:", self, v9);
            ++v10;
          }
          while (v7 != v10);
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        }
        while (v7);
      }
    }
  }
  -[IMDIDSService _loadIDSAccountController](-[IMDIDSService subService](self, "subService"), "_loadIDSAccountController");
}

- (IMDIDSService)initWithBundle:(id)a3
{
  return -[IMDIDSService initWithBundle:isMainService:](self, "initWithBundle:isMainService:", a3, 1);
}

- (IMDIDSService)initWithBundle:(id)a3 subServiceName:(id)a4
{
  IMDIDSService *v6;
  IMDIDSService *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDIDSService;
  v6 = -[IMDService initWithBundle:](&v9, sel_initWithBundle_);
  if (v6)
  {
    if (objc_msgSend(a4, "length"))
    {
      v7 = -[IMDIDSService initWithBundle:isMainService:]([IMDIDSService alloc], "initWithBundle:isMainService:", a3, 0);
      v6->_subService = v7;
      -[IMDIDSService setMainService:](v7, "setMainService:", v6);
      -[IMDIDSService setSubServiceName:](v6->_subService, "setSubServiceName:", a4);
    }
    -[IMDIDSService _loadIDSAccountController](v6, "_loadIDSAccountController");
  }
  return v6;
}

- (IMDIDSService)initWithBundle:(id)a3 isMainService:(BOOL)a4
{
  _BOOL4 v4;
  IMDIDSService *v5;
  IMDIDSService *v6;
  BOOL v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)IMDIDSService;
  v5 = -[IMDService initWithBundle:](&v9, sel_initWithBundle_, a3);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    -[IMDIDSService _loadIDSAccountController](v5, "_loadIDSAccountController");
  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[IDSAccountController accounts](self->_accountController, "accounts");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeRegistrationDelegate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[IDSAccountController removeDelegate:](self->_accountController, "removeDelegate:", self);

  objc_storeWeak((id *)&self->_mainService, 0);
  v8.receiver = self;
  v8.super_class = (Class)IMDIDSService;
  -[IMDService dealloc](&v8, sel_dealloc);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (id)accountFromIDSAccountWithUniqueID:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[IMDIDSService _loadIDSAccountController](self, "_loadIDSAccountController");
  v5 = (void *)objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountsForService:", self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "idsAccount"), "uniqueID"), "isEqualToIgnoringCase:", a3) & 1) != 0)
    {
      return v10;
    }
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_serviceDomain
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D36ED8], CFSTR("ids"));
}

- (IMDIDSService)mainService
{
  IMDIDSService **p_mainService;
  objc_super v5;

  p_mainService = &self->_mainService;
  if (objc_loadWeak((id *)&self->_mainService))
    return (IMDIDSService *)objc_loadWeak((id *)p_mainService);
  v5.receiver = self;
  v5.super_class = (Class)IMDIDSService;
  return (IMDIDSService *)-[IMDService mainService](&v5, sel_mainService);
}

- (BOOL)isSubService
{
  return -[IMDIDSService subServiceName](self, "subServiceName") != 0;
}

- (BOOL)isRegistrationUnmanaged
{
  NSDictionary *v4;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall")
    && (IMGetDomainBoolForKey() & 1) != 0)
  {
    return 0;
  }
  v4 = -[IMDService serviceProperties](self, "serviceProperties");
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FF8]), "BOOLValue");
}

- (BOOL)canManageRegistration
{
  if (-[IMDIDSService isSubService](self, "isSubService"))
    return 0;
  else
    return !-[IMDIDSService isRegistrationUnmanaged](self, "isRegistrationUnmanaged");
}

- (id)imdAccountLoginFromIDSAccountWithType:(int)a3 login:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)MEMORY[0x1D17EA374](a4, a2);
  v6 = v5;
  if (a3)
  {
    if (a3 <= 2)
    {
      if (objc_msgSend(v5, "length"))
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("E:%@"), v6);
      return CFSTR("E:");
    }
  }
  else
  {
    if (objc_msgSend(v5, "length"))
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("P:%@"), IMFormatPhoneNumber());
    return CFSTR("P:");
  }
  return v6;
}

- (NSArray)accountsLoadedFromIdentityServices
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  IMDIDSAccount *v12;
  NSArray *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMDIDSService _loadIDSAccountController](self, "_loadIDSAccountController");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)-[IDSAccountController accounts](self->_accountController, "accounts");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = *MEMORY[0x1E0D35190];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = -[IMDIDSService imdAccountLoginFromIDSAccountWithType:login:](self, "imdAccountLoginFromIDSAccountWithType:login:", objc_msgSend(v9, "accountType"), objc_msgSend(v9, "loginID"));
        v11 = (void *)objc_msgSend((id)objc_msgSend(v9, "accountInfo"), "mutableCopy");
        objc_msgSend(v11, "setObject:forKey:", v10, v7);
        v12 = -[IMDIDSAccount initWithAccountID:defaults:service:idsAccount:]([IMDIDSAccount alloc], "initWithAccountID:defaults:service:idsAccount:", objc_msgSend(v9, "uniqueID"), v11, self, v9);
        objc_msgSend(v3, "addObject:", v12);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  v13 = -[IMDIDSService accountsLoadedFromIdentityServices](-[IMDIDSService subService](self, "subService"), "accountsLoadedFromIdentityServices");
  if (-[NSArray count](v13, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v13);
  return (NSArray *)v3;
}

- (NSArray)activeAccountsFromIdentityServices
{
  NSArray *v3;
  NSArray *v4;

  v3 = (NSArray *)objc_msgSend((id)-[IDSAccountController enabledAccounts](self->_accountController, "enabledAccounts"), "allObjects");
  v4 = -[IMDIDSService activeAccountsFromIdentityServices](-[IMDIDSService subService](self, "subService"), "activeAccountsFromIdentityServices");
  if (-[NSArray count](v4, "count"))
    return -[NSArray arrayByAddingObjectsFromArray:](v3, "arrayByAddingObjectsFromArray:", v4);
  else
    return v3;
}

- (void)accountAdded:(id)a3
{
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((IMDIDSService *)objc_msgSend(a3, "service") != self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:
    v7.receiver = self;
    v7.super_class = (Class)IMDIDSService;
    -[IMDService accountAdded:](&v7, sel_accountAdded_, a3);
    return;
  }
  v5 = (void *)objc_msgSend(a3, "idsAccount");
  if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
    objc_msgSend(v5, "addRegistrationDelegate:queue:", self, MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v5, "accountType") != 2)
  {
    if (-[IMDIDSService canManageRegistration](self, "canManageRegistration")
      && !-[IDSAccountController accountWithUniqueID:](self->_accountController, "accountWithUniqueID:", objc_msgSend(v5, "uniqueID")))
    {
      v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v9 = a3;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDAccount added %@, adding corresponding IDSAccount %@", buf, 0x16u);
      }
      -[IDSAccountController addAccount:](self->_accountController, "addAccount:", v5);
    }
    goto LABEL_11;
  }
}

- (void)accountRemoved:(id)a3
{
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((IMDIDSService *)objc_msgSend(a3, "service") == self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a3, "idsAccount");
      objc_msgSend(v5, "removeRegistrationDelegate:", self);
      if (objc_msgSend(v5, "accountType") == 2)
        return;
      if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
      {
        v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v9 = a3;
          v10 = 2112;
          v11 = v5;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDAccount removed %@, removing corresponding IDSAccount %@", buf, 0x16u);
        }
        -[IDSAccountController _removeAccount:](self->_accountController, "_removeAccount:", objc_msgSend(v5, "uniqueID"));
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)IMDIDSService;
  -[IMDService accountRemoved:](&v7, sel_accountRemoved_, a3);
}

- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4
{
  void *v7;
  IMDIDSAccount *v8;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34298]), "initWithDictionary:uniqueID:serviceName:", a3, a4, sub_1D15EFFBC(self));
  v8 = -[IMDIDSAccount initWithAccountID:defaults:service:idsAccount:]([IMDIDSAccount alloc], "initWithAccountID:defaults:service:idsAccount:", a4, a3, self, v7);

  return v8;
}

- (void)enableAccount:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_activatingAccount && (IMDIDSService *)objc_msgSend(a3, "service") == self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(a3, "idsAccount");
      if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
      {
        v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 138412290;
          v8 = v5;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Enabling IDSAccount %@", (uint8_t *)&v7, 0xCu);
        }
        -[IDSAccountController enableAccount:](self->_accountController, "enableAccount:", v5);
      }
    }
  }
}

- (void)disableAccount:(id)a3
{
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_deactivatingAccount && (IMDIDSService *)objc_msgSend(a3, "service") == self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a3, "idsAccount");
      if (objc_msgSend(v5, "accountType") != 2)
      {
        if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
        {
          v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            v7 = 138412290;
            v8 = objc_msgSend(v5, "uniqueID");
            _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Disabling IDSAccount %@", (uint8_t *)&v7, 0xCu);
          }
          -[IDSAccountController disableAccount:](self->_accountController, "disableAccount:", v5);
        }
      }
    }
  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  NSObject *v6;
  IMDIDSAccount *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = objc_msgSend(a4, "uniqueID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Received account added %@", (uint8_t *)&v8, 0xCu);
  }
  if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
    objc_msgSend(a4, "addRegistrationDelegate:queue:", self, MEMORY[0x1E0C80D38]);
  v7 = -[IMDIDSAccount initWithAccountID:defaults:service:idsAccount:]([IMDIDSAccount alloc], "initWithAccountID:defaults:service:idsAccount:", objc_msgSend(a4, "uniqueID"), objc_msgSend(a4, "accountInfo"), self, a4);
  if (v7)
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "addAccount:", v7);

}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  NSObject *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = objc_msgSend(a4, "uniqueID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Received account updates %@", (uint8_t *)&v8, 0xCu);
  }
  v7 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
    objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v7, "service")), "account:defaultsChanged:", objc_msgSend(v7, "accountID"), objc_msgSend(v7, "accountDefaults"));
  objc_msgSend((id)objc_msgSend(v7, "session"), "accountDefaultsChanged:", 0);
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = objc_msgSend(a4, "uniqueID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Received accountRemoved %@", (uint8_t *)&v15, 0xCu);
  }
  if (-[IMDIDSService canManageRegistration](self, "canManageRegistration"))
    objc_msgSend(a4, "removeRegistrationDelegate:", self);
  v7 = objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "removeAccount:", v7);
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D166CF98((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = objc_msgSend(a4, "uniqueID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Received accountEnabled %@", (uint8_t *)&v15, 0xCu);
  }
  v7 = (void *)objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    self->_activatingAccount = 1;
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "activateAccount:", objc_msgSend(v7, "accountID"));
    self->_activatingAccount = 0;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D166CFFC((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = objc_msgSend(a4, "uniqueID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Received accountDisabled %@", (uint8_t *)&v15, 0xCu);
  }
  v7 = (void *)objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    self->_deactivatingAccount = 1;
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "deactivateAccount:", objc_msgSend(v7, "accountID"));
    self->_deactivatingAccount = 0;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D166D060((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3, a4);
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = objc_msgSend(v4, "accountID");
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "IMDIDSService received registration status changed: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v4, "service")), "account:defaultsChanged:", objc_msgSend(v4, "accountID"), objc_msgSend(v4, "accountDefaults"));
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = a4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = objc_msgSend(v5, "accountID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received aliases changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3, a4);
  v5 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = objc_msgSend(v4, "accountID");
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "IMDIDSService received vetted aliases changed: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }
  -[IMDNicknameController aliasesDidChange:](+[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"), "aliasesDidChange:", objc_msgSend(v4, "multiplePhoneNumbersTiedToAccount"));
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v4, "service")), "account:defaultsChanged:", objc_msgSend(v4, "accountID"), objc_msgSend(v4, "accountDefaults"));
}

- (void)account:(id)a3 profileChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = a4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = objc_msgSend(v5, "accountID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received profile changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = a4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = objc_msgSend(v5, "accountID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received login changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = a4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = objc_msgSend(v5, "accountID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received display name changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v6 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = objc_msgSend(v5, "accountID");
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, " => Registration failed, deactivating...: %@ (%@)", buf, 0x16u);
  }
  objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "deactivateAccount:", objc_msgSend(v5, "accountID"));
  if (objc_msgSend(a4, "BOOLValue"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15F1BCC;
    block[3] = &unk_1E9228690;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3);
  v4 = objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = objc_msgSend(v3, "accountID");
    _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_DEFAULT, "IMDIDSService received refresh registration: %@ (%@)", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend((id)objc_msgSend(v3, "session"), "refreshRegistration");
}

- (void)setMockAccountController:(id)a3
{
  self->_accountController = (IDSAccountController *)a3;
}

- (id)mockAccountController
{
  return self->_accountController;
}

- (IMDIDSService)subService
{
  return self->_subService;
}

- (void)setSubService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)subServiceName
{
  return self->_subServiceName;
}

- (void)setSubServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setMainService:(id)a3
{
  objc_storeWeak((id *)&self->_mainService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainService);
}

@end
