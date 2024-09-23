@implementation ASDUpdatesService

+ (BOOL)isAutomaticUpdateAuthorizationEnabled
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;
  __int16 v10;

  if ((_os_feature_enabled_impl() & 1) != 0 || (ct_green_tea_logging_enabled() & 1) != 0)
  {
    v2 = (void *)MGGetStringAnswer();
    v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("CH"));

    if (v3)
    {
      ASDLogHandleForCategory(12);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v9 = 0;
        v5 = "This region is unsupported";
        v6 = (uint8_t *)&v9;
LABEL_12:
        _os_log_impl(&dword_19A03B000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
      }
    }
    else
    {
      if ((MGGetBoolAnswer() & 1) != 0)
        return 1;
      ASDLogHandleForCategory(12);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v8 = 0;
        v5 = "This device does not have cellular data capabilities.";
        v6 = (uint8_t *)&v8;
        goto LABEL_12;
      }
    }
  }
  else
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v5 = "Feature flag not enabled";
      v6 = (uint8_t *)&v10;
      goto LABEL_12;
    }
  }

  return 0;
}

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392370);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getManagedUpdatesWithReplyHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getUpdatesWithReplyHandler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_reloadFromServerWithReplyHandler_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_reloadManagedUpdatesWithReplyHandler_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_updateAllWithOrder_replyHandler_, 1, 1);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_reloadFromServerInBackgroundWithCompletionBlock_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getUpdateMetricsEventsWithReplyHandler_, 0, 1);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_getUpdatesIncludingMetricsWithReplyHandler_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_reloadForSettingsFromServerWithReplyHandler_, 0, 1);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_updateAllGettingJobResultsWithReplyHandler_, 1, 1);

  return v2;
}

- (ASDUpdatesService)init
{
  void *v3;
  id v4;
  ASDUpdatesService *v5;
  ASDUpdatesService *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *calloutQueue;
  NSObject *v11;
  _QWORD handler[4];
  id v14;
  objc_super v15;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self
    && (v15.receiver = self,
        v15.super_class = (Class)ASDUpdatesService,
        (v5 = -[ASDUpdatesService init](&v15, sel_init)) != 0))
  {
    v6 = v5;
    objc_storeStrong((id *)&v5->_serviceBroker, v3);

    v7 = dispatch_queue_create("com.apple.appstored.ASDUpdatesService.access", 0);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.appstored.ASDUpdatesService.callout", 0);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_initWeak(&v15.receiver, v6);
    v6->_storeChangedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__ASDUpdatesService_init__block_invoke;
    handler[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v14, &v15.receiver);
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &v6->_storeChangedNotificationToken, v11, handler);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v15.receiver);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __25__ASDUpdatesService_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSoftwareUpdatesStoreDidChangeNotification"), WeakRetained);

}

- (void)dealloc
{
  int storeChangedNotificationToken;
  objc_super v4;

  storeChangedNotificationToken = self->_storeChangedNotificationToken;
  if (storeChangedNotificationToken != -1)
    notify_cancel(storeChangedNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)ASDUpdatesService;
  -[ASDUpdatesService dealloc](&v4, sel_dealloc);
}

+ (id)defaultService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ASDUpdatesService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAAA8 != -1)
    dispatch_once(&qword_1ECFFAAA8, block);
  return (id)_MergedGlobals_39;
}

void __35__ASDUpdatesService_defaultService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = (uint64_t)v1;

}

+ (id)registerBadgeCountNotificationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__ASDUpdatesService_registerBadgeCountNotificationBlock___block_invoke;
    v8[3] = &unk_1E37BF0B8;
    v9 = v4;
    v10 = a1;
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &registerBadgeCountNotificationBlock__s_storeChangedNotificationToken, v5, v8);

  }
  else
  {
    notify_cancel(registerBadgeCountNotificationBlock__s_storeChangedNotificationToken);
    registerBadgeCountNotificationBlock__s_storeChangedNotificationToken = -1;
  }
  +[ASDUpdatesService badgeCount]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__ASDUpdatesService_registerBadgeCountNotificationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[ASDUpdatesService badgeCount]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)badgeCount
{
  void *v0;
  void *v1;
  id v2;

  objc_opt_self();
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("BadgeCount"), CFSTR("com.apple.appstored"));
  v1 = v0;
  if (!v0)
    v0 = &unk_1E37E3268;
  v2 = v0;

  return v2;
}

