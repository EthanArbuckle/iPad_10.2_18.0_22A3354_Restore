@implementation ACDAccessPluginManager

intptr_t __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  dispatch_semaphore_t v13;
  id v14;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(unsigned __int8 *)(a1 + 80);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_2;
  v12[3] = &unk_24C7E3110;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v13 = v2;
  v14 = v9;
  v10 = v2;
  objc_msgSend(v3, "handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:", v4, v5, v6, v8, v7, v12);
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_cold_1();

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, void *);
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *accessPluginQueue;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(id, _QWORD, void *);
  BOOL v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v36 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD, void *))a8;
  objc_msgSend(v14, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "_obsoleteAccountTypeIDsToRemove");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", v18);

  _ACDLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No accounts found for account type %@"), v18);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDB4040]))
      v24 = 6;
    else
      v24 = 7;
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDB4200];
    v47 = *MEMORY[0x24BDD0FC8];
    v48[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v17[2](v17, 0, v28);
    goto LABEL_15;
  }
  if (v22)
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.3();

  -[ACDAccessPluginManager _authorizationPluginForAccountType:](self, "_authorizationPluginForAccountType:", v18);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No access plugin was found that supports the account type %@"), v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDB4200];
    v45 = *MEMORY[0x24BDD0FC8];
    v46 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v17[2](v17, 0, v35);
LABEL_15:
    v31 = v36;
    goto LABEL_16;
  }
  _ACDLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.2();

  accessPluginQueue = self->_accessPluginQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke;
  block[3] = &unk_24C7E3138;
  v23 = v23;
  v38 = v23;
  v39 = v14;
  v31 = v36;
  v40 = v36;
  v41 = v15;
  v42 = v16;
  v44 = a7;
  v43 = v17;
  dispatch_async(accessPluginQueue, block);

  v28 = v38;
LABEL_16:

}

- (id)_authorizationPluginForAccountType:(id)a3
{
  id v4;
  ACDAccessPluginManager *v5;
  NSSet *accessPlugins;
  uint64_t v7;
  NSSet *v8;
  NSSet *v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  void *i;
  void *v14;
  objc_class *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  uint8_t v22;
  char v23[15];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  accessPlugins = v5->_accessPlugins;
  if (!accessPlugins)
  {
    +[ACPluginLoader pluginBundlesAtSubpath:](ACDPluginLoader, "pluginBundlesAtSubpath:", CFSTR("Access"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5->_accessPlugins;
    v5->_accessPlugins = (NSSet *)v7;

    accessPlugins = v5->_accessPlugins;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = accessPlugins;
  v10 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v25;
    *(_QWORD *)&v11 = 138412546;
    v21 = v11;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (objc_class *)objc_msgSend(v14, "principalClass", v21);
        _ACDLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "bundleURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v29 = v18;
          v30 = 2112;
          v31 = v4;
          _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "\"Testing if plugin %@ supports account type %@\", buf, 0x16u);

        }
        if (-[objc_class supportsAccountTypeWithIdentifier:](v15, "supportsAccountTypeWithIdentifier:", v4))
        {
          _ACDLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[ACDAccessPluginManager _authorizationPluginForAccountType:].cold.1();

          v10 = objc_alloc_init(v15);
          goto LABEL_19;
        }
        _ACDLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[ACDAccessPluginManager _authorizationPluginForAccountType:].cold.2(&v22, v23, v17);

      }
      v10 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_19:

  objc_sync_exit(v5);
  return v10;
}

- (ACDAccessPluginManager)init
{
  ACDAccessPluginManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessPluginQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACDAccessPluginManager;
  v2 = -[ACDAccessPluginManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ACDAccessPluginQueue", v3);
    accessPluginQueue = v2->_accessPluginQueue;
    v2->_accessPluginQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *accessPluginQueue;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.3();

  -[ACDAccessPluginManager _authorizationPluginForAccountType:](self, "_authorizationPluginForAccountType:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.2();

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke;
    block[3] = &unk_24C7E2548;
    v25 = v16;
    v26 = v10;
    v27 = v11;
    v28 = v12;
    v29 = v13;
    dispatch_async(accessPluginQueue, block);

    v19 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No access plugin was found that supports the account type %@"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDB4200];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);
  }

}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;
  id v12;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2;
  v10[3] = &unk_24C7E3110;
  v7 = *(id *)(a1 + 64);
  v11 = v2;
  v12 = v7;
  v8 = v2;
  objc_msgSend(v3, "authorizeAccessToAccountsOfType:forClient:store:completion:", v4, v5, v6, v10);
  _ACDLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1();

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *accessPluginQueue;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACDAccessPluginManager revokeAccessToAccountsOfType:forClient:store:completion:].cold.2();

  -[ACDAccessPluginManager _authorizationPluginForAccountType:](self, "_authorizationPluginForAccountType:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.2();

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke;
    block[3] = &unk_24C7E2548;
    v25 = v16;
    v26 = v10;
    v27 = v11;
    v28 = v12;
    v29 = v13;
    dispatch_async(accessPluginQueue, block);

    v19 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No access plugin was found that supports the account type %@"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDB4200];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v23);
  }

}

