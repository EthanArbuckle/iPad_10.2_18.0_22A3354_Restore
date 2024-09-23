@implementation IMDCKMessageSyncController

- (IMDCKMessageSyncController)initWithSyncTokenStore:(id)a3
{
  id v5;
  IMDCKMessageSyncController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ckQueue;
  uint64_t v9;
  IMDRecordZoneManager *recordZoneManager;
  IMDCKMessageSyncCKOperationFactory *v11;
  IMDCKMessageSyncCKOperationFactory *CKOperationFactory;
  NSMutableDictionary *v13;
  NSMutableDictionary *visitedChats;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMDCKMessageSyncController;
  v6 = -[IMDCKMessageSyncController init](&v17, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.private.IMDCKMessageSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKMessageSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visitedChats = v6->_visitedChats;
    v6->_visitedChats = v13;

    v6->_deviceConditionsToCheck = 0;
    v6->_encounteredIncompatibleMessage = 0;
    -[IMDCKMessageSyncController _migrateSyncTokens](v6, "_migrateSyncTokens");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel_incompatibleMessageDeleteDetected_, CFSTR("__kCKRecordIMMessageIncompatibleDeleteNotification"), 0);

  }
  return v6;
}

- (IMDCKMessageSyncController)init
{
  IMDCKSyncTokenStore *v3;
  IMDCKMessageSyncController *v4;

  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = -[IMDCKMessageSyncController initWithSyncTokenStore:](self, "initWithSyncTokenStore:", v3);

  return v4;
}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (int64_t)syncControllerRecordType
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_1ED935CF0 != -1)
    dispatch_once(&qword_1ED935CF0, &unk_1E922D2A8);
  return (id)qword_1ED935E28;
}

- (id)_messageZoneID
{
  void *v2;
  void *v3;

  -[IMDCKMessageSyncController recordZoneManager](self, "recordZoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageRecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
}

- (id)_messageRecordSalt
{
  void *v2;
  void *v3;

  -[IMDCKMessageSyncController _recordKeyManagerSharedInstance](self, "_recordKeyManagerSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_numberOfMessagesToUpload
{
  return 200;
}

- (unint64_t)_numberOfRecordsToFetchForSyncType:(int64_t)a3
{
  return 200;
}

- (unint64_t)_messageDeleteBatchSize
{
  void *v2;
  int v3;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInCloudKitDemoMode");

  if (v3)
    return 5;
  else
    return 20;
}

- (int64_t)_numberOfBatchesOfMessagesToFetchInInitialSync
{
  void *v3;
  char v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInCloudKitDemoMode");

  if ((v4 & 1) != 0)
    return 1;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ck-max-number-of-message-batches"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "integerValue") >= 1)
  {
    v5 = objc_msgSend(v8, "integerValue");
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, " overriding max number of message batches to fetch %@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  else
  {
    v5 = 5;
  }

  return v5;
}

- (BOOL)_isValidCKRecordToSync:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "size");
  v5 = v4;
  if (v4 > 0xA000 && IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v3, "size");
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "**** Message %lu CKRecord size exceeds max limit.", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5 <= 0xA000;
}

- (id)_recordsToSaveWithAttemptCount:(unint64_t)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  if (a3 < 0x32)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D155B680;
    block[3] = &unk_1E9228080;
    block[4] = self;
    v16 = buf;
    v9 = v5;
    v15 = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    if (v18[24])
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v21 = 134217984;
          v22 = a3;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "We had invalid records attempting to load records again. Attempt count %lu", v21, 0xCu);
        }

      }
      v12 = -[IMDCKMessageSyncController _recordsToSaveWithAttemptCount:](self, "_recordsToSaveWithAttemptCount:", a3 + 1);
    }
    else
    {
      v12 = v9;
    }
    v8 = v12;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "**** We hit max number of attempts to creat CKRecords", buf, 2u);
      }

    }
    v8 = v6;
  }

  return v8;
}

- (id)_recordsToSave
{
  return -[IMDCKMessageSyncController _recordsToSaveWithAttemptCount:](self, "_recordsToSaveWithAttemptCount:", 0);
}

- (BOOL)_messageZoneCreated
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
  -[IMDCKMessageSyncController recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D155BBC8;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createMessageZoneIfNeededWithCompletionBlock:", v12);

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
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating message zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
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

- (void)_processRecordWriteCompletionForRecord:(id)a3 NSError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id *v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "_stringForKey:", CFSTR("guid"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = (uint64_t)v9;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Wrote message with GUID %@, error %@, recordName:%@", buf, 0x20u);

    }
  }
  if (!v7)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D155C1C8;
    v30[3] = &unk_1E9228750;
    v30[4] = self;
    v11 = &v31;
    v31 = v6;
    v12 = MEMORY[0x1E0C80D38];
    v13 = v30;
