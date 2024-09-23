@implementation ACDAuthenticationDialogManager

- (ACDAuthenticationDialogManager)init
{
  ACDAuthenticationDialogManager *v2;
  ACDQueueDictionary *v3;
  ACDQueueDictionary *dialogRequestQueues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDAuthenticationDialogManager;
  v2 = -[ACDAuthenticationDialogManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ACDQueueDictionary);
    dialogRequestQueues = v2->_dialogRequestQueues;
    v2->_dialogRequestQueues = v3;

  }
  return v2;
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  ACDAuthenticationDialogManager *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  ACDAuthenticationDialogRequest *v18;
  uint64_t v19;
  ACDQueueDictionary *dialogRequestQueues;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  _BYTE v28[24];
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:].cold.2((uint64_t)v13, v15, v16);

    v17 = -[ACDQueueDictionary isEmpty](v13->_dialogRequestQueues, "isEmpty");
    v18 = objc_alloc_init(ACDAuthenticationDialogRequest);
    -[ACDAuthenticationDialogRequest setUrl:](v18, "setUrl:", v10);
    v19 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke;
    v26[3] = &unk_24C7E3370;
    v27 = v12;
    -[ACDAuthenticationDialogRequest setCompletion:](v18, "setCompletion:", v26);
    -[ACDAuthenticationDialogRequest setConfirmationRequired:](v18, "setConfirmationRequired:", v7);
    -[ACDAuthenticationDialogRequest setAccount:](v18, "setAccount:", v11);
    dialogRequestQueues = v13->_dialogRequestQueues;
    objc_msgSend(v11, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDQueueDictionary addObject:toQueueForKey:](dialogRequestQueues, "addObject:toQueueForKey:", v18, v21);

    _ACDLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:].cold.1(v23, (uint64_t)v28, v22);
    }

    if (v17)
    {
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_46;
      v25[3] = &unk_24C7E3398;
      v25[4] = v13;
      -[ACDAuthenticationDialogManager _launchDialogContainerAppForAccount:shouldConfirm:completion:](v13, "_launchDialogContainerAppForAccount:shouldConfirm:completion:", v11, v7, v25);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 2, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v24);

  }
  objc_sync_exit(v13);

}

uint64_t __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_46(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) != 0)
  {
    _ACDLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_46_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationDialogDidFinishWithSuccess:response:", 0, 0);
  }
}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  ACDAuthenticationDialogManager *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  ACDAuthenticationDialogRequest *v21;
  ACDQueueDictionary *dialogRequestQueues;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _BYTE v28[24];
  uint64_t v29;

  v8 = a6;
  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = self;
  objc_sync_enter(v16);
  objc_msgSend(v12, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    _ACDLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:].cold.2((uint64_t)v16, v18, v19);

    v20 = -[ACDQueueDictionary isEmpty](v16->_dialogRequestQueues, "isEmpty");
    v21 = objc_alloc_init(ACDAuthenticationDialogRequest);
    -[ACDAuthenticationDialogRequest setUrl:](v21, "setUrl:", 0);
    -[ACDAuthenticationDialogRequest setCompletion:](v21, "setCompletion:", v15);
    -[ACDAuthenticationDialogRequest setConfirmationRequired:](v21, "setConfirmationRequired:", v8);
    -[ACDAuthenticationDialogRequest setAccount:](v21, "setAccount:", v12);
    -[ACDAuthenticationDialogRequest setAuthDelegateClassName:](v21, "setAuthDelegateClassName:", v13);
    -[ACDAuthenticationDialogRequest setAuthDelegateClassBundlePath:](v21, "setAuthDelegateClassBundlePath:", v14);
    dialogRequestQueues = v16->_dialogRequestQueues;
    objc_msgSend(v12, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDQueueDictionary addObject:toQueueForKey:](dialogRequestQueues, "addObject:toQueueForKey:", v21, v23);

    _ACDLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v12, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:].cold.1(v25, (uint64_t)v28, v24);
    }

    if (v20)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __130__ACDAuthenticationDialogManager_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke;
      v27[3] = &unk_24C7E3398;
      v27[4] = v16;
      -[ACDAuthenticationDialogManager _launchDialogContainerAppForAccount:shouldConfirm:completion:](v16, "_launchDialogContainerAppForAccount:shouldConfirm:completion:", v12, v8, v27);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 2, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v26);

  }
  objc_sync_exit(v16);

}

void __130__ACDAuthenticationDialogManager_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) != 0)
  {
    _ACDLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_46_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationDialogDidFinishWithSuccess:response:", 0, 0);
  }
}

