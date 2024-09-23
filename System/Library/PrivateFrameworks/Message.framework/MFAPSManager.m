@implementation MFAPSManager

- (void)stopWatchingForTopic:(id)a3
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
    v7[2] = __37__MFAPSManager_stopWatchingForTopic___block_invoke;
    v7[3] = &unk_1E4E88EE8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

+ (id)sharedManager
{
  void *v2;
  char v3;
  id v4;

  MFUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canRegisterForAPSPush");

  if ((v3 & 1) != 0)
  {
    if (sharedManager_onceToken != -1)
      dispatch_once(&sharedManager_onceToken, &__block_literal_global_22);
    v4 = (id)sharedManager___sharedInstance;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __29__MFAPSManager_sharedManager__block_invoke()
{
  MFAPSManager *v0;
  void *v1;

  v0 = objc_alloc_init(MFAPSManager);
  v1 = (void *)sharedManager___sharedInstance;
  sharedManager___sharedInstance = (uint64_t)v0;

}

- (MFAPSManager)init
{
  MFAPSManager *v2;
  void *v3;
  __CFString *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSCountedSet *v7;
  NSCountedSet *watchedTopics;
  NSMutableSet *v9;
  NSMutableSet *unwatchedTopics;
  uint64_t v11;
  NSConditionLock *deviceTokenLock;
  void *v13;
  MFAPSManager *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFAPSManager;
  v2 = -[MFAPSManager init](&v16, sel_init);
  if (v2)
  {
    MFUserAgent();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isMaild"))
      v4 = CFSTR("com.apple.email.maild.aps");
    else
      v4 = 0;
    objc_storeStrong((id *)&v2->_launchMachServiceName, v4);

    v5 = dispatch_queue_create("com.apple.message.apsManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    watchedTopics = v2->_watchedTopics;
    v2->_watchedTopics = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unwatchedTopics = v2->_unwatchedTopics;
    v2->_unwatchedTopics = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithCondition:", 0);
    deviceTokenLock = v2->_deviceTokenLock;
    v2->_deviceTokenLock = (NSConditionLock *)v11;

    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addDiagnosticsGenerator:", v2);

    v14 = v2;
  }

  return v2;
}

- (void)setLaunchMachServiceName:(id)a3
{
  NSString *v4;
  NSString *launchMachServiceName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  launchMachServiceName = self->_launchMachServiceName;
  self->_launchMachServiceName = v4;

}

+ (Class)APSConnection
{
  if (APSConnection_onceToken != -1)
    dispatch_once(&APSConnection_onceToken, &__block_literal_global_27);
  return (Class)(id)APSConnection_klass;
}

void __29__MFAPSManager_APSConnection__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;

  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/ApplePushService.framework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    APSConnection_klass = objc_msgSend(v1, "classNamed:", CFSTR("APSConnection"));
  }
  else
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __29__MFAPSManager_APSConnection__block_invoke_cold_1((uint64_t)v0, v3);

  }
}

+ (id)apsEnvironment
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MFUseAPSDevelopmentEnvironment"));

  if (v3)
    return CFSTR("development");
  else
    return CFSTR("production");
}

- (void)_startAPS_nts
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#aps-push A launchd mach service name is required but none was provided, pushes will not work - this will turn into an assert in the future", v1, 2u);
}

- (void)_stopAPS_nts
{
  APSConnection *pushService;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pushService = self->_pushService;
  self->_pushService = 0;

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "#aps-push Stopped MFAPSManager.", v5, 2u);
  }

}

- (void)startWatchingForTopic:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFAPSManager_startWatchingForTopic___block_invoke;
  v7[3] = &unk_1E4E88EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__MFAPSManager_startWatchingForTopic___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
    objc_msgSend(v2, "_startAPS_nts");
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "#aps-push Start watching topic '%@'", (uint8_t *)&v10, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  objc_msgSend(*(id *)(v5 + 24), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "enabledTopicsWithTopics:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabledTopics:ignoredTopics:", v8, v9);

}

void __37__MFAPSManager_stopWatchingForTopic___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "countForObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (v2 == 1)
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "#aps-push Stop watching topic '%@'", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  objc_msgSend(*(id *)(v5 + 24), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "enabledTopicsWithTopics:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabledTopics:ignoredTopics:", v8, v9);

}

- (id)enabledTopicsWithTopics:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EAD0], "cloudKitAPSTopics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count") + objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v3);
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return v5;
}

