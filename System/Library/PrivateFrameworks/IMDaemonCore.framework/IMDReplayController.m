@implementation IMDReplayController

+ (IMDReplayController)sharedInstance
{
  if (qword_1ED935D08 != -1)
    dispatch_once(&qword_1ED935D08, &unk_1E922D9B8);
  return (IMDReplayController *)qword_1ED935E48;
}

- (IMDReplayController)init
{
  IMDReplayController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMDReplayController;
  v2 = -[IMDReplayController init](&v4, sel_init);
  if (v2)
    v2->_storageController = -[IMDReplayStorageController initWithFilePath:]([IMDReplayStorageController alloc], "initWithFilePath:", CFSTR("/var/mobile/Library/SMS/replayDB.db"));
  return v2;
}

- (IMDReplayController)initWithStorageController:(id)a3
{
  IMDReplayController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDReplayController;
  v4 = -[IMDReplayController init](&v6, sel_init);
  if (v4)
    v4->_storageController = (IMDReplayStorageController *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDReplayController;
  -[IMDReplayController dealloc](&v3, sel_dealloc);
}

- (BOOL)storeMessage:(id)a3 type:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  __CFDictionary *Mutable;
  const void *v16;
  _BOOL8 v17;
  NSObject *v18;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v9 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = a3;
      v24 = 1024;
      LODWORD(v25) = v6;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Request to store replay message %@ type %d", buf, 0x12u);
    }
  }
  v10 = a3;
  if (!a3)
  {
    if (IMOSLoggingEnabled(v10))
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "IMDReplayContoller message was nil", buf, 2u);
      }
    }
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMDReplayControllerErrorDomain"), 0, 0);
    return 0;
  }
  if (v6 >= 3)
  {
    if (IMOSLoggingEnabled(v10))
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v6;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "IMDReplayContoller Incorrect message type %d", buf, 8u);
      }
    }
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMDReplayControllerErrorDomain"), 1, 0);
LABEL_11:

    return 0;
  }
  objc_opt_class();
  v14 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (id)objc_msgSend(a3, "dictionaryRepresentation");
    if (!v14)
    {
      if (IMOSLoggingEnabled(0))
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = a3;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "IMDReplayContoller Unable to archive message object: %@", buf, 0xCu);
        }
      }
      goto LABEL_11;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v16 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  if (v16)
  {
    CFDictionarySetValue(Mutable, CFSTR("mT"), v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166BDC4();
  }
  CFDictionarySetValue(Mutable, CFSTR("mPL"), v14);
  v21 = 0;
  v17 = -[IMDReplayStorageController storeDictionary:error:](self->_storageController, "storeDictionary:error:", Mutable, &v21);
  v13 = v17;
  if (!v17)
  {
    if (IMOSLoggingEnabled(v17))
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = a3;
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "IMDReplayMessageController. Storing message %@ failed with error %@", buf, 0x16u);
      }
    }
    if (a5)
      *a5 = v21;
  }

  return v13;
}

