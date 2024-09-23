@implementation IMDChatStore

- (IMDRemoteDatabaseProtocol)database
{
  return (IMDRemoteDatabaseProtocol *)objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
}

- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1D154A0CC;
  v20 = sub_1D154A0DC;
  v21 = 0;
  -[IMDChatStore database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D141AED0;
  v15[3] = &unk_1E9228998;
  v15[4] = &v16;
  objc_msgSend(v12, "fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:completionHandler:", v10, v8, v11, a6, v15);

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v17[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)_incomingChatsWithChatRecords:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  IMDChat *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  IMDChat *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "No incoming chat records.", buf, 2u);
      }

    }
    v21 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_27;
  }
  v20 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v5)
  {

    goto LABEL_26;
  }
  v6 = 0;
  v7 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(obj);
      v9 = sub_1D151D854(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      if (v9)
      {
        -[IMDChatStore _processIncomingChat:](self, "_processIncomingChat:", v9);
        -[IMDChat serviceName](v9, "serviceName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F58]);

        -[IMDChat serviceName](v9, "serviceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= v11;
        if (objc_msgSend(v12, "length"))
        {
          +[IMDChatRegistry supportedServiceNames](IMDChatRegistry, "supportedServiceNames");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDChat serviceName](v9, "serviceName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsObject:", v14);

          if (v15)
          {
            objc_msgSend(v21, "addObject:", v9);
            goto LABEL_16;
          }
        }
        else
        {

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            -[IMDChat serviceName](v9, "serviceName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v28 = v17;
            v29 = 2112;
            v30 = v9;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Tried to load chat for unsupported service (%@): %@", buf, 0x16u);

          }
        }
      }
LABEL_16:

    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
    IMGreenTeaMessageReadLog();
LABEL_26:
  v4 = v20;
LABEL_27:

  return v21;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("schema_version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IMDSMSRecordStoreGetSchemaVersion());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("schema");
  v7[0] = v2;
  IMDSMSRecordStoreGetSchema();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CKRecordZoneID)recordZoneID
{
  void *v2;
  void *v3;

  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatRecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordZoneID *)v3;
}

- (CKRecordZoneID)record1ZoneID
{
  void *v2;
  void *v3;

  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat1RecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordZoneID *)v3;
}

- (id)syncTokenStore
{
  if (qword_1EFC63D00 != -1)
    dispatch_once(&qword_1EFC63D00, &unk_1E922AF20);
  return (id)qword_1EFC63CF8;
}

- (void)resetLocalSyncStateIfAppropriate
{
  id v3;

  if (-[IMDChatStore _shouldMarkAllChatsAsNeedingSync](self, "_shouldMarkAllChatsAsNeedingSync"))
  {
    -[IMDChatStore clearLocalSyncState:](self, "clearLocalSyncState:", 3);
    -[IMDChatStore _hasMarkedAllChatsAsNeedingSync](self, "_hasMarkedAllChatsAsNeedingSync");
  }
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markDeferredChatsAsNeedingSync");

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = IMOSLoggingEnabled(self);
  if ((_DWORD)v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v3;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Clearing local chat sync state, flags 0x%x", buf, 8u);
    }

  }
  if ((v3 & 1) != 0)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastSyncDate:", 0);

    -[IMDChatStore syncTokenStore](self, "syncTokenStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistToken:forKey:", 0, CFSTR("changeToken"));

    -[IMDChatStore syncTokenStore](self, "syncTokenStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistToken:forKey:", 0, CFSTR("chat1changeToken"));

  }
  if ((v3 & 2) != 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Marking all chats as dirty", buf, 2u);
      }

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "resetCKSyncState");
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDChatStore _markAllChatsAsNeedingSync](self, "_markAllChatsAsNeedingSync");
  }
}

- (void)_markAllChatsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]);

}

- (BOOL)_shouldMarkAllChatsAsNeedingSync
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
    v5 = objc_msgSend(v6, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]) ^ 1;

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
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_shouldMarkAllChatsAsNeedingSync %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (void)_hasMarkedAllChatsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]);

}

- (id)_lockRecord
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v2 = (void *)qword_1EFC65DE8;
  if (!qword_1EFC65DE8)
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Generating Lock Record - OH BOY", v11, 2u);
      }

    }
    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatRecordZoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("chatLockRecordName"), v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("chatLockRecordType"), v6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("lRKey"));

    v9 = (void *)qword_1EFC65DE8;
    qword_1EFC65DE8 = (uint64_t)v7;

    v2 = (void *)qword_1EFC65DE8;
  }
  return v2;
}