LABEL_26:
    dispatch_sync(v12, v13);
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "code") != 14)
  {
    if (objc_msgSend(v7, "code") == 26)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1D155C41C;
      v25[3] = &unk_1E9228750;
      v25[4] = self;
      v11 = &v26;
      v26 = v6;
      v12 = MEMORY[0x1E0C80D38];
      v13 = v25;
    }
    else
    {
      v14 = objc_msgSend(v7, "code");
      if (v14 == 12 || (v14 = objc_msgSend(v7, "code"), v14 == 11))
      {
        if (IMOSLoggingEnabled(v14))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", buf, 2u);
          }

        }
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = sub_1D155C460;
        v23[3] = &unk_1E9228750;
        v23[4] = self;
        v11 = &v24;
        v24 = v6;
        v12 = MEMORY[0x1E0C80D38];
        v13 = v23;
      }
      else if (objc_msgSend(v7, "code") == 2050 || (v16 = objc_msgSend(v7, "code"), v16 == 100))
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = sub_1D155C4A4;
        v21[3] = &unk_1E9228750;
        v21[4] = self;
        v11 = &v22;
        v22 = v6;
        v12 = MEMORY[0x1E0C80D38];
        v13 = v21;
      }
      else
      {
        if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = objc_msgSend(v7, "code");
            *(_DWORD *)buf = 134217984;
            v33 = v18;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Encountered an unknown error.  We'll try syncing this message again on the next sync. Error code: %llu", buf, 0xCu);
          }

        }
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_1D155C4E8;
        v19[3] = &unk_1E9228750;
        v19[4] = self;
        v11 = &v20;
        v20 = v6;
        v12 = MEMORY[0x1E0C80D38];
        v13 = v19;
      }
    }
    goto LABEL_26;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D155C214;
  block[3] = &unk_1E9229280;
  block[4] = self;
  v28 = v7;
  v29 = v6;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

  v11 = &v28;
LABEL_27:

}

- (id)_ckUtilitiesInstance
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (id)_operationErrorForModifyingRecordCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t v11[16];

  v4 = a3;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "CKPartialError:onlyHasErrorCodes:", v4, &unk_1E9271958);

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Modify message had conflicts or the zone was not found, so treating this as a non error case", v11, 2u);
      }

    }
    v9 = 0;
  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)_processModifyRecordsCompletion:(id)a3 deletedRecordIDs:(id)a4 operationError:(id)a5 isLastBatchOfWrite:(BOOL)a6 activity:(id)a7 writeCompletionBlock:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  void (**v18)(id, BOOL, void *);
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  const __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[5];
  id v29;
  void (**v30)(id, BOOL, void *);
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v10 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (__CFString *)a5;
  v17 = a7;
  v18 = (void (**)(id, BOOL, void *))a8;
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v16;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "_processModifyRecordsCompletion error %@", buf, 0xCu);
    }

  }
  -[IMDCKMessageSyncController _operationErrorForModifyingRecordCompletion:](self, "_operationErrorForModifyingRecordCompletion:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    goto LABEL_28;
  v21 = IMIsRunningInAutomation();
  if ((_DWORD)v21)
  {
    objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addNewMessagesSyncedCount:", objc_msgSend(v14, "count"));

  }
  if (v10)
  {
LABEL_28:
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = CFSTR("NO");
        if (v10)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v32 = v25;
        v33 = 2112;
        v34 = v20;
        if (!v20)
          v24 = CFSTR("YES");
        v35 = 2112;
        v36 = v24;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "We completed writing messages. isLastBatch %@, write error %@, writeSuccess %@", buf, 0x20u);
      }

    }
    if (v18)
      v18[2](v18, v20 == 0, v20);
  }
  else
  {
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Kicking off another batch of message writes to cloudKit", buf, 2u);
      }

    }
    -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D155C950;
    block[3] = &unk_1E92290F8;
    block[4] = self;
    v29 = v17;
    v30 = v18;
    dispatch_async(v27, block);

  }
}

