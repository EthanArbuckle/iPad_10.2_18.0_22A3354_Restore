@implementation ACDAuthenticationPluginManager

- (void)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  _ACDLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:].cold.3();

  -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:].cold.2();

  -[ACDAuthenticationPluginManager _pluginForAuthenticationType:](self, "_pluginForAuthenticationType:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    _ACDLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ACDAuthenticationPluginManager credentialForAccount:client:store:handler:].cold.1(v10, v20);

    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDB4200];
    v23 = -101;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "credentialForAccount:client:", v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = 0;
      objc_msgSend(v17, "credentialForAccount:client:store:error:", v10, v11, v12, &v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v27;
      goto LABEL_16;
    }
    _ACDLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl(&dword_20D8CB000, v26, OS_LOG_TYPE_DEFAULT, "\"The plugin for account %@ does not implement credentialForAccount\", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDB4200];
    v23 = -102;
LABEL_11:
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_17;
  }
  v28 = 0;
  objc_msgSend(v17, "credentialForAccount:client:error:", v10, v11, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v28;
LABEL_16:
  v19 = v24;
LABEL_17:
  _ACDLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v18;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_debug_impl(&dword_20D8CB000, v25, OS_LOG_TYPE_DEBUG, "\"Returning credential %@ for account %@ to %@.\", buf, 0x20u);
  }

  v13[2](v13, v18, v19);
}

- (id)_authenticationTypeForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "authenticationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDB4548];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB4548]))
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.3();

    v8 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(v4, "parentAccountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "authenticationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v6))
    {
      -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _ACDLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (!v11)
      {
        if (v17)
          -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.1(v10, v16);

        objc_msgSend(v10, "accountType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      if (v17)
        -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.2();

      v12 = v11;
    }
    v15 = v12;
LABEL_15:

LABEL_19:
    goto LABEL_20;
  }
  _ACDLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (!v5)
  {
    if (v14)
      -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.4(v4, v13);

    objc_msgSend(v4, "accountType");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v14)
    -[ACDAuthenticationPluginManager _authenticationTypeForAccount:].cold.5();

  v15 = v5;
LABEL_20:

  return v15;
}

- (id)_pluginForAuthenticationType:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  objc_class *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_authenticationPluginsByType;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_authenticationPluginsByType, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    +[ACDPluginLoader pluginForIdentifier:subpath:](ACDPluginLoader, "pluginForIdentifier:subpath:", v4, CFSTR("Authentication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "loadAndReturnError:", &v18);
    v8 = v18;
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.5();

    if (!v7)
    {
      _ACDLogSystem();
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.1();
      v6 = 0;
      goto LABEL_23;
    }
    v10 = self->_authenticationPluginsByType;
    objc_sync_enter(v10);
    -[NSMutableDictionary objectForKey:](self->_authenticationPluginsByType, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v11 = (objc_class *)objc_msgSend(v7, "principalClass");
      _ACDLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.4();

      v6 = objc_alloc_init(v11);
      _ACDLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.3();

      if (v6)
      {
        if (-[NSObject conformsToProtocol:](v6, "conformsToProtocol:", &unk_2549DCE00))
        {
          -[NSMutableDictionary setObject:forKey:](self->_authenticationPluginsByType, "setObject:forKey:", v6, v4);
          goto LABEL_22;
        }
        _ACDLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAuthenticationPluginManager _pluginForAuthenticationType:].cold.2(v16, (uint64_t)buf, v15);
        }

      }
      else
      {
        _ACDLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v20 = v14;
          v21 = 2112;
          v22 = v4;
          v23 = 2112;
          v24 = v8;
          _os_log_error_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_ERROR, "\"ACDAuthenticationPluginManager: an authentication plugin of class %@ for auth type %@ could not be instantiated! Load Error: %@\", buf, 0x20u);

        }
      }

      v6 = 0;
    }
LABEL_22:
    objc_sync_exit(v10);
LABEL_23:

  }
  return v6;
}

