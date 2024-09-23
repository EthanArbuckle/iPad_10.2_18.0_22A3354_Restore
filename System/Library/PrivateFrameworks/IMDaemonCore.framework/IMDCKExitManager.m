@implementation IMDCKExitManager

+ (id)sharedInstance
{
  if (qword_1ED935C58 != -1)
    dispatch_once(&qword_1ED935C58, &unk_1E9229080);
  return (id)qword_1ED935D80;
}

- (id)initRecordZoneManager:(id)a3 databaseManager:(id)a4
{
  id v7;
  id v8;
  IMDCKExitManager *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *ckQueue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMDCKExitManager;
  v9 = -[IMDCKExitManager init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.private.IMDCKExitManager", 0);
    ckQueue = v9->_ckQueue;
    v9->_ckQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_recordZoneManager, a3);
    objc_storeStrong((id *)&v9->_databaseManager, a4);
    v9->_fetchedExitDateOnLaunch = 0;
  }

  return v9;
}

- (IMDCKExitManager)init
{
  void *v3;
  IMDCKExitManager *v4;

  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMDCKExitManager initRecordZoneManager:databaseManager:](self, "initRecordZoneManager:databaseManager:", v3, 0);

  if (v4 && (IMIsRunningInUnitTesting() & 1) == 0)
    -[IMDCKExitManager _setUpSubscription](v4, "_setUpSubscription");
  return v4;
}

- (void)_setUpSubscription
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKExitManager ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D145C894;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSDate)exitRecordDate
{
  NSDate *exitRecordDate;
  NSDate *v4;
  NSDate *v5;

  exitRecordDate = self->_exitRecordDate;
  if (!exitRecordDate)
  {
    IMGetCachedDomainValueForKey();
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_exitRecordDate;
    self->_exitRecordDate = v4;

    exitRecordDate = self->_exitRecordDate;
  }
  return exitRecordDate;
}

- (void)setExitRecordDate:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[IMDCKExitManager exitRecordDate](self, "exitRecordDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || (v6 = objc_msgSend(v5, "isEqualToDate:", v6), (v6 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        v10 = 138412802;
        v11 = v7;
        v12 = 2112;
        if (v5)
          v9 = CFSTR("YES");
        v13 = v5;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Exit Record date has been modified, changing it from %@ to %@. Are we in exit state ? %@", (uint8_t *)&v10, 0x20u);
      }

    }
    IMSetDomainValueForKey();
    IMSetDomainBoolForKey();
    objc_storeStrong((id *)&self->_exitRecordDate, a3);
  }

}

- (NSError)errorFetchingExitDate
{
  NSError *errorFetchingExitDate;
  void *v4;
  id v5;
  NSError *v6;
  NSError *v7;

  errorFetchingExitDate = self->_errorFetchingExitDate;
  if (!errorFetchingExitDate)
  {
    IMGetCachedDomainValueForKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (v5)
      {
        v6 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithSerializedError_im:", v5);
        v7 = self->_errorFetchingExitDate;
        self->_errorFetchingExitDate = v6;

      }
    }

    errorFetchingExitDate = self->_errorFetchingExitDate;
  }
  return errorFetchingExitDate;
}

- (void)setErrorFetchingExitDate:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[IMDCKExitManager errorFetchingExitDate](self, "errorFetchingExitDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || (v6 = objc_msgSend(v5, "isEqual:", v6), (v6 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Error fetching exit record date has been modified, changing it from %@ to %@", (uint8_t *)&v11, 0x16u);
      }

    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMDCKExitManagerErrorDomain"), 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serializedError_im");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    IMSetDomainValueForKey();
    objc_storeStrong((id *)&self->_errorFetchingExitDate, a3);

  }
}

- (void)handleNotificationForSubscriptionID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Handling notification for subscriptionID: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ExitRecordKeyManateeZoneSubscription")))
    -[IMDCKExitManager _fetchExitRecordDateWithCompletion:](self, "_fetchExitRecordDateWithCompletion:", 0);

}

- (void)writeExitRecordWithDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = IMOSLoggingEnabled(v7);
  if ((_DWORD)v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Calling writeExitRecordWithDate. ExitDate: %@", buf, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDCKExitManager ckQueue](self, "ckQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D145D02C;
    block[3] = &unk_1E92290F8;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "writeExitRecordWithDate, must be called with a non-nil exit date ignoring request", buf, 2u);
      }

    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMDCKExitManagerErrorDomain"), 2, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

    }
  }

}