- (unint64_t)_maxFetchChatAttempts
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ck-client-fetch-chats-max-retry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 100;

  return v4;
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(unint64_t)a4 error:(id *)a5
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = -[IMDChatStore _maxFetchChatAttempts](self, "_maxFetchChatAttempts");
  v9 = 0;
  if (v8 <= 1)
    v10 = 1;
  else
    v10 = v8;
  do
  {
    -[IMDChatStore _fetchChatRecordsToUploadWithFilter:limit:](self, "_fetchChatRecordsToUploadWithFilter:limit:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
      goto LABEL_18;
    -[IMDChatStore _generateCKRecordsFromChatRecords:filter:](self, "_generateCKRecordsFromChatRecords:filter:", v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v12 = (void *)objc_msgSend(v12, "count");
      if (v12)
        goto LABEL_19;
    }
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134218240;
        v27 = v15;
        v28 = 2048;
        v29 = v9;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "For batch of %lu records to write up, all records failed to convert to CKRecord, loop %lu.", buf, 0x16u);
      }

    }
    ++v9;
  }
  while (v10 != v9);
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v10;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Tried max times(%lu) to find chats to fetch, aborting", buf, 0xCu);
    }

  }
  if (a5)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Failed to find chats to sync; fetched chats failed to encode as CKRecord");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D37CD0], 1, v19);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *a5;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), "-[IMDChatStore(RecordStore) batchOfRecordsToWriteWithFilter:limit:error:]");
    objc_msgSend(v11, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("ExceededMaxFetchChatAttempts"), v20, CFSTR("MiCSync"), v21);

LABEL_18:
    v13 = 0;
LABEL_19:

    return v13;
  }
  return 0;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateChatUsingCKRecord:onRead:didSucceed:dispatchToMain:", v3, 0, 1, 0);

}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copy");
  if ((objc_msgSend(v10, "wasZoneNotFound:", v9) & 1) != 0 || objc_msgSend(v10, "wasUnknownItem:", v9))
  {
    objc_msgSend(v7, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("chatLockRecordName"));

    if (v13)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v32 = 138412290;
          v33 = v9;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We got back error [%@] on the lock record, setting the lock record to nil to re-generate on next sync", (uint8_t *)&v32, 0xCu);
        }

      }
      v16 = (void *)qword_1EFC65DE8;
      qword_1EFC65DE8 = 0;
    }
    else
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "existingChatWithGUID:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v32 = 138412290;
            v33 = v16;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Marking existing chat %@ as deferred", (uint8_t *)&v32, 0xCu);
          }

        }
        objc_msgSend(v16, "updateCloudKitSyncState:", 2);
        objc_msgSend(v16, "updateServerChangeToken:", 0);
        objc_msgSend(v16, "updateCloudKitRecordID:", 0);
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_markForksAsSyncedForChat:", v16);

      }
    }
    goto LABEL_29;
  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "extractServerRecordFromCKServerErrorRecordChanged:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = IMOSLoggingEnabled(v22);
  if (v16)
  {
    if (v23)
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v32 = 138412290;
        v33 = v16;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v32, 0xCu);
      }

    }
    objc_msgSend(v16, "recordID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("chatLockRecordName"));

    if (!v27)
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resolveChatConflictUsingSyncData:localGUID:", v16, v11);
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    v28 = (void *)qword_1EFC65DE8;
    qword_1EFC65DE8 = 0;
    goto LABEL_28;
  }
  if (v23)
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Could not extract server record, checking if lock record", (uint8_t *)&v32, 2u);
    }

  }
  objc_msgSend(v7, "recordName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("chatLockRecordName"));

  if (v31)
    goto LABEL_27;
LABEL_29:

}

- (id)serviceNamesForFilter:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceNamesSupportingCapability:", *MEMORY[0x1E0D38E30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByExcludingObjectsInArray:", *MEMORY[0x1E0D38F38]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 1)
    {
      v3 = (id)*MEMORY[0x1E0D38F38];
      v4 = v3;
      goto LABEL_7;
    }
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceNamesSupportingCapability:", *MEMORY[0x1E0D38E30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Predicate filtering for services %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v4;
}

- (id)_fetchChatRecordsToUploadWithFilter:(unint64_t)a3 limit:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[IMDChatStore serviceNamesForFilter:](self, "serviceNamesForFilter:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), *MEMORY[0x1E0D37778], &stru_1E92346B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "__im_chatPredicateForServiceNames:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "__im_chatPredicateForSyncState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1D14B3D68;
  v21 = sub_1D14B3D78;
  v22 = 0;
  -[IMDChatStore database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D14B3D80;
  v16[3] = &unk_1E9228998;
  v16[4] = &v17;
  objc_msgSend(v13, "fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v12, MEMORY[0x1E0C9AA60], a4, v16);

  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (void)createSMSVariantsIfNeededFor:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  id obj;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  _BYTE v74[14];
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v51;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v55)
    {
      v54 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v68 != v54)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if (objc_msgSend(v6, "style") == 45)
          {
            buf[0] = 45;
            objc_msgSend(v6, "guid");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0;
            v66 = 0;
            IMComponentsFromChatGUID();
            v8 = v66;
            v9 = v65;

            -[IMDChatStore chatsWithIdentifier:onServiceNamed:](self, "chatsWithIdentifier:onServiceNamed:", v8, *MEMORY[0x1E0D38F58]);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "firstObject");
            v11 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v6, "groupID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDChatStore chatsWithGroupID:](self, "chatsWithGroupID:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v8 = v13;
            v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v62;
LABEL_11:
              v16 = 0;
              while (1)
              {
                if (*(_QWORD *)v62 != v15)
                  objc_enumerationMutation(v8);
                v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v16);
                objc_msgSend(v6, "service");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "internalName");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D38F58]);

                if ((v20 & 1) != 0)
                  break;
                if (v14 == ++v16)
                {
                  v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
                  if (v14)
                    goto LABEL_11;
                  goto LABEL_17;
                }
              }
              v11 = v17;

              if (v11)
                goto LABEL_32;
            }
            else
            {
LABEL_17:

            }
            objc_msgSend(v6, "groupID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "originalGroupID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqualToString:", v22);

            if ((v23 & 1) != 0)
            {
              v11 = 0;
            }
            else
            {
              objc_msgSend(v6, "originalGroupID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDChatStore chatsWithGroupID:](self, "chatsWithGroupID:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = 0u;
              v60 = 0u;
              v57 = 0u;
              v58 = 0u;
              v8 = v25;
              v11 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
              if (v11)
              {
                v26 = *(_QWORD *)v58;
                while (2)
                {
                  for (j = 0; j != v11; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v58 != v26)
                      objc_enumerationMutation(v8);
                    v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                    objc_msgSend(v6, "service");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "internalName");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D38F58]);

                    if (v31)
                    {
                      v11 = v28;
                      goto LABEL_31;
                    }
                  }
                  v11 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
                  if (v11)
                    continue;
                  break;
                }
              }
