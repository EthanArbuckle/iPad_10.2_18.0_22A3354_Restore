@implementation AFSiriUserNotificationRequestCapabilityManager

- (id)_initWithPlatform:(int64_t)a3
{
  AFSiriUserNotificationRequestCapabilityManager *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSHashTable *observers;
  void *v10;
  uint64_t v11;
  AFAnnouncementRequestCapabilityProviding *capabilityProvider;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AFSiriUserNotificationRequestCapabilityManager;
  v4 = -[AFSiriUserNotificationRequestCapabilityManager init](&v14, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("AFSiriUserNotificationRequestCapabilityManager", v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v8;

    v10 = (void *)objc_msgSend((id)objc_opt_class(), "_classForPlatform:", a3);
    v4->_platform = objc_msgSend(v10, "platform");
    objc_msgSend(v10, "provider");
    v11 = objc_claimAutoreleasedReturnValue();
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v11;

    -[AFAnnouncementRequestCapabilityProviding addDelegate:](v4->_capabilityProvider, "addDelegate:", v4);
  }
  return v4;
}

- (void)fetchEligibleSetupStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (BOOL)hasEligibleSetup
{
  NSObject *v3;
  _BOOL8 v4;
  NSObject *v5;
  AFSafetyBlock *v6;
  uint64_t v7;
  NSObject *v8;
  AFSafetyBlock *v9;
  AFSafetyBlock *v10;
  dispatch_time_t v11;
  intptr_t v12;
  NSObject *v13;
  uint64_t v15;
  _QWORD v16[4];
  AFSafetyBlock *v17;
  AFSiriUserNotificationRequestCapabilityManager *v18;
  __int128 *v19;
  BOOL v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v27) = 136315138;
      *(_QWORD *)((char *)&v27 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
      _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s Always Opportune so marking as eligible setup. This should only be used for testing.", (uint8_t *)&v27, 0xCu);
    }
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = [AFSafetyBlock alloc];
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke;
    v21[3] = &unk_1E3A313B0;
    v8 = v5;
    v22 = v8;
    v9 = -[AFSafetyBlock initWithBlock:](v6, "initWithBlock:", v21);
    v4 = -[AFAnnouncementRequestCapabilityProviding lastKnownEligibleAnnouncementRequestTypes](self->_capabilityProvider, "lastKnownEligibleAnnouncementRequestTypes") & 1;
    *(_QWORD *)&v27 = 0;
    *((_QWORD *)&v27 + 1) = &v27;
    v28 = 0x2020000000;
    v29 = 0;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke_2;
    v16[3] = &unk_1E3A313D8;
    v19 = &v27;
    v10 = v9;
    v20 = v4;
    v17 = v10;
    v18 = self;
    -[AFSiriUserNotificationRequestCapabilityManager fetchEligibleSetupStateWithCompletion:](self, "fetchEligibleSetupStateWithCompletion:", v16);
    v11 = dispatch_time(0, 2000000000);
    v12 = dispatch_group_wait(v8, v11);
    -[AFSafetyBlock invoke](v10, "invoke");
    v13 = AFSiriLogContextConnection;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s Timed out fetching eligible setup", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(unsigned __int8 *)(*((_QWORD *)&v27 + 1) + 24);
        *(_DWORD *)buf = 136315394;
        v24 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]";
        v25 = 2048;
        v26 = v15;
        _os_log_debug_impl(&dword_19AF50000, v13, OS_LOG_TYPE_DEBUG, "%s Eligble Setup: %lu", buf, 0x16u);
      }
      LOBYTE(v4) = *(_BYTE *)(*((_QWORD *)&v27 + 1) + 24) != 0;
    }

    _Block_object_dispose(&v27, 8);
  }
  return v4;
}

- (void)fetchRequestCanBeHandledStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (BOOL)requestCanBeHandled
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  AFSafetyBlock *v7;
  uint64_t v8;
  NSObject *v9;
  AFSafetyBlock *v10;
  AFSafetyBlock *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *v14;
  int v16;
  _QWORD v17[4];
  AFSafetyBlock *v18;
  __int128 *v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int128 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v26) = 136315138;
      *(_QWORD *)((char *)&v26 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s Always Opportune, requests can be handled. This should only be used for testing.", (uint8_t *)&v26, 0xCu);
    }
    return 1;
  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v26) = 136315138;
      *(_QWORD *)((char *)&v26 + 4) = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v26, 0xCu);
    }
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = [AFSafetyBlock alloc];
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke;
    v20[3] = &unk_1E3A313B0;
    v9 = v6;
    v21 = v9;
    v10 = -[AFSafetyBlock initWithBlock:](v7, "initWithBlock:", v20);
    *(_QWORD *)&v26 = 0;
    *((_QWORD *)&v26 + 1) = &v26;
    v27 = 0x2020000000;
    v28 = 0;
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke_2;
    v17[3] = &unk_1E3A31BB0;
    v19 = &v26;
    v11 = v10;
    v18 = v11;
    -[AFSiriUserNotificationRequestCapabilityManager fetchRequestCanBeHandledStateWithCompletion:](self, "fetchRequestCanBeHandledStateWithCompletion:", v17);
    v12 = dispatch_time(0, 2000000000);
    v13 = dispatch_group_wait(v9, v12);
    -[AFSafetyBlock invoke](v11, "invoke");
    v14 = AFSiriLogContextConnection;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
        _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Timed out fetching request can be handled", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(unsigned __int8 *)(*((_QWORD *)&v26 + 1) + 24);
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriUserNotificationRequestCapabilityManager requestCanBeHandled]";
      v24 = 1024;
      v25 = v16;
      _os_log_debug_impl(&dword_19AF50000, v14, OS_LOG_TYPE_DEBUG, "%s Request can be handled: %d", buf, 0x12u);
    }
    v4 = *(_BYTE *)(*((_QWORD *)&v26 + 1) + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }
  return v4;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyObserversOfCurrentEligibleSetupState:(BOOL)a3 onPlatform:(int64_t)a4
{
  _BOOL8 v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "hasEligibleSetupChanged:onPlatform:", v5, a4, (_QWORD)v12);
        if (a4 == 1)
          objc_msgSend(v11, "hasEligibleSetupChanged:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)notifyObserversOfCurrentRequestCanBeHandledState:(BOOL)a3 onPlatform:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSHashTable *observers;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    observers = self->_observers;
    v15 = v7;
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:]";
    v23 = 2048;
    v24 = -[NSHashTable count](observers, "count");
    v25 = 1024;
    v26 = v5;
    _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s Notifying %lu observers, request can be handled? %d", buf, 0x1Cu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "requestCanBeHandledChanged:onPlatform:", v5, a4, (_QWORD)v16);
        if (a4 == 1)
          objc_msgSend(v13, "requestCanBeHandledChanged:", v5);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
  -[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentEligibleSetupState:onPlatform:](self, "notifyObserversOfCurrentEligibleSetupState:onPlatform:", a4 & 1, objc_msgSend((id)objc_opt_class(), "platform"));
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  -[AFSiriUserNotificationRequestCapabilityManager notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:](self, "notifyObserversOfCurrentRequestCanBeHandledState:onPlatform:", a4 & 1, objc_msgSend((id)objc_opt_class(), "platform"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__AFSiriUserNotificationRequestCapabilityManager_requestCanBeHandled__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1E3A31388;
  v4 = v1;
  objc_msgSend(v2, "fetchAvailableAnnouncementRequestTypesWithCompletion:", v3);

}

uint64_t __94__AFSiriUserNotificationRequestCapabilityManager_fetchRequestCanBeHandledStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__AFSiriUserNotificationRequestCapabilityManager_hasEligibleSetup__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;
  int v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  result = objc_msgSend(*(id *)(a1 + 32), "invoke");
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4 != *(unsigned __int8 *)(a1 + 56))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315138;
      v7 = "-[AFSiriUserNotificationRequestCapabilityManager hasEligibleSetup]_block_invoke_2";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Eligible capabilities changed, notifying observers", (uint8_t *)&v6, 0xCu);
      v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    return objc_msgSend(*(id *)(a1 + 40), "notifyObserversOfCurrentEligibleSetupState:onPlatform:", v4 != 0, objc_msgSend((id)objc_opt_class(), "platform"));
  }
  return result;
}

void __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1E3A31388;
  v4 = v1;
  objc_msgSend(v2, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v3);

}

uint64_t __88__AFSiriUserNotificationRequestCapabilityManager_fetchEligibleSetupStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFSiriUserNotificationRequestCapabilityManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_19414 != -1)
    dispatch_once(&sharedManager_onceToken_19414, block);
  return (id)sharedManager_sManager;
}

+ (Class)_classForPlatform:(int64_t)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 5)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v6 = 136315394;
      v7 = "+[AFSiriUserNotificationRequestCapabilityManager _classForPlatform:]";
      v8 = 2048;
      v9 = a3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s platform %li is not valid, using headphones provider.", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (((1 << a3) & 0x1A) == 0)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportedByApplicationWithBundleID:(id)a3
{
  id v3;
  NSObject *v4;
  char v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal && _AFPreferencesSpokenNotificationShouldAnnounceAllNotifications())
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315138;
      v9 = "+[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:]";
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Allow all notifications to be announced. This should only be used for testing.", (uint8_t *)&v8, 0xCu);
    }
    v5 = 1;
  }
  else
  {
    v5 = 1;
    +[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:](AFSiriAnnouncementRequestCapabilityManager, "supportedAnnouncementTypesForBundleId:onPlatform:", v3, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", &unk_1E3AA6520) & 1) == 0)
      v5 = objc_msgSend(v6, "containsObject:", &unk_1E3AA6538);

  }
  return v5;
}

void __63__AFSiriUserNotificationRequestCapabilityManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithPlatform:", 1);
  v1 = (void *)sharedManager_sManager;
  sharedManager_sManager = v0;

}

@end
