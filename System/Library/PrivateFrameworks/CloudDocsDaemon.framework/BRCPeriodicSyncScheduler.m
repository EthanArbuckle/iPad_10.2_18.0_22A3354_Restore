@implementation BRCPeriodicSyncScheduler

+ (id)periodicSyncLastSyncDateKey
{
  return CFSTR("periodicSyncDate");
}

- (BRCPeriodicSyncScheduler)initWithContainerScheduler:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  BRCPeriodicSyncScheduler *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BRCUserDefaults *userDefaults;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *syncQueue;
  uint64_t v18;
  NSString *personaIdentifier;
  OS_dispatch_source *periodicSyncRequestTimer;
  uint64_t v21;
  NSDate *networkConnectTime;
  uint64_t v23;
  NSDate *networkDisconnectTime;
  uint64_t v25;
  NSDate *screenUnlockedTime;
  uint64_t v27;
  NSDate *appLibrariesLastBoostTime;
  uint64_t v30[3];
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  BRCPeriodicSyncScheduler *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)BRCPeriodicSyncScheduler;
  v9 = -[BRCPeriodicSyncScheduler init](&v31, sel_init);
  if (v9)
  {
    memset(v30, 0, sizeof(v30));
    __brc_create_section(0, (uint64_t)"-[BRCPeriodicSyncScheduler initWithContainerScheduler:session:]", 84, v30);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v33 = v30[0];
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating %@%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v9->_containerScheduler, a3);
    objc_storeStrong((id *)&v9->_session, a4);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (BRCUserDefaults *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.brc.periodic-sync-scheduler", v15);

    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v16;

    -[BRCAccountSession personaIdentifier](v9->_session, "personaIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v9->_personaIdentifier;
    v9->_personaIdentifier = (NSString *)v18;

    periodicSyncRequestTimer = v9->_periodicSyncRequestTimer;
    v9->_periodicSyncRequestTimer = 0;

    *(_WORD *)&v9->_shouldTriggerPeriodicSync = 0;
    v9->_closed = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = objc_claimAutoreleasedReturnValue();
    networkConnectTime = v9->_networkConnectTime;
    v9->_networkConnectTime = (NSDate *)v21;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = objc_claimAutoreleasedReturnValue();
    networkDisconnectTime = v9->_networkDisconnectTime;
    v9->_networkDisconnectTime = (NSDate *)v23;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = objc_claimAutoreleasedReturnValue();
    screenUnlockedTime = v9->_screenUnlockedTime;
    v9->_screenUnlockedTime = (NSDate *)v25;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = objc_claimAutoreleasedReturnValue();
    appLibrariesLastBoostTime = v9->_appLibrariesLastBoostTime;
    v9->_appLibrariesLastBoostTime = (NSDate *)v27;

    __brc_leave_section(v30);
  }

  return v9;
}

- (void)_registerToNotifications
{
  void *v3;
  void *v4;
  id v5;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addReachabilityObserver:", self);
  objc_msgSend(v5, "addScreenLockObserver:", self);
  objc_msgSend((id)*MEMORY[0x1E0D10AF8], "br_libnotifyPerPersonaNotificationName:", self->_personaIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__appLibraryDidBoostForPresenterNotificationHandler_, v3, 0);

}

- (void)_unregisterToNotifications
{
  void *v3;
  void *v4;
  id v5;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeReachabilityObserver:", self);
  objc_msgSend(v5, "removeScreenLockObserver:", self);
  objc_msgSend((id)*MEMORY[0x1E0D10AF8], "br_libnotifyPerPersonaNotificationName:", self->_personaIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)close
{
  NSObject *syncQueue;
  _QWORD block[5];

  self->_closed = 1;
  -[BRCPeriodicSyncScheduler _unregisterToNotifications](self, "_unregisterToNotifications");
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BRCPeriodicSyncScheduler_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __33__BRCPeriodicSyncScheduler_close__block_invoke()
{
  return BRPerformWithPersonaAndError();
}

void __33__BRCPeriodicSyncScheduler_close__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_cancelPeriodicSyncRequestScheduler");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = 0;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    *(_QWORD *)(v8 + 96) = 0;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = 0;

  }
}

