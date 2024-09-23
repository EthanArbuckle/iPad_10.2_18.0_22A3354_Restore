@implementation IMDMessageStore

- (int64_t)unreadMessagesCount
{
  NSObject *v3;
  NSNumber *cachedUnreadMessageCount;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSObject *v18;
  NSNumber *v19;
  int v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_cachedUnreadMessageCount)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
        v21 = 138412290;
        v22 = cachedUnreadMessageCount;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Returning _cachedUnreadMessageCount %@", (uint8_t *)&v21, 0xCu);
      }

    }
    return -[NSNumber longLongValue](self->_cachedUnreadMessageCount, "longLongValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldFilterUnreadMessageCount");

    objc_msgSend(MEMORY[0x1E0D396C0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldFilterIncomingMessages");

    v10 = IMOSLoggingEnabled();
    if ((v7 | v9) == 1)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = CFSTR("NO");
          if ((_DWORD)v7)
            v13 = CFSTR("YES");
          else
            v13 = CFSTR("NO");
          if ((_DWORD)v9)
            v12 = CFSTR("YES");
          v21 = 138412546;
          v22 = (void *)v13;
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Calculating unread message count by focus [%@] and/or by assistive access [%@].", (uint8_t *)&v21, 0x16u);
        }

      }
      v14 = -[IMDMessageStore _calculateUnreadMessagesCountFilteredByFocus:filteredByAssistiveAccess:](self, "_calculateUnreadMessagesCountFilteredByFocus:filteredByAssistiveAccess:", v7, v9);
    }
    else
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Counting all unread messages.", (uint8_t *)&v21, 2u);
        }

      }
      v14 = IMDMessageRecordCountAllUnreadMessages();
    }
    v5 = v14;
    v16 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v14);
    v17 = self->_cachedUnreadMessageCount;
    self->_cachedUnreadMessageCount = v16;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = self->_cachedUnreadMessageCount;
        v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Computed _cachedUnreadMessageCount %@", (uint8_t *)&v21, 0xCu);
      }

    }
  }
  return v5;
}

- (NSString)modificationStamp
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)lastFailedMessageDate
{
  NSNumber *cachedLastFailedMessageDate;
  int64_t FailedMessageDate;
  NSNumber *v6;
  NSNumber *v7;

  cachedLastFailedMessageDate = self->_cachedLastFailedMessageDate;
  if (cachedLastFailedMessageDate)
    return -[NSNumber longLongValue](cachedLastFailedMessageDate, "longLongValue");
  FailedMessageDate = IMDMessageRecordLastFailedMessageDate();
  v6 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", FailedMessageDate);
  v7 = self->_cachedLastFailedMessageDate;
  self->_cachedLastFailedMessageDate = v6;

  return FailedMessageDate;
}

+ (IMDMessageStore)sharedInstance
{
  if (qword_1ED935CA8 != -1)
    dispatch_once(&qword_1ED935CA8, &unk_1E922C120);
  return (IMDMessageStore *)(id)qword_1ED935DE0;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("allUnreadMessages");
  -[IMDMessageStore _logAllUnreadMessages](self, "_logAllUnreadMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_logAllUnreadMessages
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1D1444BD8;
  v32 = sub_1D1444BE8;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), *MEMORY[0x1E0D377B8], 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D1444BF0;
  v27[3] = &unk_1E9228998;
  v27[4] = &v28;
  objc_msgSend(v2, "fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:limit:completionHandler:", v3, 100, v27);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)v29[5];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "chatRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (__CFString *)v10;
        else
          v12 = CFSTR("nilChatGUID");
        v13 = v12;

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v16 = v14;
        else
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = v16;

        objc_msgSend(v8, "guid");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = CFSTR("nilMessageGUID");
        objc_msgSend(v17, "addObject:", v20);

        objc_msgSend(v4, "setObject:forKey:", v17, v13);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v28, 8);
  return v4;
}

- (id)syncTokenStore
{
  if (qword_1EFC63D90 != -1)
    dispatch_once(&qword_1EFC63D90, &unk_1E922B9E8);
  return (id)qword_1EFC63D88;
}

- (CKRecordZoneID)recordZoneID
{
  void *v2;
  void *v3;

  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageRecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordZoneID *)v3;
}

- (void)resetLocalSyncStateIfAppropriate
{
  if (-[IMDMessageStore _shouldMarkAllMessagesAsNeedingSync](self, "_shouldMarkAllMessagesAsNeedingSync"))
  {
    -[IMDMessageStore clearLocalSyncState:](self, "clearLocalSyncState:", 3);
    -[IMDMessageStore _hasMarkedAllMessagesAsNeedingSync](self, "_hasMarkedAllMessagesAsNeedingSync");
  }
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
  {
    -[IMDMessageStore syncTokenStore](self, "syncTokenStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistToken:forKey:", 0, CFSTR("messagesChangeToken"));

  }
  if ((v3 & 2) != 0)
  {
    -[IMDMessageStore markAllMessagesAsNeedingCloudKitSync](self, "markAllMessagesAsNeedingCloudKitSync");
  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDMessageStore _needsToMarkAllMessagesAsNeedingSync](self, "_needsToMarkAllMessagesAsNeedingSync");
  }
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

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  __int128 v36;
  id v37;
  IMDMessageStore *v38;
  id obj;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = -[IMDMessageStore messagesThatNeedSyncWithCloudKitWithFilter:limit:](self, "messagesThatNeedSyncWithCloudKitWithFilter:limit:", a3, a4, a5);
  v38 = self;
  -[IMDMessageStore recordZoneID](self, "recordZoneID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedSalt");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v8)
  {
    v43 = *(_QWORD *)v45;
    *(_QWORD *)&v9 = 138412290;
    v36 = v9;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v43)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17EA968]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v11;
          if (objc_msgSend(v13, "isTypingMessage"))
          {
            -[IMDMessageStore markMessageAsCleanWithROWID:](v38, "markMessageAsCleanWithROWID:", objc_msgSend(v13, "messageID"));
            goto LABEL_25;
          }

        }
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance", v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "guid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "chatsGUIDsForMessageWithGUID:", v15);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "__imFirstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "chatWithGUID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "cloudKitChatID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParentChatID:", v19);

        objc_msgSend(v11, "parentChatID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = v20 == 0;

        if ((_DWORD)v19 && IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "guid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v49 = v23;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Message %@ is orphaned (parentChatID is nil)", buf, 0xCu);

          }
        }
        v24 = (void *)objc_msgSend(v11, "copyCKRecordRepresentationWithZoneID:salt:", v42, v41);
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          if (IMOSLoggingEnabled(v26))
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "guid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v36;
              v49 = v34;
              _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Cannot generate CKRecord for message %@", buf, 0xCu);

            }
          }
          -[IMDMessageStore markMessageAsCleanWithROWID:](v38, "markMessageAsCleanWithROWID:", objc_msgSend(v11, "messageID"));
          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.sync"), 0, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("FailCreateCKRecordForMessage"), v32, CFSTR("MiCSync"), CFSTR("Failed to create CKRecord for message"));
          goto LABEL_23;
        }
        objc_msgSend(v25, "recordID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "recordName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v40, "containsObject:", v28);

        if ((v29 & 1) == 0)
        {
          objc_msgSend(v11, "guid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", v25, v30);

          objc_msgSend(v25, "recordID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "recordName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v32);
LABEL_23:

        }
LABEL_25:

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v8);
  }

  return v37;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processMessageUsingCKRecord:", v3);

}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL8 v30;
  _BOOL4 v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extractServerRecordFromCKServerErrorRecordChanged:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "wasRecordAlreadyChanged:", v10))
  {
    objc_msgSend(v8, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqualToString:", v16);

    if (v17)
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processMessageUsingCKRecord:", v13);

      goto LABEL_38;
    }
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "recordID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "recordName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412546;
        v37 = (uint64_t)v27;
        v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Conflicting serverRecord was different than the one being updated (server: %@, local: %@)", (uint8_t *)&v36, 0x16u);

      }
    }
LABEL_32:
    -[IMDMessageStore _resetSyncStateForMessageWithGUID:toState:](self, "_resetSyncStateForMessageWithGUID:toState:", v9, 2);
    goto LABEL_38;
  }
  v20 = objc_msgSend(v11, "wasZoneNotFound:", v10);
  if ((_DWORD)v20)
  {
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "recordName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412546;
        v37 = (uint64_t)v22;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Zone was not found for recordName (%@) with local guid (%@)", (uint8_t *)&v36, 0x16u);

      }
    }
    -[IMDMessageStore _resetSyncStateForMessageWithGUID:toState:](self, "_resetSyncStateForMessageWithGUID:toState:", v9, 0);
  }
  else
  {
    v23 = objc_msgSend(v11, "wasUnknownItem:", v10);
    if ((_DWORD)v23)
    {
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", (uint8_t *)&v36, 2u);
        }

      }
      goto LABEL_32;
    }
    v29 = objc_msgSend(v11, "wasRecordArchived:", v10);
    if (!(_DWORD)v29)
    {
      if (IMOSLoggingEnabled(v29))
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v36 = 134217984;
          v37 = objc_msgSend(v10, "code");
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Encountered an unknown error.  We'll try syncing this message again on the next sync. Error code: %llu", (uint8_t *)&v36, 0xCu);
        }

      }
      goto LABEL_32;
    }
    v30 = -[IMDMessageStore _checkIfRecord:hasBadChatIDForMessageGUID:](self, "_checkIfRecord:hasBadChatIDForMessageGUID:", v13, v9);
    v31 = v30;
    v32 = IMOSLoggingEnabled(v30);
    if (v31)
    {
      if (v32)
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Archived Server Record has incorrect parent Chat ID, marking record as needing T3 update", (uint8_t *)&v36, 2u);
        }

      }
      -[IMDMessageStore _resetSyncStateForMessageWithGUID:toState:](self, "_resetSyncStateForMessageWithGUID:toState:", v9, 9);
    }
    else
    {
      if (v32)
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Record was archived, marking record as synced", (uint8_t *)&v36, 2u);
        }

      }
      -[IMDMessageStore _resetSyncStateForMessageWithGUID:toState:](self, "_resetSyncStateForMessageWithGUID:toState:", v9, 1);
    }
  }
LABEL_38:

}

- (BOOL)_checkIfRecord:(id)a3 hasBadChatIDForMessageGUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  v6 = a3;
  -[IMDMessageStore chatForMessageGUID:](self, "chatForMessageGUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "cloudKitChatID");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentChatIDForMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "isEqualToString:", v9) ^ 1;

      v11 = (void *)v9;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_resetSyncStateForMessageWithGUID:(id)a3 toState:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  -[IMDMessageStore itemWithGUID:](self, "itemWithGUID:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCloudKitRecordID:", 0);
  objc_msgSend(v9, "setCloudKitRecordChangeTag:", 0);
  objc_msgSend(v9, "setCloudKitSyncState:", a4);
  objc_msgSend(v9, "setCloudKitServerChangeTokenBlob:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BYTE2(v8) = 1;
    LOWORD(v8) = 0;
    v6 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:", v9, 0, 0, 0, 0x2000, 1, v8);
  }
  else
  {
    v7 = -[IMDMessageStore storeItem:forceReplace:](self, "storeItem:forceReplace:", v9, 0);
  }

}

- (void)legacyImport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_stringForKey:", CFSTR("chatID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDMessageStore visitedChats](self, "visitedChats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDMessageStore visitedChats](self, "visitedChats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v5);

    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", &unk_1E9271248, v5);
    }

    -[IMDMessageStore visitedChats](self, "visitedChats");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 138412546;
        v18 = v5;
        v19 = 1024;
        v20 = objc_msgSend(v13, "intValue");
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found parentChatID: %@, updatedLastMessageCount: %d", (uint8_t *)&v17, 0x12u);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processMessageUsingCKRecord:updatedLastMessageCount:", v4, objc_msgSend(v13, "intValue"));

  }
  else
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processMessageUsingCKRecord:", v4);

  }
}

- (IMDMessageStore)init
{
  IMDMessageStore *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDMessageStore;
  v2 = -[IMDMessageStore init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addListener:", v2);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore setModificationStamp:](v2, "setModificationStamp:", v4);

    v2->_suppressedUpdates = 0;
    v5 = (id)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
    -[IMDMessageStore performInitialHousekeeping](v2, "performInitialHousekeeping");
    objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDelegate:", v2);

    v7 = objc_alloc(MEMORY[0x1E0D39B08]);
    v8 = (void *)objc_msgSend(v7, "initWithObject:title:queue:", v2, CFSTR("IMDChatStore-AllUnreadMessages"), MEMORY[0x1E0C80D38]);
    -[IMDMessageStore setStateCaptureAssistant:](v2, "setStateCaptureAssistant:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IMDMessageStore setVisitedChats:](v2, "setVisitedChats:", v9);

  }
  return v2;
}

- (void)performInitialHousekeeping
{
  NSObject *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t IsFull;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Performing initial database housekeeping", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInternalInstall"))
  {
    v4 = IMIsRunningInUnitTesting();

    if (v4)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Bailing out of initial housekeeping, currently under unit testing", v12, 2u);
        }

      }
      return;
    }
  }
  else
  {

  }
  if (qword_1ED935FD0 != -1)
    dispatch_once(&qword_1ED935FD0, &unk_1E922C140);
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "  => Failing all unsent, unfailed messages", v11, 2u);
    }

  }
  IMDMessageRecordMarkFailedAllUnsentUnfailedMessages();
  IsFull = IMDSMSRecordIsFull();
  if ((_DWORD)IsFull)
  {
    if (IMOSLoggingEnabled(IsFull))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "  => Database was full, waiting to post", v10, 2u);
      }

    }
    im_dispatch_after();
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMDMessageStore;
  -[IMDMessageStore dealloc](&v4, sel_dealloc);
}

- (id)_chatRegistrySharedInstance
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (void)focusStateDidChange
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Focus state changed, rebuilding unread message count", buf, 2u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14FF304;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateModificationDate
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSNumber *cachedUnreadMessageCount;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore setModificationStamp:](self, "setModificationStamp:", v3);

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Resetting _cachedUnreadMessageCount because _updateModificationDate", v7, 2u);
    }

  }
  cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
  self->_cachedUnreadMessageCount = 0;

}

- (void)_performBlock:(id)a3 afterDelay:(double)a4
{
  im_dispatch_after();
}

