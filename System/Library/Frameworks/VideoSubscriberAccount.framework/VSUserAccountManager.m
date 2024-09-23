@implementation VSUserAccountManager

+ (VSUserAccountManager)sharedUserAccountManager
{
  if (sharedUserAccountManager___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedUserAccountManager___vs_lazy_init_predicate, &__block_literal_global_35);
  return (VSUserAccountManager *)(id)sharedUserAccountManager___vs_lazy_init_variable;
}

void __48__VSUserAccountManager_sharedUserAccountManager__block_invoke()
{
  VSUserAccountManager *v0;
  void *v1;

  v0 = objc_alloc_init(VSUserAccountManager);
  v1 = (void *)sharedUserAccountManager___vs_lazy_init_variable;
  sharedUserAccountManager___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSUserAccountManager)init
{
  VSUserAccountManager *v2;
  VSRemoteNotifier *v3;
  VSRemoteNotifier *remoteNotifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSUserAccountManager;
  v2 = -[VSUserAccountManager init](&v6, sel_init);
  if (v2)
  {
    v3 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSActiveSubscriptionsDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v3;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
  }
  return v2;
}

- (void)updateUserAccount:(VSUserAccount *)account completion:(void *)completion
{
  VSUserAccount *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = account;
  v7 = completion;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Object passed to %s was not of type %@."), "-[VSUserAccountManager updateUserAccount:completion:]", v11);

  }
  -[VSUserAccountManager connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__VSUserAccountManager_updateUserAccount_completion___block_invoke;
  v15[3] = &unk_1E939F2C0;
  v16 = v7;
  v13 = v7;
  objc_msgSend(v12, "serviceWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateUserAccount:completion:", v6, v13);

}

void __53__VSUserAccountManager_updateUserAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)deleteUserAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[VSUserAccountManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__VSUserAccountManager_deleteUserAccount_completion___block_invoke;
  v11[3] = &unk_1E939F2C0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "serviceWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteUserAccount:completion:", v7, v9);

}

void __53__VSUserAccountManager_deleteUserAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)fetchUserAccountWithSourceIdentifier:(id)a3 sourceType:(int64_t)a4 deviceIdentifier:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104__VSUserAccountManager_fetchUserAccountWithSourceIdentifier_sourceType_deviceIdentifier_withCompletion___block_invoke;
  v16[3] = &unk_1E93A07A8;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a4;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[VSUserAccountManager queryUserAccountsWithOptions:completion:](self, "queryUserAccountsWithOptions:completion:", 1, v16);

}

void __104__VSUserAccountManager_fetchUserAccountWithSourceIdentifier_sourceType_deviceIdentifier_withCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "sourceIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", a1[4]) && objc_msgSend(v11, "sourceType") == a1[7])
        {
          objc_msgSend(v11, "deviceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", a1[5]);

          if (v14)
          {
            v8 = v11;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
LABEL_13:

  if (objc_msgSend(v8, "isSignedOut"))
  {

    v8 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[VSUserAccountManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke;
  v15[3] = &unk_1E939F2C0;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "serviceWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke_9;
  v13[3] = &unk_1E939F2C0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "forceRefreshUserAccount:withCompletion:", v7, v13);

}

void __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryUserAccountsWithOptions:(VSUserAccountQueryOptions)options completion:(void *)completion
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = completion;
  -[VSUserAccountManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__VSUserAccountManager_queryUserAccountsWithOptions_completion___block_invoke;
  v10[3] = &unk_1E939F2C0;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "serviceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryUserAccountsWithOptions:completion:", options, v8);

}

void __64__VSUserAccountManager_queryUserAccountsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[VSUserAccountManager connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109__VSUserAccountManager_queryUserAccountsWithOptions_sourceIdentifier_sourceType_deviceIdentifier_completion___block_invoke;
  v19[3] = &unk_1E939F2C0;
  v20 = v12;
  v17 = v12;
  objc_msgSend(v16, "serviceWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryUserAccountsWithOptions:sourceIdentifier:sourceType:deviceIdentifier:completion:", a3, v15, v14, v13, v17);

}

void __109__VSUserAccountManager_queryUserAccountsWithOptions_sourceIdentifier_sourceType_deviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (VSUserAccountServiceConnection)connection
{
  VSUserAccountManager *v2;
  VSUserAccountServiceConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSUserAccountServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("VSActiveSubscriptionsDidChangeNotification"), self);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error with connection to user account service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
