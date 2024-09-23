@implementation IMDCKMessageSyncCKOperationFactory

- (id)_messageFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
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
  objc_msgSend(v11, "setFetchNewestChangesFirst:", v9 == 0);
  objc_msgSend(v10, "setObject:forKey:", v11, v8);

  return v10;
}

- (id)_operationGroupWithName:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setName:", v4);

  return v5;
}

- (id)fetchMessageZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 operationGroupName:(id)a6 activity:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v27 = v12;
  -[IMDCKMessageSyncCKOperationFactory _messageFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:](self, "_messageFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:", v12, v13, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0C94DE8]);
  IMSingleObjectArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v18, v16);

  v20 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v20, "setQualityOfService:", 17);
  objc_msgSend(v20, "setAllowsCellularAccess:", 1);
  objc_msgSend(v20, "im_setActivity:", v15);
  -[IMDCKMessageSyncCKOperationFactory _operationGroupWithName:](self, "_operationGroupWithName:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGroup:", v21);

  objc_msgSend(v19, "setConfiguration:", v20);
  if (IMOSLoggingEnabled(objc_msgSend(v19, "setFetchAllChanges:", 0)))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "operationID");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "group");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Created fetch message operation ID %@ operationGroupName %@", buf, 0x16u);

    }
  }

  return v19;
}

- (id)saveMessagesCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v8, 0);
  objc_msgSend(v11, "setAtomic:", 0);
  v12 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v12, "setQualityOfService:", 17);
  objc_msgSend(v12, "setAllowsCellularAccess:", 1);
  -[IMDCKMessageSyncCKOperationFactory _operationGroupWithName:](self, "_operationGroupWithName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQuantity:", objc_msgSend(v8, "count"));
  objc_msgSend(v11, "setConfiguration:", v12);
  objc_msgSend(v11, "setGroup:", v13);
  if (IMOSLoggingEnabled(objc_msgSend(v11, "setSavePolicy:", 1)))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "operationID");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "group");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Created modify message operation ID %@ operationGroupName %@", (uint8_t *)&v19, 0x16u);

    }
  }

  return v11;
}

- (id)deleteMessageCKOperationUsingRecordIDstoDelete:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v3);
  objc_msgSend(v4, "setAtomic:", 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v6, "setName:", CFSTR("MessageDelete"));
  objc_msgSend(v6, "setQuantity:", objc_msgSend(v3, "count"));
  objc_msgSend(v4, "setConfiguration:", v5);
  if (IMOSLoggingEnabled(objc_msgSend(v4, "setGroup:", v6)))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "operationID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Created deleted message operation ID %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4;
}

- (id)deleteRecoverableMessageCKOperationUsingRecordIDstoDelete:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v3);
  objc_msgSend(v4, "setAtomic:", 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v6, "setName:", CFSTR("RecoverableMessageDelete"));
  objc_msgSend(v6, "setQuantity:", objc_msgSend(v3, "count"));
  objc_msgSend(v4, "setConfiguration:", v5);
  if (IMOSLoggingEnabled(objc_msgSend(v4, "setGroup:", v6)))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "operationID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Created recoverable deleted message operation ID %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4;
}

- (id)_fetchOptionsDictionaryWithFetchOptions:(id)a3 andZoneID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, a4, 0);
}

- (id)fetchArchivedRecordsOperationWithSyncToken:(id)a3 zoneID:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C94DA8]);
  objc_msgSend(v11, "setPreviousServerChangeToken:", v8);
  -[IMDCKMessageSyncCKOperationFactory _fetchOptionsDictionaryWithFetchOptions:andZoneID:](self, "_fetchOptionsDictionaryWithFetchOptions:andZoneID:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v13, "setAllowsCellularAccess:", 1);
  objc_msgSend(v13, "setQualityOfService:", 17);
  v14 = objc_alloc(MEMORY[0x1E0C94DA0]);
  IMSingleObjectArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v15, v12);

  objc_msgSend(v16, "setFetchAllChanges:", 0);
  if (IMOSLoggingEnabled(objc_msgSend(v16, "setConfiguration:", v13)))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "operationID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Created fetched archived operation ID %@ using zone id %@", (uint8_t *)&v20, 0x16u);

    }
  }

  return v16;
}

@end
