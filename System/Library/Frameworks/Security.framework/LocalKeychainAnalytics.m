@implementation LocalKeychainAnalytics

- (LocalKeychainAnalytics)init
{
  LocalKeychainAnalytics *v2;
  LocalKeychainAnalytics *v3;
  uint64_t v4;
  NSMutableArray *pendingReports;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LocalKeychainAnalytics;
  v2 = -[SFAnalytics init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_probablyInClassD = 1;
    v4 = objc_opt_new();
    pendingReports = v3->_pendingReports;
    v3->_pendingReports = (NSMutableArray *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("LKADataQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_notificationToken = -1;
  }
  return v3;
}

- (BOOL)canPersistMetrics
{
  LocalKeychainAnalytics *v2;
  _BOOL4 probablyInClassD;
  LocalKeychainAnalytics *v5;
  int notificationToken;
  _QWORD v7[5];
  int v8;

  v2 = self;
  objc_sync_enter(v2);
  probablyInClassD = v2->_probablyInClassD;
  objc_sync_exit(v2);

  if (!probablyInClassD)
    return 1;
  v8 = -1431655766;
  if (!aks_get_lock_state(0, &v8) && (v8 & 4) != 0)
  {
    v5 = v2;
    objc_sync_enter(v5);
    v2->_probablyInClassD = 0;
    notificationToken = v5->_notificationToken;
    if (notificationToken != -1)
      notify_cancel(notificationToken);
    objc_sync_exit(v5);

    -[LocalKeychainAnalytics processPendingMessages](v5, "processPendingMessages");
    return 1;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke;
  v7[3] = &unk_1E1FDBE18;
  v7[4] = v2;
  if (canPersistMetrics_onceToken != -1)
    dispatch_once(&canPersistMetrics_onceToken, v7);
  return 0;
}

- (void)processPendingMessages
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__LocalKeychainAnalytics_processPendingMessages__block_invoke;
  block[3] = &unk_1E1FDBE18;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reportKeychainUpgradeFrom:(int)a3 to:(int)a4 outcome:(int)a5 error:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *queue;
  _QWORD v20[5];
  id v21;
  int v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[4];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v26[3] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v25[0] = CFSTR("oldschema");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v25[1] = CFSTR("newschema");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  v25[2] = CFSTR("upgradeoutcome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v10)
  {
    v23[0] = CFSTR("errorDomain");
    objc_msgSend(v10, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("errorCode");
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addEntriesFromDictionary:", v18);

  }
  if (-[LocalKeychainAnalytics canPersistMetrics](self, "canPersistMetrics"))
  {
    -[LocalKeychainAnalytics reportKeychainUpgradeOutcome:attributes:](self, "reportKeychainUpgradeOutcome:attributes:", v6, v15);
  }
  else
  {
    queue = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke;
    v20[3] = &unk_1E1FCB860;
    v20[4] = self;
    v22 = v6;
    v21 = v15;
    dispatch_async(queue, v20);

  }
}

- (void)reportKeychainUpgradeOutcome:(int)a3 attributes:(id)a4
{
  if (a3)
    -[SFAnalytics logHardFailureForEventNamed:withAttributes:](self, "logHardFailureForEventNamed:withAttributes:", CFSTR("LKAEventUpgrade"), a4);
  else
    -[SFAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", CFSTR("LKAEventUpgrade"), a4);
}

- (void)reportKeychainBackupStartWithType:(int)a3
{
  NSDate *v5;
  NSDate *backupStartTime;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  backupStartTime = self->_backupStartTime;
  self->_backupStartTime = v5;

  self->_backupType = a3;
}

- (void)reportKeychainBackupEnd:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v4 = a3;
  v18[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_backupStartTime);
  v9 = 100 * (int)((v8 + 0.05) * 10.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics logMetric:withName:](self, "logMetric:withName:", v10, CFSTR("LKAMetricBackupDuration"));

  if (v4)
  {
    -[SFAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v7, CFSTR("backupLastSuccess"));
    -[SFAnalytics logSuccessForEventNamed:timestampBucket:](self, "logSuccessForEventNamed:timestampBucket:", CFSTR("LKAEventBackup"), 2);
  }
  else
  {
    -[SFAnalytics datePropertyForKey:](self, "datePropertyForKey:", CFSTR("backupLastSuccess"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[SFAnalytics fuzzyDaysSinceDate:](SFAnalytics, "fuzzyDaysSinceDate:", v11);

    if (objc_msgSend(v6, "code") != -25308 || v12)
    {
      v17[0] = CFSTR("daysSinceSuccess");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v17[1] = CFSTR("duration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v14;
      v17[2] = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_backupType);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:timestampBucket:](self, "logResultForEvent:hardFailure:result:withAttributes:timestampBucket:", CFSTR("LKAEventBackup"), 1, v6, v16, 2);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupStartTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingReports, 0);
}

void __69__LocalKeychainAnalytics_reportKeychainUpgradeFrom_to_outcome_error___block_invoke(uint64_t a1)
{
  void *v1;
  LKAUpgradeOutcomeReport *v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v2 = -[LKAUpgradeOutcomeReport initWithOutcome:attributes:]([LKAUpgradeOutcomeReport alloc], "initWithOutcome:attributes:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __48__LocalKeychainAnalytics_processPendingMessages__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        v9 = objc_msgSend(v7, "outcome", (_QWORD)v11);
        objc_msgSend(v7, "attributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reportKeychainUpgradeOutcome:attributes:", v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD handler[5];

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2;
  handler[3] = &unk_1E1FCB838;
  handler[4] = v1;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(v1 + 88), v2, handler);

}

uint64_t __43__LocalKeychainAnalytics_canPersistMetrics__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPersistMetrics");
}

+ (id)databasePath
{
  return (id)objc_msgSend(a1, "defaultAnalyticsDatabasePath:", CFSTR("localkeychain"));
}

@end
