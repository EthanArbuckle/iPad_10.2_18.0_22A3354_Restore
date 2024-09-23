@implementation AKAppleIDPasskeyAuthenticationController

- (AKAppleIDPasskeyAuthenticationController)init
{
  AKAppleIDPasskeyAuthenticationController *v2;
  AKAppleIDPasskeyAuthenticationController *v3;
  uint64_t v4;
  NSMapTable *stateByController;
  dispatch_group_t v6;
  OS_dispatch_group *serializationGroup;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serializationQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *passkeyRequestQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AKAppleIDPasskeyAuthenticationController;
  v2 = -[AKAppleIDPasskeyAuthenticationController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_stateByControllerLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    stateByController = v3->_stateByController;
    v3->_stateByController = (NSMapTable *)v4;

    v6 = dispatch_group_create();
    serializationGroup = v3->_serializationGroup;
    v3->_serializationGroup = (OS_dispatch_group *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.passkey-serialization-queue", v8);
    serializationQueue = v3->_serializationQueue;
    v3->_serializationQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.authkit.passkey.request.queue", v11);
    passkeyRequestQueue = v3->_passkeyRequestQueue;
    v3->_passkeyRequestQueue = (OS_dispatch_queue *)v12;

  }
  return v3;
}

- (void)createPasskeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serializationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke;
  block[3] = &unk_1E2E60190;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serializationQueue, block);

}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  v5 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_2;
  block[3] = &unk_1E2E60190;
  block[1] = 3221225472;
  block[4] = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v4, v5, block);

}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_3;
  v4[3] = &unk_1E2E61678;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_onqueue_createPasskeyWithContext:completion:", v3, v4);

}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)appleIDPasskeyStatusForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__AKAppleIDPasskeyAuthenticationController_appleIDPasskeyStatusForAccount_withCompletion___block_invoke;
  v8[3] = &unk_1E2E616A0;
  v9 = v6;
  v7 = v6;
  -[AKAppleIDPasskeyAuthenticationController appleIDPasskeysForAccount:withCompletion:](self, "appleIDPasskeysForAccount:withCompletion:", a3, v8);

}

void __90__AKAppleIDPasskeyAuthenticationController_appleIDPasskeyStatusForAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, objc_msgSend(a2, "count") != 0, v5);

  }
}

- (void)canCreateiCloudKeychainPasskeyForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *passkeyRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AKAppleIDPasskeyAuthenticationController *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E2E616C8;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void (**v9)(id, _QWORD, NSObject *);
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    _AKLogPasskey();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    goto LABEL_17;
  }
  objc_msgSend(a1[4], "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "_authorizationControllerForAccount:", a1[4]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42;
      v10[3] = &unk_1E2E5EB58;
      v11 = v4;
      v12 = a1[6];
      -[NSObject preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:](v11, "preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:", v10);

      v5 = v11;
    }
    else
    {
      _AKLogPasskey();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_3();

      v7 = (void (**)(id, _QWORD, id))a1[6];
      if (!v7)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -120020, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  _AKLogPasskey();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_2();

  v9 = (void (**)(id, _QWORD, NSObject *))a1[6];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -12002, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:

}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  _AKLogPasskey();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42_cold_2();

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42_cold_1(a2, v7, v10);

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }

}