- (void)resume
{
  NSObject *v3;
  uint64_t v4;
  NSObject *syncQueue;
  _QWORD v6[5];
  _QWORD block[5];

  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__BRCPeriodicSyncScheduler_resume__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  -[BRCPeriodicSyncScheduler _registerToNotifications](self, "_registerToNotifications");
  syncQueue = self->_syncQueue;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __34__BRCPeriodicSyncScheduler_resume__block_invoke_9;
  v6[3] = &unk_1E875D500;
  v6[4] = self;
  dispatch_async(syncQueue, v6);
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("periodicSyncDate"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)v1 + 40);
    *(_QWORD *)(*(_QWORD *)v1 + 40) = v5;

    v7 = *(_QWORD *)(*(_QWORD *)v1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)v1 + 16), "clientState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("periodicSyncDate"));

    objc_msgSend(*(id *)(*(_QWORD *)v1 + 16), "clientDB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forceBatchStart");

  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __34__BRCPeriodicSyncScheduler_resume__block_invoke_cold_1(v1);

}

uint64_t __34__BRCPeriodicSyncScheduler_resume__block_invoke_9(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __34__BRCPeriodicSyncScheduler_resume__block_invoke_9_cold_1(a1);

  return BRPerformWithPersonaAndError();
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_markNeedPeriodicSync");
    objc_msgSend(*(id *)(a1 + 32), "_schedulePeriodicSyncRequest");
  }

}

- (void)networkReachabilityChanged:(BOOL)a3
{
  NSObject *syncQueue;
  _QWORD v4[5];
  BOOL v5;

  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke;
    v4[3] = &unk_1E8760EE0;
    v4[4] = self;
    v5 = a3;
    dispatch_async(syncQueue, v4);
  }
}

uint64_t __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 34))
    return BRPerformWithPersonaAndError();
  return result;
}

void __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 35))
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 56);
      *(_QWORD *)(v7 + 56) = v6;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = *(_BYTE *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_cancelPeriodicSyncRequestScheduler");
    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v9;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v13 = v12;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "periodicSyncNetworkUnreachableMinThreshold");
    if (v13 >= v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = 138412802;
        v19 = v17;
        v20 = 2048;
        v21 = v13 / 60.0;
        v22 = 2112;
        v23 = v15;
        _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Network disconnected for %.1f mins --> Assume missing push%@", (uint8_t *)&v18, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_markNeedPeriodicSync");
    }
    objc_msgSend(*(id *)(a1 + 32), "_schedulePeriodicSyncRequest");
  }

}

- (void)screenLockChanged:(BOOL)a3
{
  NSObject *syncQueue;
  _QWORD v4[5];
  BOOL v5;

  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke;
    v4[3] = &unk_1E8760EE0;
    v4[4] = self;
    v5 = a3;
    dispatch_async(syncQueue, v4);
  }
}

uint64_t __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 34))
    return BRPerformWithPersonaAndError();
  return result;
}

void __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 36))
    {
      if (!*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 64);
        *(_QWORD *)(v8 + 64) = v7;

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = *(_BYTE *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "_schedulePeriodicSyncRequest");
      }
    }
    else if (*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(v6 + 36) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_cancelPeriodicSyncRequestScheduler");
    }
  }

}

- (void)_appLibraryDidBoostForPresenterNotificationHandler:(id)a3
{
  NSObject *syncQueue;
  _QWORD block[5];

  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke;
    block[3] = &unk_1E875D500;
    block[4] = self;
    dispatch_async(syncQueue, block);
  }
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  double v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 34) && !*(_BYTE *)(v1 + 36))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *((_QWORD *)*v2 + 9));
    v5 = v4;
    objc_storeStrong((id *)*v2 + 9, v3);
    objc_msgSend(*v2, "_timeIntervalSinceLastPeriodicSync");
    v7 = v6;
    objc_msgSend(*((id *)*v2 + 12), "periodicSyncAutoTriggerTimeInterval");
    if (v7 >= v8)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_cold_1(v2);
    }
    else
    {
      objc_msgSend(*((id *)*v2 + 12), "periodicSyncAppLibraryLastBoostMinThreshold");
      if (v5 < v9)
      {
LABEL_10:

        return;
      }
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = *v2;
        *(_DWORD *)buf = 138412802;
        v14 = v12;
        v15 = 2048;
        v16 = v5 / 60.0;
        v17 = 2112;
        v18 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - User did not use iCloud Drive for %.1f mins --> trigger periodic sync%@", buf, 0x20u);
      }
    }

    BRPerformWithPersonaAndError();
    goto LABEL_10;
  }
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_markNeedPeriodicSync");
    objc_msgSend(*(id *)(a1 + 32), "_schedulePeriodicSyncRequest");
  }

}