- (ACDAuthenticationPluginManager)init
{
  ACDAuthenticationPluginManager *v2;
  ACDQueueDictionary *v3;
  ACDQueueDictionary *verificationHandlerQueues;
  ACDQueueDictionary *v5;
  ACDQueueDictionary *renewalHandlerQueues;
  ACDQueueDictionary *v7;
  ACDQueueDictionary *discoveryHandlerQueues;
  uint64_t v9;
  ACRateLimiter *renewalRateLimiter;
  NSMutableSet *v11;
  NSMutableSet *keysForRateExceededBugSent;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *authenticationPluginQueue;
  NSMutableDictionary *v16;
  NSMutableDictionary *authenticationPluginsByType;
  NSLock *v18;
  NSLock *verificationHandlersLock;
  NSLock *v20;
  NSLock *renewalHandlersLock;
  NSLock *v22;
  NSLock *discoveryHandlersLock;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ACDAuthenticationPluginManager;
  v2 = -[ACDAuthenticationPluginManager init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ACDQueueDictionary);
    verificationHandlerQueues = v2->_verificationHandlerQueues;
    v2->_verificationHandlerQueues = v3;

    v5 = objc_alloc_init(ACDQueueDictionary);
    renewalHandlerQueues = v2->_renewalHandlerQueues;
    v2->_renewalHandlerQueues = v5;

    v7 = objc_alloc_init(ACDQueueDictionary);
    discoveryHandlerQueues = v2->_discoveryHandlerQueues;
    v2->_discoveryHandlerQueues = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDB43F8]), "initWithMaximum:inTimeInterval:", 60, 3600.0);
    renewalRateLimiter = v2->_renewalRateLimiter;
    v2->_renewalRateLimiter = (ACRateLimiter *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    keysForRateExceededBugSent = v2->_keysForRateExceededBugSent;
    v2->_keysForRateExceededBugSent = v11;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("AuthenticationPluginQueue", v13);
    authenticationPluginQueue = v2->_authenticationPluginQueue;
    v2->_authenticationPluginQueue = (OS_dispatch_queue *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    authenticationPluginsByType = v2->_authenticationPluginsByType;
    v2->_authenticationPluginsByType = v16;

    v18 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    verificationHandlersLock = v2->_verificationHandlersLock;
    v2->_verificationHandlersLock = v18;

    v20 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    renewalHandlersLock = v2->_renewalHandlersLock;
    v2->_renewalHandlersLock = v20;

    v22 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    discoveryHandlersLock = v2->_discoveryHandlersLock;
    v2->_discoveryHandlersLock = v22;

  }
  return v2;
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:].cold.3();

  -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:].cold.2();

  -[ACDAuthenticationPluginManager _pluginForAuthenticationType:](self, "_pluginForAuthenticationType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "isPushSupportedForAccount:", v4);
  }
  else
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"The plugin for account %@ does not implement isPushSupportedForAccount:\", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager isPushSupportedForAccount:].cold.1(v9, (uint64_t)v4, v11);

  return v9;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 handler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  ACDAuthenticationPluginManager *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ACDQueueDictionary *verificationHandlerQueues;
  NSObject *v31;
  int v32;
  void *v33;
  char v34;
  ACDQueueDictionary *v35;
  void *v36;
  void *v37;
  NSObject *authenticationPluginQueue;
  void *v39;
  void *v40;
  unsigned int v42;
  id v43;
  id aBlock;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  ACDAuthenticationPluginManager *v49;
  id v50;
  id v51;
  SEL v52;
  char v53;
  uint64_t v54;
  ACDAuthenticationPluginManager *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v43 = a4;
  aBlock = a6;
  -[ACDAuthenticationPluginManager _unsanitizeOptionsDictionary:](self, "_unsanitizeOptionsDictionary:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB4540]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB44B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  _ACDLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v42);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "client");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = v10;
    v58 = 2112;
    v59 = v39;
    v60 = 2112;
    v61 = v40;
    _os_log_debug_impl(&dword_20D8CB000, v15, OS_LOG_TYPE_DEBUG, "\"verifyCredentialsForAccount %@ (should save? %@) was called for client %@...\", buf, 0x20u);

  }
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v10, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:].cold.3();

  -[ACDAuthenticationPluginManager _pluginForAuthenticationType:](self, "_pluginForAuthenticationType:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = self;
    objc_sync_enter(v20);
    if (v14)
    {
      v21 = v10;
    }
    else
    {
      -[ACDAuthenticationPluginManager _authCapableParentAccountForAccount:](v20, "_authCapableParentAccountForAccount:", v10);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v21;
    -[NSLock lock](v20->_verificationHandlersLock, "lock");
    verificationHandlerQueues = v20->_verificationHandlerQueues;
    objc_msgSend(v29, "identifier");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = -[ACDQueueDictionary isQueueEmptyForKey:](verificationHandlerQueues, "isQueueEmptyForKey:", v31);
    if ((v32 & 1) == 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDB44B0]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      if ((v34 & 1) != 0)
      {
        v32 = 1;
        goto LABEL_19;
      }
      _ACDLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:].cold.2();
    }

LABEL_19:
    v35 = v20->_verificationHandlerQueues;
    v36 = _Block_copy(aBlock);
    objc_msgSend(v29, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDQueueDictionary addObject:toQueueForKey:](v35, "addObject:toQueueForKey:", v36, v37);

    -[NSLock unlock](v20->_verificationHandlersLock, "unlock");
    if (v32)
    {
      authenticationPluginQueue = v20->_authenticationPluginQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke;
      block[3] = &unk_24C7E2D58;
      v46 = v10;
      v47 = v29;
      v52 = a2;
      v48 = v19;
      v49 = v20;
      v50 = v43;
      v53 = v42;
      v51 = v11;
      dispatch_async(authenticationPluginQueue, block);

    }
    objc_sync_exit(v20);
    goto LABEL_22;
  }
  _ACDLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[ACDAuthenticationPluginManager verifyCredentialsForAccount:accountStore:options:handler:].cold.1(v10, v22);

  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "accountType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("No auth plugin to verify credentials for accounts of type %@"), v25);
  v20 = (ACDAuthenticationPluginManager *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD1540];
  v54 = *MEMORY[0x24BDD0FC8];
  v55 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 4, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))aBlock + 2))(aBlock, 0, v28);

