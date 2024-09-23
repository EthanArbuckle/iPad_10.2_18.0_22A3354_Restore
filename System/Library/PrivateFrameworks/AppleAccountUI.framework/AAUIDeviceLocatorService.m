@implementation AAUIDeviceLocatorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance___service;
}

void __42__AAUIDeviceLocatorService_sharedInstance__block_invoke()
{
  AAUIDeviceLocatorService *v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = objc_alloc_init(AAUIDeviceLocatorService);
  v1 = (void *)sharedInstance___service;
  sharedInstance___service = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)sharedInstance___service, (CFNotificationCallback)_AAUIHandleFMIPStateChange, (CFStringRef)*MEMORY[0x1E0D21390], 0, (CFNotificationSuspensionBehavior)0);
}

- (AAUIDeviceLocatorService)init
{
  AAUIDeviceLocatorService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateUpdateQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIDeviceLocatorService;
  v2 = -[AAUIDeviceLocatorService init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.accounts.dls.update", v3);
    stateUpdateQueue = v2->_stateUpdateQueue;
    v2->_stateUpdateQueue = (OS_dispatch_queue *)v4;

    v2->_lastKnownState = 4;
  }
  return v2;
}

- (BOOL)isEnabled
{
  AAUIDeviceLocatorService *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasAttemptedToFetchState)
  {
    v3 = v2->_lastKnownState - 1 < 2;
  }
  else
  {
    -[AAUIDeviceLocatorService _updateStateAndNotify:completion:](v2, "_updateStateAndNotify:completion:", 1, 0);
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isChangingState
{
  AAUIDeviceLocatorService *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasAttemptedToFetchState)
  {
    v3 = (v2->_lastKnownState & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else
  {
    v3 = 1;
    -[AAUIDeviceLocatorService _updateStateAndNotify:completion:](v2, "_updateStateAndNotify:completion:", 1, 0);
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isStateKnown
{
  AAUIDeviceLocatorService *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastKnownState != 4;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateStateAndNotify:(BOOL)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *stateUpdateQueue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  BOOL v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke;
  aBlock[3] = &unk_1EA2DB908;
  v16 = a3;
  aBlock[4] = self;
  v15 = v6;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_2;
  block[3] = &unk_1EA2DB138;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(stateUpdateQueue, block);

}

uint64_t __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("AADeviceLocatorStateDidChange"), *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing FMiP state...", buf, 2u);
  }

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_6;
  v5[3] = &unk_1EA2DB930;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "fmipStateWithCompletion:", v5);

}

void __61__AAUIDeviceLocatorService__updateStateAndNotify_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "findmydeviced provided FMiP state %lu and error %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));

}

- (void)refreshCurrentState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AAUIDeviceLocatorService_refreshCurrentState___block_invoke;
  v6[3] = &unk_1EA2DB958;
  v7 = v4;
  v5 = v4;
  -[AAUIDeviceLocatorService _updateStateAndNotify:completion:](self, "_updateStateAndNotify:completion:", 1, v6);

}

uint64_t __48__AAUIDeviceLocatorService_refreshCurrentState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableInContext:(unint64_t)a3
{
  -[AAUIDeviceLocatorService enableInContext:completion:](self, "enableInContext:completion:", a3, 0);
}

- (void)enableInContext:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *stateUpdateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AAUIDeviceLocatorService_enableInContext_completion___block_invoke;
  block[3] = &unk_1EA2DB980;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(stateUpdateQueue, block);

}

void __55__AAUIDeviceLocatorService_enableInContext_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(a1[4] + 8) = 1;
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[6];
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching request to enable FMiP with context %lu", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableFMIPInContext:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Request to enable FMiP completed with error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v7 = a1[5];
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v5 == 0);

}

- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4
{
  -[AAUIDeviceLocatorService disableInContext:withWipeToken:completion:](self, "disableInContext:withWipeToken:completion:", a3, a4, 0);
}

- (void)disableInContext:(unint64_t)a3 withWipeToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *stateUpdateQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v8, "length"))
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "OOPS: The disable-FMiP request came in with an empty token. This will not end well.", buf, 2u);
    }

  }
  stateUpdateQueue = self->_stateUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke;
  block[3] = &unk_1EA2DB980;
  v16 = v9;
  v17 = a3;
  v15 = v8;
  v12 = v9;
  v13 = v8;
  dispatch_async(stateUpdateQueue, block);

}

void __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching request to disable FMiP with context %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke_8;
  v7[3] = &unk_1EA2DB9A8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "disableFMIPUsingToken:inContext:completion:", v5, v6, v7);

}

void __70__AAUIDeviceLocatorService_disableInContext_withWipeToken_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Request to disable FMiP completed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 != 0);

}

- (void)setShouldEnable:(BOOL)a3
{
  AAUIDeviceLocatorService *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_wantsToEnable = a3;
  objc_sync_exit(obj);

}

- (BOOL)shouldEnable
{
  AAUIDeviceLocatorService *v2;
  BOOL wantsToEnable;

  v2 = self;
  objc_sync_enter(v2);
  wantsToEnable = v2->_wantsToEnable;
  objc_sync_exit(v2);

  return wantsToEnable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdateQueue, 0);
}

@end
