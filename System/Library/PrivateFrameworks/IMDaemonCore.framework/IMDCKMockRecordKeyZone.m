@implementation IMDCKMockRecordKeyZone

- (BOOL)_operationIsCloudKitMetricsOperation:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a3, "recordsToSave", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "recordID"), "recordName"), "isEqualToString:", CFSTR("SyncCompleteRecord")) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (void)handleOperation:(id)a3
{
  NSObject *v5;
  OS_dispatch_queue *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Dispatching operation %@", buf, 0xCu);
    }
  }
  v6 = -[IMDCKMockRecordZone queue](self, "queue");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D148E66C;
  v7[3] = &unk_1E922A180;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async((dispatch_queue_t)v6, v7);
}

- (void)_handleWritingCloudKitMetrics:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Mocking writing up Cloudkit metrics", v6, 2u);
    }
  }
  v5 = objc_msgSend(a3, "modifyRecordsCompletionBlock");
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0, 0);
}

- (void)_handleFetchingExitRecordOperation:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Mock fetching exit record", buf, 2u);
    }
  }
  v5 = objc_msgSend((id)objc_msgSend(a3, "recordIDs"), "firstObject");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("Exit"), v5);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
  v8 = objc_msgSend(a3, "fetchRecordsCompletionBlock");
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, v7, 0);

}

@end
