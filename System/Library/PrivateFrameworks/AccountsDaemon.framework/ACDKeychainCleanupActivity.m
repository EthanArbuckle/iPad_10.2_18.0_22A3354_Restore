@implementation ACDKeychainCleanupActivity

+ (ACDKeychainCleanupActivity)sharedActivity
{
  if (sharedActivity_onceToken != -1)
    dispatch_once(&sharedActivity_onceToken, &__block_literal_global_12);
  return (ACDKeychainCleanupActivity *)(id)sharedActivity_sharedCleanupActivity;
}

void __44__ACDKeychainCleanupActivity_sharedActivity__block_invoke()
{
  ACDKeychainCleanupActivity *v0;
  void *v1;

  v0 = objc_alloc_init(ACDKeychainCleanupActivity);
  v1 = (void *)sharedActivity_sharedCleanupActivity;
  sharedActivity_sharedCleanupActivity = (uint64_t)v0;

}

- (ACDKeychainCleanupActivity)init
{
  ACDKeychainCleanupActivity *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *activityQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACDKeychainCleanupActivity;
  v2 = -[ACDKeychainCleanupActivity init](&v9, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.accounts.cleanup.activity", v5);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)checkInIfNecessary
{
  NSObject *activityQueue;
  _QWORD block[5];

  activityQueue = self->_activityQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke;
  block[3] = &unk_24C7E2130;
  block[4] = self;
  dispatch_async(activityQueue, block);
}

void __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allCredentialItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB43F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSeparatedPersonasUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_activityQueue_checkIn");
  }
  else
  {
    v5 = objc_msgSend(v4, "count");
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"Making sure we don't have to do cleanup for an enterprise or guest account.\", buf, 2u);
      }

      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = v4;
      obj = v4;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x24BDB43F0];
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke_5;
            v17[3] = &unk_24C7E2180;
            v17[4] = *(_QWORD *)(a1 + 32);
            v18 = v6;
            objc_msgSend(v13, "performWithinPersona:withBlock:", v12, v17);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

      if (-[NSObject count](v6, "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_activityQueue_checkIn");
      }
      else
      {
        _ACLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"No enterprise nor guest credentials items queued for deletion, will not start cleanup activity.\", buf, 2u);
        }

      }
      v4 = v15;
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"No credentials items queued for deletion, will not start cleanup activity.\", buf, 2u);
    }

  }
}

void __48__ACDKeychainCleanupActivity_checkInIfNecessary__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allCredentialItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v2);

}

- (void)queueNonPersistentCredentialRemoval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *activityQueue;
  _QWORD block[4];
  id v12;
  ACDKeychainCleanupActivity *v13;
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDB4388];
  objc_msgSend(v4, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credentialType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonPersistentKeysForAccountTypeIdentifier:credentialType:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    activityQueue = self->_activityQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__ACDKeychainCleanupActivity_queueNonPersistentCredentialRemoval___block_invoke;
    block[3] = &unk_24C7E2248;
    v12 = v9;
    v13 = self;
    v14 = v4;
    dispatch_async(activityQueue, block);

  }
}

uint64_t __66__ACDKeychainCleanupActivity_queueNonPersistentCredentialRemoval___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = a1[5];
        v9 = (void *)objc_msgSend(a1[6], "copy", (_QWORD)v11);
        objc_msgSend(v8, "_activityQueue_queueCredentialItemWithAccount:serviceName:", v9, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return objc_msgSend(a1[5], "_activityQueue_checkIn");
}

- (void)_activityQueue_checkIn
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC628]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x24BDAC6B8], 1);
  -[ACDKeychainCleanupActivity _activityQueue_configureXPCActivityWithCriteria:](self, "_activityQueue_configureXPCActivityWithCriteria:", xdict);

}