- (id)_syncOperationGroupName
{
  void *v2;
  void *v3;

  -[IMDCKAbstractSyncController syncState](self, "syncState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return CFSTR("PeriodicMessageSync");
  else
    return CFSTR("BackFillMessageSync");
}

- (void)_writeDirtyMessagesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[5];
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMDCKMessageSyncController _deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:](self, "_deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:", 1, -1, v6);
  if (v8)
  {
    v9 = -[IMDCKMessageSyncController _recordsToSave](self, "_recordsToSave");
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newfilteredArrayRemovingCKRecordDupes:", v9);

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v14;
        v38 = 2112;
        v39 = (unint64_t)v15;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Got %@ records to sync, filtered to %@ unique records", buf, 0x16u);

      }
    }
    if (objc_msgSend(v9, "count"))
    {
      v16 = objc_msgSend(v9, "count");
      v17 = -[IMDCKMessageSyncController _numberOfMessagesToUpload](self, "_numberOfMessagesToUpload");
      v18 = v17;
      if (v16 < v17)
      {
        v19 = IMOSLoggingEnabled(v17);
        if ((_DWORD)v19)
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = objc_msgSend(v9, "count");
            v22 = -[IMDCKMessageSyncController _numberOfMessagesToUpload](self, "_numberOfMessagesToUpload");
            *(_DWORD *)buf = 134218240;
            v37 = (const __CFString *)v21;
            v38 = 2048;
            v39 = v22;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Number of messages to upload %lu < max batch size. %lu ", buf, 0x16u);
          }

        }
        if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "**** This is the last batch of messages we will write", buf, 2u);
          }

        }
      }
      v24 = v16 < v18;
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToUploading](self, "setBroadcastedSyncStateToUploading");
      -[IMDCKMessageSyncController CKOperationFactory](self, "CKOperationFactory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKMessageSyncController _syncOperationGroupName](self, "_syncOperationGroupName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "saveMessagesCKOperationUsingRecordsToSave:operationGroupName:activity:", v11, v26, v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1D155CEDC;
      v35[3] = &unk_1E922A618;
      v35[4] = self;
      objc_msgSend(v27, "setPerRecordCompletionBlock:", v35);
      v31[0] = v28;
      v31[1] = 3221225472;
      v31[2] = sub_1D155CEEC;
      v31[3] = &unk_1E92292A8;
      v31[4] = self;
      v34 = v24;
      v32 = v6;
      v33 = v7;
      objc_msgSend(v27, "setModifyRecordsCompletionBlock:", v31);
      -[IMDCKMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v27);

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "**** We completed writing up messages. No more messages to write up. ***", buf, 2u);
        }

      }
      if (v7)
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    }

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("NO");
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Did not schedule a write. Device Conditions suitable to write:%@", buf, 0xCu);
    }

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CD8], 2, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
LABEL_30:

  }
}

- (void)_processRecordChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "_stringForKey:", CFSTR("guid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Fetched message record with GUID %@", buf, 0xCu);

    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D155D05C;
  v8[3] = &unk_1E9228750;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], v8);

}

- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[IMDCKMessageSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"))
  {
    if (a4 == -1)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This is a periodic sync and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 2u);
        }
        goto LABEL_12;
      }
LABEL_13:
      -[IMDCKMessageSyncController setDeviceConditionsToCheck:](self, "setDeviceConditionsToCheck:", 1);
      return;
    }
    if ((a4 & 0x8000000000000000) == 0 && a3 > a4)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412546;
          v11 = v8;
          v12 = 2112;
          v13 = v9;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This is an initial sync but current batch count [%@] >= maxBatchCount [%@] and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 0x16u);

        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5
{
  id v8;

  v8 = a5;
  -[IMDCKMessageSyncController _updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:maxBatchCount:](self, "_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:maxBatchCount:", a3, a4);
  LOBYTE(a4) = -[IMDCKMessageSyncController _deviceConditionsAllowsMessageSyncForActivity:deviceConditionsToCheck:currentBatchCount:maxBatchCount:](self, "_deviceConditionsAllowsMessageSyncForActivity:deviceConditionsToCheck:currentBatchCount:maxBatchCount:", v8, -[IMDCKMessageSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"), a3, a4);

  return a4;
}

- (BOOL)_shouldDeferCoreDuetMessagesSyncWithActivity:(id)a3
{
  _xpc_activity_s *v3;
  _BOOL8 should_defer;
  BOOL v5;
  NSObject *v6;
  _BOOL8 v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (_xpc_activity_s *)a3;
  should_defer = xpc_activity_should_defer(v3);
  v5 = should_defer;
  if (should_defer)
  {
    if (IMOSLoggingEnabled(should_defer))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", buf, 2u);
      }

    }
    v7 = xpc_activity_set_state(v3, 3);
    if (!v7 && IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", v10, 2u);
      }

    }
  }

  return v5;
}

- (BOOL)_isCoreDuetSyncForMaxBatchCount:(int64_t)a3 activity:(id)a4
{
  return a3 == -1 && a4 != 0;
}

- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  _BOOL8 v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  int64_t v23;
  unint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  __CFString *v28;
  int v29;
  __CFString *v30;
  __CFString *v31;
  NSObject *v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  int v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cloudKitSyncingEnabled");

  -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "iCloudAccountMatchesiMessageAccount");

  if ((v11 & v13) == 1)
  {
    if (-[IMDCKMessageSyncController _isCoreDuetSyncForMaxBatchCount:activity:](self, "_isCoreDuetSyncForMaxBatchCount:activity:", a6, v9))
    {
      v15 = -[IMDCKMessageSyncController _shouldDeferCoreDuetMessagesSyncWithActivity:](self, "_shouldDeferCoreDuetMessagesSyncWithActivity:", v9);
      v16 = v15;
      v17 = IMOSLoggingEnabled(v15);
      if (v16)
      {
        if (v17)
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v37 = 138412290;
            v38 = v19;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "This is a coreduet sync at currentBatchCount %@, coreduet says to defer syncing", (uint8_t *)&v37, 0xCu);

          }
        }
        v11 = 0;
        goto LABEL_44;
      }
      if (v17)
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = 138412290;
          v38 = v28;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "This is a coreduet sync at currentBatchCount %@, coreduet says to continue syncing", (uint8_t *)&v37, 0xCu);

        }
