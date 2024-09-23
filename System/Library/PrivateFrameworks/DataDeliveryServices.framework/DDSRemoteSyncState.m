@implementation DDSRemoteSyncState

- (DDSRemoteSyncState)init
{

  return 0;
}

- (DDSRemoteSyncState)initWithDelegate:(id)a3 assetType:(id)a4
{
  id v6;
  NSString *v7;
  DDSRemoteSyncState *v8;
  DDSRemoteSyncState *v9;
  DDSBackgroundActivityScheduler *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = (NSString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)DDSRemoteSyncState;
  v8 = -[DDSRemoteSyncState init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_assetType = v7;
    -[DDSRemoteSyncState setDelegate:](v8, "setDelegate:", v6);
    v10 = objc_alloc_init(DDSBackgroundActivityScheduler);
    -[DDSRemoteSyncState setScheduler:](v9, "setScheduler:", v10);

    -[DDSRemoteSyncState scheduler](v9, "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v9);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSRemoteSyncState setDate:](v9, "setDate:", v12);

    objc_msgSend((id)objc_opt_class(), "buildVersionString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSRemoteSyncState setBuildVersion:](v9, "setBuildVersion:", v13);

    -[DDSRemoteSyncState setSyncStatus:](v9, "setSyncStatus:", 0);
  }

  return v9;
}

- (void)loadStateAndScheduleUpdate
{
  -[DDSRemoteSyncState loadState](self, "loadState");
  if (-[DDSRemoteSyncState shouldRequestCompleteRefresh](self, "shouldRequestCompleteRefresh"))
    -[DDSRemoteSyncState requestCompleteRefresh](self, "requestCompleteRefresh");
  if (-[DDSRemoteSyncState shouldInitiateRegularUpdateCycle](self, "shouldInitiateRegularUpdateCycle"))
    -[DDSRemoteSyncState requestUpdate](self, "requestUpdate");
  -[DDSRemoteSyncState scheduleRegularUpdate](self, "scheduleRegularUpdate");
}

- (NSString)scheduleUpdateIdentifier
{
  void *v3;
  char v4;
  __CFString *v5;
  id v6;
  void *v7;

  -[DDSRemoteSyncState assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  v5 = CFSTR("com.apple.DataDeliveryServices.update");
  if ((v4 & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DDSRemoteSyncState assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.DataDeliveryServices.update"), v7);

  }
  return (NSString *)v5;
}

- (NSString)scheduleRetryIdentifier
{
  void *v3;
  char v4;
  __CFString *v5;
  id v6;
  void *v7;

  -[DDSRemoteSyncState assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  v5 = CFSTR("com.apple.DataDeliveryServices.retry");
  if ((v4 & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DDSRemoteSyncState assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.DataDeliveryServices.retry"), v7);

  }
  return (NSString *)v5;
}

- (void)scheduleRegularUpdate
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[DDSRemoteSyncState timeBetweenSyncs](self, "timeBetweenSyncs");
  v4 = v3;
  -[DDSRemoteSyncState scheduler](self, "scheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState scheduleUpdateIdentifier](self, "scheduleUpdateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleActivityWithIdentifier:interval:tolerance:", v5, v4, v4 * 0.5);

}

- (void)scheduleRetry
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[DDSRemoteSyncState nextUpdateTimeIntervalForAttemptCount:](self, "nextUpdateTimeIntervalForAttemptCount:", -[DDSRemoteSyncState attemptCount](self, "attemptCount"));
  v4 = v3;
  -[DDSRemoteSyncState scheduler](self, "scheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState scheduleRetryIdentifier](self, "scheduleRetryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleActivityWithIdentifier:interval:tolerance:", v5, v4, v4 * 0.5);

}

- (BOOL)shouldRequestCompleteRefresh
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "buildVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState buildVersion](self, "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    UpdateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DDSRemoteSyncState buildVersion](self, "buildVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Determined new build version: %@, previously on: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "buildVersionString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSRemoteSyncState setBuildVersion:](self, "setBuildVersion:", v8);

  }
  return v5 ^ 1;
}

- (BOOL)shouldInitiateRegularUpdateCycle
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[DDSRemoteSyncState date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  UpdateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[DDSRemoteSyncState date](self, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = -v8;
    -[DDSRemoteSyncState date](self, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Time elapsed since last update: %f, date: %@", (uint8_t *)&v12, 0x16u);

  }
  return v5 < -86400.0;
}

- (void)beganUpdateCycle
{
  if (-[DDSRemoteSyncState syncStatus](self, "syncStatus") != 1)
    -[DDSRemoteSyncState setSyncStatus:](self, "setSyncStatus:", 1);
}

- (void)completedUpdateCycleWithError:(id)a3
{
  id v4;
  void *v5;
  DDSRemoteSyncState *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSRemoteSyncState setDate:](self, "setDate:", v5);

    v6 = self;
    v7 = 2;
LABEL_9:
    -[DDSRemoteSyncState setSyncStatus:](v6, "setSyncStatus:", v7);
    -[DDSRemoteSyncState setAttemptCount:](self, "setAttemptCount:", 0);
    goto LABEL_10;
  }
  if (-[DDSRemoteSyncState attemptCount](self, "attemptCount") > 9)
  {
    UpdateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Sync failed, giving up for today", v10, 2u);
    }

    v6 = self;
    v7 = 3;
    goto LABEL_9;
  }
  if (-[DDSRemoteSyncState syncStatus](self, "syncStatus") == 1)
  {
    -[DDSRemoteSyncState setSyncStatus:](self, "setSyncStatus:", 0);
    -[DDSRemoteSyncState setAttemptCount:](self, "setAttemptCount:", -[DDSRemoteSyncState attemptCount](self, "attemptCount") + 1);
    -[DDSRemoteSyncState scheduleRetry](self, "scheduleRetry");
  }
  else if (!-[DDSRemoteSyncState syncStatus](self, "syncStatus"))
  {
    UpdateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Retry already scheduled", buf, 2u);
    }

  }
LABEL_10:
  -[DDSRemoteSyncState saveState](self, "saveState");

}