+ (BOOL)_updateCacheForMessageGUID:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 updateLastMessage:(BOOL)a6 calculateUnreadCount:(BOOL)a7
{
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _BOOL4 v29;
  _BOOL4 v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v29 = a6;
  v30 = a7;
  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v32 = a5;
  if (IMOSLoggingEnabled(v32))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v30)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v39 = v9;
      v40 = 2112;
      v41 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Updating cache for message guid: %@ calculateUnreadCount %@", buf, 0x16u);
    }

  }
  if (v9)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedChats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1D17EA968]();
          objc_msgSend(v17, "lastMessage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "guid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v9);

          if (v21)
          {
            if (IMOSLoggingEnabled(v22))
            {
              OSLogHandleForIMFoundationCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "  **** Updating this chat!", buf, 2u);
              }

            }
            if (v29)
            {
              +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "updateLastMessageForChat:hintMessage:", v17, v32);

            }
            +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOWORD(v28) = v30;
            objc_msgSend(v26, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", v17, v31, v32, 0, 0, 1, v28);

            objc_autoreleasePoolPop(v18);
            v23 = 1;
            goto LABEL_24;
          }
          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v14)
          continue;
        break;
      }
    }
    v23 = 0;
LABEL_24:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_storeAttachmentsForMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "fileTransferGUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138412290;
    v23 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "transferForGUID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8), v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "storeAttachment:associateWithMessageWithGUID:", v9, v11);

          v12 = objc_msgSend(v9, "isAuxImage");
          if ((_DWORD)v12)
          {
            if (IMOSLoggingEnabled(v12))
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v23;
                v30 = v9;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Storing Aux image transfer %@", buf, 0xCu);
              }

            }
            +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0D39848];
            objc_msgSend(v9, "guid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "AuxGUIDFromFileTransferGUID:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "transferForGUID:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "storeAttachment:associateWithMessageWithGUID:", v18, 0);

            }
            else if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v9, "guid");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v23;
                v30 = v22;
                _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "_storeAttachmentsForMessage did not find Aux video transfer %@", buf, 0xCu);

              }
            }

          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }

}

- (void)updateFileTransfer:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Updating transfer: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeAttachment:associateWithMessageWithGUID:", v4, 0);

    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentWithGUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMessageGUID:", v10);

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v9;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Posting resulting transfer to clients; %@",
          (uint8_t *)&v15,
          0xCu);
      }

    }
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTransfer:forGUID:", v9, v14);

  }
}

- (id)storeItem:(id)a3 forceReplace:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int IsFull;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id AttachmentIfNeededRef;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (v11 = objc_msgSend(v10, "supportsDatabase"), (v11 & 1) == 0))
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v10;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, " => Not storing item, service: %@  does not support a database", (uint8_t *)&v28, 0xCu);
        }

      }
      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v7;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Not storing: %@", (uint8_t *)&v28, 0xCu);
        }

      }
      AttachmentIfNeededRef = v7;
    }
    else
    {

      v12 = (void *)MEMORY[0x1D17EA968]();
      IsFull = IMDSMSRecordIsFull();
      objc_msgSend(v7, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDMessageStore _itemsWithGUIDs:](self, "_itemsWithGUIDs:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          IMDUpdateIMItemWithIMItemForceReplace();
          AttachmentIfNeededRef = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          AttachmentIfNeededRef = 0;
        }

      }
      else
      {
        v22 = (const void *)IMDCreateIMDMessageRecordRefFromIMMessageItem();
        objc_msgSend(v7, "handle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AttachmentIfNeededRef = (id)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v22, v23);

        if (v22)
          CFRelease(v22);
      }
      v24 = IMDSMSRecordIsFull();

      objc_autoreleasePoolPop(v12);
      if (IMOSLoggingEnabled(v25))
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v28 = 138412546;
          v29 = v7;
          v30 = 2112;
          v31 = AttachmentIfNeededRef;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Stored item to database: %@:%@", (uint8_t *)&v28, 0x16u);
        }

      }
      -[IMDMessageStore updateStamp](self, "updateStamp");
      sub_1D14FFFAC(IsFull != 0, v24 != 0);
    }
  }
  else
  {
    AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (id)updateSyndicatedMessageWithSyndicationMessageAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D39948]), "initWithSyndicationAction:", v4);
    objc_msgSend(v4, "messagePartGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore updateSyndicatedMessageWithMessageGUID:newRange:](self, "updateSyndicatedMessageWithMessageGUID:newRange:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = IMOSLoggingEnabled(v9);
    if (v8)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13 = 138412546;
          v14 = v4;
          v15 = 2112;
          v16 = v5;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updated syndication ranges with SyndicationAction %@. newRange: %@", (uint8_t *)&v13, 0x16u);
        }
LABEL_13:

      }
    }
    else if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Did NOT update IMMessageItem's syndication ranges for SyndicationAction %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D166A148();
    v8 = 0;
  }

  return v8;
}

- (id)updateSyndicatedMessageWithMessageGUID:(id)a3 newRange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D166A174();
    goto LABEL_19;
  }
  -[IMDMessageStore messageWithGUID:](self, "messageWithGUID:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Message not found for syndication action for guid: %@", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v9 = -[IMDMessageStore updateSyndicatedMessageWithMessageItem:newRange:](self, "updateSyndicatedMessageWithMessageItem:newRange:", v8, v7);
  v10 = v9;
  v11 = IMOSLoggingEnabled(v9);
  if (!v10)
  {
    if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[NSObject guid](v8, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Did not updated syndication ranges for message item with guid %@. newRange: %@", (uint8_t *)&v18, 0x16u);

      }
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[NSObject guid](v8, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated syndication ranges for message item with guid %@. newRange: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  v8 = v8;
  v14 = v8;
LABEL_20:

  return v14;
}

- (BOOL)updateSyndicatedMessageWithMessageItem:(id)a3 newRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166A1A0();
    goto LABEL_14;
  }
  if (!v7)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166A1CC();
LABEL_14:
    v18 = 0;
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v10;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Updating syndication ranges for message item with guid %@. newRange: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "syndicationRanges");
  v11 = objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = (void *)MEMORY[0x1E0D39948];
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateMessagesRanges:withMessagePartSyndicationRanges:didUpdate:", v11, v13, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "setSyndicationRanges:", v14);
    LOWORD(v23) = 256;
    v15 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v6, 1, 0, 0, 0, 1, v23);
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Updated syndication ranges for message: %@", buf, 0xCu);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject componentsJoinedByString:](v11, "componentsJoinedByString:", CFSTR(",\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Did NOT update syndication ranges for message: %@\nNew Range:\n%@\nOriginal Ranges:\n%@", buf, 0x20u);

    }
  }

  v18 = v24 != 0;
LABEL_18:

  return v18;
}

- (void)_fixupStoringMessageIfNecessaryWithMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "scheduleType") == 2
    && objc_msgSend(v5, "errorCode")
    && objc_msgSend(v5, "scheduleState") != 4)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1D166A1F8();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDMessageStoreDomain"), objc_msgSend(v5, "errorCode"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("MessageStore attempted to store scheduled message with an invalid scheduleState"), v7, CFSTR("ScheduledMessageFailureStateNotSet"), 0);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMDMessageStore.m"), 685, CFSTR("Scheduled message is marked as a failure, but didn't transition the scheduleState"));

    objc_msgSend(v5, "setScheduleState:", 4);
  }

}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", a3, a4, a5, a6, a7, 1, v8);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", a3, a4, a5, a6, a7, a8, v10);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10
{
  uint64_t v11;

  BYTE2(v11) = 0;
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:", a3, a4, a5, a6, a7, a8, v11);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11
{
  uint64_t v12;

  BYTE3(v12) = 0;
  *(_WORD *)((char *)&v12 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v12) = a9;
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", a3, a4, a5, a6, a7, a8, v12, 0);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11 isIncomingMessage:(BOOL)a12 didReplaceBlock:(id)a13
{
  id v14;
  void (**v15)(void);
  void (**v16)(void);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id AttachmentIfNeededRef;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  const void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  char v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int IsFull;
  void *context;
  _BOOL4 v59;
  void (**v60)(void);
  void *v61;
  uint64_t v62;
  void *v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v59 = a8;
  v68 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (void (**)(void))a13;
  v16 = v15;
  if (!v14)
  {
    AttachmentIfNeededRef = 0;
    goto LABEL_64;
  }
  v60 = v15;
  if (!a11)
  {
    v24 = v14;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "service");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serviceWithName:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 && (v28 = objc_msgSend(v27, "supportsDatabase"), (v28 & 1) == 0))
    {
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v27;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, " => Not storing message, service: %@  does not support a database", buf, 0xCu);
        }

      }
    }
    else if ((objc_msgSend(v24, "isTypingMessage") & 1) == 0)
    {
      v29 = objc_msgSend(v24, "isSuggestedActionResponse");

      if (!v29)
        goto LABEL_3;
LABEL_25:
      v33 = objc_msgSend(v24, "isTypingMessage");
      v34 = v33;
      v35 = IMOSLoggingEnabled(v33);
      if ((v34 & 1) != 0)
      {
        v16 = v60;
        if (v35)
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v24, "guid");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v65 = v37;
            v66 = 2112;
            v67 = v24;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Message %@ is a typing message, not storing %@", buf, 0x16u);

          }
LABEL_33:

          v16 = v60;
        }
      }
      else
      {
        v16 = v60;
        if (v35)
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v24;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Not storing: %@", buf, 0xCu);
          }
          goto LABEL_33;
        }
      }
      AttachmentIfNeededRef = v24;
      goto LABEL_64;
    }

    goto LABEL_25;
  }
LABEL_3:
  context = (void *)MEMORY[0x1D17EA968]();
  -[IMDMessageStore _fixupStoringMessageIfNecessaryWithMessage:](self, "_fixupStoringMessageIfNecessaryWithMessage:", v14);
  IsFull = IMDSMSRecordIsFull();
  objc_msgSend(v14, "guid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore _itemsWithGUIDs:](self, "_itemsWithGUIDs:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = (void *)objc_msgSend(v20, "copy");
      IMDUpdateIMMessageItemWithIMMessageItemForceReplaceReplaceError();
      AttachmentIfNeededRef = (id)objc_claimAutoreleasedReturnValue();
      if (v60)
        v60[2]();

    }
    else
    {
      AttachmentIfNeededRef = 0;
    }

  }
  else
  {
    v30 = (const void *)IMDCreateIMDMessageRecordRefFromIMMessageItem();
    if (!v30)
    {
      IMLogHandleForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1D166A2B8();

    }
    -[IMDMessageStore _storeAttachmentsForMessage:](self, "_storeAttachmentsForMessage:", v14);
    if ((objc_msgSend(v14, "isFromMe") & 1) != 0)
      objc_msgSend(v14, "handle");
    else
      objc_msgSend(v14, "sender");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    AttachmentIfNeededRef = (id)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v30, v38);

    if (!AttachmentIfNeededRef)
    {
      IMLogHandleForCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_1D166A258();

    }
    if (v30)
      CFRelease(v30);
  }
  v40 = IMDSMSRecordIsFull();
  objc_msgSend(AttachmentIfNeededRef, "retractedPartIndexes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isInboxSummaryEnabled");

  if (v42)
    v45 = v44;
  else
    v45 = 0;
  if (v45 == 1)
  {
    objc_msgSend(AttachmentIfNeededRef, "guid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore chatForMessageGUID:](self, "chatForMessageGUID:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v62 = *MEMORY[0x1E0D37740];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "updateProperties:shouldBroadcast:", v49, 1);

    }
  }
  if (a10)
  {
    objc_msgSend(AttachmentIfNeededRef, "guid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "length"))
    {
      if (objc_msgSend(AttachmentIfNeededRef, "isFullyRetracted"))
      {
        v61 = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        IMDCoreSpotlightDeleteMessageGUIDS();

      }
      else
      {
        IMDCoreSpotlightAddMessageGUID();
      }
    }

  }
  objc_autoreleasePoolPop(context);
  if (IMOSLoggingEnabled(v52))
  {
    OSLogHandleForIMFoundationCategory();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v65 = AttachmentIfNeededRef;
      _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Stored message: %@", buf, 0xCu);
    }

  }
  if (v59)
  {
    objc_msgSend(AttachmentIfNeededRef, "guid");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDMessageStore _updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:](IMDMessageStore, "_updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:", v54, v14, AttachmentIfNeededRef, 1, a9);

  }
  -[IMDMessageStore _storeAttachmentsForMessage:](self, "_storeAttachmentsForMessage:", AttachmentIfNeededRef);
  -[IMDMessageStore updateStamp](self, "updateStamp");
  sub_1D14FFFAC(IsFull != 0, v40 != 0);
  objc_msgSend(v14, "notificationIDSTokenURI");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AttachmentIfNeededRef, "setNotificationIDSTokenURI:", v55);

  v16 = v60;
LABEL_64:

  return AttachmentIfNeededRef;
}

- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length")
    && objc_msgSend(v8, "length")
    && objc_msgSend(v9, "length")
    && (objc_msgSend(v7, "isEqualToIgnoringCase:", v8) & 1) == 0)
  {
    v10 = (void *)IMDHandleRecordCopyHandleForIDOnService();
    if (v10)
    {
      v11 = (void *)IMDHandleRecordCopyCountry();
      v12 = IMDHandleRecordBulkUpdate();
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = 138412802;
          v15 = v8;
          v16 = 2112;
          v17 = v7;
          v18 = 2112;
          v19 = v9;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Updated from %@->%@  on service: %@", (uint8_t *)&v14, 0x20u);
        }

      }
    }

  }
}

- (id)_itemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *AttachmentIfNeededRef;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v9;
    if (a7)
    {
      objc_msgSend(v9, "reverseObjectEnumerator");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v9;
    }
    v13 = v12;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1D17EA968]();
          AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v18, v10);
          if (AttachmentIfNeededRef)
            objc_msgSend(v11, "addObject:", AttachmentIfNeededRef);

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v9 = v22;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)_messageItemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *AttachmentIfNeededRef;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    if (a7)
    {
      objc_msgSend(v9, "reverseObjectEnumerator");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v9;
    }
    v12 = v11;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v9);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1D17EA968]();
          AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v17, v10);
          if (AttachmentIfNeededRef)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v22, "addObject:", AttachmentIfNeededRef);
          }

          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v9 = v21;
  }
  else
  {
    v22 = (id)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

- (BOOL)_hasMessagesWithGUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17EA968]();
  v5 = (void *)IMDMessageRecordCopyMessagesForGUIDs();
  v6 = objc_msgSend(v5, "count") != 0;

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (id)_itemsWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *AttachmentIfNeededRef;
  uint64_t isKindOfClass;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *context;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1D17EA968]();
  v25 = v4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (id)IMDMessageRecordCopyMessagesForAssociatedGUID();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v9, 0);
        if (AttachmentIfNeededRef)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            v12 = AttachmentIfNeededRef;
            objc_msgSend(v12, "associatedMessageGUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v25);

            if ((v14 & 1) != 0)
            {
              objc_msgSend(v24, "addObject:", v12);
            }
            else
            {
              v17 = IMOSLoggingEnabled(v15);
              if ((_DWORD)v17)
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "************* Please file a radar!!!!!!!!!!! *******************************", buf, 2u);
                }

              }
              if (IMOSLoggingEnabled(v17))
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v12, "associatedMessageGUID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "associatedMessageGUID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v31 = v20;
                  v32 = 2112;
                  v33 = v21;
                  _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "A message returned by IMDMessageRecordCopyMessagesForAssociatedGUID is associated to %@ instead of the requested GUID %@.", buf, 0x16u);

                }
              }
            }

          }
          else if (IMOSLoggingEnabled(isKindOfClass))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v31 = AttachmentIfNeededRef;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "IMDMessageRecordCopyMessagesForAssociatedGUID resulted in a non-associated message item: %@", buf, 0xCu);
            }

          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
  return v24;
}