- (void)exitRecordDateWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *);
  NSObject *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(id, void *, void *);
  _QWORD v22[5];
  void (**v23)(id, void *, void *);
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMDCKExitManager exitRecordDate](self, "exitRecordDate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[IMDCKExitManager errorFetchingExitDate](self, "errorFetchingExitDate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[IMDCKExitManager fetchedExitDateOnLaunch](self, "fetchedExitDateOnLaunch");
      v9 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      v26 = 2112;
      if (v8)
        v9 = CFSTR("YES");
      v27 = v7;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Calling exitRecordDateWithCompletion date: %@ error: %@ fetchedExitDateOnLaunch: %@", buf, 0x20u);

    }
  }
  if (-[IMDCKExitManager fetchedExitDateOnLaunch](self, "fetchedExitDateOnLaunch")
    && (-[IMDCKExitManager errorFetchingExitDate](self, "errorFetchingExitDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = v10 == 0,
        v10,
        v11))
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isMainThread");

      if ((v13 & 1) != 0)
      {
        if (IMOSLoggingEnabled(v14))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            -[IMDCKExitManager exitRecordDate](self, "exitRecordDate");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            -[IMDCKExitManager errorFetchingExitDate](self, "errorFetchingExitDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v16;
            v26 = 2112;
            v27 = v17;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Already on main queue exitDate: %@ error: %@", buf, 0x16u);

          }
        }
        -[IMDCKExitManager exitRecordDate](self, "exitRecordDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCKExitManager errorFetchingExitDate](self, "errorFetchingExitDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v18, v19);

      }
      else
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = sub_1D145DA68;
        v20[3] = &unk_1E9229148;
        v20[4] = self;
        v21 = v4;
        dispatch_async(MEMORY[0x1E0C80D38], v20);

      }
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1D145D8C8;
    v22[3] = &unk_1E9229120;
    v22[4] = self;
    v23 = v4;
    -[IMDCKExitManager _fetchExitRecordDateWithCompletion:](self, "_fetchExitRecordDateWithCompletion:", v22);

  }
}

- (void)_evalToggleiCloudSettingsSwitch
{
  id v2;

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evalToggleiCloudSettingsSwitch");

}

- (void)_fetchExitRecordDateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IMDCKExitManager ckQueue](self, "ckQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D145DC84;
  v7[3] = &unk_1E9229148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)deleteExitRecordWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
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
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Calling deleteExitRecordCompletionBlock", buf, 2u);
    }

  }
  -[IMDCKExitManager ckQueue](self, "ckQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D145E474;
  v8[3] = &unk_1E9229148;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (CKRecordID)exitRecordID
{
  CKRecordID *exitRecordID;
  id v4;
  void *v5;
  void *v6;
  CKRecordID *v7;
  CKRecordID *v8;

  exitRecordID = self->_exitRecordID;
  if (!exitRecordID)
  {
    v4 = objc_alloc(MEMORY[0x1E0C95070]);
    -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deDupeSaltZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKRecordID *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("CloudKitExitRecord"), v6);
    v8 = self->_exitRecordID;
    self->_exitRecordID = v7;

    exitRecordID = self->_exitRecordID;
  }
  return exitRecordID;
}

- (id)syncCompleteRecordID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", CFSTR("SyncCompleteRecord"), v5);

  return v6;
}

- (id)analyticZoneRecordID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticRecordZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", CFSTR("AnalyticZoneRecord"), v5);

  return v6;
}

- (int64_t)derivedQualityOfService
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityOfService");

  if (v3 <= 17)
    v5 = 17;
  else
    v5 = v3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218240;
      v10 = objc_msgSend(v7, "qualityOfService");
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "QOS: 0x%lX target qos: 0x%lX", (uint8_t *)&v9, 0x16u);

    }
  }
  return v5;
}

- (id)exitConfiguration
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v3, "setAllowsCellularAccess:", 1);
  objc_msgSend(v3, "setQualityOfService:", -[IMDCKExitManager derivedQualityOfService](self, "derivedQualityOfService"));
  return v3;
}

