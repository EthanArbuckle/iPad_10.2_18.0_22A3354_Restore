@implementation GKPlayerCredentialController

void __49__GKPlayerCredentialController__transactAndWait___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke_2;
  block[3] = &unk_1E75B1FD8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v5;
  block[4] = v6;
  v10 = v7;
  v12 = v3;
  v8 = v3;
  dispatch_sync(v4, block);

}

- (id)accessQueue
{
  return (id)objc_msgSend((id)objc_opt_class(), "accessQueue");
}

+ (id)accessQueue
{
  if (accessQueue_onceToken != -1)
    dispatch_once(&accessQueue_onceToken, &__block_literal_global_13);
  return (id)accessQueue_queue;
}

void __49__GKPlayerCredentialController__transactAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke_3;
  v5[3] = &unk_1E75B1FB0;
  v6 = v2;
  v7 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v4, v5);

}

void __64__GKPlayerCredentialController_primaryCredentialForEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, id);
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v4, "primaryCredentialForEnvironment:accountStore:", v5, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

uint64_t __49__GKPlayerCredentialController__transactAndWait___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("object"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)primaryCredentialForEnvironment:(int64_t)a3 accountStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerCredentialController primaryCredentialCache](self, "primaryCredentialCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "_gkPrimaryCredentialForEnvironment:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[GKPlayerCredentialController primaryCredentialCache](self, "primaryCredentialCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v7);

      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      v13 = os_log_GKDaemon;
      if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[GKPlayerCredentialController primaryCredentialForEnvironment:accountStore:]";
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "%s - cached primary credential: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }

  return v9;
}

- (id)primaryCredentialForEnvironment:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerCredentialController primaryCredentialCache](self, "primaryCredentialCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__GKPlayerCredentialController_primaryCredentialForEnvironment___block_invoke;
    v9[3] = &unk_1E75B21B8;
    v9[4] = self;
    v9[5] = a3;
    -[GKPlayerCredentialController _transactAndWait:](self, "_transactAndWait:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (GKThreadsafeDictionary)primaryCredentialCache
{
  return self->_primaryCredentialCache;
}

- (id)_transactAndWait:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKPlayerCredentialController.m", 126, "-[GKPlayerCredentialController _transactAndWait:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__GKPlayerCredentialController__transactAndWait___block_invoke;
  v11[3] = &unk_1E75B2000;
  v12 = v6;
  v13 = v4;
  v11[4] = self;
  v7 = v6;
  v8 = v4;
  objc_msgSend(v7, "perform:", v11);
  objc_msgSend(v7, "wait");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __61__GKPlayerCredentialController_allCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void (**v5)(id, id);
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "_gkAllCredentialsForEnvironment:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_21);
  return (id)sharedController_controller;
}

- (id)allCredentialsForEnvironment:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerCredentialController allCredentialsCache](self, "allCredentialsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__GKPlayerCredentialController_allCredentialsForEnvironment___block_invoke;
    v12[3] = &__block_descriptor_40_e34_v24__0__ACAccountStore_8___v____16l;
    v12[4] = a3;
    -[GKPlayerCredentialController _transactAndWait:](self, "_transactAndWait:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[GKPlayerCredentialController allCredentialsCache](self, "allCredentialsCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v5);

      if (!os_log_GKGeneral)
        v10 = GKOSLoggers();
      v11 = os_log_GKDaemon;
      if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[GKPlayerCredentialController allCredentialsForEnvironment:]";
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "%s - cached all credentials: %@", buf, 0x16u);
      }
    }
  }

  return v7;
}

- (GKThreadsafeDictionary)allCredentialsCache
{
  return self->_allCredentialsCache;
}

- (GKPlayerCredentialController)init
{
  GKPlayerCredentialController *v2;
  GKThreadsafeDictionary *v3;
  GKThreadsafeDictionary *primaryCredentialCache;
  GKThreadsafeDictionary *v5;
  GKThreadsafeDictionary *allCredentialsCache;
  uint64_t v7;
  ACAccountStore *store;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKPlayerCredentialController;
  v2 = -[GKPlayerCredentialController init](&v12, sel_init);
  if (v2)
  {
    v3 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("primaryCredentialCache"));
    primaryCredentialCache = v2->_primaryCredentialCache;
    v2->_primaryCredentialCache = v3;

    v5 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("allCredentialsCache"));
    allCredentialsCache = v2->_allCredentialsCache;
    v2->_allCredentialsCache = v5;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v7 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (ACAccountStore *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_accountStoreDidChange_, *MEMORY[0x1E0C8F010], v2->_store);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_accountStoreEmailDidChange_, *MEMORY[0x1E0CFFF18], v2->_store);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKPlayerCredentialController;
  -[GKPlayerCredentialController dealloc](&v4, sel_dealloc);
}