- (id)_itemsWithGUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *AttachmentIfNeededRef;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *context;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1D17EA968]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
  v24 = v3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (id)IMDMessageRecordCopyMessagesForGUIDs();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v9, 0);
        v11 = AttachmentIfNeededRef;
        if (AttachmentIfNeededRef)
        {
          objc_msgSend(AttachmentIfNeededRef, "guid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "containsObject:", v12))
          {

LABEL_10:
            objc_msgSend(v25, "addObject:", v11);
            goto LABEL_11;
          }
          objc_msgSend(v11, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToIgnoringCase:", *MEMORY[0x1E0D38F58]);

          if ((v14 & 1) != 0)
            goto LABEL_10;
          v16 = IMOSLoggingEnabled(v15);
          if ((_DWORD)v16)
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "************* Please file a radar!!!!!!!!!!! *******************************", buf, 2u);
            }

          }
          if (IMOSLoggingEnabled(v16))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "guid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "guid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v31 = v19;
              v32 = 2112;
              v33 = v20;
              v34 = 2112;
              v35 = v24;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "GUID we got from IMDMessageRecordCopyMessagesForGUIDs wasn't one of the guids we requested. IMItem we got back was: %@, IMDMessageRecordRef guid we got was: %@, requested guids was: %@", buf, 0x20u);

            }
          }
        }
LABEL_11:

        ++v8;
      }
      while (v6 != v8);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      v6 = v21;
    }
    while (v21);
  }

  objc_autoreleasePoolPop(context);
  return v25;
}

- (id)_itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _BYTE v30[22];
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v8 = a8;
  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void *)MEMORY[0x1D17EA968]();
  v19 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  if (IMOSLoggingEnabled(objc_msgSend(v19, "startTimingForKey:", CFSTR("history query"))))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      *(_DWORD *)v30 = 138413570;
      *(_QWORD *)&v30[4] = v16;
      *(_WORD *)&v30[12] = 2112;
      if (v8)
        v21 = CFSTR("YES");
      *(_QWORD *)&v30[14] = v14;
      v31 = 2112;
      v32 = v15;
      v33 = 2048;
      v34 = a7;
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v21;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Requesting history with guid: %@ handles: %@ services: %@ limit: %llu thread identifier: %@ only messages: %@", v30, 0x3Eu);
    }

  }
  v22 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier();
  objc_msgSend(v19, "stopTimingForKey:", CFSTR("history query"));
  objc_msgSend(v19, "startTimingForKey:", CFSTR("generate chat items"));
  v23 = objc_msgSend(v14, "count");
  if (v23 == 1)
  {
    objc_msgSend(v14, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  -[IMDMessageStore _itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v22, v24, 1, 1, 1, *(_OWORD *)v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == 1)

  if (IMOSLoggingEnabled(objc_msgSend(v19, "stopTimingForKey:", CFSTR("generate chat items"))))
  {
    OSLogHandleForIMEventCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v30 = 138412290;
      *(_QWORD *)&v30[4] = v19;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "history query timing: %@", v30, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v18);
  if (v25)
    v27 = v25;
  else
    v27 = (void *)MEMORY[0x1E0C9AA60];
  v28 = v27;

  return v28;
}

- (id)_itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8
{
  int v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v8 = a7;
  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x1D17EA968]();
  v18 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier();
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v24 = 138413058;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 1024;
      v29 = v8;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "_messagesWithRoomNames: %@ onServices %@ limit %d recordStoreRecords: %@", (uint8_t *)&v24, 0x26u);
    }

  }
  -[IMDMessageStore _itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v18, 0, 1, 1, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v17);
  if (v20)
    v21 = v20;
  else
    v21 = (void *)MEMORY[0x1E0C9AA60];
  v22 = v21;

  return v22;
}

- (id)_itemsWithHandlesBeforeAndAfterGUID:(id)a3 handles:(id)a4 onServices:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *context;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BYTE v38[10];
  unint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  context = (void *)MEMORY[0x1D17EA968]();
  v20 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  if (IMOSLoggingEnabled(objc_msgSend(v20, "startTimingForKey:", CFSTR("paged history query"))))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      v35 = 2112;
      v36 = v18;
      v37 = 2048;
      *(_QWORD *)v38 = a6;
      *(_WORD *)&v38[8] = 2048;
      v39 = a7;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Requesting history with guid: %@ handles: %@ services: %@ number before: %llu number after: %llu thread identifier: %@", buf, 0x3Eu);
    }

  }
  v22 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier();
  if (IMOSLoggingEnabled(objc_msgSend(v20, "stopTimingForKey:", CFSTR("paged history query"))))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 138413570;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v16;
      v37 = 1024;
      *(_DWORD *)v38 = a6;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = a7;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = v24;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "_limitedNumberOfMessagesWithHandles: %@ services: %@ messageGUID: %@ numberOfMessagesBefore: %d, numberOfMessagesAfter: %d record count: %d", buf, 0x32u);
    }

  }
  objc_msgSend(v20, "startTimingForKey:", CFSTR("generate chat items"));
  -[IMDMessageStore _itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v22, 0, 1, 1, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(objc_msgSend(v20, "stopTimingForKey:", CFSTR("generate chat items"))))
  {
    OSLogHandleForIMEventCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "paged history query timing: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(context);
  if (v25)
    v27 = v25;
  else
    v27 = (void *)MEMORY[0x1E0C9AA60];
  v28 = v27;

  return v28;
}

- (id)_unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v7 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1D17EA968]();
  v14 = (void *)IMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID();
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = 138413058;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 1024;
      v27 = v7;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "_unreadMessagesWithHandles: %@ onServices %@ limit %d recordStoreRecords: %@", (uint8_t *)&v22, 0x26u);
    }

  }
  v16 = objc_msgSend(v10, "count");
  if (v16 == 1)
  {
    objc_msgSend(v10, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[IMDMessageStore _messageItemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_messageItemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v14, v17, 1, 1, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == 1)

  objc_autoreleasePoolPop(v13);
  if (v18)
    v19 = v18;
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  return v20;
}

- (id)_unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v7 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1D17EA968]();
  v14 = (void *)IMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID();
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = 138413314;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 1024;
      v25 = v7;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "_unreadMessagesWithRoomNames: %@ onServices %@ limit %d fallbackGUID %@ recordStoreRecords: %@", (uint8_t *)&v20, 0x30u);
    }

  }
  -[IMDMessageStore _messageItemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_messageItemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v14, 0, 1, 1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  if (v16)
    v17 = v16;
  else
    v17 = (void *)MEMORY[0x1E0C9AA60];
  v18 = v17;

  return v18;
}

- (void)registerTransfersWithGUIDs:(id)a3 forMessageGUID:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  void *v30;
  uint64_t v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  v7 = objc_msgSend(v6, "count");
  v30 = v6;
  v31 = v7;
  if (v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v40 = objc_msgSend(v6, "count");
        v41 = 2112;
        v42 = (uint64_t)v6;
        v43 = 2112;
        v44 = v32;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Ensure transfers(count=%lu) with GUIDs registered: %@ for message: %@", buf, 0x20u);
      }

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v9)
    {
      v11 = 0;
      v12 = *(_QWORD *)v35;
      v13 = *MEMORY[0x1E0D36168];
      *(_QWORD *)&v10 = 138412290;
      v29 = v10;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[IMDMessageStore _fileTransferCenter](self, "_fileTransferCenter", v29);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "transferForGUID:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218498;
              v40 = v11 + i + 1;
              v41 = 2048;
              v42 = v31;
              v43 = 2112;
              v44 = v17;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Existing transfer: %lu/%lu %@", buf, 0x20u);
            }

          }
          if (v17)
          {
            -[IMDMessageStore _fileTransferCenter](self, "_fileTransferCenter");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addTransfer:forGUID:", v17, v15);
          }
          else
          {
            +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "attachmentWithGUID:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = IMOSLoggingEnabled(v22);
            if ((_DWORD)v23)
            {
              OSLogHandleForIMFoundationCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                v40 = (uint64_t)v20;
                _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Found saved transfer from DB: %@", buf, 0xCu);
              }

            }
            if (v20)
            {
              if (v32)
                v23 = objc_msgSend(v20, "setMessageGUID:", v32);
              if (IMOSLoggingEnabled(v23))
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v29;
                  v40 = (uint64_t)v20;
                  _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "New transfer: %@", buf, 0xCu);
                }

              }
              -[IMDMessageStore _fileTransferCenter](self, "_fileTransferCenter");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addTransfer:forGUID:", v20, v15);

            }
          }

          if (v11 + i + 1 >= v13)
          {
            if (IMOSLoggingEnabled(v27))
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                v40 = v31 - v13;
                v41 = 2048;
                v42 = v31;
                _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Not registering %lu/%lu transfers, too many for one message", buf, 0x16u);
              }

            }
            goto LABEL_38;
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v11 += i;
        if (v9)
          continue;
        break;
      }
    }
LABEL_38:

  }
}

- (id)_fileTransferCenter
{
  return +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
}

- (id)messagesWithAssociatedGUID:(id)a3
{
  return -[IMDMessageStore messagesWithAssociatedGUID:shouldLoadAttachments:](self, "messagesWithAssociatedGUID:shouldLoadAttachments:", a3, 1);
}

- (id)messagesWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *context;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = objc_msgSend(v21, "length");
  if (v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v4)
          v8 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v27 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Should load attachments for associated messages %@", buf, 0xCu);
      }

    }
    context = (void *)MEMORY[0x1D17EA968]();
    -[IMDMessageStore _itemsWithAssociatedGUID:shouldLoadAttachments:](self, "_itemsWithAssociatedGUID:shouldLoadAttachments:", v21, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = 0;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          if (!v10)
            v10 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[__CFString addObject:](v10, "addObject:", v14);
          if (v4)
          {
            objc_msgSend(v14, "fileTransferGUIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "guid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v15, v16);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v11);
    }

    objc_autoreleasePoolPop(context);
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found messages with associated guids: %@  (%@)", buf, 0x16u);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)messagesWithGUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *context;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    context = (void *)MEMORY[0x1D17EA968]();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[IMDMessageStore _itemsWithGUIDs:](self, "_itemsWithGUIDs:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(v10, "type"))
          {
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "addObject:", v10);
            objc_msgSend(v10, "fileTransferGUIDs");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "guid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v11, v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v7);
    }

    objc_autoreleasePoolPop(context);
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Found messages with guids: %@  (%@)", buf, 0x16u);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sortedMessageItemsWithFallbackHash:(id)a3 inChat:(id)a4 limit:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = (void *)MEMORY[0x1D17EA968]();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0D38298], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x1E0D382A0], v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1D150360C;
    v18[3] = &unk_1E922A050;
    v15 = v8;
    v19 = v15;
    objc_msgSend(v12, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v13, v11, v14, 1, v18);

    objc_autoreleasePoolPop(v9);
    v16 = (void *)objc_msgSend(v15, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (BOOL)canStoreItem:(id)a3 onService:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v5;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (v11 = objc_msgSend(v10, "supportsDatabase"), (v11 & 1) == 0))
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, " => Not storing item, service: %@  does not support a database", (uint8_t *)&v15, 0xCu);
        }

      }
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canStoreMessage:(id)a3 onService:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v5;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (v11 = objc_msgSend(v10, "supportsDatabase"), (v11 & 1) == 0))
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, " => Not storing message, service: %@  does not support a database", (uint8_t *)&v15, 0xCu);
        }

      }
    }
    else if ((objc_msgSend(v7, "isTypingMessage") & 1) == 0)
    {
      v12 = objc_msgSend(v7, "isSuggestedActionResponse") ^ 1;
LABEL_12:

      goto LABEL_13;
    }
    LOBYTE(v12) = 0;
    goto LABEL_12;
  }
  LOBYTE(v12) = 0;
LABEL_13:

  return v12;
}

- (BOOL)hasStoredMessageWithGUID:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    IMSingleObjectArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IMDMessageStore _hasMessagesWithGUIDs:](self, "_hasMessagesWithGUIDs:", v5);

    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        if (v6)
          v9 = CFSTR("YES");
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Have stored message for guid (%@): %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)itemWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore _itemsWithGUIDs:](self, "_itemsWithGUIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2048;
        v15 = v8;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Fetched item from database for guid (%@): %p", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)messageWithGUID:(id)a3
{
  return -[IMDMessageStore messageWithGUID:registerAttachments:](self, "messageWithGUID:registerAttachments:", a3, 0);
}

- (id)messageWithGUID:(id)a3 registerAttachments:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDMessageStore itemWithGUID:](self, "itemWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  if (v8)
  {
    v9 = v7;
    v7 = 0;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    objc_msgSend(v7, "fileTransferGUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v9, v10);

  }
LABEL_6:
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Stored message for guid (%@): %@", (uint8_t *)&v13, 0x16u);
    }

  }
  return v7;
}

- (id)messageForAttachmentGUID:(id)a3
{
  void *v3;
  void *AttachmentIfNeededRef;
  id v5;

  v3 = (void *)IMDAttachmentRecordCopyMessageForAttachmentGUID();
  AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v3, 0);
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = AttachmentIfNeededRef;

  return v5;
}

