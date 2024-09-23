@implementation BRCBuddyFlowObserver

+ (id)sharedBuddyFlowObserver
{
  if (sharedBuddyFlowObserver_onceToken != -1)
    dispatch_once(&sharedBuddyFlowObserver_onceToken, &__block_literal_global_9);
  return (id)sharedBuddyFlowObserver_obj;
}

void __47__BRCBuddyFlowObserver_sharedBuddyFlowObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BRCBuddyFlowObserver _init]([BRCBuddyFlowObserver alloc], "_init");
  v1 = (void *)sharedBuddyFlowObserver_obj;
  sharedBuddyFlowObserver_obj = (uint64_t)v0;

}

- (id)_init
{
  BRCBuddyFlowObserver *v2;
  id *p_isa;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCBuddyFlowObserver;
  v2 = -[BRCBuddyFlowObserver init](&v7, sel_init);
  p_isa = (id *)&v2->super.isa;
  if (v2)
  {
    v2->_waitingForBuddy = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = p_isa[3];
    p_isa[3] = v4;

    objc_msgSend(p_isa[3], "setMaxConcurrentOperationCount:", 1);
  }
  return p_isa;
}

- (void)_registerForBYSetupAssistantFinishedNotification
{
  void *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Register for BYSetupAssistantFinishedDarwinNotification%@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_buddyHasFinished, (CFStringRef)*MEMORY[0x1E0D8D6D8], 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_unregisterForBYSetupAssistantFinishedNotification
{
  void *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for BYSetupAssistantFinishedDarwinNotification%@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D8D6D8], 0);
}

- (BOOL)observeBuddyIfNecessaryWithKey:(id)a3 block:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRCBuddyFlowObserver *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  uint64_t v14;
  NSMutableDictionary *registerdKeyToToken;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  NSOperationQueue *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSOperationQueue *observersQueue;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE *v34;
  _QWORD v35[4];
  id v36;
  BRCBuddyFlowObserver *v37;
  id v38;
  id v39;
  uint8_t v40[4];
  id v41;
  __int16 v42;
  void *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[BRCBuddyFlowObserver doesBuddyFlowNeedsToRun](self, "doesBuddyFlowNeedsToRun"))
  {
    v11 = self;
    objc_sync_enter(v11);
    if (-[BRCBuddyFlowObserver doesBuddyFlowNeedsToRun](v11, "doesBuddyFlowNeedsToRun"))
    {
      if (!v11->_waitingForBuddy)
      {
        v11->_waitingForBuddy = 1;
        -[BRCBuddyFlowObserver _registerForBYSetupAssistantFinishedNotification](v11, "_registerForBYSetupAssistantFinishedNotification");
      }
      brc_bread_crumbs();
      v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v45 = v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are in Buddy. Register block [%@] with key [%@]%@", buf, 0x20u);
      }

      if (!v11->_registerdKeyToToken)
      {
        v14 = objc_opt_new();
        registerdKeyToToken = v11->_registerdKeyToToken;
        v11->_registerdKeyToToken = (NSMutableDictionary *)v14;

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__6;
      v46 = __Block_byref_object_dispose__6;
      v47 = 0;
      if (v8)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](v11->_registerdKeyToToken, "objectForKeyedSubscript:", v8);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v16;

        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v40 = 138412546;
            v41 = v8;
            v42 = 2112;
            v43 = v18;
            _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] Key %@ already registered%@", v40, 0x16u);
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          observersQueue = v11->_observersQueue;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke;
          v35[3] = &unk_1E875EEF0;
          v36 = v10;
          v37 = v11;
          v27 = v8;
          v38 = v27;
          v39 = v9;
          objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.clouddocs.buddy-flow-done"), 0, observersQueue, v35);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

          -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_registerdKeyToToken, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v27);
          v18 = v36;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11->_observersQueue;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke_6;
        v31[3] = &unk_1E875EF18;
        v32 = v10;
        v34 = buf;
        v33 = v9;
        objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.clouddocs.buddy-flow-done"), 0, v22, v31);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v23;

        v18 = v32;
      }

      if (!-[BRCBuddyFlowObserver doesBuddyFlowNeedsToRun](v11, "doesBuddyFlowNeedsToRun"))
        -[BRCBuddyFlowObserver _stopObservingBuddyAndExecuteCallbacks](v11, "_stopObservingBuddyAndExecuteCallbacks");
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) != 0;
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v20 = 0;
    }
    objc_sync_exit(v11);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Buddy has finished. Execute block [%@]%@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "stopObservingBuddyWithKey:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke_6(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Buddy has finished. Execute block [%@]%@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)_stopObservingBuddyAndExecuteCallbacks
{
  __CFString *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  BRCBuddyFlowObserver *obj;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_waitingForBuddy)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self->_waitingForBuddy)
    {
      brc_bread_crumbs();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for BYSetupAssistantFinishedDarwinNotification%@", buf, 0xCu);
      }

      self->_waitingForBuddy = 0;
      -[BRCBuddyFlowObserver _unregisterForBYSetupAssistantFinishedNotification](obj, "_unregisterForBYSetupAssistantFinishedNotification");
      objc_sync_exit(obj);

      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v10 = CFSTR("com.apple.clouddocs.buddy-flow-done");
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Trigger %@%@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("com.apple.clouddocs.buddy-flow-done"), 0, 0);

    }
    else
    {
      objc_sync_exit(obj);

    }
  }
}

- (void)stopObservingBuddyWithKey:(id)a3
{
  BRCBuddyFlowObserver *v4;
  void *v5;
  NSMutableDictionary *registerdKeyToToken;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_registerdKeyToToken, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](v4->_registerdKeyToToken, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](v4->_registerdKeyToToken, "count"))
    {
      registerdKeyToToken = v4->_registerdKeyToToken;
      v4->_registerdKeyToToken = 0;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v5);

  }
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_registerdKeyToToken, 0);
}

@end
