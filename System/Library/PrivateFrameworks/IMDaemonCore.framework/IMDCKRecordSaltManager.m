@implementation IMDCKRecordSaltManager

+ (id)sharedInstance
{
  if (qword_1ED935CB8 != -1)
    dispatch_once(&qword_1ED935CB8, &unk_1E922C508);
  return (id)qword_1ED935DF0;
}

- (IMDCKRecordSaltManager)init
{
  IMDCKRecordSaltManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *ckQueue;
  NSString *cachedSalt;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDCKRecordSaltManager;
  v2 = -[IMDCKRecordSaltManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.Messages.IMDCKRecordSaltManager", 0);
    ckQueue = v2->_ckQueue;
    v2->_ckQueue = (OS_dispatch_queue *)v3;

    cachedSalt = v2->_cachedSalt;
    v2->_cachedSalt = 0;

  }
  return v2;
}

- (id)_CKUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (void)_scheduleOperation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "truthDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (id)_container
{
  void *v2;
  void *v3;

  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "truthContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_fetchLatestSaltFromCloudKitAndPersistWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Starting salt fetch on internal queue", buf, 2u);
    }

  }
  -[IMDCKRecordSaltManager _container](self, "_container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D151BA5C;
  v8[3] = &unk_1E922C530;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchUserRecordIDWithCompletionHandler:", v8);

}

- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3
{
  -[IMDCKRecordSaltManager fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:forceFetch:](self, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:forceFetch:", a3, 0);
}

- (void)fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:(id)a3 forceFetch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;
  char v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDCKRecordSaltManager _CKUtilitiesSharedInstance](self, "_CKUtilitiesSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cloudKitSyncingEnabled");

  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUnderFirstDataProtectionLock");

  v12 = IMOSLoggingEnabled(v11);
  if ((v8 | v4) != 1 || v10)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = CFSTR("NO");
        if (v8)
          v18 = CFSTR("YES");
        else
          v18 = CFSTR("NO");
        if (v10)
          v17 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v26 = v18;
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "CloudKit Salt not fetched: syncing enabled %@ first unlock %@", buf, 0x16u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D151C0AC;
    block[3] = &unk_1E922C558;
    v23 = v6;
    v24 = v10;
    v19 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Request to fetch salt", buf, 2u);
      }

    }
    -[IMDCKRecordSaltManager ckQueue](self, "ckQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1D151C134;
    v20[3] = &unk_1E9229148;
    v20[4] = self;
    v21 = v6;
    v15 = v6;
    dispatch_async(v14, v20);

  }
}

- (void)clearLocalSyncState
{
  -[IMDCKRecordSaltManager setCachedSalt:](self, "setCachedSalt:", 0);
}

- (void)deleteDeDupeRecordZone
{
  id v2;

  -[IMDCKRecordSaltManager clearLocalSyncState](self, "clearLocalSyncState");
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteDeDupeSaltZone");

}

- (NSString)cachedSalt
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCachedSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckQueue, 0);
  objc_storeStrong((id *)&self->_cachedSalt, 0);
}

@end