void __43__GKPlayerCredentialController_accessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.gamed.credentialController", 0);
  v1 = (void *)accessQueue_queue;
  accessQueue_queue = (uint64_t)v0;

}

void __48__GKPlayerCredentialController_sharedController__block_invoke()
{
  GKPlayerCredentialController *v0;
  void *v1;
  GKSignInVisibilityManager *v2;

  v0 = objc_alloc_init(GKPlayerCredentialController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

  v2 = -[GKSignInVisibilityManager initWithPersistence]([GKSignInVisibilityManager alloc], "initWithPersistence");
  objc_msgSend((id)sharedController_controller, "setSignInVisibilityManager:", v2);

}

+ (void)migrateOldAccountInformation
{
  +[GKAuthenticationMachine migratePreSundanceAccountInformation](GKAuthenticationMachine, "migratePreSundanceAccountInformation");
  +[GKAuthenticationMachine migratePreBlacktailAccountInformation](GKAuthenticationMachine, "migratePreBlacktailAccountInformation");
}

- (void)_transact:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKPlayerCredentialController.m", 144, "-[GKPlayerCredentialController _transact:complete:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke;
  v17[3] = &unk_1E75B2000;
  v17[4] = self;
  v11 = v6;
  v19 = v11;
  v12 = v9;
  v18 = v12;
  objc_msgSend(v12, "perform:", v17);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_4;
    v14[3] = &unk_1E75B1BF0;
    v16 = v7;
    v15 = v12;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

void __51__GKPlayerCredentialController__transact_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_2;
  v9[3] = &unk_1E75B1FD8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v5;
  v9[4] = v6;
  v10 = v7;
  v12 = v3;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __51__GKPlayerCredentialController__transact_complete___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__GKPlayerCredentialController__transact_complete___block_invoke_3;
  v5[3] = &unk_1E75B17D8;
  v6 = v2;
  v7 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v4, v5);

}

uint64_t __51__GKPlayerCredentialController__transact_complete___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__GKPlayerCredentialController__transact_complete___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)invalidateCredentialCaches
{
  void *v3;
  void *v4;

  -[GKPlayerCredentialController primaryCredentialCache](self, "primaryCredentialCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[GKPlayerCredentialController allCredentialsCache](self, "allCredentialsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[GKPlayerCredentialController setGameBundleId:](self, "setGameBundleId:", 0);
}

- (void)accountStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "the main account store attached to the account has changed.The notification is:%@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.account.GameCenter"));

  if (v9)
    -[GKPlayerCredentialController invalidateCredentialCaches](self, "invalidateCredentialCaches");

}

- (void)accountStoreEmailDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "the email address attached to the account has changed.The notification is:%@", (uint8_t *)&v7, 0xCu);
  }
  -[GKPlayerCredentialController invalidateCredentialCaches](self, "invalidateCredentialCaches");

}

- (void)setCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "CRED: save credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E75B2028;
  v12 = v6;
  v10 = v6;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v11, v7);

}

void __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B17D8;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "_gkSaveCredential:completionHandler:", v9, v8);

}

