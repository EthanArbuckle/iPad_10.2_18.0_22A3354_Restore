@implementation IMDCKAttachmentSyncCKOperationFactory

- (id)fetchAttachmentZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6 operationGroupName:(id)a7 activity:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  -[IMDCKAttachmentSyncCKOperationFactory _attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:desiredKeys:](self, "_attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:desiredKeys:", v14, v15, a5, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0C94DE8]);
  IMSingleObjectArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v20, v18);

  v22 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v22, "setQualityOfService:", 17);
  objc_msgSend(v22, "setAllowsCellularAccess:", 1);
  objc_msgSend(v22, "im_setActivity:", v17);
  -[IMDCKAttachmentSyncCKOperationFactory _operationGroupWithName:](self, "_operationGroupWithName:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setGroup:", v23);

  objc_msgSend(v21, "setConfiguration:", v22);
  if (IMOSLoggingEnabled(objc_msgSend(v21, "setFetchAllChanges:", 0)))
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v21, "operationID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v25;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Created fetch attachment operation  ID %@ fetch operation dictionary %@", (uint8_t *)&v27, 0x16u);

    }
  }

  return v21;
}

- (id)fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 operationGroupName:(id)a5 activity:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v10 = (objc_class *)MEMORY[0x1E0C94E18];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithRecordIDs:", v13);

  objc_msgSend((id)objc_opt_class(), "_desiredKeysArrayForType:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDesiredKeys:", v15);
  v16 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v16, "setQualityOfService:", 17);
  objc_msgSend(v16, "setAllowsCellularAccess:", 1);
  objc_msgSend(v16, "im_setActivity:", v11);

  -[IMDCKAttachmentSyncCKOperationFactory _operationGroupWithName:](self, "_operationGroupWithName:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setGroup:", v17);
  objc_msgSend(v14, "setConfiguration:", v16);

  return v14;
}

- (id)saveAttachmentsCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5
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
  objc_msgSend(v12, "im_setActivity:", v10);
  -[IMDCKAttachmentSyncCKOperationFactory _operationGroupWithName:](self, "_operationGroupWithName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQuantity:", objc_msgSend(v8, "count"));
  objc_msgSend(v11, "setConfiguration:", v12);
  if (IMOSLoggingEnabled(objc_msgSend(v11, "setGroup:", v13)))
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
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Created modify attachment operation ID %@ operationGroupName %@", (uint8_t *)&v19, 0x16u);

    }
  }

  return v11;
}

- (BOOL)_defaultsSayWeHaveSyncedOnce
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
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

- (id)_attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v13 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend((id)objc_opt_class(), "_desiredKeysArrayForType:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDesiredKeys:", v14);
  objc_msgSend(v13, "setPreviousServerChangeToken:", v11);

  objc_msgSend(v13, "setResultsLimit:", a5);
  objc_msgSend(v13, "setFetchNewestChangesFirst:", v11 == 0);
  objc_msgSend(v12, "setObject:forKey:", v13, v10);

  return v12;
}

+ (id)_desiredKeysArrayForType:(int64_t)a3
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v8[0] = CFSTR("cm");
    v8[1] = CFSTR("m");
    v8[2] = CFSTR("lqa");
    v8[3] = CFSTR("avid");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v8;
    v5 = 4;
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v9[0] = CFSTR("cm");
    v9[1] = CFSTR("m");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v9;
    v5 = 2;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)deleteAttachmentCKOperationUsingRecordIDstoDelete:(id)a3
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
  objc_msgSend(v6, "setName:", CFSTR("AttachmentDelete"));
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
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Created deleted attachment operation ID %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4;
}

@end