LABEL_31:

            }
          }
LABEL_32:

          v33 = IMOSLoggingEnabled(v32);
          if (v11)
          {
            if (v33)
            {
              OSLogHandleForIMFoundationCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "guid");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "guid");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v72 = v35;
                v73 = 2112;
                *(_QWORD *)v74 = v36;
                _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Found SMS variant for new service chat %@ as %@", buf, 0x16u);

              }
            }
          }
          else
          {
            if (v33)
            {
              OSLogHandleForIMFoundationCategory();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v6, "guid");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v6, "style");
                objc_msgSend(v6, "groupID");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "originalGroupID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v72 = v38;
                v73 = 1024;
                *(_DWORD *)v74 = v39;
                *(_WORD *)&v74[4] = 2112;
                *(_QWORD *)&v74[6] = v40;
                v75 = 2112;
                v76 = v41;
                _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Could not find SMS fallback chat for %@/style %c groupID %@ origGroupID %@, creating", buf, 0x26u);

              }
            }
            objc_msgSend(v53, "createHandleInfoFor:", v6);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v6, "spamCategory");
            objc_msgSend(v6, "spamExtensionName");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "chatIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v6, "style");
            objc_msgSend(v6, "displayName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "groupID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "originalGroupID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "didJoinChat:style:displayName:groupID:originalGroupID:handleInfo:category:spamExtensionName:", v45, v46, v47, v48, v49, v42, v43, v44);

          }
        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v55);
    }

  }
  else if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Could not find SMS session to create alternate chat to sync", buf, 2u);
    }

  }
}

- (id)zoneIDForService:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend((id)*MEMORY[0x1E0D38F38], "indexOfObject:", a3);
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "chat1RecordZoneID");
  else
    objc_msgSend(v4, "chatRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_generateCKRecordsFromChatRecords:(id)a3 filter:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  IMDChat *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  __CFDictionary *theDict;
  id obj;
  id v33;
  id v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v9 = sub_1D151D854((uint64_t)v8);
        if (v9)
        {
          objc_msgSend(v34, "addObject:", v9);
          -[IMDChat serviceName](v9, "serviceName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDChatStore zoneIDForService:](self, "zoneIDForService:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          v13 = -[IMDChat copyCKRecordRepresentationWithZoneID:salt:error:](v9, "copyCKRecordRepresentationWithZoneID:salt:error:", v11, v12, &v36);
          v14 = v36;

          if (v13)
          {
            objc_msgSend(v13, "recordID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "recordName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v33, "containsObject:", v16);

            if ((v17 & 1) == 0)
            {
              v18 = v13;
              CFDictionarySetValue(theDict, -[IMDChat guid](v9, "guid"), v18);

              objc_msgSend(v18, "recordID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "recordName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v20);

              goto LABEL_16;
            }
          }
          else
          {
            -[IMDChat setCloudKitSyncState:](v9, "setCloudKitSyncState:", 2);
            -[IMDChatStore storeChat:](self, "storeChat:", v9);
            IMLogHandleForCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              -[IMDChat guid](v9, "guid");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v42 = (uint64_t)v25;
              v43 = 2112;
              v44 = v14;
              v45 = 1024;
              LODWORD(v46) = 2;
              _os_log_error_impl(&dword_1D1413000, v22, OS_LOG_TYPE_ERROR, "Failed to generate CKRecord for chat %@, error %@, marking ck_sync_state as %d", buf, 0x1Cu);

            }
            objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("NullCKRecordForIMDChat"), v14, CFSTR("MiCSync"), CFSTR("Failed to generate CKRecord for Chat"));
LABEL_16:

          }
          goto LABEL_18;
        }
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "chatIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = (uint64_t)v23;
          v43 = 2112;
          v44 = v24;
          v45 = 2112;
          v46 = v8;
          _os_log_error_impl(&dword_1D1413000, v21, OS_LOG_TYPE_ERROR, "Failed to create IMDChat for guid %@ chatIdentifier %@ ChatRecord %@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("NullIMDChatForChatRecordRef"), 0, CFSTR("MiCSync"), CFSTR("Failed to generate IMDChat for IMDChatRecordRef"));
LABEL_18:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v5);
  }

  if (a4 == 2)
  {
    v26 = objc_msgSend(v34, "count");
    if (v26)
    {
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = objc_msgSend(v34, "count");
          *(_DWORD *)buf = 134217984;
          v42 = v28;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Making sure %ld chats have SMS variants", buf, 0xCu);
        }

      }
      -[IMDChatStore createSMSVariantsIfNeededFor:](self, "createSMSVariantsIfNeededFor:", v34);
    }
  }

  return theDict;
}