LABEL_34:

        goto LABEL_44;
      }
      goto LABEL_44;
    }
    v23 = -[IMDCKMessageSyncController _numberOfBatchesOfMessagesToFetchInInitialSync](self, "_numberOfBatchesOfMessagesToFetchInInitialSync");
    if (v23 >= a5)
    {
      v29 = IMOSLoggingEnabled(v23);
      if (a6 == -1)
      {
        if (v29)
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v37 = 138412546;
            v38 = v31;
            v39 = 2112;
            v40 = CFSTR("NO");
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Message sync: Not checking device conditions for full sync at current batch count %@ isCoreDuetSync %@", (uint8_t *)&v37, 0x16u);

          }
          goto LABEL_34;
        }
      }
      else if (v29)
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = 138412290;
          v38 = v30;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Message sync: Not checking device conditions for initial sync at current batchCount %@", (uint8_t *)&v37, 0xCu);

        }
        goto LABEL_34;
      }
LABEL_44:
      LOBYTE(v11) = v11 != 0;
      goto LABEL_45;
    }
    v24 = -[IMDCKMessageSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck");
    if (v24 == 2)
    {
      -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isDeviceOnWifi");
    }
    else
    {
      if (v24 != 1)
        goto LABEL_37;
      -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "deviceConditionsAllowPeriodicSync");
    }
    v11 = v26;

LABEL_37:
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        if (v11)
          v33 = CFSTR("YES");
        else
          v33 = CFSTR("NO");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDCKMessageSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412802;
        v38 = v33;
        v39 = 2112;
        v40 = v34;
        v41 = 2112;
        v42 = v35;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Message sync: device conditions allow sync: %@ deviceConditionsToCheck %@ currentBatchCount %@", (uint8_t *)&v37, 0x20u);

      }
    }
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      if (v11)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      if (v13)
        v21 = CFSTR("YES");
      v37 = 138412546;
      v38 = v22;
      v39 = 2112;
      v40 = v21;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message sync: Stop syncing, feature enabled %@ hasMatchingAccounts %@.", (uint8_t *)&v37, 0x16u);
    }

  }
LABEL_45:

  return v11;
}

- (void)_migrateSyncTokens
{
  void *v3;
  id v4;

  -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "migrateKey:fromDatabase:", CFSTR("archivedMessagesChangeToken"), CFSTR("/var/mobile/Library/SMS/CloudKitMetaData/MessageSyncArchivedRecordMetaData.db"));

  -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migrateKey:fromDatabase:", CFSTR("messagesChangeToken"), CFSTR("/var/mobile/Library/SMS/CloudKitMetaData/MessageSyncZoneMetaData.db"));

}

- (void)setArchivedRecordSyncToken:(id)a3
{
  CKServerChangeToken *v5;
  void *v6;
  void *v7;
  CKServerChangeToken *v8;
  CKServerChangeToken *v9;

  v5 = (CKServerChangeToken *)a3;
  if (!v5)
  {
    v9 = 0;
    -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    goto LABEL_5;
  }
  if (self->_archivedRecordSyncToken != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_archivedRecordSyncToken, a3);
    -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v9;
LABEL_5:
    objc_msgSend(v6, "persistToken:forKey:", v8, CFSTR("archivedMessagesChangeToken"));

    v5 = v9;
  }

}

- (CKServerChangeToken)archivedRecordSyncToken
{
  void *v3;
  CKServerChangeToken *v4;
  CKServerChangeToken *archivedRecordSyncToken;

  -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenForKey:", CFSTR("archivedMessagesChangeToken"));
  v4 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();
  archivedRecordSyncToken = self->_archivedRecordSyncToken;
  self->_archivedRecordSyncToken = v4;

  return self->_archivedRecordSyncToken;
}

- (void)_resetArvchivedRecordSyncToken
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting the archived message sync token to nil", buf, 2u);
    }

  }
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D155DD34;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (id)_changeTokenKey
{
  return CFSTR("messagesChangeToken");
}

- (void)setLatestSyncToken:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKMessageSyncController _changeTokenKey](self, "_changeTokenKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6 = v7;
  else
    v6 = 0;
  objc_msgSend(v4, "persistToken:forKey:", v6, v5);

}

- (CKServerChangeToken)latestSyncToken
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDCKMessageSyncController syncTokenStore](self, "syncTokenStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKMessageSyncController _changeTokenKey](self, "_changeTokenKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKServerChangeToken *)v5;
}

- (void)_resetSyncToken
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting the message sync token to nil", buf, 2u);
    }

  }
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D155DF00;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_processArchivedRecordsFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 moreComing:(BOOL)a5 currentBatchCount:(int64_t)a6 maxNumberOfBatches:(int64_t)a7 activity:(id)a8 error:(id)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  IMDCKMessageSyncController *v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;
  BOOL v32;

  v15 = a4;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D155E0AC;
  block[3] = &unk_1E922D2F8;
  v32 = a5;
  v25 = v15;
  v26 = v17;
  v30 = a6;
  v31 = a7;
  v27 = self;
  v28 = v16;
  v29 = v18;
  v20 = v18;
  v21 = v16;
  v22 = v17;
  v23 = v15;
  dispatch_sync(v19, block);

}

