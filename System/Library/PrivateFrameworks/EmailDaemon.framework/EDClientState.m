@implementation EDClientState

- (NSArray)visibleMailboxObjectIDs
{
  return (NSArray *)-[EFLocked getObject](self->_visibleMailboxObjectIDs, "getObject");
}

- (void)setIsForeground:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  BOOL *p_isForeground;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v3 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = !a3;
  EFContentProtectionValidateObservedStateIsUnlocked();
  p_isForeground = &self->_isForeground;
  while (1)
  {
    v7 = __ldaxr((unsigned __int8 *)p_isForeground);
    if (v7 != v5)
      break;
    if (!__stlxr(v3, (unsigned __int8 *)p_isForeground))
    {
      v11 = CFSTR("EDClientStateForegroundStateDidChangeKeyIsForeground");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("EDClientStateForegroundStateDidChange"), self, v9);

      return;
    }
  }
  __clrex();
}

- (id)giveBoostWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  EDClientState *v12;
  uint8_t buf[4];
  EDClientState *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDClientState log](EDClientState, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client Requested Boost", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF50]), "initWithBoost:", v4);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__EDClientState_giveBoostWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E949B6D0;
  v8 = v6;
  v11 = v8;
  v12 = self;
  objc_msgSend(v7, "setCancellationHandler:", v10);

  return v7;
}

- (void)setVisibleMailboxObjectIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint8_t buf[4];
  EDClientState *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  +[EDClientState log](EDClientState, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_mapSelector:", sel_ef_publicDescription);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting visible mailboxes to %{public}@", buf, 0x16u);

  }
  -[EFLocked replaceObject:](self->_visibleMailboxObjectIDs, "replaceObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToArray:", v8) & 1) == 0)
  {
    v14 = CFSTR("visibleMailboxObjectIDs");
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("EDClientStateForegroundStateVisibleMailboxesDidChange"), self, v12);

  }
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__EDClientState_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1)
    dispatch_once(&log_onceToken_19, block);
  return (OS_os_log *)(id)log_log_19;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  return (id)sharedInstance_sInstance;
}

void __31__EDClientState_sharedInstance__block_invoke()
{
  EDClientState *v0;
  void *v1;

  v0 = objc_alloc_init(EDClientState);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (EDClientState)init
{
  EDClientState *v2;
  id v3;
  uint64_t v4;
  EFLocked *visibleMailboxObjectIDs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDClientState;
  v2 = -[EDClientState init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v4 = objc_msgSend(v3, "initWithObject:", MEMORY[0x1E0C9AA60]);
    visibleMailboxObjectIDs = v2->_visibleMailboxObjectIDs;
    v2->_visibleMailboxObjectIDs = (EFLocked *)v4;

  }
  return v2;
}

void __20__EDClientState_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  EDClientState *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EDClientState log](EDClientState, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: deallocating client state", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)EDClientState;
  -[EDClientState dealloc](&v4, sel_dealloc);
}

- (BOOL)isForeground
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isForeground);
  return v2 & 1;
}

- (BOOL)isRunningTests
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isRunningTests);
  return v2 & 1;
}

- (void)setIsRunningTests:(BOOL)a3
{
  _BOOL4 v3;
  BOOL *p_isRunningTests;
  int v6;
  NSObject *v7;
  int v8;
  EDClientState *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  p_isRunningTests = &self->_isRunningTests;
  do
  {
    v6 = __ldaxr((unsigned __int8 *)p_isRunningTests);
    if (v6 != !a3)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(a3, (unsigned __int8 *)p_isRunningTests));
  +[EDClientState log](EDClientState, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Changed testing state. isRunningTests=%{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

}

void __46__EDClientState_giveBoostWithCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "drop");
  +[EDClientState log](EDClientState, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Client Cancelled Boost", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setStateForDemoMode:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  EDClientState *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[EDClientState log](EDClientState, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting demo mode state", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableMailTrackingProtection:", 1);

  v4[2](v4, 1, 0);
}

- (void)exitDaemon
{
  NSObject *v3;
  int v4;
  EDClientState *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[EDClientState log](EDClientState, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Exit daemon", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleMailboxObjectIDs, 0);
}

@end