LABEL_22:
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v2 = (void *)MEMORY[0x24BDB43F0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2;
  v7[3] = &unk_24C7E2D58;
  v3 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v15 = *(_BYTE *)(a1 + 88);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performWithinPersonaForAccount:withBlock:", v3, v7);

}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_2();

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_19;
  v19 = &unk_24C7E2D30;
  v3 = *(id *)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 48);
  v20 = v3;
  v21 = v4;
  v22 = *(id *)(a1 + 32);
  v23 = *(id *)(a1 + 56);
  v25 = *(_BYTE *)(a1 + 88);
  v5 = _Block_copy(&v16);
  v6 = objc_opt_respondsToSelector();
  v7 = *(void **)(a1 + 40);
  if ((v6 & 1) != 0)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend(v7, "verifyCredentialsForAccount:accountStore:options:completion:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5);
  }
  else
  {
    v9 = objc_opt_respondsToSelector();
    v10 = *(void **)(a1 + 40);
    if ((v9 & 1) != 0)
    {
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
      objc_msgSend(v10, "verifyCredentialsForAccount:accountStore:completion:", v8, *(_QWORD *)(a1 + 56), v5);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", v16, v17, v18, v19, v20, v21, v22);
      objc_msgSend(*(id *)(a1 + 56), "client");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "verifyCredentialsForAccount:client:withHandler:", v8, v12, v5);

    }
    else
    {
      _ACDLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], -102, 0, v16, v17, v18, v19, v20, v21, v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 48);
      v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(v14, "_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:", v15, 0, v8, *(_QWORD *)(a1 + 56), 0);

    }
  }

}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  _BOOL4 v5;
  void *v6;
  const char *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2 == 0;
  v6 = *(void **)(a1 + 32);
  v7 = *(const char **)(a1 + 64);
  v8 = a3;
  v9 = a2;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  objc_msgSend(v9, "accountByCleaningThirdPartyTransformations");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_sanitizeError:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ac_secureCodingError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:", *(_QWORD *)(a1 + 48), v12, v11, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
}

- (void)_handleVerificationCompletionForAccount:(id)a3 verifiedAccount:(id)a4 error:(id)a5 store:(id)a6 shouldSave:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  ACDQueueDictionary *verificationHandlerQueues;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v7 = a7;
  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  _ACDLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v42 = v12;
    v43 = 2112;
    v44 = v13;
    v45 = 2112;
    v46 = v14;
    _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleVerificationCompletion: plugin reports being done for account %@. Verified account is %@ and error is %@\", buf, 0x20u);
  }

  if (v13)
  {
    objc_msgSend(v13, "setAuthenticated:", 1);
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v18)
        -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:].cold.2();

      v39 = 0;
      v17 = objc_msgSend(v15, "saveVerifiedAccount:error:", v13, &v39);
      v19 = v39;
      _ACDLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v13;
        v43 = 2112;
        v44 = v34;
        v45 = 2112;
        v46 = v19;
        _os_log_debug_impl(&dword_20D8CB000, v20, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleVerificationCompletion: saving verified account %@ completed with result %@ and error %@\", buf, 0x20u);

      }
      objc_msgSend(v15, "client");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hasEntitlement:", *MEMORY[0x24BDB4450]);

      if (v22)
        objc_msgSend(v13, "setCredential:", 0);
    }
    else
    {
      if (v18)
        -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:].cold.3();

      v19 = 0;
      LODWORD(v17) = 1;
    }
  }
  else
  {
    v19 = 0;
    LODWORD(v17) = 0;
  }
  _ACDLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager _handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:].cold.1();

  -[NSLock lock](self->_verificationHandlersLock, "lock");
  verificationHandlerQueues = self->_verificationHandlerQueues;
  objc_msgSend(v12, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDQueueDictionary dequeueAllObjectsInQueueForKey:](verificationHandlerQueues, "dequeueAllObjectsInQueueForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_verificationHandlersLock, "unlock");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        if ((_DWORD)v17)
        {
          v32 = v13;
        }
        else
        {
          v32 = 0;
          if (v19)
          {
            v33 = v19;
            goto LABEL_27;
          }
        }
        v33 = v14;
LABEL_27:
        (*(void (**)(_QWORD, id, id))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v32, v33);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }

}