- (void)appleIDPasskeysForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *passkeyRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AKAppleIDPasskeyAuthenticationController *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E2E616C8;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void (**v9)(id, _QWORD, NSObject *);
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    _AKLogPasskey();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    goto LABEL_17;
  }
  objc_msgSend(a1[4], "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "_authorizationControllerForAccount:", a1[4]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51;
      v10[3] = &unk_1E2E616F0;
      v11 = v4;
      v12 = a1[4];
      v13 = a1[6];
      -[NSObject getPasskeysDataForRelyingParty:withCompletionHandler:](v11, "getPasskeysDataForRelyingParty:withCompletionHandler:", CFSTR("apple.com"), v10);

      v5 = v11;
    }
    else
    {
      _AKLogPasskey();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_3();

      v7 = (void (**)(id, _QWORD, id))a1[6];
      if (!v7)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -120019, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  _AKLogPasskey();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_2();

  v9 = (void (**)(id, _QWORD, NSObject *))a1[6];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -12002, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:

}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPasskeysInKeychainCount:forAccount:", v5, *(_QWORD *)(a1 + 40));

    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    objc_msgSend(v6, "saveAccount:error:", v7, &v12);
    v8 = v12;

    if (v8)
    {
      _AKLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51_cold_2();
    }
    else
    {
      _AKLogPasskey();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51_cold_1(v3, v9);
    }

    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      (*(void (**)(uint64_t, id, _QWORD))(v11 + 16))(v11, v3, 0);
    goto LABEL_11;
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -120019, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v8);
LABEL_11:

  }
}

- (void)deleteAllPasskeysForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *passkeyRequestQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AKAppleIDPasskeyAuthenticationController *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E2E616C8;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void (**v9)(id, _QWORD, NSObject *);
  _QWORD v10[4];
  NSObject *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    _AKLogPasskey();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    goto LABEL_17;
  }
  objc_msgSend(a1[4], "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "_authorizationControllerForAccount:", a1[4]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57;
      v10[3] = &unk_1E2E5EB58;
      v11 = v4;
      v12 = a1[6];
      -[NSObject deleteAllPasskeysForRelyingParty:completionHandler:](v11, "deleteAllPasskeysForRelyingParty:completionHandler:", CFSTR("apple.com"), v10);

      v5 = v11;
    }
    else
    {
      _AKLogPasskey();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_3();

      v7 = (void (**)(id, _QWORD, id))a1[6];
      if (!v7)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -120019, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  _AKLogPasskey();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_2();

  v9 = (void (**)(id, _QWORD, NSObject *))a1[6];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), -12002, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:

}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _AKLogPasskey();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57_cold_2();
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)_onqueue_createPasskeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *ASAuthorizationPlatformPublicKeyCredentialProviderClass;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *ASAuthorizationControllerClass;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint8_t buf[4];
  AKAppleIDPasskeyAuthenticationController *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "relyingPartyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credentialName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "challenge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8 && v9 && v10 && v11)
  {
    ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
    if (ASAuthorizationPlatformPublicKeyCredentialProviderClass)
      ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationPlatformPublicKeyCredentialProviderClass();
    v14 = (void *)objc_msgSend([ASAuthorizationPlatformPublicKeyCredentialProviderClass alloc], "initWithRelyingPartyIdentifier:", v8);
    objc_msgSend(v14, "createCredentialRegistrationRequestWithChallenge:name:userID:", v10, v9, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (!v15)
    {
      _AKLogPasskey();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = v6;
        v40 = 2112;
        v41 = v14;
        _os_log_error_impl(&dword_19202F000, v24, OS_LOG_TYPE_ERROR, "%@: Failed to create passkey request with context (%@) using provider (%@)", buf, 0x20u);
      }

      _AKLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.2();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_passkeyErrorWithCode:", -12001);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0);

      }
      goto LABEL_38;
    }
    v35 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
    v31 = v16;
    if (ASAuthorizationControllerClass)
      ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
    v18 = (void *)objc_msgSend([ASAuthorizationControllerClass alloc], "initWithAuthorizationRequests:", v32);
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "setDelegate:", self);
      v34 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProxiedAssociatedDomains:", v20);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        _AKLogPasskey();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.4();

        +[_AKAppleIDPasskeyRequestState stateWithContext:completion:](_AKAppleIDPasskeyRequestState, "stateWithContext:completion:", v6, v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDPasskeyAuthenticationController _pushPasskeyRequestState:forController:](self, "_pushPasskeyRequestState:forController:", v22, v19);
        objc_msgSend(v19, "performSilentRequests");
        goto LABEL_36;
      }
      _AKLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.5();

      if (!v7)
        goto LABEL_37;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = -12002;
    }
    else
    {
      _AKLogPasskey();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v37 = self;
        v38 = 2112;
        v39 = v31;
        v40 = 2112;
        v41 = v6;
        _os_log_error_impl(&dword_19202F000, v26, OS_LOG_TYPE_ERROR, "%@: Failed to create authorization controller with request (%@) for context (%@)", buf, 0x20u);
      }

      _AKLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.3();

      if (!v7)
        goto LABEL_37;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = -12001;
    }
    objc_msgSend(v28, "ak_passkeyErrorWithCode:", v29, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v7[2])(v7, 0, v22);
