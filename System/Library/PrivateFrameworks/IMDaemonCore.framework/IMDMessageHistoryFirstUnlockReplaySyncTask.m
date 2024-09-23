@implementation IMDMessageHistoryFirstUnlockReplaySyncTask

- (IMDMessageHistoryFirstUnlockReplaySyncTask)initWithReplayController:(id)a3 accountController:(id)a4
{
  IMDMessageHistoryFirstUnlockReplaySyncTask *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDMessageHistoryFirstUnlockReplaySyncTask;
  v5 = -[IMDMessageHistoryIDSTransactionLogSyncTask initWithAccountController:](&v7, sel_initWithAccountController_, a4);
  if (v5)
    v5->_replayController = (IMDReplayController *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_replayController = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryFirstUnlockReplaySyncTask;
  -[IMDMessageHistoryIDSTransactionLogSyncTask dealloc](&v3, sel_dealloc);
}

- (unint64_t)syncTaskType
{
  return 0;
}

- (void)_setupAndBeginSync
{
  NSArray *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDAccountController activeSessions](-[IMDMessageHistoryIDSTransactionLogSyncTask accountController](self, "accountController"), "activeSessions");
  if (IMOSLoggingEnabled(-[IMDMessageHistoryIDSTransactionLogSyncTask setTaskGroupedByServiceName:](self, "setTaskGroupedByServiceName:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v3, "count")))))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = -[NSArray count](v3, "count");
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "IMDMessageHistoryFirstUnlockReplaySyncTask: Begin replaying first unlock database for %ld services", buf, 0xCu);
    }
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0D343A0]);
        v10 = -[IMDMessageHistoryIDSTransactionLogSyncTask _createProcessBatchBlockWithServiceSession:](self, "_createProcessBatchBlockWithServiceSession:", v8);
        v11 = -[IMDMessageHistoryIDSTransactionLogSyncTask _createSyncCompletionBlockForServiceSession:](self, "_createSyncCompletionBlockForServiceSession:", v8);
        objc_msgSend(v9, "setBatchProcessingBlock:", v10);
        objc_msgSend(v9, "setKnownRecordIDsFromList:", 0);
        objc_msgSend(v9, "setCompletionBlock:", v11);

        -[NSMutableDictionary setValue:forKey:](-[IMDMessageHistoryIDSTransactionLogSyncTask taskGroupedByServiceName](self, "taskGroupedByServiceName"), "setValue:forKey:", v9, objc_msgSend((id)objc_msgSend(v8, "service"), "internalName"));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  -[IMDReplayController scheduleSyncTaskForServices:](self->_replayController, "scheduleSyncTaskForServices:", -[IMDMessageHistoryIDSTransactionLogSyncTask taskGroupedByServiceName](self, "taskGroupedByServiceName"));
}

@end