- (unint64_t)renewalCredentialTimeout
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.accounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("renewalCredentialTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    if ((unint64_t)(v5 - 1) >= 0xE0F)
      v6 = 3600;
    else
      v6 = v5;
  }
  else
  {
    v6 = 3600;
  }

  return v6;
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  ACDAuthenticationPluginManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  id v57;
  NSObject *v58;
  ACDQueueDictionary *renewalHandlerQueues;
  NSObject *v60;
  int v61;
  int v62;
  NSObject *v63;
  ACDQueueDictionary *v64;
  NSObject *authenticationPluginQueue;
  id v66;
  unsigned int v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  id v70;
  void *v71;
  void (**aBlock)(id, uint64_t, _QWORD);
  id v73;
  void *v74;
  ACDAuthenticationPluginManager *v75;
  id obj;
  _QWORD block[4];
  id v78;
  ACDAuthenticationPluginManager *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  _BYTE *v85;
  SEL v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  _BYTE buf[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  _BYTE v103[20];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v73 = a3;
  v70 = a4;
  aBlock = (void (**)(id, uint64_t, _QWORD))a6;
  -[ACDAuthenticationPluginManager _unsanitizeOptionsDictionary:](self, "_unsanitizeOptionsDictionary:", a5);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB43C8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForManagedDefault:", *MEMORY[0x24BDB4368]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BDB4530]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BDB4528]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x24BDB44B8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BDB4518]);
  v69 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v70, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v68);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v73;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    v102 = v69;
    *(_WORD *)v103 = 2114;
    *(_QWORD *)&v103[2] = v20;
    *(_WORD *)&v103[10] = 2114;
    *(_QWORD *)&v103[12] = v21;
    _os_log_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEFAULT, "\"renewCredentialsForAccount %@ was called by client %{public}@ with reason %@ shouldForce %{public}@ shouldAvoidUI %{public}@\", buf, 0x34u);

  }
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v73, "accountType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v73);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _ACDLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:].cold.3();

  if (v12)
  {
    _ACDLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:].cold.1(v24);

    aBlock[2](aBlock, 1, 0);
  }
  else
  {
    -[ACDAuthenticationPluginManager _pluginForAuthenticationType:](self, "_pluginForAuthenticationType:", v71);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = self;
      objc_sync_enter(v26);
      v75 = v26;
      if (v17)
      {
        v66 = v73;
      }
      else
      {
        -[ACDAuthenticationPluginManager _authCapableParentAccountForAccount:](v26, "_authCapableParentAccountForAccount:", v73);
        v66 = (id)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v25, "renewalIDsForAccount:accountStore:options:", v66, v70, v74);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v25, "renewalIDForAccount:", v66);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v36)
        {
          v98 = v36;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v98, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }

      }
      else
      {
        v35 = 0;
      }
      if (!objc_msgSend(v35, "count"))
      {
        objc_msgSend(v66, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v38;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
        v39 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v39;
      }
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v35, "count"));
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      obj = v35;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v92 != v42)
              objc_enumerationMutation(obj);
            v44 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
            v45 = (void *)MEMORY[0x24BDD17C8];
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%@.%@"), v47, v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "addObject:", v48);
          }
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
        }
        while (v41);
      }

      -[NSLock lock](v75->_renewalHandlersLock, "lock");
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v49 = v40;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v88;
        v52 = *MEMORY[0x24BDB44B0];