LABEL_36:

LABEL_37:
    v16 = v31;

LABEL_38:
    goto LABEL_39;
  }
  _AKLogPasskey();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.1();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_passkeyErrorWithCode:", -120012);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v7[2])(v7, 0, v14);
LABEL_39:

  }
}

- (void)_pushPasskeyRequestState:(id)a3 forController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_stateByControllerLock);
    -[NSMapTable setObject:forKey:](self->_stateByController, "setObject:forKey:", v6, v7);
    os_unfair_lock_unlock(&self->_stateByControllerLock);
  }
  else
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AKAppleIDPasskeyAuthenticationController _pushPasskeyRequestState:forController:].cold.1();

  }
}

- (id)_popPasskeyRequestStateForController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_stateByControllerLock);
    -[NSMapTable objectForKey:](self->_stateByController, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_stateByController, "setObject:forKey:", 0, v4);
    os_unfair_lock_unlock(&self->_stateByControllerLock);
  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AKAppleIDPasskeyAuthenticationController _pushPasskeyRequestState:forController:].cold.1();

    v5 = 0;
  }

  return v5;
}

- (void)_onqueue_authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  AKAppleIDPasskeyCredential *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serializationQueue);
  -[AKAppleIDPasskeyAuthenticationController _popPasskeyRequestStateForController:](self, "_popPasskeyRequestStateForController:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (AuthenticationServicesLibraryCore())
      getASAuthorizationPlatformPublicKeyCredentialRegistrationClass();
    objc_opt_class();
    objc_msgSend(v9, "credential");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      v37 = v10;
      v38 = v9;
      v39 = v8;
      _AKLogPasskey();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v13;
        _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Successfully obtained passkey credential: %@", buf, 0xCu);
      }

      v40 = [AKAppleIDPasskeyCredential alloc];
      objc_msgSend(v11, "context");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "relyingPartyIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rawAttestationObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rawClientDataJSON");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v13;
      objc_msgSend(v13, "credentialID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "context");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "originalChallenge");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "userID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v11;
      objc_msgSend(v11, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "credentialName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)v17;
      v15 = -[AKAppleIDPasskeyCredential initWithRelyingPartyIdentifier:attestationData:clientData:credentialID:originalChallenge:userID:credentialName:](v40, "initWithRelyingPartyIdentifier:attestationData:clientData:credentialID:originalChallenge:userID:credentialName:", v17, v18, v19, v20, v21, v23, v25);

      _AKLogPasskey();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v11 = v35;
        -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:].cold.4(v35, v27);
        v9 = v38;
        v8 = v39;
        v13 = v36;
        v10 = v37;
      }
      else
      {
        v9 = v38;
        v8 = v39;
        v13 = v36;
        v10 = v37;
        v11 = v35;
      }
    }
    else
    {
      _AKLogPasskey();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v28)
          -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:].cold.3(v9, v27);

        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_passkeyErrorWithCode:", -12009);
        v15 = 0;
        v27 = v10;
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v28)
          -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:].cold.2();
        v15 = 0;
      }
    }

    _AKLogPasskey();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "completion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13;
      v34 = (void *)MEMORY[0x194022E4C]();
      *(_DWORD *)buf = 138412802;
      v44 = v34;
      v45 = 2112;
      v46 = v15;
      v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_19202F000, v29, OS_LOG_TYPE_DEBUG, "Calling completion block (%@) with passkey (%@) and error (%@)", buf, 0x20u);

      v13 = v33;
    }

    objc_msgSend(v11, "completion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v11, "completion");
      v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSObject *, NSObject *))v31)[2](v31, v15, v10);

    }
  }
  else
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v44 = v9;
      v45 = 2112;
      v46 = v10;
      v47 = 2112;
      v48 = v8;
      _os_log_error_impl(&dword_19202F000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve passkey authorization (%@) with error (%@) due to missing entry for controller (%@) in table", buf, 0x20u);
    }

    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:].cold.1();
  }

}