+ (BOOL)isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("NSAppNeedsAutoUpdateConsent"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)areAllAppsAuthorizedForAutomaticUpdates
{
  void *v2;
  id v3;
  unsigned int (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (_autoUpdatesEnabled())
  {
    if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled](ASDUpdatesService, "isAutomaticUpdateAuthorizationEnabled"))
    {
      v2 = (void *)CFPreferencesCopyValue(CFSTR("AutomaticUpdateAuthorizations"), CFSTR("com.apple.appstored"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __60__ASDUpdatesService_areAllAppsAuthorizedForAutomaticUpdates__block_invoke;
      v32[3] = &unk_1E37BF0E0;
      v3 = v2;
      v33 = v3;
      v4 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC5B88](v32);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v3, "allKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 7);
      objc_msgSend(v6, "addObjectsFromArray:", &unk_1E37E33D8);
      objc_msgSend(v6, "addObjectsFromArray:", v5);
      v7 = (void *)objc_msgSend(v6, "copy");

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);
            if (v13 && !((unsigned int (**)(_QWORD, uint64_t, void *))v4)[2](v4, v12, v13))
            {

              LOBYTE(v21) = 0;
              goto LABEL_27;
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
          if (v9)
            continue;
          break;
        }
      }

      ASDLogHandleForCategory(12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19A03B000, v14, OS_LOG_TYPE_DEBUG, "Checking all apps", buf, 2u);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
LABEL_16:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v7);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v18);
          objc_msgSend(v19, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = ((unsigned int (**)(_QWORD, void *, void *))v4)[2](v4, v20, v19);

          if (!v21)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
            LOBYTE(v21) = 1;
            if (v16)
              goto LABEL_16;
            break;
          }
        }
      }
      else
      {
        LOBYTE(v21) = 1;
      }
LABEL_27:

    }
    else
    {
      LOBYTE(v21) = 1;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
  return v21;
}

uint64_t __60__ASDUpdatesService_areAllAppsAuthorizedForAutomaticUpdates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:](ASDUpdatesService, "isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:", a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  OS_dispatch_queue *accessQueue;
  NSObject *v17;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = (id)objc_opt_class();
    v9 = v23;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle", buf, 0xCu);

  }
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled](ASDUpdatesService, "isAutomaticUpdateAuthorizationEnabled"))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_autoUpdatesEnabled()
      && (v11 = (void *)CFPreferencesCopyValue(CFSTR("AutomaticUpdateAuthorizations"), CFSTR("com.apple.appstored"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]), objc_msgSend(v11, "objectForKeyedSubscript:", v10), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v11, !v12))
    {
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke;
      block[3] = &unk_1E37BF158;
      block[4] = self;
      v21 = v7;
      v20 = v6;
      v17 = accessQueue;
      v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v17, v18);

    }
    else
    {
      ASDLogHandleForCategory(12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A03B000, v13, OS_LOG_TYPE_DEFAULT, "Already asked for authorization or auto-updates are disabled", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDErrorDomain"), 1300, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v14);

    }
  }
  else
  {
    ASDLogHandleForCategory(12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A03B000, v15, OS_LOG_TYPE_DEFAULT, "Automatic update authorization is disabled.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDErrorDomain"), 1300, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_2;
  v4[3] = &unk_1E37BF130;
  v4[4] = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_3;
    v15[3] = &unk_1E37BDEE8;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_5;
    v13[3] = &unk_1E37BDEE8;
    v6 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:completion:", v6, v13);

    v7 = v16;
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_7;
    block[3] = &unk_1E37BF108;
    v12 = *(id *)(a1 + 48);
    v9 = v8;
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);

    v7 = v12;
  }

}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_4;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v4;
  v6 = v5;
  v7 = v3;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_block_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_6;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v4;
  v6 = v5;
  v7 = v3;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
  dispatch_async(v6, v8);

}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __95__ASDUpdatesService_requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)autoUpdateEnabled
{
  ASDServiceBroker *serviceBroker;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  v15 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getUpdatesServiceWithError:](serviceBroker, "getUpdatesServiceWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v15, obj);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ASDUpdatesService_autoUpdateEnabled__block_invoke;
  v8[3] = &unk_1E37BDFB0;
  v8[4] = v14;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __38__ASDUpdatesService_autoUpdateEnabled__block_invoke_2;
  v7[3] = &unk_1E37BE510;
  v7[4] = &v10;
  objc_msgSend(v5, "autoUpdateEnabled:", v7);

  LOBYTE(v5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);

  return (char)v5;
}