- (id)existingMessageSimilarToMessage:(id)a3 skipServices:(id)a4 skipGUIDs:(id)a5 withinTimeInterval:(double)a6 participants:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  void *AttachmentIfNeededRef;
  NSObject *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v50 = a5;
  v13 = a7;
  v51 = v11;
  if (v11)
  {
    v48 = v13;
    objc_msgSend(v12, "__imArrayByApplyingBlock:", &unk_1E922C1E0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "body");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "__stringByStrippingAttachmentAndControlCharacters");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sender");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v48, "count") < 2)
    {
      v41 = IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs();
      v40 = (const void *)v41;
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v48, "count"));
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v17 = v48;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v61 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "ID", v46);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "length"))
              objc_msgSend(v16, "addObject:", v21);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        }
        while (v18);
      }

      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      +[IMDServiceController sharedController](IMDServiceController, "sharedController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allServices");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v57 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
            if ((objc_msgSend(v12, "containsObject:", v28, v46) & 1) == 0)
            {
              +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "existingChatsForIDs:onService:style:", v16, v28, 43);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObjectsFromArray:", v30);

            }
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
        }
        while (v25);
      }

      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v33 = v22;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v53;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v53 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
            objc_msgSend(v37, "serviceName", v46);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v38);

            objc_msgSend(v37, "chatIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v39);

          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
        }
        while (v34);
      }

      v40 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDs();
    }
    if (v40
      && (AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v40, v49), CFRelease(v40), AttachmentIfNeededRef))
    {
      if (IMOSLoggingEnabled(v41))
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          v65 = AttachmentIfNeededRef;
          v66 = 2112;
          v67 = v51;
          v68 = 2112;
          v69 = v12;
          v70 = 2112;
          v71 = *(double *)&v50;
          v72 = 2048;
          v73 = a6;
          _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Found existing message: %@ similar to: %@   (Skip Services: %@   Skip GUIDs: %@   Within Time Interval: %f)", buf, 0x34u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v41))
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v65 = v51;
          v66 = 2112;
          v67 = v12;
          v68 = 2112;
          v69 = v50;
          v70 = 2048;
          v71 = a6;
          _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "No existing message similar to: %@   (Skip Services: %@   Skip GUIDs: %@   Within Time Interval: %f)", buf, 0x2Au);
        }

      }
      AttachmentIfNeededRef = 0;
    }

    v13 = v48;
  }
  else
  {
    AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (id)existingSOSMessageSimilarToMessage:(id)a3 matchingService:(id)a4 withinTimeInterval:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  const void *v17;
  void *AttachmentIfNeededRef;
  NSObject *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "body");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__stringByStrippingAttachmentAndControlCharacters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "isSOS");
    objc_msgSend(v7, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13 ^ 1;
    v16 = IMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID();
    if (v16
      && (v17 = (const void *)v16,
          AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v16, v12),
          CFRelease(v17),
          AttachmentIfNeededRef))
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v22 = 138413314;
          v23 = v8;
          v24 = 1024;
          v25 = v15;
          v26 = 2048;
          v27 = a5;
          v28 = 2112;
          v29 = AttachmentIfNeededRef;
          v30 = 2112;
          v31 = v7;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Found existing SOS message (Matching service: %@  Matching isSOS: %d  Within Time Interval: %f) - found message: %@ similar to: %@", (uint8_t *)&v22, 0x30u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 138413058;
          v23 = v8;
          v24 = 1024;
          v25 = v15;
          v26 = 2048;
          v27 = a5;
          v28 = 2112;
          v29 = v7;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "No existing SOS message (Matching service: %@  Matching isSOS: %d  Within Time Interval: %f) - similar to: %@", (uint8_t *)&v22, 0x26u);
        }

      }
      AttachmentIfNeededRef = 0;
    }

  }
  else
  {
    AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (void)markMessageAsDeduplicated:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "guid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "guid");
      IMDMessageRecordMarkMessageGUIDAsDeduplicated();
      v3 = v5;
    }
  }

}

- (BOOL)wasMessageDeduplicatedWithGUID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)IMDMessageRecordCopyMessageForGUID();
    v5 = objc_msgSend(v4, "wasDeduplicated");

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 136315138;
        v9 = "-[IMDMessageStore wasMessageDeduplicatedWithGUID:]";
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "%s received zero-length message GUID", (uint8_t *)&v8, 0xCu);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (id)messageWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *AttachmentIfNeededRef;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  AttachmentIfNeededRef = 0;
  if (v7 && v8)
  {
    v11 = IMDMessageRecordCopyMessageWithHandleOnServiceWithReplaceID();
    if (v11)
    {
      v12 = (const void *)v11;
      AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v11, v7);
      CFRelease(v12);
    }
    else
    {
      AttachmentIfNeededRef = 0;
    }
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15[0] = 67109378;
        v15[1] = a3;
        v16 = 2112;
        v17 = AttachmentIfNeededRef;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Stored message for replace ID (%d): %@", (uint8_t *)v15, 0x12u);
      }

    }
  }

  return AttachmentIfNeededRef;
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1D17EA968]();
  v29 = v14;
  v30 = v12;
  v28 = a7;
  -[IMDMessageStore _itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:onlyMessages:](self, "_itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:onlyMessages:", v12, v13, v14, v15, a7, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!objc_msgSend(v21, "type"))
        {
          objc_msgSend(v21, "fileTransferGUIDs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v22, v23);

        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v18);
  }

  objc_autoreleasePoolPop(v16);
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 67109890;
      v36 = v26;
      v37 = 2112;
      v38 = v30;
      v39 = 2112;
      v40 = v13;
      v41 = 1024;
      v42 = v28;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found %d messages with handles: %@ on services: %@  limit: %d", buf, 0x22u);
    }

  }
  return v17;
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1D17EA968]();
  v29 = v14;
  v30 = v12;
  v28 = a7;
  -[IMDMessageStore _itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:onlyMessages:](self, "_itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:onlyMessages:", v12, v13, v14, v15, a7, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!objc_msgSend(v21, "type"))
        {
          objc_msgSend(v21, "fileTransferGUIDs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v22, v23);

        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v18);
  }

  objc_autoreleasePoolPop(v16);
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 67109890;
      v36 = v26;
      v37 = 2112;
      v38 = v30;
      v39 = 2112;
      v40 = v13;
      v41 = 1024;
      v42 = v28;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found %d messages with room names: %@ on services: %@  limit: %d", buf, 0x22u);
    }

  }
  return v17;
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  int v33;
  int v34;
  int v36;
  int v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = (void *)MEMORY[0x1D17EA968]();
  v38 = v18;
  v39 = v16;
  v36 = a6;
  v37 = a7;
  v21 = a6;
  v22 = v19;
  -[IMDMessageStore _itemsWithHandlesBeforeAndAfterGUID:handles:onServices:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:hasMessagesBefore:hasMessagesAfter:](self, "_itemsWithHandlesBeforeAndAfterGUID:handles:onServices:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:hasMessagesBefore:hasMessagesAfter:", v18, v16, v17, v21, a7, v19, a9, a10);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (!objc_msgSend(v27, "type"))
        {
          objc_msgSend(v27, "fileTransferGUIDs");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "guid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v28, v29);

        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v24);
  }

  objc_autoreleasePoolPop(v20);
  if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(v23, "count");
      v33 = objc_msgSend(v39, "count");
      v34 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 67110144;
      v45 = v32;
      v46 = 1024;
      v47 = v33;
      v48 = 1024;
      v49 = v34;
      v50 = 1024;
      v51 = v36;
      v52 = 1024;
      v53 = v37;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "messagesWithHandlesBeforeAndAfterGUID found %d messages for number of ids: %d on number of services: %d numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x20u);
    }

  }
  return v23;
}

- (id)lastMessageWithHandles:(id)a3 onServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17EA968]();
  -[IMDMessageStore _itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:onlyMessages:](self, "_itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:onlyMessages:", v6, v7, 0, 0, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found last message: %@ with handles: %@ on services: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  return v10;
}

- (id)unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int v25;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  context = (void *)MEMORY[0x1D17EA968]();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = a5;
  v26 = v12;
  -[IMDMessageStore _unreadMessagesWithHandles:onServices:limit:fallbackGUID:](self, "_unreadMessagesWithHandles:onServices:limit:fallbackGUID:", v10, v11, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v18)
        {
          if (!v14)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "addObject:", v18);
          if (!objc_msgSend(v18, "type"))
          {
            objc_msgSend(v18, "fileTransferGUIDs");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "guid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v19, v20);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(context);
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109890;
      v33 = v23;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v11;
      v38 = 1024;
      v39 = v25;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found %d messages with handle: %@ on service: %@  limit: %d", buf, 0x22u);
    }

  }
  return v14;
}

- (id)unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int v25;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  context = (void *)MEMORY[0x1D17EA968]();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = a5;
  v26 = v12;
  -[IMDMessageStore _unreadMessagesWithRoomNames:onServices:limit:fallbackGUID:](self, "_unreadMessagesWithRoomNames:onServices:limit:fallbackGUID:", v10, v11, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v18)
        {
          if (!v14)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "addObject:", v18);
          if (!objc_msgSend(v18, "type"))
          {
            objc_msgSend(v18, "fileTransferGUIDs");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "guid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDMessageStore registerTransfersWithGUIDs:forMessageGUID:](self, "registerTransfersWithGUIDs:forMessageGUID:", v19, v20);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(context);
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109890;
      v33 = v23;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v11;
      v38 = 1024;
      v39 = v25;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found %d messages with handle: %@ on service: %@  limit: %d", buf, 0x22u);
    }

  }
  return v14;
}

- (id)lastMessageWithRoomNames:(id)a3 onServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17EA968]();
  -[IMDMessageStore _itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:onlyMessages:](self, "_itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:onlyMessages:", v6, v7, 0, 0, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found last message: %@ with room names: %@ on services: %@", (uint8_t *)&v14, 0x20u);
    }

  }
  return v10;
}

- (id)lastIncomingMessageForChatWithIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 onService:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0D382B8], MEMORY[0x1E0C9AAA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v27[0] = v8;
  v27[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0D38298], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)IMCopyGUIDForChat();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1D1505B84;
  v24 = sub_1D1505B94;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1D1505B9C;
  v19[3] = &unk_1E9228998;
  v19[4] = &v20;
  objc_msgSend(v15, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v14, v12, v16, 1, v19);

  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (id)messagesInChat:(id)a3 earliestDate:(id)a4 limit:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D38298];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), *MEMORY[0x1E0D38298], v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v9;
  v29[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1D1505B84;
  v26 = sub_1D1505B94;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1D1505EA0;
  v21[3] = &unk_1E9228998;
  v21[4] = &v22;
  objc_msgSend(v16, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v17, v14, v18, a5, v21);

  v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)scheduledMessagesBatchFetcher
{
  return -[IMDMessageStore scheduledMessagesBatchFetcherForChat:](self, "scheduledMessagesBatchFetcherForChat:", 0);
}

- (id)scheduledMessagesBatchFetcherForChat:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36100]), "initWithAssociatedChatGUID:", v4);
  else
    v5 = objc_alloc_init(MEMORY[0x1E0D36100]);
  v6 = v5;
  objc_msgSend(v5, "setBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lu"), *MEMORY[0x1E0D382E8], 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lu OR %K = %lu"), *MEMORY[0x1E0D382E0], 1, *MEMORY[0x1E0D382E0], 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v12);

  return v6;
}

- (id)scheduledMessagesBatchFetcherForSyncState:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D36100]);
  objc_msgSend(v4, "setBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lu"), *MEMORY[0x1E0D382E8], 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D38290], a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v5;
  v12[1] = v6;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v10);

  return v4;
}

- (id)messageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  unint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  _QWORD v47[5];

  v7 = a5;
  v47[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "startDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v40 = v9;
  objc_msgSend(v9, "endDate");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D38298];
  v39 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), *MEMORY[0x1E0D38298], v12);
  v16 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), v15, v13);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3528];
  v36 = (void *)v16;
  v37 = (void *)v14;
  v47[0] = v14;
  v47[1] = v16;
  v35 = (void *)v17;
  v47[2] = v17;
  v19 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v15, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v22 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v22);
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v7;
      v27 = v11;
      v28 = (void *)IMCopyGUIDForChat();
      v46 = v42;
      objc_msgSend(*(id *)(v19 + 3360), "arrayWithObjects:count:", &v46, 1);
      v29 = v19;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = sub_1D1506728;
      v44[3] = &unk_1E922A050;
      v45 = v21;
      objc_msgSend(v41, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v28, v43, v30, 10000, v44);

      v19 = v29;
      v11 = v27;
      v7 = v26;

      v10 = v23;
      ++v22;
    }
    while (v22 < objc_msgSend(v23, "count"));
  }
  v31 = objc_alloc(MEMORY[0x1E0D39908]);
  v32 = (void *)objc_msgSend(v21, "copy");
  v33 = (void *)objc_msgSend(v31, "initWithDateInterval:messages:", v40, v32);

  return v33;
}

- (id)oldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0D38298], 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1D1505B84;
  v23 = sub_1D1505B94;
  v24 = 0;
  while (v10 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)IMCopyGUIDForChat();
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1D1506B18;
    v18[3] = &unk_1E9228998;
    v18[4] = &v19;
    objc_msgSend(v9, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v13, v7, v14, 1, v18);

    ++v10;
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v15;
}

- (id)lastMessageForChatWithRowID:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1D1505B84;
  v12 = sub_1D1505B94;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1506D40;
  v7[3] = &unk_1E922C208;
  v7[4] = &v8;
  objc_msgSend(v4, "fetchLastMessageRecordForChatRecordWithRowID:completionHandler:", a3, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)lastTUConversationItemForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D1505B84;
  v16 = sub_1D1505B94;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %lld"), *MEMORY[0x1E0D382C0], 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0D38298], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D1506F9C;
  v11[3] = &unk_1E9228998;
  v11[4] = &v12;
  objc_msgSend(v5, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v6, v4, v8, 1, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)attachmentsWithHandles:(id)a3 onServices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17EA968]();
  v8 = (void *)IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices();
  objc_autoreleasePoolPop(v7);
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109634;
      v12[1] = objc_msgSend(v8, "count");
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Found %d filenames with handles: %@ on services: %@", (uint8_t *)v12, 0x1Cu);
    }

  }
  return v8;
}

- (id)attachmentsWithRoomNames:(id)a3 onServices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17EA968]();
  v8 = (void *)IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices();
  objc_autoreleasePoolPop(v7);
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109634;
      v12[1] = objc_msgSend(v8, "count");
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Found %d filenames with room names: %@ on services: %@ ", (uint8_t *)v12, 0x1Cu);
    }

  }
  return v8;
}

- (id)messageActionItemsForOriginalMessageGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *AttachmentIfNeededRef;
  uint64_t v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D17EA968]();
  v5 = (void *)IMDMessageRecordCopyMessageActionItemsForOriginalMessageGUID();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = objc_msgSend(v5, "objectAtIndex:", v6);
      if (v8)
      {
        AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v8, 0);
        if (AttachmentIfNeededRef)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v7, "addObject:", AttachmentIfNeededRef);
        }

      }
      ++v6;
    }
    while (objc_msgSend(v5, "count") > v6);
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v4);
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109378;
      v13[1] = objc_msgSend(v7, "count");
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Found %d message action items for original message guid: %@", (uint8_t *)v13, 0x12u);
    }

  }
  return v7;
}

- (id)frequentRepliesForForChatIdentifiers:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  int v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D17EA968]();
  v10 = (void *)IMDMessageRecordCopyFrequentRepliesForChatIdentifiersOnServicesUpToLimit();
  objc_autoreleasePoolPop(v9);
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109890;
      v14[1] = objc_msgSend(v10, "count");
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found %d messages with handles: %@ on services: %@  limit: %d", (uint8_t *)v14, 0x22u);
    }

  }
  return v10;
}

- (id)messagesWithReplyToGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *AttachmentIfNeededRef;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17EA968]();
  v5 = (void *)IMDMessageRecordCopyMessagesWithReplyToGUIDs();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x1D17EA968]();
      AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(objc_msgSend(v5, "objectAtIndex:", v7), 0);
      if (AttachmentIfNeededRef)
        objc_msgSend(v6, "addObject:", AttachmentIfNeededRef);

      objc_autoreleasePoolPop(v8);
      ++v7;
    }
    while (objc_msgSend(v5, "count") > v7);
  }

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)_missingMessageReadReceiptCache
{
  if (qword_1ED935FE0 != -1)
    dispatch_once(&qword_1ED935FE0, &unk_1E922C228);
  return (id)qword_1ED935FD8;
}