- (id)_authorizationControllerForAccount:(id)a3
{
  id v3;
  objc_class *ASAuthorizationPlatformPublicKeyCredentialProviderClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *ASAuthorizationControllerClass;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationPlatformPublicKeyCredentialProviderClass)
    ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationPlatformPublicKeyCredentialProviderClass();
  v5 = (void *)objc_msgSend([ASAuthorizationPlatformPublicKeyCredentialProviderClass alloc], "initWithRelyingPartyIdentifier:", CFSTR("apple.com"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "createCredentialRegistrationRequestWithChallenge:name:userID:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
    if (ASAuthorizationControllerClass)
      ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
    v11 = [ASAuthorizationControllerClass alloc];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithAuthorizationRequests:", v12);
  }
  else
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[AKAppleIDPasskeyAuthenticationController _authorizationControllerForAccount:].cold.1((uint64_t)v5, v12);
    v13 = 0;
  }

  return v13;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v6;
  id v7;
  NSObject *serializationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithAuthorization___block_invoke;
  block[3] = &unk_1E2E5FDA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serializationQueue, block);

}

uint64_t __97__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithAuthorization___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_authorizationController:didCompleteWithAuthorization:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *serializationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithError___block_invoke;
  block[3] = &unk_1E2E5FDA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serializationQueue, block);

}

uint64_t __89__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_authorizationController:didCompleteWithAuthorization:error:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyRequestQueue, 0);
  objc_storeStrong((id *)&self->_stateByController, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_serializationGroup, 0);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Missing AKAppleIDPasskeyAuthenticationController instance.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to fetch user visible keychain sync status. Missing username", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "We don't have a way to know if passkey can be created in keychain. Failing gracefully.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42_cold_1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, a3, "preflightCanCreateICloudKeychainPasskey : %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_42_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "preflightCanCreateICloudKeychainPasskey failed with error: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "AppleID passkey keychain status failed. Missing username", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "AppleID passkey keychain status failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v3, "Saved passkeyInKeychainCount (%lu) to account", v4);
  OUTLINED_FUNCTION_2_0();
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_51_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Failed to save setPasskeyInKeychainCount to account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to delete AppleID passkeys - Missing username", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to delete AppleID passkeys - Missing implementation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Successfully deleted all AppleID passkeys", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_57_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to delete AppleID passkeys with error:%{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, v0, (uint64_t)v0, "%@: Unable to create passkey with invalid context (%@) missing required parameters", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Unexpectedly failed creating passkey registration request (nil return)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Unexpectedly failed creating authorization controller (nil return)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Creating credential with context: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Authorization controller unexpectedly does not respond to selector: 'performSilentRequests'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_pushPasskeyRequestState:forController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Unexpectedly passed nil authorization controller as key for passkey request state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_onqueue_authorizationController:didCompleteWithAuthorization:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Unexpected nil passkey request state found for authorization controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_onqueue_authorizationController:didCompleteWithAuthorization:error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, v0, (uint64_t)v0, "Failed to create passkey using controller (%@) with error: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_authorizationController:(void *)a1 didCompleteWithAuthorization:(NSObject *)a2 error:.cold.3(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a2, v5, "Authorization (%@) is not of desired credential type: %@", (uint8_t *)&v6);

}

- (void)_onqueue_authorizationController:(void *)a1 didCompleteWithAuthorization:(NSObject *)a2 error:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v4, "AppleID passkey was created successfully with context: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_authorizationControllerForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[AKAppleIDPasskeyAuthenticationController _authorizationControllerForAccount:]";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_19202F000, a2, OS_LOG_TYPE_FAULT, "%s: Skipping status check - registrationRequest is nil for passkeyProvider: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
