@implementation MFLocalActionReplayHandler

void __33__MFLocalActionReplayHandler_log__block_invoke(uint64_t a1)
{
  const char *v2;
  os_log_t v3;
  void *v4;
  id v5;

  v2 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4D878], "UTF8String");
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = os_log_create(v2, (const char *)objc_msgSend(v5, "UTF8String"));
  v4 = (void *)log_log_12;
  log_log_12 = (uint64_t)v3;

}

- (MFLocalActionReplayHandler)initWithLibrary:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  MFLocalActionReplayHandler *v9;
  MFLocalActionReplayHandler *v10;
  uint64_t v11;
  NSMutableArray *actionsToReplay;
  uint64_t v13;
  EFScheduler *replayScheduler;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  MFLocalActionReplayHandler *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFLocalActionReplayHandler;
  v9 = -[MFLocalActionReplayHandler init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeWeak((id *)&v10->_account, v8);
    v11 = objc_opt_new();
    actionsToReplay = v10->_actionsToReplay;
    v10->_actionsToReplay = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.localActionReplayScheduler"), 25);
    v13 = objc_claimAutoreleasedReturnValue();
    replayScheduler = v10->_replayScheduler;
    v10->_replayScheduler = (EFScheduler *)v13;

  }
  +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Created %{public}@ for account %{public}@", buf, 0x16u);

  }
  return v10;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MFLocalActionReplayHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1)
    dispatch_once(&log_onceToken_12, block);
  return (OS_os_log *)(id)log_log_12;
}

- (void)connectionEstablished
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MFLocalActionReplayHandler ef_publicDescription](self, "ef_publicDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ connection established", (uint8_t *)&v6, 0xCu);

  }
  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (!-[MFLocalActionReplayHandler replayingActions](self, "replayingActions"))
  {
    -[MFLocalActionReplayHandler setNeedToCheckForNewActions:](self, "setNeedToCheckForNewActions:", 1);
    -[MFLocalActionReplayHandler _replayAllActions](self, "_replayAllActions");
  }
  objc_sync_exit(v5);

}

- (void)newActionsAdded
{
  id obj;

  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  -[MFLocalActionReplayHandler setNeedToCheckForNewActions:](self, "setNeedToCheckForNewActions:", 1);
  if (!-[MFLocalActionReplayHandler replayingActions](self, "replayingActions"))
    -[MFLocalActionReplayHandler _replayAllActions](self, "_replayAllActions");
  objc_sync_exit(obj);

}

- (void)addNewAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MFLocalActionReplayHandler ef_publicDescription](self, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ added action %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  if (!-[MFLocalActionReplayHandler replayingActions](self, "replayingActions"))
    -[MFLocalActionReplayHandler _replayAllActions](self, "_replayAllActions");
  objc_sync_exit(v5);

}

- (void)_replayAllActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_sync_exit(v3);
  +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MFLocalActionReplayHandler ef_publicDescription](self, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2048;
    v16 = v5;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Replaying all actions %@: %ld action(s) to replay", buf, 0x16u);

  }
  -[MFLocalActionReplayHandler setReplayingActions:](self, "setReplayingActions:", 1);
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.mobilemail.localActionReplayScheduler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLocalActionReplayHandler replayScheduler](self, "replayScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MFLocalActionReplayHandler__replayAllActions__block_invoke;
  v11[3] = &unk_1E4E88EE8;
  v11[4] = self;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "performBlock:", v11);

}

void __47__MFLocalActionReplayHandler__replayAllActions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageChangeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v5 = 138543874;
  v25 = v5;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_checkForNewActions", v25);
    objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v6);
    if (!v8)
      break;
    +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v10;
      v28 = 2114;
      v29 = (uint64_t)v8;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ replaying action %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replayAction:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = (uint64_t)v8;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Did not get results back for action: %{public}@. Will stop replaying actions.", buf, 0x16u);

      }
      break;
    }
    v13 = objc_msgSend(v4, "persistResults:forAction:", v12, v8);
    +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v25;
      v27 = v15;
      v28 = 2114;
      v29 = (uint64_t)v8;
      v30 = 1024;
      v31 = v13;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ action %{public}@ finished, needToReplayAction = %d", buf, 0x1Cu);

    }
    if ((v13 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v16);
      objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObject:", v8);

      objc_sync_exit(v16);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v20);
  objc_msgSend(*(id *)(a1 + 32), "setReplayingActions:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "needToCheckForNewActions"))
    objc_msgSend(*(id *)(a1 + 32), "_replayAllActions");
  +[MFLocalActionReplayHandler log](MFLocalActionReplayHandler, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionsToReplay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 138543618;
    v27 = v22;
    v28 = 2048;
    v29 = v24;
    _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished replaying actions. %ld action(s) left to replay", buf, 0x16u);

  }
  objc_sync_exit(v20);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)_checkForNewActions
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = -[MFLocalActionReplayHandler needToCheckForNewActions](self, "needToCheckForNewActions");
  -[MFLocalActionReplayHandler setNeedToCheckForNewActions:](self, "setNeedToCheckForNewActions:", 0);
  objc_sync_exit(v3);

  if (v4)
  {
    -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "databaseID");

    -[MFLocalActionReplayHandler library](self, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localActionPersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLocalActionReplayHandler account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageActionsForAccountURL:previousActionID:", v13, v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    -[MFLocalActionReplayHandler actionsToReplay](self, "actionsToReplay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    objc_sync_exit(v14);
  }
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MFLocalActionReplayHandler account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_publicDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ for account: %@"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)replayingActions
{
  return self->_replayingActions;
}

- (void)setReplayingActions:(BOOL)a3
{
  self->_replayingActions = a3;
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (MailAccount)account
{
  return (MailAccount *)objc_loadWeakRetained((id *)&self->_account);
}

- (void)setAccount:(id)a3
{
  objc_storeWeak((id *)&self->_account, a3);
}

- (NSMutableArray)actionsToReplay
{
  return self->_actionsToReplay;
}

- (void)setActionsToReplay:(id)a3
{
  objc_storeStrong((id *)&self->_actionsToReplay, a3);
}

- (EFScheduler)replayScheduler
{
  return self->_replayScheduler;
}

- (BOOL)needToCheckForNewActions
{
  return self->_needToCheckForNewActions;
}

- (void)setNeedToCheckForNewActions:(BOOL)a3
{
  self->_needToCheckForNewActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayScheduler, 0);
  objc_storeStrong((id *)&self->_actionsToReplay, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
