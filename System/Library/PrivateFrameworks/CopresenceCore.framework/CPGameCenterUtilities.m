@implementation CPGameCenterUtilities

- (CPGameCenterUtilities)init
{
  CPGameCenterUtilities *v2;
  CPThreadSafeMutableSet *v3;
  CPThreadSafeMutableSet *supportedBundleIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPGameCenterUtilities;
  v2 = -[CPGameCenterUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CPThreadSafeMutableSet);
    supportedBundleIDs = v2->_supportedBundleIDs;
    v2->_supportedBundleIDs = v3;

  }
  return v2;
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  return (id)shared_sCPGameCenterUtilities;
}

void __31__CPGameCenterUtilities_shared__block_invoke()
{
  CPGameCenterUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(CPGameCenterUtilities);
  v1 = (void *)shared_sCPGameCenterUtilities;
  shared_sCPGameCenterUtilities = (uint64_t)v0;

}

- (BOOL)supportsBundleID:(id)a3
{
  return -[CPThreadSafeMutableSet containsObject:](self->_supportedBundleIDs, "containsObject:", a3);
}

- (void)fetchOnDeviceMultiplayerBundleIDsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(getGKLocalPlayerClass(), "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getGKDaemonProxyClass(), "proxyForPlayer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiplayerService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CPGameCenterUtilities_fetchOnDeviceMultiplayerBundleIDsWithHandler___block_invoke;
  v9[3] = &unk_1E5C80F60;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchOnDeviceMultiplayerBundleIDsWithHandler:", v9);

}

void __70__CPGameCenterUtilities_fetchOnDeviceMultiplayerBundleIDsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    cpGameCenterLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1ACCCC000, v7, OS_LOG_TYPE_DEFAULT, "error encountered calling fetchOnDeviceMultiplayerBundleIDsWithHandler: error: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  cpGameCenterLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1ACCCC000, v8, OS_LOG_TYPE_DEFAULT, "fetched on device multiplayer bundleIDs: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "supportedBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)fetchGameCenterMultiplayerGameStatusForBundleID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CPGameCenterUtilities *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(getGKLocalPlayerClass(), "localPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getGKDaemonProxyClass(), "proxyForPlayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "multiplayerService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__CPGameCenterUtilities_fetchGameCenterMultiplayerGameStatusForBundleID_handler___block_invoke;
  v13[3] = &unk_1E5C80F88;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "isGameCenterMultiplayerGameForBundleID:handler:", v12, v13);

}

void __81__CPGameCenterUtilities_fetchGameCenterMultiplayerGameStatusForBundleID_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    cpGameCenterLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1ACCCC000, v6, OS_LOG_TYPE_DEFAULT, "error encountered calling fetchGameCenterMultiplayerGameStatusForBundleID:handler: error: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  cpGameCenterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1ACCCC000, v7, OS_LOG_TYPE_DEFAULT, "fetched Game Center multiplayer game status for: %@, is: %@", (uint8_t *)&v12, 0x16u);

  }
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "supportedBundleIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 32));

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (CPThreadSafeMutableSet)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedBundleIDs, 0);
}

@end