LABEL_38:
        v53 = 0;
        while (1)
        {
          if (*(_QWORD *)v88 != v51)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v53);
          if (!-[ACDQueueDictionary isQueueEmptyForKey:](v75->_renewalHandlerQueues, "isQueueEmptyForKey:", v54))
          {
            objc_msgSend(v74, "objectForKeyedSubscript:", v52);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "BOOLValue");

            if ((v56 & 1) == 0)
              break;
          }
          if (v50 == ++v53)
          {
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
            if (v50)
              goto LABEL_38;
            goto LABEL_45;
          }
        }
        v57 = v54;

        if (!v57)
          goto LABEL_50;
        _ACDLogSystem();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v73;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v57;
          _os_log_impl(&dword_20D8CB000, v58, OS_LOG_TYPE_DEFAULT, "\"It appears we are already renewing credentials for account %@ with renewal ID %@. We will enqueue the current request's completion handler and call it when done.\", buf, 0x16u);
        }

        renewalHandlerQueues = v75->_renewalHandlerQueues;
        v60 = _Block_copy(aBlock);
        -[ACDQueueDictionary addObject:toQueueForKey:](renewalHandlerQueues, "addObject:toQueueForKey:", v60, v57);
        v61 = 0;
        v62 = 0;
      }
      else
      {
LABEL_45:

LABEL_50:
        if ((v68 & 1) != 0
          || -[ACDAuthenticationPluginManager _renewalRequestIsWithinLimitsForAccount:accountStore:](v75, "_renewalRequestIsWithinLimitsForAccount:accountStore:", v73, v70))
        {
          _ACDLogSystem();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v73;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = 0;
            _os_log_impl(&dword_20D8CB000, v63, OS_LOG_TYPE_DEFAULT, "\"Allow new renewal for account %@ with renewal ID %@.\", buf, 0x16u);
          }

          objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          v64 = v75->_renewalHandlerQueues;
          v60 = _Block_copy(aBlock);
          -[ACDQueueDictionary addObject:toQueueForKey:](v64, "addObject:toQueueForKey:", v60, v57);
          v62 = 0;
          v61 = 1;
        }
        else
        {
          _ACDLogSystem();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v73;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = 0;
            _os_log_impl(&dword_20D8CB000, v60, OS_LOG_TYPE_DEFAULT, "\"Limit renewal for account %@ with renewal ID %@.\", buf, 0x16u);
          }
          v61 = 0;
          v57 = 0;
          v62 = 1;
        }
      }

      -[NSLock unlock](v75->_renewalHandlersLock, "unlock");
      if (v62)
      {
        aBlock[2](aBlock, 1, 0);
      }
      else if (v61)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v102 = __Block_byref_object_copy__5;
        *(_QWORD *)v103 = __Block_byref_object_dispose__5;
        *(_QWORD *)&v103[8] = v70;
        authenticationPluginQueue = v75->_authenticationPluginQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke;
        block[3] = &unk_24C7E2DD0;
        v78 = v73;
        v79 = v75;
        v80 = v25;
        v86 = a2;
        v81 = v66;
        v82 = v57;
        v85 = buf;
        v83 = v74;
        v84 = v69;
        dispatch_async(authenticationPluginQueue, block);

        _Block_object_dispose(buf, 8);
      }

      v31 = v75;
      objc_sync_exit(v75);
    }
    else
    {
      _ACDLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ACDAuthenticationPluginManager renewCredentialsForAccount:accountStore:options:completion:].cold.2(v73, v27);

      v28 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v73, "accountType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("No auth plugin to renew credentials for accounts of type %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x24BDD1540];
      v99 = *MEMORY[0x24BDD0FC8];
      v100 = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 4, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))aBlock)[2](aBlock, 2, v34);

    }
  }

}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v2 = (void *)MEMORY[0x24BDB43F0];
  v3 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2;
  v11[3] = &unk_24C7E2DD0;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v12 = v4;
  v13 = v5;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 96);
  v14 = v7;
  v20 = v8;
  v15 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 88);
  v16 = v9;
  v19 = v10;
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 80);
  objc_msgSend(v2, "performWithinPersonaForAccount:withBlock:", v4, v11);

}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_2();

  v3 = objc_msgSend(*(id *)(a1 + 40), "renewalCredentialTimeout");
  objc_msgSend(MEMORY[0x24BDB4408], "expirerWithTimeout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_45;
  v29[3] = &unk_24C7E2D80;
  v6 = v4;
  v30 = v6;
  v31 = *(id *)(a1 + 48);
  v32 = v3;
  objc_msgSend(v6, "scheduleExpiration:", v29);
  v18 = v5;
  v19 = 3221225472;
  v20 = __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_55;
  v21 = &unk_24C7E2DA8;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 96);
  v22 = v7;
  v28 = v8;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 40);
  v23 = v9;
  v24 = v10;
  v25 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 88);
  v26 = v11;
  v27 = v12;
  v13 = _Block_copy(&v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "renewCredentialsForAccount:accountStore:options:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 72), v13, v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "renewCredentialsForAccount:accountStore:reason:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 80), v13, v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], -102, 0, v18, v19, v20, v21, v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelTimer");
    objc_msgSend(*(id *)(a1 + 40), "_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v15);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cancelTimer");
  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_45_cold_1();

  if (ACIsInternal())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Slow Credential Renewal: %@"), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:](ACDPluginAnalyticsSender, "openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:", CFSTR("Slow Credential Renewal"), CFSTR("Accounts is tracking issues with slow or stuck credential renewals, please help us out by filing a radar via Tap-To-Radar"), v3, CFSTR("I was informed of a slow or hung authentication plugin, please investigate."));

  }
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL4 v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2 == 2;
  v6 = *(void **)(a1 + 32);
  v7 = *(const char **)(a1 + 80);
  v8 = a3;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "cancelTimer");
  objc_msgSend(*(id *)(a1 + 48), "_sanitizeError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ac_secureCodingError");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:", a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (BOOL)_renewalRequestIsWithinLimitsForAccount:(id)a3 accountStore:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  ACDAuthenticationPluginManager *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSObject identifier](v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastCredentialRenewalRejectionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "timeIntervalSinceDate:", v10),
        v13 = v12,
        v11,
        v13 < 86400.0))
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"The user has declined an identical request to renew credentials for %@ within the past 24 hours. Suppressing the password prompt and failing immediately.\", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = DMIsMigrationNeeded();
    v21 = CFSTR("NO");
    if (v20)
      v21 = CFSTR("YES");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@.%@"), v18, v19, v21);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = -[ACRateLimiter reservePerformActionForKey:](self->_renewalRateLimiter, "reservePerformActionForKey:", v14);
    if ((v15 & 1) == 0)
    {
      _ACDLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[NSObject accountType](v6, "accountType");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ACRateLimiter maximum](self->_renewalRateLimiter, "maximum"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x24BDD16E0];
        -[ACRateLimiter timeInterval](self->_renewalRateLimiter, "timeInterval");
        objc_msgSend(v28, "numberWithDouble:", v29 / 60.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v14;
        v37 = 2114;
        v38 = v33;
        v39 = 2114;
        v40 = v31;
        v41 = 2114;
        v42 = v30;
        _os_log_error_impl(&dword_20D8CB000, v22, OS_LOG_TYPE_ERROR, "\"%{public}@ (%{public}@) exceeded %{public}@ renewals per %{public}@ minutes -- rejecting\", buf, 0x2Au);

      }
      if ((-[NSMutableSet containsObject:](self->_keysForRateExceededBugSent, "containsObject:", v14) & 1) == 0)
      {
        -[NSObject accountType](v6, "accountType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "client");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleID");
        v32 = self;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACDAutoBugCapture triggerAutoBugCaptureWithType:subType:subtypeContext:detectedProcess:](ACDAutoBugCapture, "triggerAutoBugCaptureWithType:subType:subtypeContext:detectedProcess:", 0x24C7E6BF8, 0x24C7E6C38, v24, v26);

        -[NSMutableSet addObject:](v32->_keysForRateExceededBugSent, "addObject:", v14);
      }
    }
  }

  return v15;
}