- (IMDCKDatabaseManager)databaseManager
{
  IMDCKDatabaseManager *databaseManager;
  IMDCKDatabaseManager *v4;
  IMDCKDatabaseManager *v5;

  databaseManager = self->_databaseManager;
  if (!databaseManager)
  {
    +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
    v4 = (IMDCKDatabaseManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_databaseManager;
    self->_databaseManager = v4;

    databaseManager = self->_databaseManager;
  }
  return databaseManager;
}

- (void)_scheduleOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMDCKExitManager databaseManager](self, "databaseManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "truthDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (BOOL)_saltZoneCreated
{
  NSNumber *saltZoneCreatedOverride;
  NSObject *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  NSObject *v11;
  uint8_t v12;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  saltZoneCreatedOverride = self->_saltZoneCreatedOverride;
  if (saltZoneCreatedOverride)
    return -[NSNumber BOOLValue](saltZoneCreatedOverride, "BOOLValue");
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Checking if salt zone needs to be created", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D145EDE8;
  v14[3] = &unk_1E92291E8;
  v16 = buf;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "createDeDupeSaltZoneIfNeededWithCompletionBlock:", v14);

  v9 = dispatch_time(0, 600000000000);
  v10 = dispatch_semaphore_wait(v8, v9);
  if (v10)
  {
    v18[24] = 0;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "***** Timed out creating salt zone *******", v13, 2u);
      }

    }
  }
  v12 = v18[24];

  _Block_object_dispose(buf, 8);
  return v12;
}

- (BOOL)_subscriptionCreated
{
  NSNumber *subscriptionCreatedOverride;
  NSObject *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  NSObject *v11;
  uint8_t v12;
  uint8_t v13[16];
  _QWORD v14[4];
  NSObject *v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  subscriptionCreatedOverride = self->_subscriptionCreatedOverride;
  if (subscriptionCreatedOverride)
    return -[NSNumber BOOLValue](subscriptionCreatedOverride, "BOOLValue");
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Checking if exit zone subscription needs to be created", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D145F118;
  v14[3] = &unk_1E92291E8;
  v16 = buf;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "createSubscriptionIfNeededOnDeDupeZoneForSubscription:recordType:completionBlock:", CFSTR("ExitRecordKeyManateeZoneSubscription"), CFSTR("Exit"), v14);

  v9 = dispatch_time(0, 180000000000);
  v10 = dispatch_semaphore_wait(v8, v9);
  if (v10)
  {
    v18[24] = 0;
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "***** Timed out creating exit zone subscription *******", v13, 2u);
      }

    }
  }
  v12 = v18[24];

  _Block_object_dispose(buf, 8);
  return v12;
}

- (void)writeInitialSyncCompletedRecordIfNeeded
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnderFirstDataProtectionLock");

  if (v4)
  {
    if (!IMOSLoggingEnabled(v5))
      return;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded Not doing under first unlock", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    v7 = IMGetDomainBoolForKeyWithDefaultValue();
    if ((v7 & 1) != 0)
    {
      if (!IMOSLoggingEnabled(v7))
        return;
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded We have already done this. Not doing again unless you do defaults delete com.apple.madrid initialSyncRecordHasBeenWritten", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      IMSetDomainBoolForKey();
      -[IMDCKAbstractSyncController syncState](self, "syncState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastSyncDate");
      v6 = objc_claimAutoreleasedReturnValue();

      v10 = IMOSLoggingEnabled(v9);
      if ((_DWORD)v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v19 = 138412290;
          v20 = v6;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded Requesting last sync date for metrics: %@", (uint8_t *)&v19, 0xCu);
        }

      }
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[NSObject differenceFromDate:](v6, "differenceFromDate:", v12);
        v14 = (unint64_t)(v13 + 7) < 8;
        v15 = IMOSLoggingEnabled(v13);
        if (v14)
        {
          if (v15)
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              LOWORD(v19) = 0;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Last sync was within the last 7 days", (uint8_t *)&v19, 2u);
            }

          }
          -[IMDCKExitManager writeSyncCompletedRecordWithDate:completion:](self, "writeSyncCompletedRecordWithDate:completion:", v6, &unk_1E9229208);
        }
        else if (v15)
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v19 = 138412290;
            v20 = v6;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded last sync date %@ was not in last 7 days", (uint8_t *)&v19, 0xCu);
          }

        }
      }
      else if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded No last sync date", (uint8_t *)&v19, 2u);
        }

      }
    }
  }

}

- (void)writeSyncCompletedRecordWithDate:(id)a3 completion:(id)a4
{
  -[IMDCKExitManager submitCloudKitMetricWithData:operationGroupName:completion:](self, "submitCloudKitMetricWithData:operationGroupName:completion:", a3, CFSTR("FullSyncCompleted"), 0);
}