void __64__GKPlayerCredentialController_setCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: save credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setPrimaryCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKPlayerCredentialController *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "CRED: set primary credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E75B2078;
  v12 = v6;
  v13 = self;
  v10 = v6;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v11, v7);

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  char *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  char *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKPlayerCredentialController.m", 204, "-[GKPlayerCredentialController setPrimaryCredential:completionHandler:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2;
  v40[3] = &unk_1E75B1800;
  v41 = *(id *)(a1 + 32);
  v8 = v5;
  v42 = v8;
  v9 = v7;
  v43 = v9;
  objc_msgSend(v9, "perform:", v40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "environment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "primaryCredentialCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

  objc_msgSend(v8, "_gkAllCredentialsForEnvironment:", objc_msgSend(*(id *)(a1 + 32), "environment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "allCredentialsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

    if (!os_log_GKGeneral)
      v15 = GKOSLoggers();
    v16 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[GKPlayerCredentialController setPrimaryCredential:completionHandler:]_block_invoke";
      v47 = 2112;
      v48 = v13;
      _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "%s - cached all credentials: %@", buf, 0x16u);
    }
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = *(char **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((objc_msgSend(v22, "scope") & 4) != 0 && (objc_msgSend(v22, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
        {
          if (!os_log_GKGeneral)
            v23 = GKOSLoggers();
          v24 = os_log_GKDaemon;
          if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v22;
            _os_log_impl(&dword_1BCDE3000, v24, OS_LOG_TYPE_INFO, "CRED: clear primary credential on other credential (%@) start", buf, 0xCu);
          }
          objc_msgSend(v22, "setScope:", objc_msgSend(v22, "scope") & 0xFFFFFFF3);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_37;
          v32[3] = &unk_1E75B1800;
          v33 = v8;
          v34 = v22;
          v35 = v9;
          objc_msgSend(v35, "perform:", v32);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 40), "accessQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_39;
  v29[3] = &unk_1E75B1BF0;
  v30 = v9;
  v31 = v28;
  v26 = v9;
  v27 = v28;
  objc_msgSend(v26, "notifyOnQueue:block:", v25, v29);

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setScope:", objc_msgSend(*(id *)(a1 + 32), "scope") | 0xC);
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_3;
  v7[3] = &unk_1E75B2050;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "_gkSaveCredential:completionHandler:", v8, v7);

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: set primary credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2_38;
  v7[3] = &unk_1E75B2050;
  v7[4] = v5;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_gkSaveCredential:completionHandler:", v5, v7);

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_2_38(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: clear primary credential on other credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__GKPlayerCredentialController_setPrimaryCredential_completionHandler___block_invoke_39(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setContactAssociationID:(id)a3 contactIntegrationConsent:(int)a4 serviceLastUpdateTimestamp:(id)a5 forEnvironment:(int64_t)a6 forcefully:(BOOL)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  GKPlayerCredentialController *v20;
  id v21;
  int64_t v22;
  int v23;
  BOOL v24;

  v14 = a3;
  v15 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke;
  v18[3] = &unk_1E75B20A0;
  v19 = v15;
  v20 = self;
  v24 = a7;
  v21 = v14;
  v22 = a6;
  v23 = a4;
  v16 = v14;
  v17 = v15;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v18, a8);

}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "Updating contacts information on the IDS account and credentials.", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "primaryCredentialForEnvironment:accountStore:", *(_QWORD *)(a1 + 56), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerInternal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKContactsIntegrationErrorDomain"), 6, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v18);
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(v10, "serviceLastUpdatedTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "lastSaveFailed") & 1) != 0
      || *(_BYTE *)(a1 + 68)
      || !v12
      || objc_msgSend(*(id *)(a1 + 32), "compare:", v12) == 1)
    {
      objc_msgSend(v11, "setContactsAssociationID:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v11, "setContactsIntegrationConsent:", *(unsigned int *)(a1 + 64));
      objc_msgSend(v11, "setServiceLastUpdatedTimestamp:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v9, "accountName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_gkAccountForAppleID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "_gkSetPlayerInternal:", v11);
        v22 = 0;
        objc_msgSend(v5, "saveVerifiedAccount:error:", v14, &v22);
        v15 = v22;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKContactsIntegrationErrorDomain"), 2, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v15;

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setLastSaveFailed:", v18 != 0);
    if (!objc_msgSend(*(id *)(a1 + 40), "lastSaveFailed"))
      goto LABEL_29;
    if (!os_log_GKGeneral)
      v19 = GKOSLoggers();
    v20 = os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
      __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_3(v20);
    if (!os_log_GKGeneral)
      v21 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    {
      __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_2();
      if (!v6)
        goto LABEL_31;
    }
    else
    {
LABEL_29:
      if (!v6)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    v6[2](v6, v18);
    goto LABEL_31;
  }
  if (!os_log_GKGeneral)
    v16 = GKOSLoggers();
  v17 = os_log_GKContacts;
  if (os_log_type_enabled((os_log_t)os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_1(v17);
  v6[2](v6, 0);
LABEL_33:

}

- (void)getAltDSIDFromIDMSForCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E75B20F0;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[GKPlayerCredentialController _transactAndWait:](self, "_transactAndWait:", v11);

}

void __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B20C8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "_getAltDSIDFromIDMSForCredential:completionHandler:", v6, v8);

}

void __82__GKPlayerCredentialController_getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "got missing altDSID from IDMS", v10, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);

}

- (void)removeAllCredentialsForEnvironment:(int64_t)a3 completionHandler:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke;
  v4[3] = &unk_1E75B2140;
  v4[4] = self;
  v4[5] = a3;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v4, a4);
}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "_gkAllCredentialsForEnvironment:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_2;
  v11[3] = &unk_1E75B2118;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_3;
  v7[3] = &unk_1E75B2050;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "_gkDeleteCredential:completionHandler:", v6, v7);

}