void __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;
  id v12;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_2;
  v10[3] = &unk_24C7E3110;
  v7 = *(id *)(a1 + 64);
  v11 = v2;
  v12 = v7;
  v8 = v2;
  objc_msgSend(v3, "revokeAccessToAccountsOfType:forClient:store:completion:", v4, v5, v6, v10);
  _ACDLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1();

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;

  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *accessPluginQueue;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACDAccessPluginManager revokeAllAccessToAccountsOfType:store:withCompletion:].cold.2();

  -[ACDAccessPluginManager _authorizationPluginForAccountType:](self, "_authorizationPluginForAccountType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:].cold.2();

    accessPluginQueue = self->_accessPluginQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke;
    block[3] = &unk_24C7E2520;
    v22 = v13;
    v23 = v8;
    v24 = v9;
    v25 = v10;
    dispatch_async(accessPluginQueue, block);

    v16 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No access plugin was found that supports the account type %@"), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDB4200];
    v26 = *MEMORY[0x24BDD0FC8];
    v27[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);
  }

}

void __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  id v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_2;
  v9[3] = &unk_24C7E3110;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v10 = v2;
  v11 = v6;
  v7 = v2;
  objc_msgSend(v3, "revokeAllAccessToAccountsOfType:store:withCompletion:", v4, v5, v9);
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_cold_1();

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;

  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(a2, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPluginQueue, 0);
  objc_storeStrong((id *)&self->_accessPlugins, 0);
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, v0, v1, "\"Account type %@ has been obsoleted and accounts and authorization plugins removed, returning no accounts error\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Dispatching to access plugin queue...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "\"Looking for plugin to authorize access to account type %@ for %@\");
  OUTLINED_FUNCTION_2();
}

void __122__ACDAccessPluginManager_handleAccessRequestToAccountsOfType_forClient_withOptions_store_allowUserInteraction_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Called out to plugin (handleAccessRequest), now waiting for signal from completion handler...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Called out to plugin (authorizeAccess), now waiting for signal from completion handler...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __85__ACDAccessPluginManager_authorizeAccessToAccountsOfType_forClient_store_completion___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v4, "\"Plugin result handler called with result %@.\", v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)revokeAccessToAccountsOfType:forClient:store:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20D8CB000, v0, v1, "\"Looking for plugin to revoke access to account type %@ for %@\");
  OUTLINED_FUNCTION_2();
}

void __82__ACDAccessPluginManager_revokeAccessToAccountsOfType_forClient_store_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Called out to plugin (revokeAccess), now waiting for signal from completion handler...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)revokeAllAccessToAccountsOfType:store:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, v0, v1, "\"Looking for plugin to revoke ALL access to account type %@\", v2);
  OUTLINED_FUNCTION_2();
}

void __79__ACDAccessPluginManager_revokeAllAccessToAccountsOfType_store_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Called out to plugin (revokeAllAccess), now waiting for signal from completion handler...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_authorizationPluginForAccountType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account type supported!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_authorizationPluginForAccountType:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "\"Account type not supported!\", buf, 2u);
}

@end