+ (IMDChatStore)sharedInstance
{
  if (qword_1ED935CE0 != -1)
    dispatch_once(&qword_1ED935CE0, &unk_1E922CE40);
  return (IMDChatStore *)(id)qword_1ED935E18;
}

- (IMDChatStore)init
{
  IMDChatStore *v2;
  void *v3;
  IMDMessagePTaskXPCStore *v4;
  IMDMessagePTaskStore *messagePTaskStore;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMDChatStore;
  v2 = -[IMDChatStore init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatStore setModificationStamp:](v2, "setModificationStamp:", v3);

    v4 = objc_alloc_init(IMDMessagePTaskXPCStore);
    messagePTaskStore = v2->_messagePTaskStore;
    v2->_messagePTaskStore = (IMDMessagePTaskStore *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D39B08]);
    v7 = (void *)objc_msgSend(v6, "initWithObject:title:queue:", v2, CFSTR("IMDChatStore-Schema"), MEMORY[0x1E0C80D38]);
    -[IMDChatStore setStateCaptureAssistant:](v2, "setStateCaptureAssistant:", v7);

  }
  return v2;
}

- (void)_updateModificationDate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDChatStore setModificationStamp:](self, "setModificationStamp:", v3);

}

- (void)blackholeChat:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Blackholing chat: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v4, "guid");
    v6 = (const void *)IMDChatRecordCopyChatForGUID();
    if (v6)
    {
      IMDChatRecordSetIsBlackholed();
      CFRelease(v6);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "No chat record found to archive for chat: %@", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

- (void)unblackholeChat:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
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
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Unblackholing chat: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v4, "guid");
    v6 = (const void *)IMDChatRecordCopyChatForGUID();
    if (v6)
    {
      IMDChatRecordSetIsBlackholed();
      CFRelease(v6);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "No chat record found to unarchive for chat: %@", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

- (void)_addGroupPhotoToTransferCenterForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "groupPhotoGuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferForGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Transfer already exists in transfer center. not overwriting. Transfer: %@", (uint8_t *)&v15, 0xCu);
      }
LABEL_17:

    }
  }
  else if (objc_msgSend(v4, "length"))
  {
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachmentWithGUID:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v11 = IMOSLoggingEnabled(v10);
    if (v8)
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v4;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Adding group photo to IMDFileTransferCenter for guid: %@.", (uint8_t *)&v15, 0xCu);
        }

      }
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTransfer:forGUID:", v8, v4);

    }
    else if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Group file transfer is nil for guid: %@. Not adding anything to file transfers.", (uint8_t *)&v15, 0xCu);
      }

    }
    goto LABEL_17;
  }

}

- (BOOL)_hasCancellableScheduledMessageForChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  __int128 v23;
  void *v24;
  id v25;
  uint8_t v26;
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scheduledMessagesBatchFetcherForChat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138412290;
    v23 = v7;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9), 0);
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "scheduleType") != 2)
          goto LABEL_20;
        v12 = objc_msgSend(v11, "scheduleState");
        if ((unint64_t)(v12 - 1) > 1)
          goto LABEL_20;
        if (IMOSLoggingEnabled(v12))
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v25, "chatIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = v11;
            v34 = 2112;
            v35 = v14;
            _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found scheduled message: %@ for chatIdentifier: %@", buf, 0x16u);

          }
        }
        if (!objc_msgSend(v11, "errorCode", v23))
        {

          v21 = 1;
          goto LABEL_28;
        }
        IMLogHandleForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v33 = v11;
          _os_log_error_impl(&dword_1D1413000, v15, OS_LOG_TYPE_ERROR, "Scheduled message was marked as failed but didn't update the scheduleState: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDChatStore-Database"), objc_msgSend(v11, "errorCode"), 0);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("Database read a failed scheduled message with an invalid scheduleState"), v16, CFSTR("ScheduledMessageFailureStateNotSet"), 0);

        objc_msgSend(v11, "setScheduleState:", 4);
      }
      else
      {
        IMLogHandleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1D166AEA8(&v26, v27, v16);
      }

LABEL_20:
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v25, "chatIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v20;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "No scheduled message found for chatIdentifier: %@", buf, 0xCu);

    }
  }
  v21 = 0;
LABEL_28:

  return v21;
}