- (void)_processBatch:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v20;
  void *v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE buf[24];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(a3);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D17EA968]();
        v9 = objc_msgSend((id)objc_msgSend(v7, "valueForKey:", CFSTR("mT")), "integerValue");
        v10 = objc_msgSend(v7, "valueForKey:", CFSTR("mPL"));
        if (v10)
        {
          v11 = objc_msgSend(MEMORY[0x1E0D34398], "transactionLogMessageFromDictionaryRepresentation:", v10);
          if (v11)
            v12 = v11;
          else
            v12 = v10;
          if (v9 - 1 >= 2)
          {
            if (v9)
            {
              if (IMOSLoggingEnabled(v11))
              {
                v14 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v7;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v9;
                  _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "IMDReplayContoller Trying to replay message of unknown type %@ %d", buf, 0x12u);
                }
              }
            }
            else
            {
              objc_msgSend(v20, "addObject:", v12);
            }
          }
          else
          {
            objc_msgSend(v21, "addObject:", v12);
          }
        }
        else
        {
          if (IMOSLoggingEnabled(0))
          {
            v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "IMDReplayContoller: Found an empty message payload while replaying", buf, 2u);
            }
          }

        }
        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v4);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v28 = 0;
  if (objc_msgSend(v20, "count"))
    ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  if (objc_msgSend(v21, "count"))
    ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1D157475C;
  v22[3] = &unk_1E922D9E0;
  v22[4] = self;
  v22[5] = buf;
  v15 = -[NSDictionary valueForKey:](self->_syncTaskByServiceName, "valueForKey:", *MEMORY[0x1E0D38F68]);
  v16 = objc_msgSend(v15, "batchProcessingBlock");
  if (objc_msgSend(v20, "count") && v15 && objc_msgSend(v15, "batchProcessingBlock") && v16)
    (*(void (**)(uint64_t, void *, _QWORD *))(v16 + 16))(v16, v20, v22);
  v17 = -[NSDictionary valueForKey:](self->_syncTaskByServiceName, "valueForKey:", *MEMORY[0x1E0D38F58]);
  v18 = objc_msgSend(v17, "batchProcessingBlock");
  if (objc_msgSend(v21, "count") && v17 && objc_msgSend(v17, "batchProcessingBlock") && v18)
    (*(void (**)(uint64_t, void *, _QWORD *))(v18 + 16))(v18, v21, v22);
  _Block_object_dispose(buf, 8);
}

- (void)replayMessages
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Request received to replay messages.", v4, 2u);
    }
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:", IMDMessageHistorySyncNotifyReplayControllerWantsSync, 0);
}

- (void)scheduleSyncTaskForServices:(id)a3
{
  -[IMDReplayController setHeldDeletionContext:](self, "setHeldDeletionContext:", 0);
  -[IMDReplayController setSyncTaskByServiceName:](self, "setSyncTaskByServiceName:", a3);
  MEMORY[0x1E0DE7D20](self, sel__fetchNexBatchOfMessagesAndReplay);
}

- (void)_fetchNexBatchOfMessagesAndReplay
{
  IMDReplayStorageIterationContext *v3;
  void *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  IMDReplayStorageIterationContext *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDReplayController heldDeletionContext](self, "heldDeletionContext");
  v4 = (void *)MEMORY[0x1D17EA968]();
  v17 = v3;
  v5 = -[IMDReplayStorageController copyNextBatchWithSize:iterationContext:](self->_storageController, "copyNextBatchWithSize:iterationContext:", 200, &v17);
  if (v3 != v17)
    -[IMDReplayController setHeldDeletionContext:](self, "setHeldDeletionContext:");
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[IMDReplayController _processBatch:](self, "_processBatch:", v5);

  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = -[NSDictionary allKeys](self->_syncTaskByServiceName, "allKeys");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = objc_msgSend(-[NSDictionary valueForKey:](self->_syncTaskByServiceName, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9)), "completionBlock");
          if (v10)
            (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }
    if (-[IMDReplayController automationCompletionBlock](self, "automationCompletionBlock"))
    {
      (*(void (**)(void))(-[IMDReplayController automationCompletionBlock](self, "automationCompletionBlock") + 16))();
      -[IMDReplayController setAutomationCompletionBlock:](self, "setAutomationCompletionBlock:", 0);
    }

    if (IMOSLoggingEnabled(-[IMDReplayController setHeldDeletionContext:](self, "setHeldDeletionContext:", 0)))
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Deleting replay DB after replaying messages", v12, 2u);
      }
    }
    -[IMDReplayStorageController deleteReplayDB](self->_storageController, "deleteReplayDB");
  }
  objc_autoreleasePoolPop(v4);
}