- (void)requestUpdate
{
  void *v3;
  id v4;

  -[DDSRemoteSyncState delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteSyncStateRequestsUpdateForAssetType:", v3);

}

- (void)requestRetry
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  UpdateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Requesting retry...", v6, 2u);
  }

  -[DDSRemoteSyncState delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteSyncStateRequestsRetryForAssetType:", v5);

}

- (void)requestCompleteRefresh
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  UpdateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Requesting complete refresh...", v6, 2u);
  }

  -[DDSRemoteSyncState delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSRemoteSyncState assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteSyncStateRequestsResetForAssetType:", v5);

}

- (void)performScheduledActivityWithIdentifier:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[DDSRemoteSyncState scheduleUpdateIdentifier](self, "scheduleUpdateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqualToString:", v4);

  if (v5)
  {
    -[DDSRemoteSyncState resetState](self, "resetState");
    -[DDSRemoteSyncState requestUpdate](self, "requestUpdate");
    -[DDSRemoteSyncState scheduleRegularUpdate](self, "scheduleRegularUpdate");
  }
  else
  {
    -[DDSRemoteSyncState scheduleRetryIdentifier](self, "scheduleRetryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v6);

    if (v7)
      -[DDSRemoteSyncState requestRetry](self, "requestRetry");
  }

}

- (NSString)metadataSyncStatePreferenceKey
{
  void *v3;
  char v4;
  __CFString *v5;
  id v6;
  void *v7;

  -[DDSRemoteSyncState assetType](self, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  v5 = CFSTR("MetadataSyncState");
  if ((v4 & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DDSRemoteSyncState assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@"), CFSTR("MetadataSyncState"), v7);

  }
  return (NSString *)v5;
}

- (void)resetState
{
  -[DDSRemoteSyncState setSyncStatus:](self, "setSyncStatus:", 0);
  -[DDSRemoteSyncState setAttemptCount:](self, "setAttemptCount:", 0);
  -[DDSRemoteSyncState saveState](self, "saveState");
}

- (void)loadState
{
  __assert_rtn("-[DDSRemoteSyncState loadState]", "DDSRemoteSyncState.m", 221, "[date isKindOfClass:[NSDate class]]");
}

- (void)saveState
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138544386;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2050;
  v14 = objc_msgSend(a1, "attemptCount");
  v15 = 2050;
  v16 = objc_msgSend(a1, "syncStatus");
  _os_log_debug_impl(&dword_1DA990000, a2, OS_LOG_TYPE_DEBUG, "Saving sync state for asset type: %{public}@ (date: %{public}@, buildVersion: %{public}@, attempts: %{public}lu, status: %{public}lu", (uint8_t *)&v7, 0x34u);

}

- (double)nextUpdateTimeIntervalForAttemptCount:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 10800.0;
  else
    return dbl_1DA9B5218[a3 - 1];
}

+ (double)timeIntervalUntilNextRegularUpdate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint32_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 30, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = arc4random() % 3;
  v7 = arc4random() % 0x3C;
  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setDay:", 1);
  objc_msgSend(v8, "setHour:", v6 + 2);
  objc_msgSend(v8, "setMinute:", v7);
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v8, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v9);
  v12 = fabs(v11);

  return v12;
}

- (double)timeBetweenSyncs
{
  int v2;
  double result;

  v2 = DDSGetPreferenceIntForKey(CFSTR("timerOverrideDuration"));
  if (v2 >= 1)
    return (double)v2;
  objc_msgSend((id)objc_opt_class(), "timeIntervalUntilNextRegularUpdate");
  return result;
}

- (DDSRemoteSyncStateDelegate)delegate
{
  return (DDSRemoteSyncStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(int64_t)a3
{
  self->_syncStatus = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (DDSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