- (double)_timeIntervalSinceLastPeriodicSync
{
  void *v3;
  double v4;
  double v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastPeriodicSyncDate);
  v5 = v4;

  return fmax(v5, 0.0);
}

- (void)_markNeedPeriodicSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_closed)
    self->_shouldTriggerPeriodicSync = 1;
}

- (void)_schedulePeriodicSyncRequest
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  OS_dispatch_source *v23;
  OS_dispatch_source *periodicSyncRequestTimer;
  int64_t v25;
  NSObject *v26;
  dispatch_time_t v27;
  OS_dispatch_source *v28;
  NSObject *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  dispatch_block_t v33;
  void *v34;
  NSObject *v35;
  OS_dispatch_source *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  BRCPeriodicSyncScheduler *v39;
  __int16 v40;
  OS_dispatch_source *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  void *v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_closed
    && self->_shouldTriggerPeriodicSync
    && !self->_isScreenLocked
    && self->_isNetworkReachable
    && !self->_periodicSyncInProgress
    && !self->_periodicSyncRequestTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCUserDefaults periodicSyncNetworkStableMinThreshold](self->_userDefaults, "periodicSyncNetworkStableMinThreshold");
    v5 = v4;
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_networkConnectTime);
    v7 = v5 - v6;
    -[BRCUserDefaults periodicSyncScreenUnlockedMinThreshold](self->_userDefaults, "periodicSyncScreenUnlockedMinThreshold");
    v9 = v8;
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_screenUnlockedTime);
    v11 = v9 - v10;
    -[BRCUserDefaults periodicSyncTimeInterval](self->_userDefaults, "periodicSyncTimeInterval");
    v13 = v12;
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastPeriodicSyncDate);
    v15 = v13 - v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "br_maxWithComparator:", *MEMORY[0x1E0D11010]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    if (v22 <= 0.0)
    {
      -[BRCPeriodicSyncScheduler _tiggerPeriodicSync](self, "_tiggerPeriodicSync");
    }
    else
    {
      v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_syncQueue);
      periodicSyncRequestTimer = self->_periodicSyncRequestTimer;
      self->_periodicSyncRequestTimer = v23;

      v25 = (unint64_t)(v22 * 1000000000.0);
      v26 = self->_periodicSyncRequestTimer;
      v27 = dispatch_time(0, v25);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, v25 / 10);
      v28 = self->_periodicSyncRequestTimer;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __56__BRCPeriodicSyncScheduler__schedulePeriodicSyncRequest__block_invoke;
      v37[3] = &unk_1E875D500;
      v37[4] = self;
      v29 = v28;
      v30 = v37;
      v31 = v30;
      v32 = v30;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v32);
      dispatch_source_set_event_handler(v29, v33);

      dispatch_resume((dispatch_object_t)self->_periodicSyncRequestTimer);
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v36 = self->_periodicSyncRequestTimer;
        *(_DWORD *)buf = 138413058;
        v39 = self;
        v40 = 2112;
        v41 = v36;
        v42 = 2048;
        v43 = v25 / 0x3B9ACA00uLL;
        v44 = 2112;
        v45 = v34;
        _os_log_debug_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - scheduled _periodicSyncRequestTimer %@ in %llu sec%@", buf, 0x2Au);
      }

    }
  }
}

uint64_t __56__BRCPeriodicSyncScheduler__schedulePeriodicSyncRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tiggerPeriodicSync");
}