- (void)swapTopic:(id)a3 forNewTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MFAPSManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MFAPSManager_swapTopic_forNewTopic___block_invoke;
  block[3] = &unk_1E4E8AE10;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __38__MFAPSManager_swapTopic_forNewTopic___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v11 = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_INFO, "#aps-push Swapping registered topic '%@' for topic '%@'", (uint8_t *)&v11, 0x16u);
  }

  v5 = objc_msgSend(*(id *)(a1[6] + 24), "containsObject:", a1[4]);
  if (v5)
  {
    objc_msgSend(*(id *)(a1[6] + 24), "removeObject:", a1[4]);
    objc_msgSend(*(id *)(a1[6] + 24), "addObject:", a1[5]);
  }
  if (objc_msgSend(*(id *)(a1[6] + 32), "containsObject:", a1[4]))
  {
    objc_msgSend(*(id *)(a1[6] + 32), "removeObject:", a1[4]);
    objc_msgSend(*(id *)(a1[6] + 32), "addObject:", a1[5]);
  }
  else if (!v5)
  {
    return;
  }
  v6 = a1[6];
  v7 = *(void **)(v6 + 16);
  objc_msgSend(*(id *)(v6 + 24), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "enabledTopicsWithTopics:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[6] + 32), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabledTopics:ignoredTopics:", v9, v10);

}

- (void)connect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MFAPSManager_connect__block_invoke;
  block[3] = &unk_1E4E88DC8;
  block[4] = self;
  dispatch_async(queue, block);
}

_QWORD *__23__MFAPSManager_connect__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_startAPS_nts");
  return result;
}

- (id)copyDeviceToken
{
  NSObject *queue;
  NSConditionLock *deviceTokenLock;
  void *v5;
  _BOOL4 v6;
  NSData *v7;
  _QWORD block[5];

  if (!self->_pushService)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__MFAPSManager_copyDeviceToken__block_invoke;
    block[3] = &unk_1E4E88DC8;
    block[4] = self;
    dispatch_sync(queue, block);
  }
  deviceTokenLock = self->_deviceTokenLock;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSConditionLock lockWhenCondition:beforeDate:](deviceTokenLock, "lockWhenCondition:beforeDate:", 1, v5);

  if (!v6)
    return 0;
  v7 = self->_deviceToken;
  -[NSConditionLock unlock](self->_deviceTokenLock, "unlock");
  return v7;
}

uint64_t __31__MFAPSManager_copyDeviceToken__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAPS_nts");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  NSData *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSData *)a4;
  if (v7
    && -[NSCountedSet containsObject:](self->_watchedTopics, "containsObject:", CFSTR("com.apple.mobilemail.dummyTopicToForceServerConnection")))
  {
    -[MFAPSManager stopWatchingForTopic:](self, "stopWatchingForTopic:", CFSTR("com.apple.mobilemail.dummyTopicToForceServerConnection"));
  }
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[NSData ef_hexString](v7, "ef_hexString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_INFO, "#aps-push Received public token '%@'.", (uint8_t *)&v10, 0xCu);

  }
  -[NSConditionLock lock](self->_deviceTokenLock, "lock");
  if (self->_deviceToken == v7)
  {
    -[NSConditionLock unlock](self->_deviceTokenLock, "unlock");
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceToken, a4);
    -[NSConditionLock unlockWithCondition:](self->_deviceTokenLock, "unlockWithCondition:", self->_deviceToken != 0);
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_43_0);
  }

}

void __49__MFAPSManager_connection_didReceivePublicToken___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MFAPSManagerDeviceTokenChangedNote"), 0);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "wasFromStorage");
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_INFO, "#aps-push received notification on topic '%@', userInfo=%@", (uint8_t *)&v15, 0x16u);
  }

  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.mobilemail.push.")) & 1) != 0
    || objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.mail.")))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("aps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("account-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("m"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "handlePushNotificationOnMailboxes:missedNotifications:", v12, v7);

      }
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D1EAD0], "cloudKitAPSTopics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v5);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E978], 0, v10);
    goto LABEL_14;
  }
LABEL_16:

}

- (id)copyDiagnosticInformation
{
  id v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__MFAPSManager_copyDiagnosticInformation__block_invoke;
  v9[3] = &unk_1E4E88EE8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __41__MFAPSManager_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lock");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "condition");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "ef_hexString");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unlock");
  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n==== MFAPSManager ====\n"));
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("  push service: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  watched topics: {%@}\n"), v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("  ignored topics: {%@}\n"), v8);

  if (v2)
  {
    if (v2 != 1)
      __assert_rtn("_tokenConditionString", "MFAPSManager.m", 322, "0 && \"unknown token condition\");
    v9 = CFSTR("has token");
  }
  else
  {
    v9 = CFSTR("waiting for token");
  }
  v10 = CFSTR("<unknown>");
  if (v11)
    v10 = v11;
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("  device token (%@): '%@'\n"), v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchMachServiceName, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_deviceTokenLock, 0);
  objc_storeStrong((id *)&self->_unwatchedTopics, 0);
  objc_storeStrong((id *)&self->_watchedTopics, 0);
  objc_storeStrong((id *)&self->_pushService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__MFAPSManager_APSConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "#aps-push Unable to open ApplePushService at %@", (uint8_t *)&v2, 0xCu);
}

@end