- (void)_fetchArchivedRecordsIfNeeded:(BOOL)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 withCompletionBlock:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v15;
  _BOOL8 v16;
  _BOOL4 v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  IMDCKMessageSyncController *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v39[5];
  id v40;
  id v41;
  int64_t v42;
  int64_t v43;
  _QWORD v44[5];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v10 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (a5 < 0 || a4 < a5)
  {
    v16 = -[IMDCKMessageSyncController _deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:](self, "_deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:", a4, a5, v12);
    v17 = v16;
    v18 = IMOSLoggingEnabled(v16);
    if (v17 && v10)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v20;
          v47 = 2112;
          v48 = v21;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Fetching archived currentBatchCount %@ maxNumberOfBatches %@", buf, 0x16u);

        }
      }
      if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setBroadcastedSyncStateToDownloading](self, "setBroadcastedSyncStateToDownloading")))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          -[IMDCKMessageSyncController archivedRecordSyncToken](self, "archivedRecordSyncToken");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v23;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "******** Fetching archived records ***** sync token is %@", buf, 0xCu);

        }
      }
      -[IMDCKMessageSyncController CKOperationFactory](self, "CKOperationFactory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKMessageSyncController archivedRecordSyncToken](self, "archivedRecordSyncToken");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKMessageSyncController _messageZoneID](self, "_messageZoneID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fetchArchivedRecordsOperationWithSyncToken:zoneID:activity:", v25, v26, v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = sub_1D155EAC0;
      v44[3] = &unk_1E922A4F8;
      v44[4] = self;
      objc_msgSend(v27, "setRecordFetchedBlock:", v44);
      objc_msgSend(v27, "setRecordZoneChangeTokensUpdatedBlock:", &unk_1E922D338);
      v39[0] = v28;
      v39[1] = 3221225472;
      v39[2] = sub_1D155ECAC;
      v39[3] = &unk_1E922D360;
      v39[4] = self;
      v42 = a4;
      v43 = a5;
      v40 = v12;
      v29 = v14;
      v41 = v29;
      objc_msgSend(v27, "setRecordZoneFetchCompletionBlock:", v39);
      v33 = v28;
      v34 = 3221225472;
      v35 = sub_1D155ECEC;
      v36 = &unk_1E922A5B0;
      v37 = self;
      v38 = v29;
      objc_msgSend(v27, "setFetchArchivedRecordsCompletionBlock:", &v33);
      -[IMDCKMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v27, v33, v34, v35, v36, v37);

    }
    else if (v17)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Did not fetch archived records from message zone as no archived hint present", buf, 2u);
        }

      }
      if (v14)
        goto LABEL_8;
    }
    else
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Did not fetch archived records from message zone as device condition does not allow sync", buf, 2u);
        }

      }
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CD8], 2, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v14)[2](v14, 0, 0, v32);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "****** We are done fetching archived messages as max batch attempt limit reached ********", buf, 2u);
      }

    }
    if (v14)
LABEL_8:
      v14[2](v14, 1, 1, 0);
  }

}

- (void)_processFetchArchivedRecordCompletionWithError:(id)a3 WithCompletionBlock:(id)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = IMOSLoggingEnabled(v6);
  if (v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "*** Encountered error while fetching archived records %@", (uint8_t *)&v10, 0xCu);
      }

    }
    if (v6)
      (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v5);
  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "*** Did not encounter error while fetching archived records", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)_processRecordZoneFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 NSError:(id)a7 syncType:(int64_t)a8 currentBatchCount:(int64_t)a9 maxNumberOfBatches:(int64_t)a10 shouldFetchArchivedRecords:(BOOL)a11 activity:(id)a12 completionBlock:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  IMDCKMessageSyncController *v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  BOOL v35;
  BOOL v36;

  v16 = a4;
  v17 = a7;
  v18 = a12;
  v19 = a13;
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D155EFA4;
  block[3] = &unk_1E922D3B0;
  v35 = a6;
  v27 = v16;
  v28 = v17;
  v36 = a11;
  v33 = a10;
  v34 = a8;
  v29 = self;
  v30 = v18;
  v31 = v19;
  v32 = a9;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v25 = v16;
  dispatch_sync(v20, block);

}

- (void)_processFetchRecordZoneChangesCompletionWithError:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
    goto LABEL_5;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "errorIndicatesZoneNotCreated:", v6))
  {

    goto LABEL_5;
  }
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "errorIndicatesUserDeletedZone:", v6);

  if ((v11 & 1) != 0)
  {
LABEL_5:
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "_processFetchRecordZoneChangesCompletionWithError with no error", buf, 2u);
      }

    }
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Failed fetching messages %@", buf, 0xCu);
    }

  }
  if (v8)
  {
    -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1D155FAF0;
    v15[3] = &unk_1E92290A8;
    v17 = v8;
    v16 = v6;
    dispatch_async(v14, v15);

  }