- (void)_activityQueue_queueCredentialItemWithAccount:(id)a3 serviceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 300.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore credentialItemForAccount:serviceName:](self->_accountStore, "credentialItemForAccount:serviceName:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setExpirationDate:", v8);
    _ACLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_20D8CB000, v11, OS_LOG_TYPE_DEFAULT, "\"Extending credential item: %@ expiration date: %@\", (uint8_t *)&v15, 0x16u);
    }

    -[ACAccountStore saveCredentialItem:withCompletionHandler:](self->_accountStore, "saveCredentialItem:withCompletionHandler:", v10, &__block_literal_global_9_0);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDB43B0]);
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithAccountIdentifier:serviceName:", v13, v7);

    objc_msgSend(v10, "setExpirationDate:", v8);
    objc_msgSend(v10, "setPersistent:", 0);
    _ACLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Creating credential item: %@ expiration date: %@\", (uint8_t *)&v15, 0x16u);
    }

    -[ACAccountStore insertCredentialItem:withCompletionHandler:](self->_accountStore, "insertCredentialItem:withCompletionHandler:", v10, &__block_literal_global_9_0);
  }

}

void __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (v3)
  {
    _ACLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)_activityQueue_configureXPCActivityWithCriteria:(id)a3
{
  id v4;
  OS_xpc_object *xpcActivity;
  xpc_object_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  xpcActivity = self->_xpcActivity;
  if (xpcActivity)
  {
    v6 = xpc_activity_copy_criteria(xpcActivity);
    v7 = v6;
    if (v6 && xpc_equal(v6, v4))
    {
      _ACLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"XPC criteria not changed, ignoring criteria.\", (uint8_t *)&v10, 2u);
      }

    }
    else
    {
      _ACLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_20D8CB000, v9, OS_LOG_TYPE_DEFAULT, "\"Configuring keychain cleanup activity: %@\", (uint8_t *)&v10, 0xCu);
      }

      xpc_activity_set_criteria(self->_xpcActivity, v4);
    }

  }
  else
  {
    -[ACDKeychainCleanupActivity _activityQueue_registerXPCActivityWithCriteria:](self, "_activityQueue_registerXPCActivityWithCriteria:", v4);
  }

}

- (void)_activityQueue_registerXPCActivityWithCriteria:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting up XPC activity...\", buf, 2u);
  }

  v6 = (void *)*MEMORY[0x24BDAC5A0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke;
  v8[3] = &unk_24C7E3768;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  xpc_activity_register("com.apple.accounts.cleanup", v6, v8);

}

void __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _xpc_activity_s *v10;
  _QWORD v11[5];
  _xpc_activity_s *v12;
  id v13;
  xpc_activity_state_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", state);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"XPC Activity block invoked with state %@...\", buf, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke_12;
  v11[3] = &unk_24C7E1FC8;
  v11[4] = v7;
  v12 = v3;
  v14 = state;
  v13 = v8;
  v10 = v3;
  dispatch_async(v9, v11);

}

void __77__ACDKeychainCleanupActivity__activityQueue_registerXPCActivityWithCriteria___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_activityQueue_removeExpiredCredentials");
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    _ACLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"Setting cleanup activity criteria...\", v3, 2u);
    }

    xpc_activity_set_criteria(*(xpc_activity_t *)(*(_QWORD *)(a1 + 32) + 16), *(xpc_object_t *)(a1 + 48));
  }
}