- (void)_updateHasCancellableScheduledMessageForChat:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Updating hasCancellableScheduledMessage state for chat: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v6 = -[IMDChatStore _hasCancellableScheduledMessageForChat:](self, "_hasCancellableScheduledMessageForChat:", v4);
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Calculated hasCancellableScheduledMessage: %@ for chat: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[__CFString updateHasCancellableScheduledMessage:](v4, "updateHasCancellableScheduledMessage:", v6);

}

- (void)_processIncomingChat:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "chatsIgnoreLoginStatus") & 1) == 0 && objc_msgSend(v15, "style") != 45)
    objc_msgSend(v15, "setState:", 0);
  v5 = objc_msgSend(v15, "style") == 43;
  v6 = v15;
  if (v5)
  {
    objc_msgSend(v15, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v15, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trimmedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      v6 = v15;
      if (v10)
        goto LABEL_11;
      objc_msgSend(v15, "setDisplayName:", 0);
    }
    else
    {

    }
    v6 = v15;
  }
LABEL_11:
  objc_msgSend(v6, "lastMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileTransferGUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerTransfersWithGUIDs:forMessageGUID:", v13, v14);

  }
  -[IMDChatStore _updateHasCancellableScheduledMessageForChat:](self, "_updateHasCancellableScheduledMessageForChat:", v15);
  objc_msgSend(v15, "recoverParticipantsIfNeeded");
  -[IMDChatStore _addGroupPhotoToTransferCenterForChat:](self, "_addGroupPhotoToTransferCenterForChat:", v15);
  objc_msgSend(v15, "_repairUnregisteredChatIfNeeded");

}

- (id)loadAllChats
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__loadChatsIncludingAllChats_);
}

- (id)loadRecentChats
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__loadChatsIncludingAllChats_);
}

- (id)_loadChatsIncludingAllChats:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD aBlock[4];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1D154A0CC;
  v39 = sub_1D154A0DC;
  v40 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v5, "startTimingForKey:", CFSTR("loadAllChatsForChatStore"));
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D154A0E4;
  aBlock[3] = &unk_1E922CE68;
  v7 = v6;
  v30 = v7;
  v8 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (v3)
  {
    IMDChatRecordCopyAllActiveChatsProgressivelyWithLimitAndBlock();
  }
  else
  {
    v9 = IMGetCachedDomainIntForKeyWithDefaultValue();
    v10 = IMGetCachedDomainIntForKeyWithDefaultValue();
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v43 = v9;
        v44 = 2048;
        v45 = v10;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Loading recent chats (budget %lld for known senders, %lld for other filters)", buf, 0x16u);
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = (id)IMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1D17EA968]();
          v8[2](v8, v16);
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      }
      while (v13);
    }

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1D154A12C;
  v24[3] = &unk_1E922CE90;
  v24[4] = self;
  v24[5] = &v31;
  v24[6] = &v35;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
  if (*((_BYTE *)v32 + 24))
    IMGreenTeaMessageReadLog();
  if (IMOSLoggingEnabled(objc_msgSend(v5, "stopTimingForKey:", CFSTR("loadAllChatsForChatStore"))))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "totalTimeForKey:", CFSTR("loadAllChatsForChatStore"));
      v20 = v19;
      v21 = objc_msgSend((id)v36[5], "count");
      *(_DWORD *)buf = 134218240;
      v43 = v20;
      v44 = 2048;
      v45 = v21;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Loading all chats took %f seconds for %lu chats", buf, 0x16u);
    }

  }
  v22 = (id)v36[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

- (BOOL)_storeChat:(id)a3 updateProtectedProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  const void *v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17EA968]();
    v8 = sub_1D151C3C8(v6, v4);
    if (v8)
    {
      v9 = (const void *)v8;
      objc_msgSend(v6, "_setRowID:", IMDChatRecordGetIdentifier());
      CFRelease(v9);
    }
    else
    {
      objc_msgSend(v6, "_setRowID:", -1);
    }
    objc_autoreleasePoolPop(v7);
    -[IMDChatStore _updateModificationDate](self, "_updateModificationDate");
  }

  return 0;
}

- (BOOL)storeChat:(id)a3
{
  return -[IMDChatStore _storeChat:updateProtectedProperties:](self, "_storeChat:updateProtectedProperties:", a3, 0);
}

- (unint64_t)unreadCountForChat:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsDatabase");

  if (v5)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend(v3, "rowID");
        v9 = CFSTR("Chat Row ID");
        if (v8 == -1)
          v9 = CFSTR("Chat GUID");
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Counting all unread messages for %@", (uint8_t *)&v13, 0xCu);
      }

    }
    if (objc_msgSend(v3, "rowID") == -1)
    {
      objc_msgSend(v3, "guid");
      v10 = IMDMessageRecordCountAllUnreadMessagesForChatGUID();
    }
    else
    {
      objc_msgSend(v3, "rowID");
      v10 = IMDMessageRecordCountAllUnreadMessagesForChatRowID();
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_incomingChatWithChatRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "No incoming chat record.", v11, 2u);
      }

    }
    v8 = 0;
  }

  return v8;
}