- (void)_launchDialogContainerAppForAccount:(id)a3 shouldConfirm:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *activeAccountID;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "identifier");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  activeAccountID = self->_activeAccountID;
  self->_activeAccountID = v10;

  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke;
  v15[3] = &unk_24C7E33E8;
  v18 = a4;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  if (*(_BYTE *)(a1 + 56)
    && !objc_msgSend(*(id *)(a1 + 32), "_confirmUserWantsToOpenAuthenticationURLForAccount:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _ACDLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_cold_1(v2, v3, v4);

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_49;
    v6[3] = &unk_24C7E33C0;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v5, "openApplication:withOptions:completion:", CFSTR("com.apple.AccountAuthenticationDialog"), 0, v6);

  }
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    _ACDLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_49_cold_1((uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (BOOL)_confirmUserWantsToOpenAuthenticationURLForAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint8_t buf[16];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v3 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(v3, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypeDescription");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = &stru_24C7E3E98;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_REQUIRED_MESSAGE_FORMAT"), &stru_24C7E3E98, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v22 = (__CFString *)v6;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: asking user to confirm showing auth dialog.\", buf, 2u);
  }

  v13 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_REQUIRED_TITLE"), &stru_24C7E3E98, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C7E3E98, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24C7E3E98, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __85__ACDAuthenticationDialogManager__confirmUserWantsToOpenAuthenticationURLForAccount___block_invoke;
  v23[3] = &unk_24C7E3410;
  v25 = &v27;
  v20 = v13;
  v24 = v20;
  +[ACDUserNotification showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:](ACDUserNotification, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v15, v11, v17, v19, v23);

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v14) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)v14;
}

intptr_t __85__ACDAuthenticationDialogManager__confirmUserWantsToOpenAuthenticationURLForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v8[16];
  uint8_t buf[16];

  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: user declined.\", v8, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: user asked to continue.\", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)contextForAuthenticationDialog:(id)a3
{
  void (**v4)(id, void *, void *, void *, void *, void *);
  ACDAuthenticationDialogManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, void *, void *, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ACDQueueDictionary firstObjectInQueueForKey:](v5->_dialogRequestQueues, "firstObjectInQueueForKey:", v5->_activeAccountID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "authDelegateClassName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authDelegateClassBundlePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138413314;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_debug_impl(&dword_20D8CB000, v15, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationDialogManager: providing active dialog with URL: %@ title: %@ username: %@ authDelegateClassName %@ authDelegateClassBundlePath %@\", (uint8_t *)&v17, 0x34u);
    }

    v4[2](v4, v8, v10, v12, v13, v14);
  }
  else
  {
    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAuthenticationDialogManager contextForAuthenticationDialog:].cold.1();

    v4[2](v4, 0, 0, 0, 0, 0);
  }

  objc_sync_exit(v5);
}

- (void)authenticationDialogDidFinishWithSuccess:(BOOL)a3 response:(id)a4
{
  _BOOL8 v4;
  id v6;
  ACDAuthenticationDialogManager *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *activeAccountID;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ACDQueueDictionary dequeueAllObjectsInQueueForKey:](v7->_dialogRequestQueues, "dequeueAllObjectsInQueueForKey:", v7->_activeAccountID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDAuthenticationDialogManager authenticationDialogDidFinishWithSuccess:response:].cold.1();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "completion");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          (*(void (**)(uint64_t, _BOOL8, id, _QWORD))(v14 + 16))(v14, v4, v6, 0);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  activeAccountID = v7->_activeAccountID;
  v7->_activeAccountID = 0;

  -[ACDQueueDictionary keyForRandomQueue](v7->_dialogRequestQueues, "keyForRandomQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDQueueDictionary firstObjectInQueueForKey:](v7->_dialogRequestQueues, "firstObjectInQueueForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = dispatch_time(0, 1000000000);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke;
    v20[3] = &unk_24C7E2180;
    v20[4] = v7;
    v21 = v18;
    dispatch_after(v19, MEMORY[0x24BDAC9B8], v20);

  }
  objc_sync_exit(v7);

}

void __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "confirmationRequired");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke_2;
  v5[3] = &unk_24C7E3398;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_launchDialogContainerAppForAccount:shouldConfirm:completion:", v3, v4, v5);

}

uint64_t __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "authenticationDialogDidFinishWithSuccess:response:", 0, 0);
  return result;
}

- (void)authenticationDialogCrashed
{
  if (self->_activeAccountID)
    -[ACDAuthenticationDialogManager authenticationDialogDidFinishWithSuccess:response:](self, "authenticationDialogDidFinishWithSuccess:response:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccountID, 0);
  objc_storeStrong((id *)&self->_dialogRequestQueues, 0);
  objc_storeStrong((id *)&self->_authenticationDialogListener, 0);
}

- (void)openAuthenticationURL:(NSObject *)a3 forAccount:shouldConfirm:completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a3, (uint64_t)a3, "\"ACDAuthenticationDialogRequest: added dialog request to queue under ID %@\", (uint8_t *)a2);

}

- (void)openAuthenticationURL:(uint64_t)a3 forAccount:shouldConfirm:completion:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, a3, "\"ACDAuthenticationDialogManager current queue: %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationDialogRequest: OOPA dialog host launched!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("com.apple.AccountAuthenticationDialog");
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a1, a3, "\"Launching app with identifier %@\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_49_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("com.apple.AccountAuthenticationDialog");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_ERROR, "\"Failed to lauch %@ app: %@\", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)contextForAuthenticationDialog:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationDialogManager: an authentication dialog is trying to talk to me, but I have no record of launching it!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)authenticationDialogDidFinishWithSuccess:response:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"ACDAuthenticationDialogManager: an authentication dialog reports being done, but I have no record of launching it!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
