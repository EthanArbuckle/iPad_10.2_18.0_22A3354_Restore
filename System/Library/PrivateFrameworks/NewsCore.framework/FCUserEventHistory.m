@implementation FCUserEventHistory

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return CFSTR("user-event-history");
}

+ (id)commandStoreFileName
{
  return CFSTR("user-event-history-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (void)loadLocalCachesFromStore
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__FCUserEventHistory_loadLocalCachesFromStore__block_invoke;
  v2[3] = &unk_1E463AB18;
  v2[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v2);
}

- (FCUserEventHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5 sessionStorage:(id)a6
{
  id v11;
  FCUserEventHistory *v12;
  FCUserEventHistory *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)FCUserEventHistory;
  v12 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v15, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_privateStorage, a6);
    -[FCUserEventHistoryStorage addObserver:](v13->_privateStorage, "addObserver:", v13);
  }

  return v13;
}

void __46__FCUserEventHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  FCRemoveUserEventHistoryCommand *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "privateStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appConfigurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possiblyUnfetchedAppConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "newsPersonalizationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackingConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pruningPolicies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pruneWithPolicies:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = FCUserEventsLog;
  v12 = os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = v11;
      v15 = 134217984;
      v16 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "User event history found %ld pruned IDs, adding command to remove from cloud", (uint8_t *)&v15, 0xCu);

    }
    v14 = -[FCRemoveUserEventHistoryCommand initWithSessionIDs:]([FCRemoveUserEventHistoryCommand alloc], "initWithSessionIDs:", v9);
    objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", v14);

  }
  else if (v12)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "User event history found no pruned IDs", (uint8_t *)&v15, 2u);
  }

}

- (FCUserEventHistoryStorage)privateStorage
{
  return self->_privateStorage;
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("UserEventHistory"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  FCUserEventHistoryStorage *v8;
  void *v9;
  FCUserEventHistoryStorage *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  FCModifyUserEventHistoryCommand *v16;
  void *v17;
  id v18;
  FCModifyUserEventHistoryCommand *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Asked for command to merge user event history local data with cloud", buf, 2u);
  }
  v8 = [FCUserEventHistoryStorage alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCUserEventHistoryStorage initWithPrivateDataDirectory:](v8, "initWithPrivateDataDirectory:", v9);

  -[FCUserEventHistoryStorage sessions](v10, "sessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = FCUserEventsLog;
  v13 = os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = v12;
      v15 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v22 = v15;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "Returning command to sync %lu sessions", buf, 0xCu);

    }
    v16 = -[FCModifyUserEventHistoryCommand initWithSessions:]([FCModifyUserEventHistoryCommand alloc], "initWithSessions:", v11);
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "Failed to lookup sesssions to build commands to merge local data to cloud", buf, 2u);
    }
    v17 = (void *)MEMORY[0x1E0C9AA60];
    v18 = MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134218240;
    v15 = objc_msgSend(v6, "count");
    v16 = 2048;
    v17 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "User event history handling sync with %lu changed records, %lu deleted records", buf, 0x16u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v13[3] = &unk_1E4646DB0;
  v13[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  -[FCUserEventHistory privateStorage](self, "privateStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    v12 = v7;
  else
    v12 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "clearSessionsWithIDs:", v12);

}

void __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sessionData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "privateStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeSessionID:compressedSessionData:notify:", v6, v3, 0);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2;
    v8[3] = &unk_1E463AB18;
    v8[4] = v7;
    __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2((uint64_t)v8);
  }

}

void __70__FCUserEventHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Handing sync for CKRecord with no session data: %@"), *(_QWORD *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v4 = "-[FCUserEventHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke_2";
    v5 = 2080;
    v6 = "FCUserEventHistory.m";
    v7 = 1024;
    v8 = 142;
    v9 = 2114;
    v10 = v2;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidUserEventHistorySessionCKRecord) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCUserEventHistory storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
    v9[3] = &unk_1E4643BA0;
    v10 = v4;
    __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke((uint64_t)v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __64__FCUserEventHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Failed to get session ids for all known record names within record zone %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return MEMORY[0x1E0C9AA60];
}

- (void)storage:(id)a3 didStoreData:(id)a4 forSessionID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  FCModifyUserEventHistoryCommand *v13;
  FCModifyUserEventHistoryCommand *v14;
  _QWORD v15[5];
  FCModifyUserEventHistoryCommand *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB34E8];
    v11 = v9;
    objc_msgSend(v10, "stringFromByteCount:countStyle:", objc_msgSend(v7, "length"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Observed session stored with ID %{public}@, size %{public}@. Queueing command to sync session.", buf, 0x16u);

  }
  v13 = -[FCModifyUserEventHistoryCommand initWithSessionID:data:]([FCModifyUserEventHistoryCommand alloc], "initWithSessionID:data:", v8, v7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__FCUserEventHistory_storage_didStoreData_forSessionID___block_invoke;
  v15[3] = &unk_1E463AD10;
  v15[4] = self;
  v16 = v13;
  v14 = v13;
  FCPerformBlockOnMainThread(v15);

}

uint64_t __56__FCUserEventHistory_storage_didStoreData_forSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", *(_QWORD *)(a1 + 40));
}

- (void)storage:(id)a3 didClearAllSessions:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  FCRemoveUserEventHistoryCommand *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)FCUserEventsLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Observed session storage cleared all session IDs. Queueing command to remove %lu session records.", (uint8_t *)&v9, 0xCu);

  }
  v8 = -[FCRemoveUserEventHistoryCommand initWithSessionIDs:]([FCRemoveUserEventHistoryCommand alloc], "initWithSessionIDs:", v5);
  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);

}

- (void)setPrivateStorage:(id)a3
{
  objc_storeStrong((id *)&self->_privateStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateStorage, 0);
}

@end