- (id)chatWithGUID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)IMDChatRecordCopyChatForGUID();
  -[IMDChatStore _incomingChatWithChatRecord:](self, "_incomingChatWithChatRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatsFilteredUsingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChatStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatRecordsFilteredByPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1D154A0CC;
  v18 = sub_1D154A0DC;
  v19 = 0;
  -[IMDChatStore database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D154A6D8;
  v13[3] = &unk_1E9228998;
  v13[4] = &v14;
  objc_msgSend(v10, "fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:", v8, v9, a5, v13);

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v15[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)chatsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDChatStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatRecordsWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)chatsWithIdentifier:(id)a3 onService:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChatStore chatsWithIdentifier:onServiceNamed:](self, "chatsWithIdentifier:onServiceNamed:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)chatsWithIdentifier:(id)a3 onServiceNamed:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)IMDChatRecordCopyChatsWithIdentifierOnService();
  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chatsWithPinningIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1D154A0CC;
  v13 = sub_1D154A0DC;
  v14 = 0;
  -[IMDChatStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D154A900;
  v8[3] = &unk_1E9228998;
  v8[4] = &v9;
  objc_msgSend(v5, "fetchChatRecordsWithPinningIdentifier:completionHandler:", v4, v8);

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v10[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)chatsWithGroupID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)IMDChatRecordCopyChatsWithGroupID();
  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatsWithHandle:(id)a3 onService:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)IMDChatRecordCopyChatsWithHandleOnService();
  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[IMDChatStore database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:", v15, v14, v13, v12, v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[IMDChatStore database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:", v15, v14, v13, v12, v7, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)chatsWithRoomname:(id)a3 onService:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)IMDChatRecordCopyChatsWithRoomnameOnService();
  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyDuplicateGroupChatsWithLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyDuplicateGroupChatRecordsWithLimit:", a3);

  -[IMDChatStore _incomingChatsWithChatRecords:](self, "_incomingChatsWithChatRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)newestChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)IMDChatRecordCopyNewestChatForGroupIDOnService();
  -[IMDChatStore _incomingChatWithChatRecord:](self, "_incomingChatWithChatRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newestChatWithGroupID:(id)a3 onService:(id)a4
{
  uint64_t v4;
  void *v5;
  IMDChat *v6;

  v4 = IMDChatRecordCopyNewestChatForGroupIDOnService();
  v5 = (void *)v4;
  if (v4)
    v6 = sub_1D151D854(v4);
  else
    v6 = 0;

  return v6;
}

- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 block:(id)a4
{
  -[IMDChatStore enumerateBatchedChatsFilteredUsingPredicate:batchSize:block:](self, "enumerateBatchedChatsFilteredUsingPredicate:batchSize:block:", a3, 250, a4);
}

- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 batchSize:(unint64_t)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, void *, _BYTE *);
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unsigned __int8 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  if (v9)
  {
    v24 = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0D360E0]);
    objc_msgSend(v10, "setBatchSize:", a4);
    objc_msgSend(v10, "setPredicate:", v8);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1D17EA968](v12);
        -[IMDChatStore _incomingChatWithChatRecord:](self, "_incomingChatWithChatRecord:", v16, (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v18, &v24);
        v19 = v24;

        objc_autoreleasePoolPop(v17);
        if (v19)
          break;
        if (v13 == ++v15)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          v13 = v12;
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (id)chatsGUIDsForMessageWithGUID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (v3 = (id)objc_msgSend(v3, "length")) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)IMDMessageRecordCopyMessageForGUID();
    if (v6)
    {
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = (id)IMDMessageRecordCopyChats();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = (void *)IMDChatRecordCopyGUID();
            if (v11)
              objc_msgSend(v5, "addObject:", v11, v16);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v8);
      }

      if (!objc_msgSend(v5, "count") && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMEventCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v4;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Couldn't find chat for message guid: %@", buf, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMEventCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Couldn't find message for guid: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Lookup failed, NIL or empty message GUID.", buf, 2u);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (id)chatIdentitiesForMessageWithGUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (v3 = (id)objc_msgSend(v3, "count")) != 0)
  {
    v5 = (void *)IMDChatRecordCopyChatIdentitiesForMessageWithGUIDs();
    v6 = v5;
    if (v5 && (v5 = (void *)objc_msgSend(v5, "count")) != 0)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v12 = 136315650;
          v13 = "-[IMDChatStore chatIdentitiesForMessageWithGUIDs:]";
          v14 = 2048;
          v15 = objc_msgSend(v6, "count");
          v16 = 2048;
          v17 = objc_msgSend(v4, "count");
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "%s found %lu chats from %lu message guids", (uint8_t *)&v12, 0x20u);
        }

      }
      v8 = v6;
    }
    else
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = 136315138;
          v13 = "-[IMDChatStore chatIdentitiesForMessageWithGUIDs:]";
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "%s returned nil or empty", (uint8_t *)&v12, 0xCu);
        }

      }
      v8 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Lookup failed, NILL or empty message GUIDs array.", (uint8_t *)&v12, 2u);
      }

    }
    v8 = 0;
  }

  return v8;
}

