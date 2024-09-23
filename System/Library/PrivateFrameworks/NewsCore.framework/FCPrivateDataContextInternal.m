@implementation FCPrivateDataContextInternal

- (FCAppActivityMonitor)appActivityMonitor
{
  FCAppActivityMonitor *appActivityMonitor;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  appActivityMonitor = self->_appActivityMonitor;
  if (!appActivityMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_appActivityMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal appActivityMonitor]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 384;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_appActivityMonitor;
    }
    appActivityMonitor = 0;
  }
  return appActivityMonitor;
}

- (FCCKPrivateDatabase)privateDatabase
{
  FCCKPrivateDatabase *privateDatabase;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  privateDatabase = self->_privateDatabase;
  if (!privateDatabase)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_privateDatabase");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal privateDatabase]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 378;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_privateDatabase;
    }
    privateDatabase = 0;
  }
  return privateDatabase;
}

- (void)setRecordZoneManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneManager, a3);
}

- (void)setPrivateDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_privateDatabase, a3);
}

- (void)setAppActivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appActivityMonitor, a3);
}

- (FCPrivateDataContextInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCPrivateDataContextInternal;
  return -[FCPrivateDataContextInternal init](&v3, sel_init);
}

- (FCCKRecordZoneManager)recordZoneManager
{
  FCCKRecordZoneManager *recordZoneManager;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  recordZoneManager = self->_recordZoneManager;
  if (!recordZoneManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_recordZoneManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal recordZoneManager]";
      v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      v10 = 1024;
      v11 = 371;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_recordZoneManager;
    }
    recordZoneManager = 0;
  }
  return recordZoneManager;
}

- (FCCKRecordZone)issueReadingHistoryRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("IssueReadingHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)readingListRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("ReadingList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)puzzleHistoryRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("PuzzleHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)shortcutsRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("Shortcuts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)subscriptionsRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("Subscriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)sensitiveSubscriptionsRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("SensitiveSubscriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)readingHistoryRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("ReadingHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)channelMembershipsRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("ChannelMemberships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)userInfoRecordZone
{
  id *v2;
  void *v3;

  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v2, (uint64_t)CFSTR("UserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCKRecordZone *)v3;
}

- (id)recordZoneWithName:(id)a3
{
  id v4;
  id *v5;
  void *v6;

  v4 = a3;
  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager recordZoneWithName:](v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prepareRecordZonesForUseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPrivateDataContextInternal recordZoneManager](self, "recordZoneManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordZoneManager prepareRecordZonesForUseWithCompletionHandler:]((uint64_t)v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
}

@end