- (void)_handleRenewalCompletionResult:(int64_t)a3 forAccount:(id)a4 renewalID:(id)a5 accountStore:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  _ACDLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    -[ACDAuthenticationPluginManager _descriptionForRenewalResult:](self, "_descriptionForRenewalResult:", a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v12;
    v41 = 2112;
    v42 = v32;
    v43 = 2112;
    v44 = v15;
    _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationPluginManager _handleRenewalCompletion: plugin reports being done for account %@ with result %@ and error %@\", buf, 0x20u);

  }
  v17 = v15;
  v18 = v17;
  if (a3 || v17)
  {
    v19 = v17;
    if (a3 != 1)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastCredentialRenewalRejectionDate:", v20);

  }
  else
  {
    objc_msgSend(v12, "setAuthenticated:", 1);
  }
  _ACDLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:].cold.3();

  v37 = 0;
  v22 = objc_msgSend(v14, "saveVerifiedAccount:error:", v12, &v37);
  v23 = v37;
  v19 = v18;
  if ((v22 & 1) == 0)
  {
    _ACDLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:].cold.2();

    v19 = v18;
    if (!v18)
      v19 = v23;
  }

LABEL_16:
  _ACDLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager _handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:].cold.1();

  -[NSLock lock](self->_renewalHandlersLock, "lock");
  -[ACDQueueDictionary dequeueAllObjectsInQueueForKey:](self->_renewalHandlerQueues, "dequeueAllObjectsInQueueForKey:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_renewalHandlersLock, "unlock");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v29);
  }

}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  ACDAuthenticationPluginManager *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  int v40;
  NSObject *v41;
  ACDQueueDictionary *discoveryHandlerQueues;
  void *v43;
  NSObject *authenticationPluginQueue;
  char v45;
  id v47;
  id aBlock;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  ACDAuthenticationPluginManager *v53;
  id v54;
  id v55;
  id v56;
  SEL v57;
  char v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v47 = a4;
  aBlock = a6;
  v11 = a5;
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:].cold.4((uint64_t)v10, v47, v12);

  -[ACDAuthenticationPluginManager _unsanitizeOptionsDictionary:](self, "_unsanitizeOptionsDictionary:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB44B8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v16 = *MEMORY[0x24BDB44E0];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB44E0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v18, "BOOLValue");
  }
  else
  {
    objc_msgSend(v10, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v18 != 0;
  }

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v10, "accountType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ACDAuthenticationPluginManager _authenticationTypeForAccount:](self, "_authenticationTypeForAccount:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _ACDLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:].cold.3();

  -[ACDAuthenticationPluginManager _pluginForAuthenticationType:](self, "_pluginForAuthenticationType:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = self;
    objc_sync_enter(v23);
    if (v15)
    {
      v24 = v10;
    }
    else
    {
      -[ACDAuthenticationPluginManager _authCapableParentAccountForAccount:](v23, "_authCapableParentAccountForAccount:", v10);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v24;
    v33 = (void *)MEMORY[0x24BDD17C8];
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@.%@"), v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSLock lock](v23->_discoveryHandlersLock, "lock");
    if (-[ACDQueueDictionary isQueueEmptyForKey:](v23->_discoveryHandlerQueues, "isQueueEmptyForKey:", v37)
      || (objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB44B0]),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v38, "BOOLValue"),
          v38,
          (v39 & 1) != 0))
    {
      v40 = 1;
    }
    else
    {
      _ACDLogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:].cold.2();

      v40 = 0;
    }
    discoveryHandlerQueues = v23->_discoveryHandlerQueues;
    v43 = _Block_copy(aBlock);
    -[ACDQueueDictionary addObject:toQueueForKey:](discoveryHandlerQueues, "addObject:toQueueForKey:", v43, v37);

    -[NSLock unlock](v23->_discoveryHandlersLock, "unlock");
    if (v40)
    {
      authenticationPluginQueue = v23->_authenticationPluginQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke;
      block[3] = &unk_24C7E2E20;
      v50 = v10;
      v51 = v32;
      v57 = a2;
      v52 = v22;
      v53 = v23;
      v54 = v37;
      v55 = v47;
      v58 = v45;
      v56 = v13;
      dispatch_async(authenticationPluginQueue, block);

    }
    objc_sync_exit(v23);
  }
  else
  {
    _ACDLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:].cold.1(v10, v25);

    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "accountType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("No auth plugin to discover properties for accounts of type %@"), v28);
    v23 = (ACDAuthenticationPluginManager *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDD1540];
    v59 = *MEMORY[0x24BDD0FC8];
    v60[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 4, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))aBlock + 2))(aBlock, 0, v31);

  }
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v2 = (void *)MEMORY[0x24BDB43F0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2;
  v7[3] = &unk_24C7E2D58;
  v3 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 72);
  v15 = *(_BYTE *)(a1 + 96);
  v13 = *(id *)(a1 + 80);
  objc_msgSend(v2, "performWithinPersonaForAccount:withBlock:", v3, v7);

}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_2();

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_71;
  aBlock[3] = &unk_24C7E2DF8;
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v5;
  v12 = v4;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v16 = *(_BYTE *)(a1 + 88);
  v6 = _Block_copy(aBlock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "discoverPropertiesForAccount:accountStore:options:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v6);
  }
  else
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], -102, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 88), v8);

  }
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  _BOOL4 v5;
  void *v6;
  const char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2 == 0;
  v6 = *(void **)(a1 + 32);
  v7 = *(const char **)(a1 + 72);
  v8 = a3;
  v9 = a2;
  _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(v5, (uint64_t)v8, v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "_sanitizeError:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ac_secureCodingError");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), v11);
}