- (id)chatsGUIDsForMessageWithIdentifier:(int64_t)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)IMDMessageRecordCopyChatsForMessageIdentifier();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)IMDChatRecordCopyGUID();
        if (v9)
          objc_msgSend(v4, "addObject:", v9, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v4, "count") && IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Couldn't find chat for message identifier: %lld", buf, 0xCu);
    }

  }
  return v4;
}

- (void)addMessageWithGUID:(id)a3 toChat:(id)a4
{
  -[IMDChatStore addMessageWithGUID:toChat:deferSpotlightIndexing:](self, "addMessageWithGUID:toChat:deferSpotlightIndexing:", a3, a4, 0);
}

- (void)addMessageWithGUID:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsDatabase");

  if (v11)
  {
    if (v8)
    {
      v12 = objc_msgSend(v8, "length");
      if (v12)
      {
        objc_msgSend(v9, "guid");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && (v13 = -[NSObject length](v13, "length")) != 0)
        {
          if (IMOSLoggingEnabled(v13))
          {
            OSLogHandleForIMEventCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v17 = 138412546;
              v18 = v8;
              v19 = 2112;
              v20 = v9;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Associating message guid: %@ to chat: %@", (uint8_t *)&v17, 0x16u);
            }

          }
          IMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded();
          -[IMDChatStore _performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:chat:shouldDeferIndexing:](self, "_performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:chat:shouldDeferIndexing:", v8, v9, v5);
          IMDSMSRecordStoreSave();
        }
        else if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Association failed, NIL or empty chat GUID.", (uint8_t *)&v17, 2u);
          }

        }
LABEL_19:

        goto LABEL_20;
      }
    }
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Association failed, NIL or empty message GUID.", (uint8_t *)&v17, 2u);
      }
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)_performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:(id)a3 chat:(id)a4 shouldDeferIndexing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  IMDMessagePTask *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "isDeletingIncomingMessages");
  if ((_DWORD)v10)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = (IMDMessagePTask *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v8;
        v29 = 2112;
        v30 = v12;
        _os_log_impl(&dword_1D1413000, &v11->super, OS_LOG_TYPE_INFO, "Not indexing %@, chat %@ has automatic deletion of incoming messages enabled", buf, 0x16u);

      }
LABEL_5:

    }
  }
  else
  {
    if (v5)
    {
      v11 = -[IMDMessagePTask initWithGUID:]([IMDMessagePTask alloc], "initWithGUID:", v8);
      -[IMDMessagePTask setTaskFlag:](v11, "setTaskFlag:", 1);
      if (IMOSLoggingEnabled(-[IMDMessagePTaskStore storePTask:](self->_messagePTaskStore, "storePTask:", v11)))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v8;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Deferring indexing of %@", buf, 0xCu);
        }

      }
      goto LABEL_5;
    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageWithGUID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v15, "syndicationRanges", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v16);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "syndicationStatus") == 2)
          {
            if (IMOSLoggingEnabled(2))
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v15, "guid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v28 = v21;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Not indexing message %@, contains syndication range with not donated status", buf, 0xCu);

              }
            }

            goto LABEL_26;
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v17)
          continue;
        break;
      }
    }

    IMDCoreSpotlightAddMessageGUID();
LABEL_26:

  }
}

- (void)removeMessageWithGUID:(id)a3 fromChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsDatabase");

  if (v8)
  {
    if (v5)
    {
      v9 = objc_msgSend(v5, "length");
      if (v9)
      {
        objc_msgSend(v6, "guid");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (v10 = -[NSObject length](v10, "length")) != 0)
        {
          IMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded();
          IMDSMSRecordStoreSave();
        }
        else if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Disassociation failed, NIL or empty chat GUID.", v13, 2u);
          }

        }
LABEL_14:

        goto LABEL_15;
      }
    }
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Disassociation failed, NIL or empty message GUID.", buf, 2u);
      }
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)remapMessageError:(unsigned int)a3 toError:(unsigned int)a4 forChat:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  __int128 v13;
  CFIndex v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  CFTypeRef cf;
  void (**v24)(id, id);
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v24 = (void (**)(id, id))a6;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = v8;
  objc_msgSend(v8, "guid");
  cf = (CFTypeRef)IMDChatRecordCopyChatForGUID();
  v10 = (const __CFArray *)IMDChatRecordCopyMessagesWithLimit();
  v11 = v10;
  if (v10)
  {
    Count = CFArrayGetCount(v10);
    if (Count << 32 >= 1)
    {
      v14 = 0;
      v15 = (int)Count;
      *(_QWORD *)&v13 = 138412290;
      v22 = v13;
      do
      {
        CFArrayGetValueAtIndex(v11, v14);
        v16 = (void *)IMDMessageRecordCopyGUIDForMessage();
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "messageWithGUID:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && objc_msgSend(v18, "errorCode") == a3)
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          IMLogHandleForCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v28 = v25;
            _os_log_error_impl(&dword_1D1413000, v19, OS_LOG_TYPE_ERROR, "No message guid found for chat: %@", buf, 0xCu);
          }

        }
        ++v14;
      }
      while (v15 != v14);
    }
  }
  objc_msgSend(v25, "guid", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  IMDChatRemapMessagesWithErrorCodeToErrorCode();
  if (v24)
    v24[2](v24, v9);
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);

}