- (void)addMissingMessageReadReceipt:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDMessageStore _missingMessageReadReceiptCache](IMDMessageStore, "_missingMessageReadReceiptCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[IMDMessageStore _missingMessageReadReceiptCache](IMDMessageStore, "_missingMessageReadReceiptCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v3;
      v10 = 2048;
      v11 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Adding message GUID to readReceiptsForMissingMessage cache: %@ (size: %lu)", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (BOOL)popReadReceiptForMissingGUID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && (+[IMDMessageStore _missingMessageReadReceiptCache](IMDMessageStore, "_missingMessageReadReceiptCache"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "containsObject:", v3), v4, v5))
  {
    +[IMDMessageStore _missingMessageReadReceiptCache](IMDMessageStore, "_missingMessageReadReceiptCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v3);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enumerateMessagesToRelayOnService:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *AttachmentIfNeededRef;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D36100]);
  v8 = (void *)MEMORY[0x1E0CB3880];
  v18 = v5;
  objc_msgSend(v5, "internalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), *MEMORY[0x1E0D382C8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D382F0], v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v19);
  objc_msgSend(v7, "setBatchSize:", 100);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v14, "itemType"))
        {
          AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v14, 0);
          if (AttachmentIfNeededRef)
          {
            v6[2](v6, AttachmentIfNeededRef);
          }
          else if (IMOSLoggingEnabled(0))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "guid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v25 = v17;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Could not fetch IMMessageItem from record guid: %@", buf, 0xCu);

            }
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

}

- (id)chatForMessage:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore chatForMessageGUID:](self, "chatForMessageGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatForMessageGUID:(id)a3
{
  return -[IMDMessageStore chatForMessageGUID:enableVerboseLogging:](self, "chatForMessageGUID:enableVerboseLogging:", a3, 1);
}

- (id)chatForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4
{
  void *v4;
  void *v5;

  -[IMDMessageStore _chatsForMessageGUID:enableVerboseLogging:](self, "_chatsForMessageGUID:enableVerboseLogging:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__imFirstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatsForMessage:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore chatsForMessageGUID:](self, "chatsForMessageGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatsForMessageGUID:(id)a3
{
  return -[IMDMessageStore _chatsForMessageGUID:enableVerboseLogging:](self, "_chatsForMessageGUID:enableVerboseLogging:", a3, 1);
}

- (id)_chatsForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *context;
  _BOOL4 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (v24)
  {
    v23 = v4;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    context = (void *)MEMORY[0x1D17EA968]();
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatsGUIDsForMessageWithGUID:", v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v7;
        v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Found chat guids: %@ for message guid: %@", buf, 0x16u);
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "existingChatWithGUID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v5, "addObject:", v16);
          }
          else if (IMOSLoggingEnabled(v17))
          {
            OSLogHandleForIMEventCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v31 = v14;
              v32 = 2112;
              v33 = v24;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Couldn't find existing chat with guid: %@ in IMDChatRegistry for messageGUID: %@", buf, 0x16u);
            }

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    if (v23 && IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v5;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "   Found Chats: %@", buf, 0xCu);
      }

    }
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)chatForMessageIdentifier:(int64_t)a3
{
  void *v3;
  void *v4;

  -[IMDMessageStore _chatsForMessageIdentifier:](self, "_chatsForMessageIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imFirstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)existingChatForMessageGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatsGUIDsForMessageWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "__imFirstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_chatsForMessageIdentifier:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatsGUIDsForMessageWithIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v5;
      v28 = 2048;
      v29 = a3;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Found chat guids: %@ for message identifier: %lld", buf, 0x16u);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v10 = 138412546;
    v19 = v10;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "existingChatWithGUID:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v3, "addObject:", v15);
        }
        else if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMEventCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v27 = v13;
            v28 = 2048;
            v29 = a3;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Couldn't find existing chat with guid: %@ in IMDChatRegistry for messageIdentifier: %lld", buf, 0x16u);
          }

        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v3;
}

- (_IMDHandleRecordStruct)_copyHandle:(id)a3 onService:(id)a4
{
  return (_IMDHandleRecordStruct *)IMDHandleRecordCopyHandleForIDOnService();
}

- (BOOL)_isValidPhoneNumber:(id)a3 forCountryCode:(id)a4
{
  id v5;
  id v6;
  uint64_t (*v7)(id, id);
  char v8;

  v5 = a4;
  v6 = a3;
  v7 = (uint64_t (*)(id, id))MEMORY[0x1D17EA3F8]("PNIsValidPhoneNumberForCountry", CFSTR("CorePhoneNumbers"));
  v8 = v7(v6, v5);

  return v8;
}

- (id)cleanUnformattedPhoneNumber:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = -[IMDMessageStore _isValidPhoneNumber:forCountryCode:](self, "_isValidPhoneNumber:forCountryCode:", v8, v7);
  v10 = ((objc_msgSend(v8, "hasPrefix:", CFSTR("#")) & 1) != 0
      || objc_msgSend(v8, "hasPrefix:", CFSTR("*")))
     && (unint64_t)objc_msgSend(v8, "length") >= 5
     && (unint64_t)objc_msgSend(v8, "length") < 0xA;
  v11 = objc_msgSend(v8, "hasPrefix:", CFSTR("444"));
  if ((_DWORD)v11)
  {
    v11 = objc_msgSend(v8, "length");
    if (v11 == 7)
      v10 = 1;
  }
  v12 = v8;
  if (!v10)
  {
    v12 = v8;
    if (v9)
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412802;
          v16 = v8;
          v17 = 1024;
          v18 = 1;
          v19 = 1024;
          v20 = 0;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Cleaning up symbols from unformatted phone number %@ based on phoneNumberIsValid %d and phoneNumberIsShortCode %d", (uint8_t *)&v15, 0x18u);
        }

      }
      -[IMDMessageStore _cleanupPhoneNumber:](self, "_cleanupPhoneNumber:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (id)updatedMessagesForMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "arrayByApplyingSelector:", sel_guid);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore messagesWithGUIDs:](self, "messagesWithGUIDs:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v20, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          v23 = v22;
        else
          v23 = v20;
        objc_msgSend(v14, "addObject:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }

  v24 = (void *)objc_msgSend(v14, "copy");
  return v24;
}

- (id)_cleanupPhoneNumber:(id)a3
{
  return (id)IMCleanupPhoneNumber();
}

- (void)resolveUnformattedRepresentationsForHandles:(id)a3 onService:(id)a4 message:(id)a5 completionBlock:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _IMDHandleRecordStruct *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void (**v55)(_QWORD, _QWORD);
  id v56;
  id obj;
  id v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v62 = a4;
  v61 = a5;
  v9 = a6;
  if (v9)
  {
    v10 = v9;
    v55 = (void (**)(_QWORD, _QWORD))objc_msgSend(v9, "copy");

    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v56;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (!v60)
      goto LABEL_58;
    v59 = *(_QWORD *)v67;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v67 != v59)
        {
          v12 = v11;
          objc_enumerationMutation(obj);
          v11 = v12;
        }
        v64 = v11;
        v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v11);
        objc_msgSend(v13, "ID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "internalName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[IMDMessageStore _copyHandle:onService:](self, "_copyHandle:onService:", v14, v15);

        if (v16)
        {
          v17 = (void *)IMDHandleRecordCopyCountry();
          v18 = IMDHandleRecordCopyUncanonicalizedID();
          v19 = (void *)v18;
          if (v17)
          {
            if (v18)
              goto LABEL_10;
LABEL_17:
            objc_msgSend(v61, "unformattedID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_18;
LABEL_11:
            if (!v19)
              goto LABEL_19;
          }
          else
          {
            objc_msgSend(v61, "countryCode");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
              goto LABEL_17;
LABEL_10:
            if (v17)
              goto LABEL_11;
LABEL_18:
            objc_msgSend(v13, "countryCode");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
LABEL_19:
              objc_msgSend(v13, "unformattedID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          objc_msgSend(v13, "ID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "im_stripCategoryLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedPhoneNumberHandleForValue:isoCountryCode:", v24, v17);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0DBD2F8];
          objc_msgSend(v19, "im_stripCategoryLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v25, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v26, v17);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v63, "isoCountryCode");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v26, v28);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v27)
          {
            v29 = objc_msgSend(v27, "isEquivalentToHandle:", v63);
            if ((v29 & 1) == 0)
            {
              if (IMOSLoggingEnabled(v29))
              {
                OSLogHandleForIMFoundationCategory();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138413058;
                  v71 = v24;
                  v72 = 2112;
                  v73 = v19;
                  v74 = 2112;
                  v75 = v63;
                  v76 = 2112;
                  v77 = v27;
                  _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Canonicalized handle (%@) and unformatted handle (%@) were not equal - TU canonical: (%@) TU unformatted: (%@)", buf, 0x2Au);
                }

              }
              v19 = 0;
            }
          }
          -[IMDMessageStore cleanUnformattedPhoneNumber:countryCode:](self, "cleanUnformattedPhoneNumber:countryCode:", v19, v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "im_stripCategoryLabel");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "internalName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0D38F50]) & 1) != 0)
          {
            objc_msgSend(v13, "personCentricID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "__im_isSipHandle");

            if (v35)
            {
              if (IMOSLoggingEnabled(v36))
              {
                OSLogHandleForIMFoundationCategory();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v13, "personCentricID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v71 = v38;
                  v72 = 2112;
                  v73 = v24;
                  _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Found a chat bot sip handle %@, for %@", buf, 0x16u);

                }
              }
              v39 = (void *)MEMORY[0x1E0C99D80];
              objc_msgSend(v13, "personCentricID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v24, CFSTR("__kIMDMessageStoreHandleCanonicalIDKey"), v40, CFSTR("__kIMDMessageStoreHandleAlternateSIPID"), v32, CFSTR("__kIMDMessageStoreHandleUnformattedIDKey"), v17, CFSTR("__kIMDMessageStoreHandleCountryCodeKey"), 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v41)
                goto LABEL_41;
LABEL_40:
              objc_msgSend(v58, "addObject:", v41);
LABEL_41:

              CFRelease(v16);
              goto LABEL_56;
            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v24, CFSTR("__kIMDMessageStoreHandleCanonicalIDKey"), v32, CFSTR("__kIMDMessageStoreHandleUnformattedIDKey"), v17, CFSTR("__kIMDMessageStoreHandleCountryCodeKey"), 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
            goto LABEL_40;
          goto LABEL_41;
        }
        objc_msgSend(v61, "countryCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "unformattedID");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v20)
        {
          if (!v21)
            goto LABEL_43;
        }
        else
        {
          objc_msgSend(v13, "countryCode");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
LABEL_43:
            objc_msgSend(v13, "unformattedID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v42 = (void *)MEMORY[0x1E0DBD2F8];
        objc_msgSend(v13, "ID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v43, v20);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = (void *)MEMORY[0x1E0DBD2F8];
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedPhoneNumberHandleForValue:isoCountryCode:", v22, v20);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v44, "isoCountryCode");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v22, v47);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v48 = objc_msgSend(v46, "isEquivalentToHandle:", v44);
        if ((v48 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v48))
          {
            OSLogHandleForIMFoundationCategory();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v13, "ID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v71 = v50;
              v72 = 2112;
              v73 = v22;
              v74 = 2112;
              v75 = v44;
              v76 = 2112;
              v77 = v46;
              _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "Canonicalized handle (%@) and unformatted handle (%@) were not equal - TU canonical: (%@) TU unformatted: (%@)", buf, 0x2Au);

            }
          }

          v22 = 0;
        }
        -[IMDMessageStore cleanUnformattedPhoneNumber:countryCode:](self, "cleanUnformattedPhoneNumber:countryCode:", v22, v20);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(v13, "ID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "dictionaryWithObjectsAndKeys:", v53, CFSTR("__kIMDMessageStoreHandleCanonicalIDKey"), v51, CFSTR("__kIMDMessageStoreHandleUnformattedIDKey"), v20, CFSTR("__kIMDMessageStoreHandleCountryCodeKey"), 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
          objc_msgSend(v58, "addObject:", v54);

LABEL_56:
        v11 = v64 + 1;
      }
      while (v60 != v64 + 1);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (!v60)
      {
LABEL_58:

        ((void (**)(_QWORD, id))v55)[2](v55, v58);
        break;
      }
    }
  }

}

- (id)deleteMessageGUIDs:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  int v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int IsFull;
  void *context;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = v6;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    context = (void *)MEMORY[0x1D17EA968]();
    IsFull = IMDSMSRecordIsFull();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[IMDMessageStore _itemsWithGUIDs:](self, "_itemsWithGUIDs:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "guid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeMessage:fromChat:", v13, v7);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v10);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v27;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          +[IMDMessageStore _updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:](IMDMessageStore, "_updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 0, 0, 1, 1);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      }
      while (v17);
    }

    v20 = IMDSMSRecordIsFull();
    objc_autoreleasePoolPop(context);
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109634;
        v37 = v23;
        v38 = 2112;
        v39 = v16;
        v40 = 2112;
        v41 = v7;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Deleted %d messages with guids: %@ in chat: %@", buf, 0x1Cu);
      }

    }
    if (!objc_msgSend(v8, "count"))
    {

      v8 = 0;
    }
    -[IMDMessageStore updateStamp](self, "updateStamp");
    sub_1D14FFFAC(IsFull != 0, v20 != 0);
  }
  else
  {
    -[IMDMessageStore deleteMessageGUIDs:](self, "deleteMessageGUIDs:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)deleteMessageGUIDs:(id)a3
{
  id v4;
  void *v5;
  int IsFull;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17EA968]();
  IsFull = IMDSMSRecordIsFull();
  v22 = 0;
  IMDMessageRecordDeleteMessagesForGUIDs();
  v7 = 0;
  if (v7)
  {
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          +[IMDMessageStore _updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:](IMDMessageStore, "_updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 0, 0, 1, 1, (_QWORD)v18);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v9);
    }

    v12 = IMDSMSRecordIsFull();
    objc_msgSend(MEMORY[0x1E0D39890], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteInteractionsWithMessageGUIDs:", v8);

    objc_autoreleasePoolPop(v5);
    -[IMDMessageStore updateStamp](self, "updateStamp");
    sub_1D14FFFAC(IsFull != 0, v12 != 0);
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109378;
        v24 = v16;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Deleted %d messages with guids: %@", buf, 0x12u);
      }

    }
  }

  return v4;
}