- (void)_cancelPeriodicSyncRequestScheduler
{
  void *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *periodicSyncRequestTimer;
  int v7;
  BRCPeriodicSyncScheduler *v8;
  __int16 v9;
  OS_dispatch_source *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (self->_periodicSyncRequestTimer)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      periodicSyncRequestTimer = self->_periodicSyncRequestTimer;
      v7 = 138412802;
      v8 = self;
      v9 = 2112;
      v10 = periodicSyncRequestTimer;
      v11 = 2112;
      v12 = v3;
      _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - cancelling periodicSyncRequestTimer %@%@", (uint8_t *)&v7, 0x20u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_periodicSyncRequestTimer);
    v5 = self->_periodicSyncRequestTimer;
    self->_periodicSyncRequestTimer = 0;

  }
}

- (void)_tiggerPeriodicSync
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@: Periodic sync already running%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0C94F88], "br_syncDownPeriodic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke_2;
  v4[3] = &unk_1E875D850;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "schedulePeriodicSyncInGroup:completion:", v3, v4);

}

uint64_t __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_periodicSyncCompletionWithError:", a2);
}

- (void)_periodicSyncCompletionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *syncQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  BRCPeriodicSyncScheduler *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if (v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      -[BRCPeriodicSyncScheduler _periodicSyncCompletionWithError:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - persist last periodic sync date: %@%@", buf, 0x20u);
  }

  -[BRCAccountSession clientState](self->_session, "clientState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("periodicSyncDate"));

  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "forceBatchStart");

  syncQueue = self->_syncQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke;
  v15[3] = &unk_1E875D470;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  dispatch_async(syncQueue, v15);

}

void __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  BRPerformWithPersonaAndError();

}

void __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelPeriodicSyncRequestScheduler");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  }

}

- (NSDate)lastPeriodicSyncDate
{
  return self->_lastPeriodicSyncDate;
}

- (void)setLastPeriodicSyncDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPeriodicSyncDate, a3);
}

- (BOOL)shouldTriggerPeriodicSync
{
  return self->_shouldTriggerPeriodicSync;
}

- (void)setShouldTriggerPeriodicSync:(BOOL)a3
{
  self->_shouldTriggerPeriodicSync = a3;
}

- (BOOL)periodicSyncInProgress
{
  return self->_periodicSyncInProgress;
}

- (void)setPeriodicSyncInProgress:(BOOL)a3
{
  self->_periodicSyncInProgress = a3;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (NSDate)networkConnectTime
{
  return self->_networkConnectTime;
}

- (void)setNetworkConnectTime:(id)a3
{
  objc_storeStrong((id *)&self->_networkConnectTime, a3);
}

- (NSDate)networkDisconnectTime
{
  return self->_networkDisconnectTime;
}

- (void)setNetworkDisconnectTime:(id)a3
{
  objc_storeStrong((id *)&self->_networkDisconnectTime, a3);
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (NSDate)screenUnlockedTime
{
  return self->_screenUnlockedTime;
}

- (void)setScreenUnlockedTime:(id)a3
{
  objc_storeStrong((id *)&self->_screenUnlockedTime, a3);
}

- (NSDate)appLibrariesLastBoostTime
{
  return self->_appLibrariesLastBoostTime;
}

- (void)setAppLibrariesLastBoostTime:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrariesLastBoostTime, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (OS_dispatch_source)periodicSyncRequestTimer
{
  return self->_periodicSyncRequestTimer;
}

- (void)setPeriodicSyncRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_periodicSyncRequestTimer, a3);
}

- (BRCUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_periodicSyncRequestTimer, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_appLibrariesLastBoostTime, 0);
  objc_storeStrong((id *)&self->_screenUnlockedTime, 0);
  objc_storeStrong((id *)&self->_networkDisconnectTime, 0);
  objc_storeStrong((id *)&self->_networkConnectTime, 0);
  objc_storeStrong((id *)&self->_lastPeriodicSyncDate, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_containerScheduler, 0);
}

void __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to adopt persona: %@%@");
  OUTLINED_FUNCTION_2();
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Last periodic sync date: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_9_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - try trigger periodic sync on startup%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - long time since last periodic sync --> trigger periodic sync%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_periodicSyncCompletionWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Periodic sync failed with: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