- (void)_activityQueue_removeExpiredCredentials
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  BOOL v25;
  os_activity_scope_state_s state;
  uint8_t v27[128];
  uint8_t v28[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = _os_activity_create(&dword_20D8CB000, "accounts/keychain-cleanup-activity", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v4, OS_LOG_TYPE_DEFAULT, "\"Running cleanup activity credential removal...\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  v25 = 0;
  v25 = -[ACDKeychainCleanupActivity _removeExpiredCredentials](self, "_removeExpiredCredentials");
  objc_msgSend(MEMORY[0x24BDB43F0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSeparatedPersonasUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "count");
      *(_DWORD *)v28 = 134217984;
      v29 = v8;
      _os_log_impl(&dword_20D8CB000, v7, OS_LOG_TYPE_DEFAULT, "\"We have %ld enterprise or guest persona(s). Running cleanup within those personas as well.\", v28, 0xCu);
    }

    v15 = v6;
    v16 = v3;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      v12 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17[0] = v12;
          v17[1] = 3221225472;
          v17[2] = __69__ACDKeychainCleanupActivity__activityQueue_removeExpiredCredentials__block_invoke;
          v17[3] = &unk_24C7E24D0;
          v17[4] = self;
          v17[5] = buf;
          objc_msgSend(MEMORY[0x24BDB43F0], "performWithinPersona:withBlock:", v14, v17, v15, v16);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v10);
    }

    v6 = v15;
    v3 = v16;
  }
  if (v23[24])
    -[ACDKeychainCleanupActivity _activityQueue_unregisterActivity](self, "_activityQueue_unregisterActivity");

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

uint64_t __69__ACDKeychainCleanupActivity__activityQueue_removeExpiredCredentials__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_removeExpiredCredentials");
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v1 + 24) = result;
  return result;
}

- (BOOL)_removeExpiredCredentials
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD aBlock[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[ACAccountStore allCredentialItems](self->_accountStore, "allCredentialItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  if (objc_msgSend(v3, "count"))
  {
    v4 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke;
    aBlock[3] = &unk_24C7E3790;
    v19 = &v20;
    v5 = v4;
    v18 = v5;
    v6 = _Block_copy(aBlock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          -[ACDKeychainCleanupActivity _activityQueue_removeCredentialItem:withCompletionHandler:](self, "_activityQueue_removeCredentialItem:withCompletionHandler:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v6, (_QWORD)v13);
          dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      }
      while (v8);
    }

  }
  v11 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB4200]))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 23)
    {
      _ACLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_20D8CB000, v7, OS_LOG_TYPE_DEFAULT, "\"Credential item not yet expired, will remove later\", v14, 2u);
      }
LABEL_9:

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (v4)
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke_cold_1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_activityQueue_removeCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  ACAccountStore *accountStore;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  _ACLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"Attempting to remove credential item (and keychain item) for %@\", buf, 0xCu);
  }

  if (!objc_msgSend(v6, "isExpired"))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "expirationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("The credential item %@ is set to expire in the future, at %@"), v6, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDB4200];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 23, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  accountStore = self->_accountStore;
  objc_msgSend(v6, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountWithIdentifier:](accountStore, "accountWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "serviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[ACDKeychainManager removeCredentialForAccount:key:error:](ACDKeychainManager, "removeCredentialForAccount:key:error:", v11, v12, &v19);
    v13 = v19;
LABEL_7:
    v18 = v13;

    goto LABEL_8;
  }
  v18 = 0;
LABEL_8:

  if (v18)
    v7[2](v7, 0, v18);
  else
    -[ACAccountStore removeCredentialItem:withCompletionHandler:](self->_accountStore, "removeCredentialItem:withCompletionHandler:", v6, v7);

}

- (void)_activityQueue_unregisterActivity
{
  NSObject *v3;
  OS_xpc_object *xpcActivity;
  uint8_t v5[16];

  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Stopping keychain cleanup activity...\", v5, 2u);
  }

  xpc_activity_unregister("com.apple.accounts.cleanup");
  xpcActivity = self->_xpcActivity;
  self->_xpcActivity = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __88__ACDKeychainCleanupActivity__activityQueue_queueCredentialItemWithAccount_serviceName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Failed to save credential item: %@\", a5, a6, a7, a8, 2u);
}

void __55__ACDKeychainCleanupActivity__removeExpiredCredentials__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Failed to remove credential item: %@\", a5, a6, a7, a8, 2u);
}

@end