- (void)_deleteMessagesWithGUIDs:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 batchNumber:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void (**v27)(_QWORD);
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  IMDMessageStore *v34;
  void (**v35)(_QWORD);
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unsigned __int8 v39;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v27 = (void (**)(_QWORD))a8;
  v28 = v13;
  v16 = objc_msgSend(v13, "count");
  v25 = a7;
  v17 = 1000 * a7;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v14, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v19, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)IMCopyGUIDForChat();

      if (objc_msgSend(v22, "length"))
        objc_msgSend(v18, "addObject:", v22);

      ++v19;
    }
    while (v19 < objc_msgSend(v14, "count"));
  }
  if (v17 >= v16)
  {
    v24 = v27;
    v23 = v28;
    if (v27)
      v27[2](v27);
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1D15097DC;
    v29[3] = &unk_1E922C270;
    v36 = v16;
    v37 = v17;
    v23 = v28;
    v30 = v28;
    v38 = v25;
    v31 = v14;
    v32 = v15;
    v24 = v27;
    v33 = v18;
    v34 = self;
    v39 = a5;
    v35 = v27;
    -[IMDMessageStore _performBlock:afterDelay:](self, "_performBlock:afterDelay:", v29, 2.0);

  }
}

- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v8 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19 = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "deleteMessageswithChatIdentifiers: %@ onServices: %@", (uint8_t *)&v19, 0x16u);
    }

  }
  v14 = (void *)MEMORY[0x1D17EA968]();
  v15 = (void *)IMDMessageRecordCopyGUIDsForMessagesWithChatIdentifiersOnServices();
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v15, "count");
      v19 = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Found %d messages to delete", (uint8_t *)&v19, 8u);
    }

  }
  -[IMDMessageStore _deleteMessagesWithGUIDs:chatIdentifiers:style:onServices:batchNumber:completion:](self, "_deleteMessagesWithGUIDs:chatIdentifiers:style:onServices:batchNumber:completion:", v15, v10, v8, v11, 0, v12);
  objc_autoreleasePoolPop(v14);
  if (!objc_msgSend(v15, "count"))
  {

    v15 = 0;
  }

  return v15;
}

- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_deleteMessagesWithChatIdentifiers_style_onServices_completion_);
}

- (id)deleteMessagesWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _DWORD v22[2];
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[IMDMessageStore messageWithReplaceMessageID:fromHandle:onService:](self, "messageWithReplaceMessageID:fromHandle:onService:", v6, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      objc_msgSend(v11, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[IMDMessageStore deleteMessageGUIDs:](self, "deleteMessageGUIDs:", v16);

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "broadcasterForChatListeners");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v12, 0, 0);

  }
  else
  {
    v12 = 0;
  }
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22[0] = 67109890;
      v22[1] = objc_msgSend(v12, "count");
      v23 = 1024;
      v24 = v6;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Deleted %d messages with replace ID: %d from handle: %@ on service: %@", (uint8_t *)v22, 0x22u);
    }

  }
  return v12;
}

- (void)signalUnreadChangeForHandle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  IMBiomeQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D1509F48;
  v8[3] = &unk_1E9228750;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  dispatch_async(v5, v8);

}

- (BOOL)markMessageGUIDUnread:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDMessageStore chatForMessageGUID:](self, "chatForMessageGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    IMDMessageRecordMarkMessageGUIDUnread();
    -[IMDMessageStore messageWithGUID:](self, "messageWithGUID:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;
    if (v6)
    {
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v5, "isBlackholed"));
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "accountID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chatIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject account:chat:style:chatProperties:messageUpdated:suppressNotification:](v9, "account:chat:style:chatProperties:messageUpdated:suppressNotification:", v10, v11, objc_msgSend(v5, "style"), 0, v6, 1);

      v12 = objc_msgSend((id)objc_opt_class(), "_updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:", v4, 0, 0, 0, 1);
      if ((v12 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v12))
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v18 = 138412290;
            v19 = v4;
            _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Attempted to mark a message as unread that wasn't the last message: %@", (uint8_t *)&v18, 0xCu);
          }

        }
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v5, 0, 0, 1);

      }
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Marked %@ as unread", (uint8_t *)&v18, 0xCu);
        }

      }
      -[NSObject handle](v6, "handle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDMessageStore signalUnreadChangeForHandle:](self, "signalUnreadChangeForHandle:", v16);

    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1D166A378();
    }

  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1D166A318();
    v7 = 0;
  }

  return v7;
}

- (id)markMessagesAsReadWithIdentifiers:(id)a3 onServices:(id)a4 chatStyle:(unsigned __int8)a5 upToGUID:(id)a6 readDate:(id)a7 fromMe:(BOOL)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  _BOOL4 v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v26 = a8;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v27 = a6;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v12, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)IMCopyGUIDForChat();

      if (v19)
        objc_msgSend(v15, "addObject:", v19);

      ++v16;
    }
    while (v16 < objc_msgSend(v12, "count"));
  }
  -[IMDMessageStore markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:](self, "markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:", v15, v27, v14, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  if (!v21)
  {

    v20 = 0;
  }
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v20, "count");
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 67109890;
      v29 = v23;
      v30 = 2112;
      if (v26)
        v24 = CFSTR("YES");
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Marked %d messages as read with handles: %@ on service: %@  from me: %@", buf, 0x26u);
    }

  }
  return v20;
}

- (id)markMessagesAsReadWithChatGUIDs:(id)a3 upToGUID:(id)a4 readDate:(id)a5 fromMe:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *MessagesPriorToGuidMatchingChatGUIDs;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  _DWORD v20[2];
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17EA968]();
  MessagesPriorToGuidMatchingChatGUIDs = (void *)IMDMessageRecordCopyAndMarkAsReadMessagesPriorToGuidMatchingChatGUIDs();
  objc_autoreleasePoolPop(v13);
  if (!objc_msgSend(MessagesPriorToGuidMatchingChatGUIDs, "count"))
  {

    MessagesPriorToGuidMatchingChatGUIDs = 0;
  }
  v15 = objc_msgSend(MessagesPriorToGuidMatchingChatGUIDs, "count");
  if (v15)
    v15 = -[IMDMessageStore updateStamp](self, "updateStamp");
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(MessagesPriorToGuidMatchingChatGUIDs, "count");
      v18 = CFSTR("NO");
      v20[0] = 67109634;
      v20[1] = v17;
      v21 = 2112;
      if (v6)
        v18 = CFSTR("YES");
      v22 = v10;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Marked %d messages as read with chat guid: %@ from me: %@", (uint8_t *)v20, 0x1Cu);
    }

  }
  return MessagesPriorToGuidMatchingChatGUIDs;
}

- (int64_t)_calculateUnreadMessagesCountFilteredByFocus:(BOOL)a3 filteredByAssistiveAccess:(BOOL)a4
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D396C0], "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cachedChats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v35 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Calculating unread message count from %ld cached chats.", buf, 0xCu);
    }

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v8)
  {
    v29 = 0;
    goto LABEL_35;
  }
  v29 = 0;
  v9 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v31 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "unreadCount");
      if (v12)
      {
        if (!v5)
        {
          if (a4)
            goto LABEL_20;
          goto LABEL_25;
        }
        -[IMDMessageStore _handleStringsForChat:](self, "_handleStringsForChat:", v11);
        v4 = objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "activeFocusModeMatchesConversationWithHandleStrings:", v4) & 1) != 0)
        {
          if (!a4)
          {

            goto LABEL_25;
          }
LABEL_20:
          -[IMDMessageStore _handleIDsForChat:](self, "_handleIDsForChat:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v24, "allowsConversationWithHandleIDs:", v15);

          if (v5)
          {

            if ((v16 & 1) == 0)
              goto LABEL_26;
LABEL_25:
            v29 += v12;
LABEL_30:
            v7 += v12;
            continue;
          }
          if (v16)
            goto LABEL_25;
        }
        else
        {

        }
LABEL_26:
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v19;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Chat with guid is not allowed: %@", buf, 0xCu);

          }
        }
        goto LABEL_30;
      }
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "guid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = (uint64_t)v14;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Chat with guid (%@) did not have an unread count greater than 0.", buf, 0xCu);

        }
      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  }
  while (v8);
LABEL_35:

  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v35 = v29;
      v36 = 2048;
      v37 = v7;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Determined unread badge count is %ld after filtering, totalUnreadCount: %ld", buf, 0x16u);
    }

  }
  return v29;
}

- (id)_handleStringsForChat:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "ID", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "im_stripCategoryLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)_handleIDsForChat:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByApplyingBlock:", &unk_1E922C2D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cleanseAttachments
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D36120], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanseOrphanedFileTransfers");

}

- (BOOL)isAttachmentReferencedByMessage:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  uint64_t isKindOfClass;
  uint64_t v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMMessageGuidFromIMFileTransferGuid();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDMessageStore itemWithGUID:](self, "itemWithGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[NSObject balloonBundleID](v7, "balloonBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        v10 = -[NSObject messagePartIndexForAttachmentMessagePartWithTransferGUID:](v7, "messagePartIndexForAttachmentMessagePartWithTransferGUID:", v4);
        if (!v9 && v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled(0x7FFFFFFFFFFFFFFFLL))
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              -[NSObject balloonBundleID](v7, "balloonBundleID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = 138412802;
              v19 = v4;
              v20 = 2112;
              v21 = CFSTR("NO");
              v22 = 2112;
              v23 = v12;
              _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in message(nil:%@), bundle %@", (uint8_t *)&v18, 0x20u);

            }
          }
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_18;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v7 = v6;
        v15 = -[NSObject actionIsGroupPhoto](v7, "actionIsGroupPhoto");
        if ((v15 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v15))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v18 = 138412546;
              v19 = v4;
              v20 = 2048;
              v21 = (const __CFString *)-[NSObject actionType](v7, "actionType");
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in group action type %lu", (uint8_t *)&v18, 0x16u);
            }

          }
          goto LABEL_27;
        }
LABEL_18:

        v13 = 1;
LABEL_29:

        goto LABEL_30;
      }
      if (IMOSLoggingEnabled(isKindOfClass))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v18 = 138412546;
          v19 = v4;
          v20 = 2048;
          v21 = (const __CFString *)objc_msgSend(v6, "type");
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in item type %lu", (uint8_t *)&v18, 0x16u);
        }
        goto LABEL_27;
      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: mssage %@ not found", (uint8_t *)&v18, 0x16u);
      }
      goto LABEL_27;
    }
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
  v13 = 0;
LABEL_30:

  return v13;
}

- (BOOL)isSuppressDatabaseUpdates
{
  return self->_suppressedUpdates;
}

- (void)_suppressDBUpdateTimerFired
{
  NSObject *v3;
  NSTimer *suppressedUpdatesTimer;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "suppress DB update timer fired", v5, 2u);
    }

  }
  -[NSTimer invalidate](self->_suppressedUpdatesTimer, "invalidate");
  suppressedUpdatesTimer = self->_suppressedUpdatesTimer;
  self->_suppressedUpdatesTimer = 0;

  self->_suppressedUpdates = 0;
  -[IMDMessageStore updateStamp](self, "updateStamp");
}

- (void)setSuppressDatabaseUpdates:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSTimer *suppressedUpdatesTimer;
  NSTimer *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "setSuppressDatabaseUpdates called with suppressUpdates %d ", buf, 8u);
    }

  }
  suppressedUpdatesTimer = self->_suppressedUpdatesTimer;
  if (suppressedUpdatesTimer)
  {
    -[NSTimer invalidate](suppressedUpdatesTimer, "invalidate");
    v7 = self->_suppressedUpdatesTimer;
    self->_suppressedUpdatesTimer = 0;

  }
  self->_suppressedUpdates = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1D150B304;
    v9[3] = &unk_1E92287A0;
    v9[4] = self;
    objc_msgSend(v8, "__im_performBlock:", v9);

  }
  else
  {
    -[IMDMessageStore updateStamp](self, "updateStamp");
  }
}

- (void)retractPostedNotificationsForMessageGUIDs:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence();
  if (v3)
  {
    if (v4)
    {
      v5 = objc_msgSend(v3, "count");
      if (v5)
      {
        if (IMOSLoggingEnabled(v5))
        {
          OSLogHandleForIMFoundationCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v7 = 0;
            _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Going to retract user notifications for read messages", v7, 2u);
          }

        }
        IMDNotificationsRetractNotificationsForReadMessages();
      }
    }
  }

}

- (void)retractPostedNotificationsForMessagesMatchingChatGUIDs:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence();
  if (v3)
  {
    if (v4)
    {
      v5 = objc_msgSend(v3, "count");
      if (v5)
      {
        if (IMOSLoggingEnabled(v5))
        {
          OSLogHandleForIMFoundationCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            v7 = 138412290;
            v8 = v3;
            _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Retract notification for messages matching chats: %@", (uint8_t *)&v7, 0xCu);
          }

        }
        IMDMessageRecordRetractNotificationsForMessagesMatchingChatGUIDs();
      }
    }
  }

}

- (void)postUrgentNotificationsForMessageGUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  if (IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence())
  {
    v4 = objc_msgSend(v3, "count");
    if (v4)
    {
      if (IMOSLoggingEnabled(v4))
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Posting urgent notifications for messages", v9, 2u);
        }

      }
      +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeAliases");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0D360D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IMDNotificationsPostUrgentNotificationsForMessages();

    }
  }

}

- (void)updatePostedNotificationsForMessageGUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence())
  {
    v4 = objc_msgSend(v3, "count");
    if (v4)
    {
      if (IMOSLoggingEnabled(v4))
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v3;
          _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Updating posted notifications for messages: %@", (uint8_t *)&v9, 0xCu);
        }

      }
      +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeAliases");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0D360D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IMDNotificationsUpdatePostedNotificationsForMessages();

    }
  }

}

- (void)__postDBUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___postDBUpdate, 0);
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForChatDatabaseListeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore modificationStamp](self, "modificationStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseUpdated:", v5);

  -[IMDMessageStore postCountChanges](self, "postCountChanges");
  v6 = IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence();
  if ((_DWORD)v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Going to post user notifications", v9, 2u);
      }

    }
    -[IMDMessageStore notificationContext](self, "notificationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMDNotificationsPostNotificationsWithContext();

  }
}

- (void)_postDBUpdate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___postDBUpdate, 0);
  -[IMDMessageStore performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___postDBUpdate, 0, 0.2);
}

- (void)updateStamp
{
  -[IMDMessageStore _updateModificationDate](self, "_updateModificationDate");
  if (!self->_suppressedUpdates)
    MEMORY[0x1E0DE7D20](self, sel__postDBUpdate);
}

- (void)databaseChatSpamUpdated:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcasterForChatDatabaseListeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseChatSpamUpdated:", v3);

}

- (id)notificationContext
{
  void *v2;
  void *v3;
  void *v4;

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, *MEMORY[0x1E0D360D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldUseBadgeUtilities
{
  return 1;
}

- (void)rebuildLastFailedMessageDate
{
  NSNumber *cachedLastFailedMessageDate;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  cachedLastFailedMessageDate = self->_cachedLastFailedMessageDate;
  self->_cachedLastFailedMessageDate = 0;

  if (self->_suppressedUpdates)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Suppressed: Rebuilding lastFailedMessageDateChanged", (uint8_t *)&v11, 2u);
      }

    }
  }
  else
  {
    v6 = -[IMDMessageStore lastFailedMessageDate](self, "lastFailedMessageDate");
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Rebuilding lastFailedMessageDateChanged with new value: %lld ", (uint8_t *)&v11, 0xCu);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "broadcasterForChatCountsListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastFailedMessageDateChanged:", v6);

    +[IMDBadgeUtilities sharedInstance](IMDBadgeUtilities, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateBadgeForLastFailedMessageDateChangeIfNeeded:", v6);

  }
}