- (void)submitCloudKitMetricWithOperationGroupName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverAllowsMetricSubmission");

  if ((v6 & v8) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D145F8C8;
    v14[3] = &unk_1E9229230;
    v14[4] = self;
    v15 = v4;
    -[IMDCKExitManager submitCloudKitMetricWithData:operationGroupName:completion:](self, "submitCloudKitMetricWithData:operationGroupName:completion:", v10, v15, v14);

  }
  else if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      if (v6)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      if (v8)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "*** submitCloudKitMetricWithOperationGroupName not submitting MOC enabled: %@, serverAllowsSubmission: %@", buf, 0x16u);
    }

  }
}

- (BOOL)_analyticZoneCreated
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  char v9;
  uint8_t v11[16];
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  -[IMDCKExitManager recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D145FB68;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createAnalyticZoneIfNeededWithCompletionBlock:", v12);

  v6 = dispatch_time(0, 300000000000);
  v7 = dispatch_semaphore_wait(v5, v6);
  if (v7)
  {
    *((_BYTE *)v16 + 24) = 0;
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating analytic zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Request to submit dictionary (%@) opGroupName %@", buf, 0x16u);

    }
  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "serverAllowsAnalyticSubmission");

  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D145FE98;
    v14[3] = &unk_1E9229258;
    v14[4] = self;
    v15 = v7;
    v16 = v6;
    -[IMDCKExitManager submitCloudKitAnalyticWithDictionary:operationGroupName:completion:](self, "submitCloudKitAnalyticWithDictionary:operationGroupName:completion:", v15, v16, v14);

  }
  else if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "*** submitCloudKitMetricWithOperationGroupName not submitting as analytic submission is not enabled", buf, 2u);
    }

  }
}

- (void)_scheduleMetricOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKExitManager databaseManager](self, "databaseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manateeDataBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Performing metric operation name %@ using DB %@", (uint8_t *)&v11, 0x16u);

    }
  }
  objc_msgSend(v6, "addOperation:", v4);

}

- (id)_sharedCKUtilities
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (id)_modifiedOpGroupName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[IMDCKExitManager _sharedCKUtilities](self, "_sharedCKUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceActiveString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_submitCloudKitMetricWithOperationGroupName:(id)a3 record:(id)a4 ignoreZoneNotFoundError:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  IMDCKExitManager *v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IMDCKExitManager ckQueue](self, "ckQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1460798;
  block[3] = &unk_1E92292D0;
  v18 = v11;
  v19 = v10;
  v22 = a5;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

- (BOOL)_canSubmitCloudKitMetric
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serverAllowsMetricSubmission");

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if ((v3 & 1) == 0 && IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("YES");
      v10 = 138412802;
      v11 = CFSTR("NO");
      v12 = 2112;
      if (!v5)
        v8 = CFSTR("NO");
      v13 = v8;
      v14 = 2112;
      v15 = CFSTR("NO");
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit: serverAllowsMetricSubmission: %@ isInternal: %@ isSeed: %@", (uint8_t *)&v10, 0x20u);
    }

  }
  return v3;
}

- (BOOL)_canSubmitCloudKitAnalytic
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serverAllowsAnalyticSubmission");

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if ((v3 & 1) == 0 && IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("YES");
      v10 = 138412802;
      v11 = CFSTR("NO");
      v12 = 2112;
      if (!v5)
        v8 = CFSTR("NO");
      v13 = v8;
      v14 = 2112;
      v15 = CFSTR("NO");
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit: serverAllowsMetricSubmission: %@ isInternal: %@ isSeed: %@", (uint8_t *)&v10, 0x20u);
    }

  }
  return v3;
}

- (void)submitCloudKitMetricWithData:(id)a3 operationGroupName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = -[IMDCKExitManager _canSubmitCloudKitMetric](self, "_canSubmitCloudKitMetric");
  if (v11)
  {
    -[IMDCKExitManager _modifiedOpGroupName:](self, "_modifiedOpGroupName:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Writing up sync metric using opGroup %@", (uint8_t *)&v19, 0xCu);
      }

    }
    v15 = objc_alloc(MEMORY[0x1E0C95048]);
    -[IMDCKExitManager syncCompleteRecordID](self, "syncCompleteRecordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithRecordType:recordID:", CFSTR("SyncCompleteRecordType"), v16);

    objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("SyncCompleteDateKey"));
    -[IMDCKExitManager _submitCloudKitMetricWithOperationGroupName:record:ignoreZoneNotFoundError:completion:](self, "_submitCloudKitMetricWithOperationGroupName:record:ignoreZoneNotFoundError:completion:", v12, v17, 1, v10);

  }
  else
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit so calling completion with success.", (uint8_t *)&v19, 2u);
      }

    }
    if (v10)
      v10[2](v10, 1, 0);
    v12 = v9;
  }

}