void __85__GKPlayerCredentialController_removeAllCredentialsForEnvironment_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidateCredentialCaches");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)removeCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  GKPlayerCredentialController *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) start", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke;
  v11[3] = &unk_1E75B2078;
  v12 = v6;
  v13 = self;
  v10 = v6;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v11, v7);

}

void __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke_2;
  v10[3] = &unk_1E75B2050;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  objc_msgSend(a2, "_gkDeleteCredential:completionHandler:", v7, v10);

}

void __67__GKPlayerCredentialController_removeCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: delete credential (%@) finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidateCredentialCaches");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)replaceCredential:(id)a3 withCredential:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  GKPlayerCredentialController *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!os_log_GKGeneral)
    v11 = GKOSLoggers();
  v12 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1BCDE3000, v12, OS_LOG_TYPE_INFO, "CRED: replace credential old:(%@) new:(%@) start", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke;
  v15[3] = &unk_1E75B2190;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v13 = v9;
  v14 = v8;
  -[GKPlayerCredentialController _transact:complete:](self, "_transact:complete:", v15, v10);

}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_2;
  v12[3] = &unk_1E75B2168;
  v13 = v7;
  v14 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v8;
  v16 = v9;
  v17 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v11, "_gkDeleteCredential:completionHandler:", v13, v12);

}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: replace credential (%@) delete finished (error:%@)", buf, 0x16u);
  }
  v8 = (void *)a1[5];
  v7 = (void *)a1[6];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_43;
  v12[3] = &unk_1E75B2050;
  v9 = v7;
  v10 = a1[7];
  v11 = (void *)a1[8];
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v8, "_gkSaveCredential:completionHandler:", v9, v12);

}

void __83__GKPlayerCredentialController_replaceCredential_withCredential_completionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "CRED: replace credential (%@) save finished (error:%@)", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidateCredentialCaches");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)credentialForPlayer:(id)a3 environment:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerCredentialController credentialForPlayerID:environment:](self, "credentialForPlayerID:environment:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)credentialForPlayerID:(id)a3 environment:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GKPlayerCredentialController allCredentialsForEnvironment:](self, "allCredentialsForEnvironment:", a4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "playerInternal", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "playerID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)credentialForUsername:(id)a3 environment:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__GKPlayerCredentialController_credentialForUsername_environment___block_invoke;
  v10[3] = &unk_1E75B21B8;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  -[GKPlayerCredentialController _transactAndWait:](self, "_transactAndWait:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __66__GKPlayerCredentialController_credentialForUsername_environment___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "_gkCredentialForUsername:environment:", v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v7, v8);

}

- (id)suggestedUsername
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void)setPrimaryCredentialCache:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCredentialCache, a3);
}

- (NSString)gameBundleId
{
  return self->_gameBundleId;
}

- (void)setGameBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_gameBundleId, a3);
}

- (void)setAllCredentialsCache:(id)a3
{
  objc_storeStrong((id *)&self->_allCredentialsCache, a3);
}

- (GKSignInVisibilityManager)signInVisibilityManager
{
  return self->_signInVisibilityManager;
}

- (void)setSignInVisibilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_signInVisibilityManager, a3);
}

- (BOOL)lastSaveFailed
{
  return self->_lastSaveFailed;
}

- (void)setLastSaveFailed:(BOOL)a3
{
  self->_lastSaveFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInVisibilityManager, 0);
  objc_storeStrong((id *)&self->_allCredentialsCache, 0);
  objc_storeStrong((id *)&self->_gameBundleId, 0);
  objc_storeStrong((id *)&self->_primaryCredentialCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "Will not update contacts integration information since we are missing a timestamp", v1, 2u);
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_DEBUG, "Account save error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __153__GKPlayerCredentialController_setContactAssociationID_contactIntegrationConsent_serviceLastUpdateTimestamp_forEnvironment_forcefully_completionHandler___block_invoke_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "Failed to save account after contacts integration update", v1, 2u);
}

@end