- (void)rebuildUnreadMessageCount
{
  NSNumber *cachedUnreadMessageCount;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
  self->_cachedUnreadMessageCount = 0;

  if (self->_suppressedUpdates)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Suppressed: Rebuilding/Broadcasting unreadCountChanged", (uint8_t *)&v11, 2u);
      }

    }
  }
  else
  {
    v6 = -[IMDMessageStore unreadMessagesCount](self, "unreadMessagesCount");
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Rebuilding/Broadcasting unreadCountChanged with new value: %lld ", (uint8_t *)&v11, 0xCu);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "broadcasterForChatCountsListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unreadCountChanged:", v6);

    -[IMDMessageStore _notifyWidgetKitTimeline:](self, "_notifyWidgetKitTimeline:", v6);
    if (-[IMDMessageStore _shouldUseBadgeUtilities](self, "_shouldUseBadgeUtilities"))
    {
      +[IMDBadgeUtilities sharedInstance](IMDBadgeUtilities, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateBadgeForUnreadCountChangeIfNeeded:", v6);

    }
  }
}

- (void)postCountChanges
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int64_t v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_suppressedUpdates)
  {
    v2 = IMOSLoggingEnabled(self);
    if ((_DWORD)v2)
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Suppressed: Broadcasting unreadCountChanged", (uint8_t *)&v17, 2u);
      }

    }
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Suppressed: Broadcasting lastFailedMessageDateChanged", (uint8_t *)&v17, 2u);
      }

    }
  }
  else
  {
    v6 = -[IMDMessageStore unreadMessagesCount](self, "unreadMessagesCount");
    v7 = -[IMDMessageStore lastFailedMessageDate](self, "lastFailedMessageDate");
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v6;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Broadcasting unreadCountChanged with new value: %lld ", (uint8_t *)&v17, 0xCu);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "broadcasterForChatCountsListeners");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unreadCountChanged:", v6);

    -[IMDMessageStore _notifyWidgetKitTimeline:](self, "_notifyWidgetKitTimeline:", v6);
    v11 = -[IMDMessageStore _shouldUseBadgeUtilities](self, "_shouldUseBadgeUtilities");
    if (v11)
    {
      +[IMDBadgeUtilities sharedInstance](IMDBadgeUtilities, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateBadgeForUnreadCountChangeIfNeeded:", v6);

    }
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v7;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Broadcasting lastFailedMessageDateChanged with new value: %lld ", (uint8_t *)&v17, 0xCu);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "broadcasterForChatCountsListeners");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastFailedMessageDateChanged:", v7);

    +[IMDBadgeUtilities sharedInstance](IMDBadgeUtilities, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateBadgeForLastFailedMessageDateChangeIfNeeded:", v7);

  }
}

- (void)_notifyWidgetKitTimeline:(int64_t)a3
{
  if (-[IMDMessageStore lastNotifiedUnreadCount](self, "lastNotifiedUnreadCount") != a3)
    MEMORY[0x1E0DE7D20](self, sel_setLastNotifiedUnreadCount_);
}

- (id)replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:(id)a3 associatedMessageGUID:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (*v14)(void *);
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (*v22)(void *);
  NSObject *v23;
  const __CFArray *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  CFIndex Count;
  CFIndex v31;
  id v32;
  const void *ValueAtIndex;
  void *AttachmentIfNeededRef;
  void *v35;
  unint64_t v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v51;
  id v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[32];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v52 = a5;
  v53 = v7;
  if (!v7)
  {
    v9 = v8;
    *(_OWORD *)v56 = xmmword_1E922C2F0;
    *(_OWORD *)&v56[16] = *(_OWORD *)off_1E922C300;
    v57 = 2780;
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E92346B0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("newGUID"), "-[IMDMessageStore replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:associatedMessageGUID:sender:]", v11, 2780, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v14)
    {
      v14(v13);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v13;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
    v8 = v9;
    if (v9)
      goto LABEL_18;
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_11:
    v16 = v8;
    *(_OWORD *)v56 = xmmword_1E922C318;
    *(_OWORD *)&v56[16] = *(_OWORD *)off_1E922C328;
    v57 = 2781;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = IMFileLocationTrimFileName();
    v19 = v57;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E92346B0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("associatedMessageGUID"), "-[IMDMessageStore replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:associatedMessageGUID:sender:]", v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v22)
    {
      v22(v21);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v21;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
    v8 = v16;
  }
LABEL_18:
  v51 = v8;
  v24 = (const __CFArray *)IMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender();
  v25 = 0;
  v26 = v25;
  if (v25)
  {
    if (IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v26, "localizedDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v56 = 138412290;
        *(_QWORD *)&v56[4] = v28;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Deleting previous acknowledgments failed with error: %@", v56, 0xCu);

      }
    }
    v29 = 0;
    goto LABEL_49;
  }
  Count = CFArrayGetCount(v24);
  if (Count < 1)
  {
    v32 = 0;
    v29 = 0;
    goto LABEL_48;
  }
  v31 = 0;
  v32 = 0;
  v29 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v24, v31);
    if (!ValueAtIndex)
      goto LABEL_43;
    AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)ValueAtIndex, 0);
    v35 = AttachmentIfNeededRef;
    if (AttachmentIfNeededRef)
    {
      v36 = objc_msgSend(AttachmentIfNeededRef, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8;
      if (v36 != 3000 && v36 != 2000
        || (objc_msgSend(v35, "guid"),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            v38 = objc_msgSend(v37, "isEqual:", v53),
            v37,
            (v38 & 1) != 0))
      {
        IMLogHandleForCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v35, "guid");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "associatedMessageGUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v35, "associatedMessageType");
          *(_DWORD *)v56 = 138412802;
          *(_QWORD *)&v56[4] = v40;
          *(_WORD *)&v56[12] = 2112;
          *(_QWORD *)&v56[14] = v41;
          *(_WORD *)&v56[22] = 2048;
          *(_QWORD *)&v56[24] = v42;
          _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Will NOT delete old ack %@: %@: %lld", v56, 0x20u);

        }
        goto LABEL_42;
      }
      IMLogHandleForCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v35, "guid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "associatedMessageGUID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v35, "associatedMessageType");
        *(_DWORD *)v56 = 138412802;
        *(_QWORD *)&v56[4] = v44;
        *(_WORD *)&v56[12] = 2112;
        *(_QWORD *)&v56[14] = v45;
        *(_WORD *)&v56[22] = 2048;
        *(_QWORD *)&v56[24] = v46;
        _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Will delete old ack %@: %@: %lld", v56, 0x20u);

      }
      if (v29)
      {
        if (!v32)
          goto LABEL_40;
      }
      else
      {
        v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (!v32)
LABEL_40:
          v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }
      objc_msgSend(v35, "guid");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v47);

      objc_msgSend(v29, "addObject:", v35);
    }
LABEL_42:

LABEL_43:
    ++v31;
  }
  while (Count != v31);
  if (v32 && objc_msgSend(v32, "count"))
    v48 = -[IMDMessageStore deleteMessageGUIDs:](self, "deleteMessageGUIDs:", v32);
LABEL_48:

LABEL_49:
  if (v24)
    CFRelease(v24);

  return v29;
}

- (id)_fileTransferGUIDsInMessageBody:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v6 = *MEMORY[0x1E0D36430];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D150C828;
  v10[3] = &unk_1E922C348;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v10);

  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addEditHistoryToMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v46;
  void *v47;
  uint8_t buf[16];

  v8 = a3;
  v9 = a6;
  objc_msgSend(v8, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  objc_msgSend(v9, "body");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "plainBody");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1E92346B0;
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
  }
  objc_msgSend(v8, "originalTextRangesByPartIndex", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    if (!IMOSLoggingEnabled(v18))
      goto LABEL_11;
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Message already had originalTextRangesByPartIndex, messages is being edited for a second (or more) time. Not overriding original values.", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v11, "__im_messagePartIndexToRangeMap");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOriginalTextRangesByPartIndex:", v19);
  }

LABEL_11:
  objc_msgSend(v8, "historyForMessagePart:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v23;

  if (!objc_msgSend(v24, "count"))
  {
    v25 = v10;
    objc_msgSend(v11, "__im_messagePartMatchingPartIndex:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "messagePartBody");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = objc_alloc_init(MEMORY[0x1E0CB3498]);
    v30 = v29;

    v31 = objc_alloc(MEMORY[0x1E0D39938]);
    objc_msgSend(v47, "time");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:", v30, v32, 0);

    objc_msgSend(v24, "addObject:", v33);
    v10 = v25;
  }
  v34 = v10;
  objc_msgSend(v10, "__im_messagePartMatchingPartIndex:", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "messagePartBody");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
    v38 = v36;
  else
    v38 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  v39 = v38;

  v40 = objc_alloc(MEMORY[0x1E0D39938]);
  objc_msgSend(v8, "dateEdited");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:", v39, v41, 0);

  objc_msgSend(v24, "addObject:", v42);
  if (v46 == 2)
  {
    if (objc_msgSend(v8, "scheduleType") != 2)
    {
      objc_msgSend(v8, "setHistory:forMessagePart:", MEMORY[0x1E0C9AA60], a4);
      goto LABEL_28;
    }
  }
  else if (v46 != 1)
  {
    goto LABEL_28;
  }
  v43 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v8, "setHistory:forMessagePart:", v43, a4);

LABEL_28:
  return v8;
}

- (id)storeEditedMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v14 = (void *)MEMORY[0x1E0CB36B8];
  v15 = a7;
  v16 = a6;
  v17 = a3;
  objc_msgSend(v14, "indexSetWithIndex:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore storeEditedMessage:editedPartIndexes:editType:previousMessage:chat:updatedAssociatedMessageItems:](self, "storeEditedMessage:editedPartIndexes:editType:previousMessage:chat:updatedAssociatedMessageItems:", v17, v18, a5, v16, v15, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)storeEditedMessage:(id)a3 editedPartIndexes:(id)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  int v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[5];
  id v100;
  __int128 *p_buf;
  unint64_t v102;
  uint8_t v103[4];
  id v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  id v108;
  void *v109;
  _BYTE v110[128];
  uint8_t v111[128];
  __int128 buf;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v83 = a4;
  v13 = a6;
  v82 = a7;
  objc_msgSend(v13, "guid");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v87))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v87;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Applying edits to the content of message: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(v12, "body");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v113 = 0x3032000000;
  v114 = sub_1D1505B84;
  v115 = sub_1D1505B94;
  v116 = 0;
  v15 = v12;
  v116 = v15;
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = sub_1D150D8C4;
  v99[3] = &unk_1E922C370;
  v99[4] = self;
  p_buf = &buf;
  v102 = a5;
  v86 = v13;
  v100 = v86;
  objc_msgSend(v83, "enumerateIndexesUsingBlock:", v99);
  v90 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  v16 = v90;
  if (objc_msgSend(v90, "isFullyRetracted"))
  {
    v17 = objc_msgSend(v90, "isRead");
    if ((v17 & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v103 = 0;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Message no longer contains any parts, all parts have been retracted, marking message as read", v103, 2u);
        }

        v16 = v90;
      }
      objc_msgSend(v16, "setFlags:", objc_msgSend(v16, "flags") | 0x2000);
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimeRead:", v20);

      v18 = 0x2000;
      v16 = v90;
    }
    objc_msgSend(v16, "payloadData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length") == 0;

    if (v22)
      goto LABEL_20;
    v24 = v90;
    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v103 = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Message is fully retracted, deleting payload data", v103, 2u);
      }

      v24 = v90;
    }
    objc_msgSend(v24, "setPayloadData:", 0);
    objc_msgSend(v24, "retractedPartIndexes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count") == 0;

    if (v27)
    {
      v16 = v90;
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v103 = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "We retracted the payload data on a message that had no body and was a payload only. Inserting a retraction stamp at index 0.", v103, 2u);
        }

        v16 = v90;
      }
      objc_msgSend(v16, "addRetractedPartIndex:", 0);
    }
    else
    {
LABEL_20:
      v16 = v90;
    }
  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend(v16, "errorCode"))
    objc_msgSend(v16, "setErrorCode:", 0);
  objc_msgSend(v16, "setCloudKitSyncState:", 0);
  if (objc_msgSend(MEMORY[0x1E0D397F8], "supportsDataDetectors"))
  {
    v30 = (void *)objc_msgSend(v84, "mutableCopy");
    objc_msgSend(v84, "string");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "isFromMe");
    objc_msgSend(v16, "time");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    IMDDataDectorDictionaryForMessageItem();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sender");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v36 = v34;
    }
    else
    {
      objc_msgSend(v90, "handle");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v36;

    v39 = IMDDScanAttributedStringWithExtendedContext();
    v40 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v90, "setBody:", v40);

    v41 = objc_msgSend(v90, "flags") & 0xFFFFFFFFFFFEFFFFLL;
    v42 = 0x10000;
    if (!v39)
      v42 = 0;
    objc_msgSend(v90, "setFlags:", v41 | v42);

    v37 = v18 | 0x10000;
    v16 = v90;
  }
  else
  {
    v37 = v18;
  }
  v78 = v37;
  LODWORD(v76) = 16777473;
  v43 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", v16, 1, 1, v37 != 0, v76, 0);
  -[IMDMessageStore messageWithGUID:](self, "messageWithGUID:", v87);
  v44 = objc_claimAutoreleasedReturnValue();
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v82, 1, 0, 1);
  v79 = v45;
  v85 = (id)v44;
  -[IMDMessageStore _updateAssociatedMessageItemsFromMessage:toMessage:](self, "_updateAssociatedMessageItemsFromMessage:toMessage:", v86, v44);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  if (a8)
    *a8 = objc_retainAutorelease(v81);
  objc_msgSend(v86, "fileTransferGUIDs");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore _fileTransferGUIDsInMessageBody:](self, "_fileTransferGUIDsInMessageBody:", v84);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "scheduleType") == 2)
    objc_msgSend(v90, "setScheduledMessageOriginalTransferGUIDs:", v46);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v48 = v46;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
  if (v49)
  {
    v89 = 0;
    v50 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v96 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        v53 = objc_msgSend(v47, "containsObject:", v52);
        if ((v53 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v53))
          {
            OSLogHandleForIMFoundationCategory();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v103 = 138412290;
              v104 = v52;
              _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_INFO, "Edited message does not contain file transfer guid: %@", v103, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "isScheduledMessagesCoreEnabled");

          if (v56 && objc_msgSend(v90, "scheduleType") == 2 && objc_msgSend(v90, "scheduleState") == 2)
          {
            objc_msgSend(v90, "fileTransferGUIDs");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v57, "mutableCopy");

            objc_msgSend(v58, "removeObject:", v52);
            objc_msgSend(v90, "setFileTransferGUIDs:", v58);
            v89 = 1;
          }
          else
          {
            +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "deleteAttachmentWithGUID:", v52);
          }

        }
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
    }
    while (v49);
  }
  else
  {
    v89 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isScheduledMessagesCoreEnabled");

  if ((v60 & v89) == 1)
  {
    LOWORD(v77) = 257;
    -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v90, 1, 1, v78 != 0, v77);
    v61 = objc_claimAutoreleasedReturnValue();

    v85 = (id)v61;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v62 = v47;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
  if (v63)
  {
    v64 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v63; ++j)
      {
        if (*(_QWORD *)v92 != v64)
          objc_enumerationMutation(v62);
        v66 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        if ((objc_msgSend(v48, "containsObject:", v66) & 1) == 0)
        {
          IMLogHandleForCategory();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v103 = 138412290;
            v104 = v66;
            _os_log_error_impl(&dword_1D1413000, v67, OS_LOG_TYPE_ERROR, "Edited message contains a file transfer not found in original message. FileTransferGuid: %@", v103, 0xCu);
          }

        }
      }
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
    }
    while (v63);
  }

  if (v87)
  {
    v109 = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
    v68 = v85;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = (void *)MEMORY[0x1E0C9AA60];
    v68 = v85;
  }
  -[IMDMessageStore updatePostedNotificationsForMessageGUIDs:](self, "updatePostedNotificationsForMessageGUIDs:", v69);
  if (!v68)
  {
    IMLogHandleForCategory();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_1D166A3D8();

    IMLogHandleForCategory();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v103 = 138412802;
      v104 = v83;
      v105 = 2112;
      v106 = v75;
      v107 = 2112;
      v108 = v86;
      _os_log_error_impl(&dword_1D1413000, v71, OS_LOG_TYPE_ERROR, "partIndexes: %@ editType: %@ previousMessage: %@", v103, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDMessageStoreDomain"), 0, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Store Edited Message Failed"), v72);

  }
  _Block_object_dispose(&buf, 8);

  return v85;
}