- (void)submitCloudKitAnalyticWithDictionary:(id)a3 operationGroupName:(id)a4 completion:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  void (**v10)(id, uint64_t, _QWORD);
  uint64_t v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = -[IMDCKExitManager _canSubmitCloudKitAnalytic](self, "_canSubmitCloudKitAnalytic");
  v12 = v11;
  if (v8 && (v11 = objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v8), (_DWORD)v11))
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 1, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    v15 = v14;
    if (!v12)
    {
LABEL_4:
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = CFSTR("YES");
          if (v13)
            v17 = CFSTR("NO");
          *(_DWORD *)buf = 138412546;
          v27 = CFSTR("NO");
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Not submitting metrics to CloudKit because notAllowed: %@ noJsonData: %@ so calling completion with success.", buf, 0x16u);
        }

      }
      v10[2](v10, 1, 0);
      v18 = v9;
      goto LABEL_23;
    }
  }
  else
  {
    v14 = (id)IMOSLoggingEnabled(v11);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v8;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Failed to serizlize analyticdict as JSON %@. Posting operationGroupName %@ only.", buf, 0x16u);
      }

    }
    v13 = 0;
    v15 = 0;
    if (!v12)
      goto LABEL_4;
  }
  -[IMDCKExitManager _modifiedOpGroupName:](self, "_modifiedOpGroupName:", v9);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Writing up sync analytic using opGroup %@", buf, 0xCu);
    }

  }
  v22 = objc_alloc(MEMORY[0x1E0C95048]);
  -[IMDCKExitManager analyticZoneRecordID](self, "analyticZoneRecordID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithRecordType:recordID:", CFSTR("AnalyticDataRecordType"), v23);

  if (v13)
    objc_msgSend(v24, "setObject:forKey:", v13, CFSTR("AnalyticDataKey"));
  -[IMDCKExitManager _submitCloudKitMetricWithOperationGroupName:record:ignoreZoneNotFoundError:completion:](self, "_submitCloudKitMetricWithOperationGroupName:record:ignoreZoneNotFoundError:completion:", v18, v24, 0, v10);

LABEL_23:
}

- (void)sendCloudKitZoneFetchRequestToNoteFeatureIsOn
{
  NSObject *v3;
  void *v4;
  char v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "sendCloudKitZoneFetchRequestToNoteFeatureIsOn", buf, 2u);
    }

  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cloudKitSyncingEnabled");

  v7 = IMOSLoggingEnabled(v6);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Pinging cloudkit to tell feature is on.", buf, 2u);
      }

    }
    -[IMDCKExitManager ckQueue](self, "ckQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1461554;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "sendCloudKitZoneFetchRequestToNoteFeatureIsOn not pinging CK as feature is off", buf, 2u);
    }

  }
}

- (void)setExitRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_exitRecordID, a3);
}

- (NSNumber)saltZoneCreatedOverride
{
  return self->_saltZoneCreatedOverride;
}

- (void)setSaltZoneCreatedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_saltZoneCreatedOverride, a3);
}

- (NSNumber)subscriptionCreatedOverride
{
  return self->_subscriptionCreatedOverride;
}

- (void)setSubscriptionCreatedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCreatedOverride, a3);
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ckQueue, a3);
}

- (IMDRecordZoneManager)recordZoneManager
{
  return self->_recordZoneManager;
}

- (void)setRecordZoneManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneManager, a3);
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (BOOL)fetchedExitDateOnLaunch
{
  return self->_fetchedExitDateOnLaunch;
}

- (void)setFetchedExitDateOnLaunch:(BOOL)a3
{
  self->_fetchedExitDateOnLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionCreatedOverride, 0);
  objc_storeStrong((id *)&self->_saltZoneCreatedOverride, 0);
  objc_storeStrong((id *)&self->_exitRecordID, 0);
  objc_storeStrong((id *)&self->_errorFetchingExitDate, 0);
  objc_storeStrong((id *)&self->_exitRecordDate, 0);
}

@end