- (void)_handleDiscoveryCompletionResult:(id)a3 forAccount:(id)a4 discoveryID:(id)a5 accountStore:(id)a6 shouldSave:(BOOL)a7 error:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v9 = a7;
  v37 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  _ACDLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:].cold.3();

  v20 = v18;
  if (!v18)
  {
    v20 = 0;
    if (v9)
    {
      _ACDLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:].cold.2();

      v35 = 0;
      v22 = objc_msgSend(v17, "saveVerifiedAccount:error:", v15, &v35);
      v23 = v35;
      v20 = 0;
      if ((v22 & 1) == 0)
      {
        _ACDLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[ACDAuthenticationPluginManager _handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:].cold.1();

        v20 = v23;
      }

    }
  }
  -[NSLock lock](self->_discoveryHandlersLock, "lock");
  -[ACDQueueDictionary dequeueAllObjectsInQueueForKey:](self->_discoveryHandlerQueues, "dequeueAllObjectsInQueueForKey:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_discoveryHandlersLock, "unlock");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v30) + 16))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v30));
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v28);
  }

}

- (id)_authCapableParentAccountForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "authenticationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDB4548];
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4548]);

  v7 = v3;
  if (v6)
  {
    v8 = v3;
    do
    {
      objc_msgSend(v8, "parentAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "authenticationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v5);

      v8 = v7;
    }
    while ((v10 & 1) != 0);
  }

  return v7;
}

- (id)_descriptionForRenewalResult:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("UNKNOWN");
  else
    return off_24C7E2E40[a3];
}

- (id)_sanitizeError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CFTypeID TypeID;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD1318];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD1318]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (TypeID = SecTrustGetTypeID(), TypeID == CFGetTypeID(v6))
    && (objc_msgSend(v3, "domain"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = *MEMORY[0x24BDD1308],
        v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD1308]),
        v8,
        v10))
  {
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v5);
    v13 = (void *)SecTrustSerialize();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSErrorPeerCertificateChainKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v20 = CFSTR("c");
      v21[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      serializeSecCertificates();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("NSErrorPeerCertificateChainKey"));

    }
    objc_msgSend(v12, "removeObjectForKey:", *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v9, objc_msgSend(v3, "code"), v12);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v3;
  }

  return v18;
}

- (id)_unsanitizeOptionsDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = *MEMORY[0x24BDB4448];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDB4448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)objc_msgSend(v3, "mutableCopy");
    unserializeSecCertificates();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v4);

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationPluginQueue, 0);
  objc_storeStrong((id *)&self->_authenticationPluginsByType, 0);
  objc_storeStrong((id *)&self->_discoveryHandlersLock, 0);
  objc_storeStrong((id *)&self->_renewalHandlersLock, 0);
  objc_storeStrong((id *)&self->_verificationHandlersLock, 0);
  objc_storeStrong((id *)&self->_keysForRateExceededBugSent, 0);
  objc_storeStrong((id *)&self->_renewalRateLimiter, 0);
  objc_storeStrong((id *)&self->_discoveryHandlerQueues, 0);
  objc_storeStrong((id *)&self->_renewalHandlerQueues, 0);
  objc_storeStrong((id *)&self->_verificationHandlerQueues, 0);
}

- (ACRateLimiter)renewalRateLimiter
{
  return self->_renewalRateLimiter;
}

- (void)setRenewalRateLimiter:(id)a3
{
  id v4;
  ACRateLimiter *v5;
  ACRateLimiter *renewalRateLimiter;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (ACRateLimiter *)v4;
  else
    v5 = (ACRateLimiter *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43F8]), "initWithMaximum:inTimeInterval:", 60, 3600.0);
  renewalRateLimiter = self->_renewalRateLimiter;
  self->_renewalRateLimiter = v5;

}