void __38__ASDUpdatesService_autoUpdateEnabled__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __38__ASDUpdatesService_autoUpdateEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)confirmAgentRequestedUpdateAll
{
  ASDServiceBroker *serviceBroker;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  v15 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getUpdatesServiceWithError:](serviceBroker, "getUpdatesServiceWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v15, obj);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke;
  v8[3] = &unk_1E37BDFB0;
  v8[4] = v14;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke_2;
  v7[3] = &unk_1E37BE510;
  v7[4] = &v10;
  objc_msgSend(v5, "confirmAgentRequestedUpdateAll:", v7);

  LOBYTE(v5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);

  return (char)v5;
}

void __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __51__ASDUpdatesService_confirmAgentRequestedUpdateAll__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getManagedUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_3;
    v15[3] = &unk_1E37BDEE8;
    v5 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v5;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_5;
    v13[3] = &unk_1E37BDD10;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(v6, "getManagedUpdatesWithReplyHandler:", v13);

    v8 = v16;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_7;
    block[3] = &unk_1E37BF108;
    v12 = v9;
    dispatch_async(v10, block);
    v8 = v12;
  }

}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__ASDUpdatesService_getManagedUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_3;
    v15[3] = &unk_1E37BDEE8;
    v5 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v5;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_5;
    v13[3] = &unk_1E37BEEC8;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    objc_msgSend(v6, "getUpdatesWithReplyHandler:", v13);

    v8 = v16;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_7;
    block[3] = &unk_1E37BF108;
    v12 = v9;
    dispatch_async(v10, block);
    v8 = v12;
  }

}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __51__ASDUpdatesService_getUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdateCountWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_5;
    v16[3] = &unk_1E37BF1A8;
    v9 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v9;
    objc_msgSend(v8, "refreshUpdateCountWithReplyHandler:", v16);

    v10 = v19;
  }
  else
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_7;
    v13[3] = &unk_1E37BDCC0;
    v15 = v11;
    v14 = v5;
    dispatch_async(v12, v13);

    v10 = v15;
  }

}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BE9A8;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __59__ASDUpdatesService_refreshUpdateCountWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke;
  block[3] = &unk_1E37BF158;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(accessQueue, block);

}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF130;
  v4[4] = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3;
    v17[3] = &unk_1E37BDEE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5;
    v15[3] = &unk_1E37BE200;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v9;
    objc_msgSend(v7, "refreshUpdatesWithCompletionBlock:completionBlock:", v8, v15);

    v10 = v18;
  }
  else
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_7;
    v12[3] = &unk_1E37BDCC0;
    v14 = *(id *)(a1 + 48);
    v13 = v5;
    dispatch_async(v11, v12);

    v10 = v14;
  }

}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6;
    block[3] = &unk_1E37BDF60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __71__ASDUpdatesService_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)reloadFromServer
{
  ASDServiceBroker *serviceBroker;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = (id)MEMORY[0x1E0C9AA60];
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getUpdatesServiceWithError:](serviceBroker, "getUpdatesServiceWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v26, obj);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__ASDUpdatesService_reloadFromServer__block_invoke;
  v13[3] = &unk_1E37BDFB0;
  v13[4] = &v21;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __37__ASDUpdatesService_reloadFromServer__block_invoke_2;
  v12[3] = &unk_1E37BF1D0;
  v12[4] = &v21;
  v12[5] = &v15;
  objc_msgSend(v5, "reloadFromServerWithReplyHandler:", v12);

  if (v22[5])
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v22[5];
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      v11 = v9;
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]: error in reloadFromServer: %{public}@", buf, 0x16u);

    }
  }
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __37__ASDUpdatesService_reloadFromServer__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __37__ASDUpdatesService_reloadFromServer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_5;
    v16[3] = &unk_1E37BDD10;
    v9 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v9;
    objc_msgSend(v8, "reloadFromServerWithReplyHandler:", v16);

    v10 = v19;
  }
  else
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_7;
    v13[3] = &unk_1E37BDCC0;
    v15 = v11;
    v14 = v5;
    dispatch_async(v12, v13);

    v10 = v15;
  }

}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BDF10;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __57__ASDUpdatesService_reloadFromServerWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadManagedUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_3;
    v18[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_5;
    v16[3] = &unk_1E37BDD10;
    v9 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v9;
    objc_msgSend(v8, "reloadManagedUpdatesWithReplyHandler:", v16);

    v10 = v19;
  }
  else
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_7;
    v13[3] = &unk_1E37BDCC0;
    v15 = v11;
    v14 = v5;
    dispatch_async(v12, v13);

    v10 = v15;
  }

}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BDF10;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __61__ASDUpdatesService_reloadManagedUpdatesWithCompletionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke;
  v4[3] = &unk_1E37BE338;
  v4[4] = self;
  v5 = a3;
  dispatch_async(accessQueue, v4);
}