- (void)deleteChat:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  double v8;
  int v9;
  double v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(v3, "guid");
    IMDChatRecordDeleteChatForGUID();
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStamp");

    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v9 = 134218242;
      v10 = v8 - v5;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Deleted chat in %f seconds (%@) ", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1D166AEE4(v7);
  }

}

- (void)setChatIsFiltered:(int64_t)a3 withChatGuid:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a4;
  v5 = v4;
  if (v4 && (v4 = (id)objc_msgSend(v4, "length")) != 0)
  {
    IMDChatRecordSetIsFiltered();
  }
  else if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Setting chat isFiltered failed, nil chat guid", v7, 2u);
    }

  }
}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (BOOL)updatePersonCentricIDForHandlesInChatWithMessage:(id)a3 fromIdentifier:(id)a4 personCentricID:(id)a5 chat:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t i;
  void *v47;
  id v49;
  id v50;
  __int128 v51;
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
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = IMSharedHelperPersistMergeID();
  if ((v12 & 1) != 0)
  {
    v45 = v11;
    objc_msgSend(v9, "_stripFZIDPrefix");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v49, "isTypingMessage") & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v9 = v44;
      if ((objc_msgSend(v44, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) != 0)
      {
        v13 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v44, "_stripFZIDPrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatStore _chatRegistry](self, "_chatRegistry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chatIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allExistingChatsWithIdentifier:style:", v18, objc_msgSend(v45, "style"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v19;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (v43)
      {
        v13 = 0;
        v42 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v60 != v42)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v47 = v20;
            objc_msgSend(v20, "participants");
            v50 = (id)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v56;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v56 != v22)
                    objc_enumerationMutation(v50);
                  v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                  objc_msgSend(v24, "ID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "isEqualToString:", v16);

                  if (v26)
                  {
                    objc_msgSend(v24, "personCentricID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v27, "isEqualToString:", v10);

                    if ((v28 & 1) == 0)
                    {
                      if (IMOSLoggingEnabled(v29))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(v24, "ID");
                          v31 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v24, "personCentricID");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412802;
                          v65 = v31;
                          v66 = 2112;
                          v67 = v32;
                          v68 = 2112;
                          v69 = v10;
                          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Updating handle(%@) from:%@ to:%@", buf, 0x20u);

                        }
                      }
                      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "ID");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "allHandlesForID:", v34);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();

                      v53 = 0u;
                      v54 = 0u;
                      v51 = 0u;
                      v52 = 0u;
                      v36 = v35;
                      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
                      if (v37)
                      {
                        v38 = *(_QWORD *)v52;
                        do
                        {
                          for (k = 0; k != v37; ++k)
                          {
                            if (*(_QWORD *)v52 != v38)
                              objc_enumerationMutation(v36);
                            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "setPersonCentricID:", v10);
                          }
                          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
                        }
                        while (v37);
                      }

                      objc_msgSend(v24, "setPersonCentricID:", v10);
                      objc_msgSend(v47, "serviceName");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      -[IMDChatStore updateHandle:sourceMessage:personCentricID:onService:](self, "updateHandle:sourceMessage:personCentricID:onService:", v24, v49, v10, v40);

                      v13 = 1;
                    }
                  }
                }
                v21 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
              }
              while (v21);
            }

          }
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
        }
        while (v43);
      }
      else
      {
        v13 = 0;
      }

    }
    v9 = v44;
LABEL_12:
    v11 = v45;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not persisting merge id due to override", buf, 2u);
    }

  }
  v13 = 0;
LABEL_13:

  return v13 & 1;
}

- (BOOL)updateHandle:(id)a3 sourceMessage:(id)a4 personCentricID:(id)a5 onService:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "ID");
  v13 = IMDHandleRecordCopyHandleForIDOnService();
  if (v13)
  {
    v14 = (const void *)v13;
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Writing to DB", buf, 2u);
      }

    }
    objc_msgSend(v9, "ID");
    objc_msgSend(v9, "countryCode");
    objc_msgSend(v9, "unformattedID");
    IMDHandleRecordBulkUpdate();
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidatePersonCentricGroupedChatsCache");

    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Done", v20, 2u);
      }

    }
    CFRelease(v14);
  }

  return 1;
}

- (void)_broadcastToForceReloadChats
{
  id v2;

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_forceReloadChats:", 1);

}

- (NSString)modificationStamp
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModificationStamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (IMDMessagePTaskStore)messagePTaskStore
{
  return (IMDMessagePTaskStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessagePTaskStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_messagePTaskStore, 0);
  objc_storeStrong((id *)&self->_lastModificationStamp, 0);
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  IMDChatStore *v4;
  void *v5;

  v4 = self;
  IMDChatStore.batchOfRecordIDsToDelete(limit:)();

  sub_1D16107C8();
  sub_1D1610804();
  v5 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  IMDChatStore *v4;

  sub_1D16107C8();
  sub_1D166DBEC();
  v4 = self;
  _sSo12IMDChatStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

@end
