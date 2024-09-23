@implementation IMDCKChatSyncCKOperationFactory

- (id)_chatFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v11 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend(v11, "setDesiredKeys:", 0);
  objc_msgSend(v11, "setPreviousServerChangeToken:", v9);

  objc_msgSend(v11, "setResultsLimit:", a5);
  objc_msgSend(v10, "setObject:forKey:", v11, v8);

  return v10;
}

- (id)_chatFetchRecordZoneChangesCKConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F80];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)_chatSyncOperationGroupWithName:(id)a3
{
  __CFString *v3;
  id v4;

  v3 = (__CFString *)a3;
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("ChatSync");
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v4, "setName:", v3);

  return v4;
}

- (id)_chatSyncOperationGroup
{
  return -[IMDCKChatSyncCKOperationFactory _chatSyncOperationGroupWithName:](self, "_chatSyncOperationGroupWithName:", 0);
}

- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 groupName:(id)a6 activity:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v13)
  {
    v17 = objc_alloc(MEMORY[0x1E0C94DE8]);
    IMSingleObjectArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKChatSyncCKOperationFactory _chatFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:](self, "_chatFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:", v12, v13, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v18, v19);

    -[IMDCKChatSyncCKOperationFactory _chatFetchRecordZoneChangesCKConfiguration:](self, "_chatFetchRecordZoneChangesCKConfiguration:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConfiguration:", v21);

    -[IMDCKChatSyncCKOperationFactory _chatSyncOperationGroupWithName:](self, "_chatSyncOperationGroupWithName:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setGroup:", v22);

    if (IMOSLoggingEnabled(objc_msgSend(v20, "setFetchAllChanges:", 1)))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "operationID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v24;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Created fetch chat operation ID %@", (uint8_t *)&v27, 0xCu);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "fetchChatZoneChangesCKOperationUsingToken was passed in a nil zone", (uint8_t *)&v27, 2u);
      }

    }
    v20 = 0;
  }

  return v20;
}

- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 activity:(id)a6
{
  return -[IMDCKChatSyncCKOperationFactory fetchChatZoneChangesCKOperationUsingToken:zone:resultsLimit:groupName:activity:](self, "fetchChatZoneChangesCKOperationUsingToken:zone:resultsLimit:groupName:activity:", a3, a4, a5, 0, a6);
}

- (id)_chatWriteRecordsCKConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F80];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)saveChatsCKOperationUsingRecordsToSave:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v6, 0);
    objc_msgSend(v9, "setAtomic:", 1);
    objc_msgSend(v9, "setSavePolicy:", 1);
    -[IMDCKChatSyncCKOperationFactory _chatWriteRecordsCKConfiguration:](self, "_chatWriteRecordsCKConfiguration:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConfiguration:", v10);

    -[IMDCKChatSyncCKOperationFactory _chatSyncOperationGroup](self, "_chatSyncOperationGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroup:", v11);

    objc_msgSend(v9, "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQuantity:", objc_msgSend(v6, "count"));

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "operationID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Created modify chat operation ID %@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "writeChatsOperationUsingRecordsToSave was passed in a nil records array", (uint8_t *)&v18, 2u);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (id)deleteChatCKOperationUsingRecordIDstoDelete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v4);
  objc_msgSend(v5, "setAtomic:", 0);
  v6 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v6, "setQualityOfService:", 17);
  objc_msgSend(v6, "setAllowsCellularAccess:", 1);
  -[IMDCKChatSyncCKOperationFactory _chatSyncOperationGroup](self, "_chatSyncOperationGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQuantity:", objc_msgSend(v4, "count"));
  objc_msgSend(v5, "setConfiguration:", v6);
  if (IMOSLoggingEnabled(objc_msgSend(v5, "setGroup:", v7)))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "operationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Created deleted chat operation ID %@", (uint8_t *)&v11, 0xCu);

    }
  }

  return v5;
}

- (id)fetchChatCKOperationUsingRecordIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v6, "setQualityOfService:", 17);
  objc_msgSend(v6, "setAllowsCellularAccess:", 1);
  -[IMDCKChatSyncCKOperationFactory _chatSyncOperationGroup](self, "_chatSyncOperationGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQuantity:", objc_msgSend(v4, "count"));
  objc_msgSend(v5, "setConfiguration:", v6);
  if (IMOSLoggingEnabled(objc_msgSend(v5, "setGroup:", v7)))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "operationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Created fetch chat operation ID %@", (uint8_t *)&v11, 0xCu);

    }
  }

  return v5;
}

@end