uint64_t __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  char v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke_2;
  v3[3] = &__block_descriptor_33_e69_v24__0___ASDUpdatesServiceProtocol__NSXPCProxyCreating__8__NSError_16l;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "getUpdatesServiceWithCompletionHandler:", v3);
}

void __42__ASDUpdatesService_setAutoUpdateEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAutoUpdateEnabled:withReplyHandler:", *(unsigned __int8 *)(a1 + 32), &__block_literal_global_33);

  }
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithOrder", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke;
  block[3] = &unk_1E37BF158;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(accessQueue, block);

}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF130;
  v4[4] = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_3;
    v21[3] = &unk_1E37BF260;
    v21[4] = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_5;
    v19[3] = &unk_1E37BF288;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v9;
    objc_msgSend(v7, "updateAllWithOrder:replyHandler:", v8, v19);

    v10 = v23;
  }
  else
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_7;
    block[3] = &unk_1E37BF238;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v18 = v12;
    block[4] = v13;
    v16 = v14;
    v17 = v5;
    dispatch_async(v11, block);

    v10 = v18;
  }

}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_3(uint64_t a1, void *a2)
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
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_4;
  v9[3] = &unk_1E37BF238;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = v5;
  v9[4] = v6;
  v10 = v7;
  v11 = v3;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  -[ASDUpdatesService _failedJobResultsForBundleIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v2 + 16))(v2, 0, v3, *(_QWORD *)(a1 + 48));

}

- (id)_failedJobResultsForBundleIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASDErrorDomain"), 901, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[ASDJobResult resultWithPersistentID:bundleID:status:error:](ASDJobResult, "resultWithPersistentID:bundleID:status:error:", 0, v10, 1, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_6;
    v11[3] = &unk_1E37BE360;
    v14 = v9;
    v15 = a2;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __56__ASDUpdatesService_updateAllWithOrder_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  -[ASDUpdatesService _failedJobResultsForBundleIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v2 + 16))(v2, 0, v3, *(_QWORD *)(a1 + 48));

}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerInBackground", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BF180;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getUpdatesServiceWithCompletionHandler:](serviceBroker, "getUpdatesServiceWithCompletionHandler:", v9);

}

void __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2;
    v4[3] = &unk_1E37BDDB0;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadFromServerInBackgroundWithCompletionBlock:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __69__ASDUpdatesService_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: shouldUseModernUpdatesWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BF180;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getUpdatesServiceWithCompletionHandler:](serviceBroker, "getUpdatesServiceWithCompletionHandler:", v9);

}

void __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2;
    v4[3] = &unk_1E37BDDB0;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shouldUseModernUpdatesWithReplyHandler:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __63__ASDUpdatesService_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)getUpdateMetricsEventsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdateMetricsEventsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BF180;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getUpdatesServiceWithCompletionHandler:](serviceBroker, "getUpdatesServiceWithCompletionHandler:", v9);

}