LABEL_9:

}

- (BOOL)_shouldFetchArchivedRecords:(id)a3
{
  void *v4;

  objc_msgSend(a3, "recordZoneIDsWithPendingArchivedRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMDCKMessageSyncController _doesAnyRecordZoneIDHavePendingArchivedRecords:](self, "_doesAnyRecordZoneIDHavePendingArchivedRecords:", objc_msgSend(v4, "count"));

  return (char)self;
}

- (BOOL)_doesAnyRecordZoneIDHavePendingArchivedRecords:(int64_t)a3
{
  return a3 > 0;
}

- (BOOL)_isDiskSpaceAvailableForSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4
{
  _BOOL8 v6;
  void *v7;

  v6 = __ROR8__(0x8F5C28F5C28F5C29 * a4, 2) < 0x28F5C28F5C28F5DuLL;
  +[IMDCKCacheDeleteManager sharedInstance](IMDCKCacheDeleteManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "canWriteFileOfEstimatedSize:refreshCachedValue:", 40960* -[IMDCKMessageSyncController _numberOfRecordsToFetchForSyncType:](self, "_numberOfRecordsToFetchForSyncType:", a3), v6);

  return a3;
}

- (void)_fetchMessageZoneChangesSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 completionBlock:(id)a7
{
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  int64_t v22;
  int64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  _BOOL8 v29;
  _BOOL4 v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v54[5];
  id v55;
  id v56;
  _BYTE *v57;
  int64_t v58;
  int64_t v59;
  int64_t v60;
  _QWORD v61[5];
  uint8_t v62[4];
  void *v63;
  _BYTE buf[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v51 = a6;
  v12 = a7;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (a5 < 1 || a4 < a5)
  {
    v22 = -[IMDCKMessageSyncController _numberOfBatchesOfMessagesToFetchInInitialSync](self, "_numberOfBatchesOfMessagesToFetchInInitialSync");
    if (a5 == -1)
    {
      v23 = v22;
      if (v22 < a4)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled(v24))
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v24;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We completed fetching %@ batches of messages during a full sync, setting fullPartialSyncFirstCompletedDate to %@", buf, 0x16u);

          }
        }
        -[IMDCKAbstractSyncController syncState](self, "syncState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAnalyticSyncDatesDictionaryObject:forKey:shouldOverrideIfExists:", v24, *MEMORY[0x1E0D37A18], 0);

      }
    }
    v28 = -[IMDCKMessageSyncController _isDiskSpaceAvailableForSyncType:currentBatchCount:](self, "_isDiskSpaceAvailableForSyncType:currentBatchCount:", a3, a4);
    v29 = -[IMDCKMessageSyncController _deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:](self, "_deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:", a4, a5, v51);
    v30 = v29;
    v31 = IMOSLoggingEnabled(v29);
    if (v30 && v28)
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v34;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Fetching live messages, currentBatchCount %@ maxNumberOfBatches %@", buf, 0x16u);

        }
      }
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToDownloading](self, "setBroadcastedSyncStateToDownloading");
      -[IMDCKMessageSyncController CKOperationFactory](self, "CKOperationFactory");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKMessageSyncController latestSyncToken](self, "latestSyncToken");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKMessageSyncController _messageZoneID](self, "_messageZoneID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[IMDCKMessageSyncController _numberOfRecordsToFetchForSyncType:](self, "_numberOfRecordsToFetchForSyncType:", a3);
      -[IMDCKMessageSyncController _syncOperationGroupName](self, "_syncOperationGroupName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fetchMessageZoneChangesCKOperationUsingToken:zoneID:resultsLimit:operationGroupName:activity:", v36, v37, v38, v39, v51);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = sub_1D156044C;
      v61[3] = &unk_1E922A4F8;
      v61[4] = self;
      objc_msgSend(v40, "setRecordChangedBlock:", v61);
      objc_msgSend(v40, "setRecordZoneChangeTokensUpdatedBlock:", &unk_1E922D3D0);
      objc_msgSend(v40, "setRecordWithIDWasDeletedBlock:", &unk_1E922D410);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v65 = sub_1D156060C;
      v66 = sub_1D156061C;
      v67 = 0;
      v42 = v40;
      v67 = v42;
      v54[0] = v41;
      v54[1] = 3221225472;
      v54[2] = sub_1D1560624;
      v54[3] = &unk_1E922D438;
      v54[4] = self;
      v57 = buf;
      v58 = a3;
      v59 = a4;
      v60 = a5;
      v55 = v51;
      v43 = v13;
      v56 = v43;
      objc_msgSend(v42, "setRecordZoneFetchCompletionBlock:", v54);
      v52[0] = v41;
      v52[1] = 3221225472;
      v52[2] = sub_1D15606F4;
      v52[3] = &unk_1E922A5B0;
      v52[4] = self;
      v53 = v43;
      if (IMOSLoggingEnabled(objc_msgSend(v42, "setFetchRecordZoneChangesCompletionBlock:", v52)))
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          -[IMDCKMessageSyncController latestSyncToken](self, "latestSyncToken");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v62 = 138412290;
          v63 = v45;
          _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Scheduling a fetch operation from message zone, using token %@", v62, 0xCu);

        }
      }
      -[IMDCKMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v42);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v31)
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = CFSTR("NO");
          if (v30)
            v49 = CFSTR("YES");
          else
            v49 = CFSTR("NO");
          if (v28)
            v48 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v49;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v48;
          _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Did not fetch changes from message zone. Device condition allows sync %@. Disk Space Available %@", buf, 0x16u);
        }

      }
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CD8], 2, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v13)[2](v13, 0, 0, 0, v50);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "****** We are done fetching live messages as max batch attempt limit reached ********", buf, 2u);
      }

    }
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldForceArchivedMessagesSync");

    if (v16)
    {
      v18 = IMGetDomainBoolForKeyWithDefaultValue();
      if (v13)
      {
        v19 = v18;
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = CFSTR("NO");
            if ((_DWORD)v19)
              v21 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v21;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "shouldForceArchivedMessagesSync is YES, fetched max live record batches but will also fetch initial sync archived records if needed: %@", buf, 0xCu);
          }

        }
        v13[2](v13, 1, v19, 0, 0);
      }
    }
    else if (v13)
    {
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Since we fetched max live batch records, we will not fetch archived records", buf, 2u);
        }

      }
      v13[2](v13, 1, 0, 0, 0);
    }
  }

}