- (void)deleteReplayDBIfNotUnderFirstUnlock
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance"), "isUnderFirstDataProtectionLock");
  v4 = v3;
  v5 = IMOSLoggingEnabled(v3);
  if ((_DWORD)v5)
  {
    v6 = OSLogHandleForIMEventCategory();
    v5 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if ((_DWORD)v5)
    {
      v7 = CFSTR("NO");
      if (v4)
        v7 = CFSTR("YES");
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "deleteReplayDBIfNotUnderFirstUnlock isUnderFirstUnlock %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v8 = IMOSLoggingEnabled(v5);
  if (v4)
  {
    if (v8)
    {
      v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not deleting replay DB", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    if (v8)
    {
      v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Deleting replay DB on imagent launch after first unlock", (uint8_t *)&v11, 2u);
      }
    }
    -[IMDReplayStorageController deleteReplayDB](self->_storageController, "deleteReplayDB");
  }
}

- (void)overrideStorageControllerWithDatabaseFromPath:(id)a3
{
  NSObject *v5;
  IMDReplayStorageController *v6;
  IMDReplayStorageController *v7;
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Setting up new replay database at path: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v6 = -[IMDReplayStorageController initWithFilePath:]([IMDReplayStorageController alloc], "initWithFilePath:", a3);
  v7 = v6;
  if (v6)
  {
    if (self->_suspendedStorageController)
    {
      if (IMOSLoggingEnabled(v6))
      {
        v8 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "An replay database was already overriding the default, ending previous override", (uint8_t *)&v11, 2u);
        }
      }
    }
    else
    {
      self->_suspendedStorageController = self->_storageController;
    }
    self->_storageController = v7;
  }
  else if (IMOSLoggingEnabled(0))
  {
    v9 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[IMDReplayStorageController filePath](self->_storageController, "filePath");
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Unable to setup replayStorageController, previous store controller with database at path %@ remains active", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)restoreDefaultStoreControllerInstance
{
  IMDReplayStorageController *suspendedStorageController;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  suspendedStorageController = self->_suspendedStorageController;
  v4 = IMOSLoggingEnabled(self);
  if (suspendedStorageController)
  {
    if (v4)
    {
      v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Restoring default replay database", buf, 2u);
      }
    }
    if (self->_isRecordingReplayDB)
      -[IMDReplayController endRecordingReplayDatabase](self, "endRecordingReplayDatabase");

    self->_storageController = self->_suspendedStorageController;
    self->_suspendedStorageController = 0;
  }
  else if (v4)
  {
    v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Attempted to restore a database when no override database was set", v7, 2u);
    }
  }
}

- (void)startRecordingReplayDatabase
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_isRecordingReplayDB)
  {
    if (IMOSLoggingEnabled(self))
    {
      v3 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Starting to recording replay database", v4, 2u);
      }
    }
    self->_isRecordingReplayDB = 1;
  }
}

- (void)endRecordingReplayDatabase
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_isRecordingReplayDB)
  {
    if (IMOSLoggingEnabled(self))
    {
      v3 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "End recording replay database", v4, 2u);
      }
    }
    self->_isRecordingReplayDB = 0;
  }
}

- (void)replayMessagesWithCompletion:(id)a3
{
  if (a3)
    -[IMDReplayController setAutomationCompletionBlock:](self, "setAutomationCompletionBlock:");
  -[IMDReplayController replayMessages](self, "replayMessages");
}

+ (int64_t)batchSize
{
  return 200;
}

- (BOOL)isRecordingReplayDB
{
  return self->_isRecordingReplayDB;
}

- (NSDictionary)syncTaskByServiceName
{
  return self->_syncTaskByServiceName;
}

- (void)setSyncTaskByServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (IMDReplayStorageIterationContext)heldDeletionContext
{
  return self->_heldDeletionContext;
}

- (void)setHeldDeletionContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)automationCompletionBlock
{
  return self->_automationCompletionBlock;
}

- (void)setAutomationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (IMDReplayStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