- (id)_updateAssociatedMessageItemsFromMessage:(id)a3 toMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retractedPartIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  location = 0;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = sub_1D150DB4C;
  v22 = &unk_1E922C398;
  objc_copyWeak(&v25, &location);
  v12 = v8;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", &v19);
  v14 = objc_msgSend(v13, "count", v19, v20, v21, v22);
  if (v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Deleting associated message GUIDs: %@", buf, 0xCu);
      }

    }
    v16 = -[IMDMessageStore deleteMessageGUIDs:](self, "deleteMessageGUIDs:", v13);
  }
  v17 = (void *)objc_msgSend(v11, "copy");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

- (id)storeRepositionedStickerWithMetadata:(id)a3 fileTransferGUID:(id)a4 repositioningFromLocalChange:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  IMDMessageStore *v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint8_t buf[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transferForGUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stickerUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = *MEMORY[0x1E0D39318];
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D39318]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v8, "objectForKey:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  if (v16 >= v18)
  {
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Don't store the new sticker user info", buf, 2u);
      }

    }
    v34 = 0;
  }
  else
  {
    v42 = self;
    v43 = v5;
    v46 = v11;
    v47 = v9;
    v41 = *MEMORY[0x1E0D39328];
    objc_msgSend(v8, "objectForKey:");
    v20 = objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x1E0D39330];
    objc_msgSend(v8, "objectForKey:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0D392D8];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D392D8]);
    v22 = objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0D392D0];
    objc_msgSend(v8, "objectForKey:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D392C8];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D392C8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v14);
    v49 = objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0D392C0];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D392C0]);
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = &unk_1E92713E0;
    if (v26)
      v28 = (void *)v26;
    v45 = v28;

    v29 = (void *)v22;
    v44 = (void *)v20;
    if (v20 && v51 && v22 && v50 && v24 && v49 && v48)
    {
      objc_msgSend(v13, "setValue:forKey:", v20, v41);
      objc_msgSend(v13, "setValue:forKey:", v51, v40);
      objc_msgSend(v13, "setValue:forKey:", v22, v21);
      objc_msgSend(v13, "setValue:forKey:", v50, v39);
      objc_msgSend(v13, "setValue:forKey:", v24, v23);
      v30 = (void *)v49;
      objc_msgSend(v13, "setValue:forKey:", v49, v14);
      v31 = (void *)v48;
      objc_msgSend(v13, "setValue:forKey:", v48, v25);
      v32 = v45;
      objc_msgSend(v13, "setValue:forKey:", v45, *MEMORY[0x1E0D392B0]);
      objc_msgSend(v13, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D39308]);
      -[IMDMessageStore _fileTransferCenter](v42, "_fileTransferCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v47;
      objc_msgSend(v33, "setUpdatedStickerUserInfo:forTransfer:repositioningFromLocalChange:", v13, v47, v43);

      v34 = (void *)objc_msgSend(v13, "copy");
      v35 = v29;
      v11 = v46;
    }
    else
    {
      v35 = (void *)v22;
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      v9 = v47;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_1D166A438();

      v34 = 0;
      v32 = v45;
      v11 = v46;
      v31 = (void *)v48;
      v30 = (void *)v49;
    }

  }
  return v34;
}

- (id)storeRepositionedStickerLocally:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "messageSummaryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D383B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    -[IMDMessageStore storeRepositionedStickerWithMetadata:fileTransferGUID:repositioningFromLocalChange:](self, "storeRepositionedStickerWithMetadata:fileTransferGUID:repositioningFromLocalChange:", v6, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)loadConsumedSessionPayloadsForItems:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(v22, "__imArrayByFilteringWithBlock:", &unk_1E922C3D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "pluginSessionGUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsObject:", v10);
        if ((_DWORD)v11)
        {
          if (IMOSLoggingEnabled(v11))
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "balloonBundleID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v29 = v9;
              v30 = 2112;
              v31 = (uint64_t)v13;
              v32 = 2112;
              v33 = v10;
              _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Observed more than one unconsumed breadcrumb: %@ for '%@' session %@", buf, 0x20u);

            }
          }
        }
        else
        {
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "messagesWithAssociatedGUID:shouldLoadAttachments:", v10, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = sub_1D150E660;
          v23[3] = &unk_1E922C400;
          v23[4] = v9;
          objc_msgSend(v15, "__imArrayByFilteringWithBlock:", v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          IMGetConsumedSessionPayloadsForBreadcrumbItems();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setConsumedSessionPayloads:", v17);

          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "consumedSessionPayloads");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "count");
              *(_DWORD *)buf = 138412546;
              v29 = v9;
              v30 = 2048;
              v31 = v21;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "History query found breadcrumb %@ with payload history: %tu items.", buf, 0x16u);

            }
          }
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v6);
  }

}

- (BOOL)_itemClassShouldUpdateTransferForItem:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)messageRecordsToUploadToCloudKitWithLimit:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Trying to Load Message Records that need CK Sync", v5, 2u);
    }

  }
  return (id)IMDMessageRecordCopyMessagesToUploadToCloudKitWithLimit();
}

- (id)messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4
{
  return -[IMDMessageStore _messagesThatNeedSyncWithCloudKitWithFilter:limit:attemptCount:](self, "_messagesThatNeedSyncWithCloudKitWithFilter:limit:attemptCount:", a3, a4, 0);
}

- (id)_messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4 attemptCount:(unint64_t)a5
{
  int v7;
  NSObject *v8;
  __CFArray *v9;
  NSObject *v10;
  void *v11;
  __CFArray *v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void *AttachmentIfNeededRef;
  int64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  __CFArray *v26;
  NSObject *v27;
  uint64_t v28;
  unint64_t v31;
  uint8_t buf[4];
  int64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = IMOSLoggingEnabled(self);
  v31 = a5;
  if (a5 < 0x64)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v34 = a4;
        v35 = 2048;
        v36 = v31;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "load messages needing CK sync with limit %ld, attemptCount %lu", buf, 0x16u);
      }

    }
    -[IMDMessageStore messageRecordsToUploadToCloudKitWithLimit:](self, "messageRecordsToUploadToCloudKitWithLimit:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend(v11, "count");
    if (!v13)
      goto LABEL_41;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = objc_msgSend(v11, "objectAtIndex:", v14);
      AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v16, 0);
      if (!AttachmentIfNeededRef)
      {
        v18 = *(_QWORD *)(v16 + 16);
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v34 = v18;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "**** Marking message with rowID %lld as clean ***", buf, 0xCu);
          }

        }
        IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit();
        v15 = 1;
      }
      if (-[IMDMessageStore _itemClassShouldUpdateTransferForItem:](self, "_itemClassShouldUpdateTransferForItem:", AttachmentIfNeededRef))
      {
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "updateTemporaryTransferGUIDsOnMessageIfNeeded:", AttachmentIfNeededRef);

        if (v21)
        {
          objc_msgSend(AttachmentIfNeededRef, "guid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "itemWithGUID:", v22);
          v24 = objc_claimAutoreleasedReturnValue();

          AttachmentIfNeededRef = (void *)v24;
        }
      }
      if (v12 && AttachmentIfNeededRef)
        CFArrayAppendValue(v12, AttachmentIfNeededRef);

      v13 = objc_msgSend(v11, "count");
      ++v14;
    }
    while (v13 > v14);
    if ((v15 & 1) != 0)
    {
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v34 = v31;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "**** We had corrupt messages amongst dirty messages. Trying to load messages again. numberOfAttempts %lu", buf, 0xCu);
        }

      }
      v26 = -[IMDMessageStore _messagesThatNeedSyncWithCloudKitWithFilter:limit:attemptCount:](self, "_messagesThatNeedSyncWithCloudKitWithFilter:limit:attemptCount:", a3, a4, v31 + 1);
    }
    else
    {
LABEL_41:
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = -[__CFArray count](v12, "count");
          *(_DWORD *)buf = 134217984;
          v34 = v28;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "loaded %lu messages needing CK sync with limit", buf, 0xCu);
        }

      }
      v26 = v12;
    }
    v9 = v26;

  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages. Bailing for now", buf, 2u);
      }

    }
    return 0;
  }
  return v9;
}

- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__messagesPendingUpdateT1ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  void *updated;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  int64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = IMOSLoggingEnabled(self);
  if (a4 < 0x64)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 134218240;
        v14 = a3;
        v15 = 2048;
        v16 = a4;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T1 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }

    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKitWithLimit();
    if (IMOSLoggingEnabled(updated))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(updated, "count");
        v13 = 134217984;
        v14 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T1 update with limit", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T1 update. Bailing for now", (uint8_t *)&v13, 2u);
      }

    }
    return 0;
  }
  return updated;
}

- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__messagesPendingUpdateT2ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  void *updated;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  int64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = IMOSLoggingEnabled(self);
  if (a4 < 0x64)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 134218240;
        v14 = a3;
        v15 = 2048;
        v16 = a4;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T2 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }

    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKitWithLimit();
    if (IMOSLoggingEnabled(updated))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(updated, "count");
        v13 = 134217984;
        v14 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T2 update with limit", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T2 update. Bailing for now", (uint8_t *)&v13, 2u);
      }

    }
    return 0;
  }
  return updated;
}

- (id)messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__messagesPendingUpdateT3ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  void *updated;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  int64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = IMOSLoggingEnabled(self);
  if (a4 < 0x64)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 134218240;
        v14 = a3;
        v15 = 2048;
        v16 = a4;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T3 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }

    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKitWithLimit();
    if (IMOSLoggingEnabled(updated))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(updated, "count");
        v13 = 134217984;
        v14 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T3 update with limit", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T2 update. Bailing for now", (uint8_t *)&v13, 2u);
      }

    }
    return 0;
  }
  return updated;
}

- (id)copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:(unint64_t)a3
{
  return (id)IMDMessageRecordCopyRecordIDsAndGUIDsToDeleteWithLimit();
}

- (void)deleteMessagesFromTombStoneTableWithRecordIDs:(id)a3
{
  IMDMessageRecordDeleteTombStonedMessagesWithRecordIDs();
}

- (void)clearMessagesTombStoneTable
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Clearing tombstone message table", v3, 2u);
    }

  }
  IMDMessageRecordClearDeleteTombStones();
}

- (void)markMessageAsCleanWithROWID:(int64_t)a3
{
  IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit();
}

- (void)markMessageAsIgnoreButNeedingSyncWithROWID:(int64_t)a3
{
  IMDMessageRecordMarkMessageWithROWIDAsIgnoreButNeedingSyncWithCloudKit();
}

+ (void)databaseFull
{
  uint64_t v2;

  if ((byte_1EFC63DA8 & 1) == 0)
  {
    byte_1EFC63DA8 = 1;
    v2 = objc_opt_class();
    MEMORY[0x1E0DE7D20](v2, sel__displayDatabaseFullAlert);
  }
}

+ (void)databaseNoLongerFull
{
  if (byte_1EFC63DA8 == 1)
    byte_1EFC63DA8 = 0;
}

+ (void)_displayDatabaseFullAlert
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SMS_FULL_WARNING"), &stru_1E92346B0, CFSTR("IMSharedUtilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFString *)objc_msgSend(v2, "localizedStringWithFormat:", v3, 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  IMSharedUtilitiesFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_1E92346B0, CFSTR("IMSharedUtilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v4, 0, (CFStringRef)objc_msgSend(v5, "localizedStringWithFormat:", v7, 0), 0, 0, 0);

}

- (void)setModificationStamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)visitedChats
{
  return self->_visitedChats;
}

- (void)setVisitedChats:(id)a3
{
  objc_storeStrong((id *)&self->_visitedChats, a3);
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, a3);
}

- (int64_t)lastNotifiedUnreadCount
{
  return self->_lastNotifiedUnreadCount;
}

- (void)setLastNotifiedUnreadCount:(int64_t)a3
{
  self->_lastNotifiedUnreadCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_visitedChats, 0);
  objc_storeStrong((id *)&self->_suppressedUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_cachedLastFailedMessageDate, 0);
  objc_storeStrong((id *)&self->_cachedUnreadMessageCount, 0);
  objc_storeStrong((id *)&self->_modificationStamp, 0);
}

- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3
{
  void *v3;

  _sSo15IMDMessageStoreC12IMDaemonCoreE25recordIDsAndGUIDsToDelete9withLimitSaySDys11AnyHashableVypGGs5Int64V_tF_0();
  sub_1D141AC58(&qword_1ED935B90);
  v3 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  IMDMessageStore *v5;
  void *v6;

  v5 = self;
  IMDMessageStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D16107C8();
  sub_1D1610804();
  v6 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  IMDMessageStore *v4;

  sub_1D16107C8();
  sub_1D166DBEC();
  v4 = self;
  _sSo15IMDMessageStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

@end