- (void)_noteSyncEnded
{
  _BOOL8 v3;
  NSObject *v4;
  uint8_t v5[16];

  -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
  -[IMDCKMessageSyncController setDeviceConditionsToCheck:](self, "setDeviceConditionsToCheck:", 0);
  v3 = -[IMDCKMessageSyncController encounteredIncompatibleMessage](self, "encounteredIncompatibleMessage");
  if (v3)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Need to kick off a sync of deletes because we had an incompatible message earlier.", v5, 2u);
      }

    }
    -[IMDCKMessageSyncController setEncounteredIncompatibleMessage:](self, "setEncounteredIncompatibleMessage:", 0);
    -[IMDCKMessageSyncController syncDeletedMessagesToCloudKitWithCompletion:](self, "syncDeletedMessagesToCloudKitWithCompletion:", &unk_1E922D458);
  }
}

- (void)_markAllIncompatibleMessagesForDeletion
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Mark all incompatible messages for deletion from cloudkit", v4, 2u);
    }

  }
  IMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("__kCKRecordIMMessageIncompatibleDeleteNotification"), 0);

}

- (void)_needsToMarkAllMessagesAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37988]);

}

- (BOOL)_shouldMarkAllMessagesAsNeedingSync
{
  void *v2;
  char v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnderFirstDataProtectionLock");

  if ((v3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37988]) ^ 1;

  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_shouldMarkAllMessagesAsNeedingSync %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (void)_hasMarkedAllMessagesAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37988]);

}

- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Kicking off a message write after fetching messages", buf, 2u);
    }

  }
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1560C9C;
  block[3] = &unk_1E92290F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[5];
  uint8_t buf[16];

  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "shouldKickOffWriteForSyncType:", a3);

  if (!(_DWORD)a3)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Not writing up messages as sync type does not allow it", buf, 2u);
      }

    }
    if (v9)
      v9[2](v9, 1, 0);
    goto LABEL_16;
  }
  -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isLocalCachedSaltPresent");

  if ((v13 & 1) == 0)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not kicking off a write because cachedSalt is not present.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CD8], 3, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);

    }
LABEL_16:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15610FC;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v15 = 0;
    goto LABEL_17;
  }
  -[IMDCKMessageSyncController _kickOffWriteOnCKQueueWithActivity:completion:](self, "_kickOffWriteOnCKQueueWithActivity:completion:", v8, v9);
  v15 = 1;
LABEL_17:

  return v15;
}

- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v22 = a3;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "syncMessagesWithSyncType with type %ld deviceConditionsToCheck %@", buf, 0x16u);

    }
  }
  -[IMDCKAbstractSyncController resetRecordCounts](self, "resetRecordCounts");
  -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 1);
  -[IMDCKMessageSyncController setDeviceConditionsToCheck:](self, "setDeviceConditionsToCheck:", a4);
  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D15612D4;
  v17[3] = &unk_1E922D520;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = a3;
  v15 = v11;
  v16 = v10;
  dispatch_async(v14, v17);

}

- (void)deleteMessageSyncToken
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Clearing local sync tokens for Messages", v5, 2u);
    }

  }
  v4 = -[IMDCKMessageSyncController latestSyncToken](self, "latestSyncToken");
  -[IMDCKMessageSyncController setLatestSyncToken:](self, "setLatestSyncToken:", 0);
  -[IMDCKMessageSyncController setArchivedRecordSyncToken:](self, "setArchivedRecordSyncToken:", 0);
}