void __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke_2;
    v4[3] = &unk_1E37BDDB0;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getUpdateMetricsEventsWithReplyHandler:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __63__ASDUpdatesService_getUpdateMetricsEventsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)getMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get metrics with completion block", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2_39;
    v18[3] = &unk_1E37BF2B0;
    v9 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    objc_msgSend(v8, "getMetricsWithReplyHandler:", v18);

    v10 = v21;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v5;
      v14 = v23;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_42;
    v15[3] = &unk_1E37BDCC0;
    v17 = v12;
    v16 = v5;
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v8 = v13;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_38;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, v9);

}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v12 = v18;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_40;
  block[3] = &unk_1E37BDF10;
  v15 = v6;
  v16 = v8;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_40(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__ASDUpdatesService_getMetricsWithCompletionBlock___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get updates including metrics with completion block", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3;
    v19[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2_44;
    v17[3] = &unk_1E37BDD10;
    v9 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v9;
    objc_msgSend(v8, "getUpdatesIncludingMetricsWithReplyHandler:", v17);

    v10 = v20;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v22 = (id)objc_opt_class();
      v23 = 2114;
      v24 = v5;
      v14 = v22;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_46;
    block[3] = &unk_1E37BF108;
    v16 = v12;
    dispatch_async(v13, block);
    v10 = v16;
  }

}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v3;
    v7 = v11;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_43;
  block[3] = &unk_1E37BF108;
  v9 = v5;
  dispatch_async(v6, block);

}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v6;
      v11 = v16;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_45;
  v12[3] = &unk_1E37BDCC0;
  v13 = v5;
  v14 = v8;
  v10 = v5;
  dispatch_async(v9, v12);

}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__ASDUpdatesService_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hideApplicationBadgeForPendingUpdates
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hide application badge for pending updates", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_2;
  v4[3] = &unk_1E37BF2D8;
  v4[4] = v1;
  return objc_msgSend(v2, "getUpdatesServiceWithCompletionHandler:", v4);
}

void __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_3;
    v8[3] = &unk_1E37BDDB0;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject hideApplicationBadgeForPendingUpdates](v6, "hideApplicationBadgeForPendingUpdates");
  }
  else
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v5;
      v7 = v10;
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }

}

void __58__ASDUpdatesService_hideApplicationBadgeForPendingUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reload for settings from server with completion block", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2_48;
    v18[3] = &unk_1E37BDD10;
    v9 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    objc_msgSend(v8, "reloadForSettingsFromServerWithReplyHandler:", v18);

    v10 = v21;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v5;
      v14 = v23;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_50;
    v15[3] = &unk_1E37BDCC0;
    v17 = v12;
    v16 = v5;
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v8 = v13;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_47;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, v9);

}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v12 = v18;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_49;
  block[3] = &unk_1E37BDF10;
  v15 = v6;
  v16 = v8;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_49(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __68__ASDUpdatesService_reloadForSettingsFromServerWithCompletionBlock___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

- (void)showApplicationBadgeForPendingUpdates
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Show application badge for pending updates", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_2;
  v4[3] = &unk_1E37BF2D8;
  v4[4] = v1;
  return objc_msgSend(v2, "getUpdatesServiceWithCompletionHandler:", v4);
}

void __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_3;
    v8[3] = &unk_1E37BDDB0;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject showApplicationBadgeForPendingUpdates](v6, "showApplicationBadgeForPendingUpdates");
  }
  else
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v5;
      v7 = v10;
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }

}

void __58__ASDUpdatesService_showApplicationBadgeForPendingUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2114;
    v8 = v2;
    v4 = v6;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)updateAllWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update all with completion block", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2_52;
    v18[3] = &unk_1E37BF300;
    v9 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    objc_msgSend(v8, "updateAllWithReplyHandler:", v18);

    v10 = v21;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v5;
      v14 = v23;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_54;
    v15[3] = &unk_1E37BDCC0;
    v17 = v12;
    v16 = v5;
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v8 = v13;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_51;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, v9);

}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_2_52(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v5;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_53;
  block[3] = &unk_1E37BDF60;
  v14 = a2;
  v12 = v5;
  v13 = v7;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __50__ASDUpdatesService_updateAllWithCompletionBlock___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)updateAllWithJobResultsCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update all with job results completion block", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E37BF180;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getUpdatesServiceWithCompletionHandler:", v4);

}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_3;
    v20[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2_56;
    v18[3] = &unk_1E37BE388;
    v9 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    objc_msgSend(v8, "updateAllGettingJobResultsWithReplyHandler:", v18);

    v10 = v21;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v5;
      v14 = v23;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_58;
    v15[3] = &unk_1E37BDCC0;
    v17 = v12;
    v16 = v5;
    dispatch_async(v13, v15);

    v10 = v17;
  }

}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v3;
    v8 = v13;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_55;
  v9[3] = &unk_1E37BDCC0;
  v10 = v3;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, v9);

}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

void __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_2_56(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = (id)objc_opt_class();
      v22 = 2114;
      v23 = v8;
      v14 = v21;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %{public}@", buf, 0x16u);

    }
  }
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_57;
  v15[3] = &unk_1E37BE360;
  v17 = v8;
  v18 = v10;
  v19 = a2;
  v16 = v7;
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, v15);

}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __60__ASDUpdatesService_updateAllWithJobResultsCompletionBlock___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