- (void)isPushSupportedForAccount:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_19(&dword_20D8CB000, a3, v6, "\"Returning isPushSupported == %@ for account %@.\", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3();
}

- (void)isPushSupportedForAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"isPushSupportedForAccount: using authType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isPushSupportedForAccount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Entering isPushSupportedForAccount: for account %@...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)credentialForAccount:(void *)a1 client:(NSObject *)a2 store:handler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v5, "\"No auth plugin to fetch credentials for accounts of type %@, defaulting to ACDKeychain...\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)credentialForAccount:client:store:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"credentialForAccount:client using authType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)credentialForAccount:client:store:handler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Entering credentialForAccount:client: for account %@...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCredentialsForAccount:(void *)a1 accountStore:(NSObject *)a2 options:handler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v5, "\"No auth plugin to verify credentials for accounts of type %@, bailing!\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)verifyCredentialsForAccount:accountStore:options:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"It appears we are already verifying credentials for %@. We will enqueue the current request's completion handler and call it when done.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCredentialsForAccount:accountStore:options:handler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"verifyCredentials using authType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"The plugin for account %@ does not implement verifyCredentials\", v2);
  OUTLINED_FUNCTION_2();
}

void __91__ACDAuthenticationPluginManager_verifyCredentialsForAccount_accountStore_options_handler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Plugin started on queue, will authenticate account %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is invoking all queued completion blocks for account %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is saving the verified account %@...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleVerificationCompletionForAccount:verifiedAccount:error:store:shouldSave:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleVerificationCompletion is intentionally NOT saving the verified account %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)renewCredentialsForAccount:(os_log_t)log accountStore:options:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"Password dialogs suppressed, force-rejecting renewal request.\", v1, 2u);
}

- (void)renewCredentialsForAccount:(void *)a1 accountStore:(NSObject *)a2 options:completion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v5, "\"No auth plugin to renew credentials for accounts of type %@, bailing!\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)renewCredentialsForAccount:accountStore:options:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"renewCredentials using authType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"The plugin for account %@ does not implement renewCredentials\", v2);
  OUTLINED_FUNCTION_2();
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Plugin started on queue, will renew credentials for %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__ACDAuthenticationPluginManager_renewCredentialsForAccount_accountStore_options_completion___block_invoke_45_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_20D8CB000, v1, OS_LOG_TYPE_ERROR, "@\"Call to renewCredentialsForAccount:accountStore:options:completion: on %@ failed to complete in expected time %llu.\", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion is invoking all queued completion blocks under renewal ID %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion failed to save account: %@ error: %@\");
  OUTLINED_FUNCTION_2();
}

- (void)_handleRenewalCompletionResult:forAccount:renewalID:accountStore:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleRenewalCompletion is saving account %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)discoverPropertiesForAccount:(void *)a1 accountStore:(NSObject *)a2 options:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v5, "\"No auth plugin to discover properties for accounts of type %@, bailing!\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)discoverPropertiesForAccount:accountStore:options:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"It appears we are already discovering settings for account %@. We will enqueue the current request's completion handler and call it when done.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)discoverPropertiesForAccount:accountStore:options:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"discoverPropertiesForAccount using authType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)discoverPropertiesForAccount:(NSObject *)a3 accountStore:options:completion:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_19(&dword_20D8CB000, a3, v6, "\"discoverPropertiesForAccount %@ was called by client %@\", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3();
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, v0, v1, "\"The plugin for account %@ does not implement discoverProperties\", v2);
  OUTLINED_FUNCTION_2();
}

void __95__ACDAuthenticationPluginManager_discoverPropertiesForAccount_accountStore_options_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Plugin started on queue, will discover settings for %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion failed to save account: %@ error: %@\");
  OUTLINED_FUNCTION_2();
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion is saving account %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleDiscoveryCompletionResult:forAccount:discoveryID:accountStore:shouldSave:error:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, (uint64_t)v0, "\"ACDAuthenticationPluginManager _handleDiscoveryCompletion: plugin reports being done for account %@ with error %@\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_pluginForAuthenticationType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager: no authentication bundle for auth type %@, nothing to do here...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pluginForAuthenticationType:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a3, (uint64_t)a3, "\"ACDAuthenticationPluginManager: authentication plugin of class %@ does not conform to ACDAccountAuthenticationPlugin protocol!\", (uint8_t *)a2);

}

- (void)_pluginForAuthenticationType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager: created plugin %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pluginForAuthenticationType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager: got principalClass %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pluginForAuthenticationType:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationPluginManager: got pluginBundle %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_authenticationTypeForAccount:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v5, "\"Returning a parent's account type as the authentication type: %@\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)_authenticationTypeForAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Returning a parent's authenticationType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_authenticationTypeForAccount:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account %@ depends on parent for Authentication\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_authenticationTypeForAccount:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v5, "\"Returning account's accountType as the authentication type: %@\", v6);

  OUTLINED_FUNCTION_3();
}

- (void)_authenticationTypeForAccount:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Returning account's authenticationType: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