- (void)deleteMessagesZone
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1561E38;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing local messages sync state, flags 0x%x", (uint8_t *)v7, 8u);
    }

  }
  if ((v3 & 1) != 0)
    -[IMDCKMessageSyncController deleteMessageSyncToken](self, "deleteMessageSyncToken");
  if ((v3 & 2) != 0)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markAllMessagesAsNeedingCloudKitSync");

  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDCKMessageSyncController _needsToMarkAllMessagesAsNeedingSync](self, "_needsToMarkAllMessagesAsNeedingSync");
  }
}

- (void)_processRecordDeletionCompletion:(id)a3 error:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  IMDCKMessageSyncController *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Delete message callback with error %@", buf, 0xCu);
    }

  }
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1562164;
  block[3] = &unk_1E9229280;
  v13 = v8;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v22 = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (v10)
  {
    -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = sub_1D1562490;
    v16[3] = &unk_1E92290A8;
    v18 = v10;
    v17 = v14;
    dispatch_async(v15, v16);

  }
}

- (void)_deleteMessagesWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  IMDCKMessageSyncController *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[IMDCKMessageSyncController CKOperationFactory](self, "CKOperationFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteMessageCKOperationUsingRecordIDstoDelete:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = sub_1D15626AC;
    v15 = &unk_1E92291C0;
    v16 = self;
    v17 = v7;
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v12);
    if (IMOSLoggingEnabled(objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1E922D560, v12, v13, v14, v15, v16)))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Kicking off deleted of recordIDs %@", buf, 0xCu);
      }

    }
    -[IMDCKMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v9);

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No GUIDs passed in to delete", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)_sharedIMDMessageStore
{
  return +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
}

- (id)_constructMessageRecordIDUsingTombStoneDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "valueForKey:", CFSTR("recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C95070]);
    -[IMDCKMessageSyncController _messageZoneID](self, "_messageZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFArray *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[IMDCKMessageSyncController _sharedIMDMessageStore](self, "_sharedIMDMessageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:", a3);

  v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)MEMORY[0x1D17EA968]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = -[IMDCKMessageSyncController _constructMessageRecordIDUsingTombStoneDictionary:](self, "_constructMessageRecordIDUsingTombStoneDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v15 = v14;
        if (v7 && v14)
          CFArrayAppendValue(v7, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(v8);
  return v7;
}

- (void)syncDeletedMessagesToCloudKitWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if ((v6 & 1) != 0)
  {
    v8 = -[IMDCKMessageSyncController _copyRecordIDsToDeleteWithLimit:](self, "_copyRecordIDsToDeleteWithLimit:", -[IMDCKMessageSyncController _messageDeleteBatchSize](self, "_messageDeleteBatchSize"));
    -[IMDCKMessageSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newfilteredArrayRemovingCKRecordIDDupes:", v8);

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v21 = objc_msgSend(v8, "count");
        v22 = 2048;
        v23 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Got %lu recordIDs to sync, filtered to %lu unique recordID", buf, 0x16u);
      }

    }
    if (objc_msgSend(v10, "count"))
      goto LABEL_7;
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "No pending messages to delete from CloudKit", buf, 2u);
      }

    }
    -[IMDCKMessageSyncController _sharedIMDMessageStore](self, "_sharedIMDMessageStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clearMessagesTombStoneTable");

    if (!v4)
    {
LABEL_7:
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToDeleting](self, "setBroadcastedSyncStateToDeleting");
      -[IMDCKMessageSyncController ckQueue](self, "ckQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D1562BCC;
      block[3] = &unk_1E92290F8;
      block[4] = self;
      v18 = v10;
      v19 = v4;
      dispatch_async(v13, block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not doing CloudKit message deletes as CK syncing is off", buf, 2u);
      }

    }
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)incompatibleMessageDeleteDetected:(id)a3
{
  -[IMDCKMessageSyncController setEncounteredIncompatibleMessage:](self, "setEncounteredIncompatibleMessage:", 1);
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

- (SyncTokenStoreProviding)syncTokenStore
{
  return self->_syncTokenStore;
}

- (void)setSyncTokenStore:(id)a3
{
  objc_storeStrong((id *)&self->_syncTokenStore, a3);
}

- (IMDCKMessageSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_CKOperationFactory, a3);
}

- (unint64_t)deviceConditionsToCheck
{
  return self->_deviceConditionsToCheck;
}

- (void)setDeviceConditionsToCheck:(unint64_t)a3
{
  self->_deviceConditionsToCheck = a3;
}

- (NSMutableDictionary)visitedChats
{
  return self->_visitedChats;
}

- (void)setVisitedChats:(id)a3
{
  objc_storeStrong((id *)&self->_visitedChats, a3);
}

- (BOOL)encounteredIncompatibleMessage
{
  return self->_encounteredIncompatibleMessage;
}

- (void)setEncounteredIncompatibleMessage:(BOOL)a3
{
  self->_encounteredIncompatibleMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedChats, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
  objc_storeStrong((id *)&self->_archivedRecordSyncToken, 0);
}

@end
