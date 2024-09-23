@implementation IMDMessageHistoryIDSTransactionLogSyncTask

- (IMDMessageHistoryIDSTransactionLogSyncTask)initWithAccountController:(id)a3
{
  IMDMessageHistoryIDSTransactionLogSyncTask *v4;
  objc_class *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDMessageHistoryIDSTransactionLogSyncTask;
  v4 = -[IMDMessageHistoryIDSTransactionLogSyncTask init](&v7, sel_init);
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v4->_className = NSStringFromClass(v5);
    v4->_accountController = (IMDAccountController *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_className = 0;
  self->_accountController = 0;

  self->_taskGroupedByServiceName = 0;
  self->_syncTaskCompletionBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDMessageHistoryIDSTransactionLogSyncTask;
  -[IMDMessageHistoryIDSTransactionLogSyncTask dealloc](&v3, sel_dealloc);
}

- (void)startSyncTask:(id)a3
{
  NSObject *v4;
  NSString *className;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_taskGroupedByServiceName)
  {
    if (IMOSLoggingEnabled(self))
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        className = self->_className;
        v6 = 138412290;
        v7 = className;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "%@: Start sync should not be called more than once.  Ignoring request.", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  else
  {
    -[IMDMessageHistoryIDSTransactionLogSyncTask setSyncTaskCompletionBlock:](self, "setSyncTaskCompletionBlock:", a3);
    MEMORY[0x1E0DE7D20](self, sel__setupAndBeginSync);
  }
}

- (unint64_t)syncTaskType
{
  return 2;
}

- (void)_setupAndBeginSync
{
  NSObject *v3;
  NSString *className;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSString *v20;
  uint64_t v21;
  __int128 v22;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  obj = -[IMDAccountController activeSessions](self->_accountController, "activeSessions");
  if (IMOSLoggingEnabled(-[IMDMessageHistoryIDSTransactionLogSyncTask setTaskGroupedByServiceName:](self, "setTaskGroupedByServiceName:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](obj, "count")))))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      className = self->_className;
      *(_DWORD *)buf = 138412546;
      v35 = className;
      v36 = 2048;
      v37 = -[NSArray count](obj, "count");
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "%@: Begin syncing IDS transaction log history for %ld services", buf, 0x16u);
    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x1E0D343A0]);
        v10 = -[IMDMessageHistoryIDSTransactionLogSyncTask _createProcessBatchBlockWithServiceSession:](self, "_createProcessBatchBlockWithServiceSession:", v8);
        v11 = -[IMDMessageHistoryIDSTransactionLogSyncTask _createKnownRecordBlock](self, "_createKnownRecordBlock");
        v12 = -[IMDMessageHistoryIDSTransactionLogSyncTask _createSyncCompletionBlockForServiceSession:](self, "_createSyncCompletionBlockForServiceSession:", v8);
        objc_msgSend(v9, "setBatchProcessingBlock:", v10);
        objc_msgSend(v9, "setKnownRecordIDsFromList:", v11);
        objc_msgSend(v9, "setCompletionBlock:", v12);

        -[NSMutableDictionary setValue:forKey:](self->_taskGroupedByServiceName, "setValue:forKey:", v9, objc_msgSend((id)objc_msgSend(v8, "service"), "internalName"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v25;
    *(_QWORD *)&v14 = 138412546;
    v22 = v14;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_taskGroupedByServiceName, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "service", v22), "internalName"));
        if (IMOSLoggingEnabled(v18))
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = self->_className;
            v21 = objc_msgSend((id)objc_msgSend(v17, "service"), "internalName");
            *(_DWORD *)buf = v22;
            v35 = v20;
            v36 = 2112;
            v37 = v21;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "%@: Starting sync task for %@ service ", buf, 0x16u);
          }
        }
        objc_msgSend(v17, "scheduleTransactionLogTask:", v18);
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }
}

- (id)_createProcessBatchBlockWithServiceSession:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D1435D98;
  v4[3] = &unk_1E9228600;
  v4[4] = self;
  v4[5] = a3;
  return (id)objc_msgSend(v4, "copy");
}

- (id)_createKnownRecordBlock
{
  return (id)objc_msgSend(&unk_1E9228640, "copy");
}

- (id)_createSyncCompletionBlockForServiceSession:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D14360D0;
  v4[3] = &unk_1E9228668;
  v4[4] = self;
  v4[5] = a3;
  return (id)objc_msgSend(v4, "copy");
}

- (IMDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableDictionary)taskGroupedByServiceName
{
  return self->_taskGroupedByServiceName;
}

- (void)setTaskGroupedByServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)syncTaskCompletionBlock
{
  return self->_syncTaskCompletionBlock;
}

- (void)setSyncTaskCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
