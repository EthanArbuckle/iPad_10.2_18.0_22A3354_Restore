@implementation IMDUpdateV2RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *recordNameToMessageItemMap;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "messagesPendingUpdateT2ToCloudKitWithLimit:", a4);

  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  recordNameToMessageItemMap = self->_recordNameToMessageItemMap;
  self->_recordNameToMessageItemMap = v9;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v43;
    *(_QWORD *)&v12 = 138412290;
    v39 = v12;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1E0D398B8];
        +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance", v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateRecordZoneID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cachedSalt");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v16, "createCKRecordForUpdateT2:zoneID:salt:", v15, v18, v20);

        if (v21)
        {
          -[IMDUpdateV2RecordStore recordNameToMessageItemMap](self, "recordNameToMessageItemMap");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "recordName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (!v27)
            goto LABEL_20;
          -[IMDUpdateV2RecordStore recordNameToMessageItemMap](self, "recordNameToMessageItemMap");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "recordName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v15, v30);

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v40, "setObject:forKey:", v21, v32);
          }
          else
          {
            IMLogHandleForCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v39;
              v48 = v15;
              _os_log_error_impl(&dword_1D1413000, v37, OS_LOG_TYPE_ERROR, "messageItem guid is nil when setting batch of update records: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          if (IMOSLoggingEnabled(v22))
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v39;
              v48 = v15;
              _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "**** T2 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
            }

          }
          objc_msgSend(v15, "objectForKey:", CFSTR("MID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "updateMessagesSyncedSyndicationRangesForGUIDs:toStatus:", v36, 1);

          }
        }

LABEL_20:
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v11);
  }

  return v40;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  -[IMDUpdateV2RecordStore recordNameToMessageItemMap](self, "recordNameToMessageItemMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SR"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateSyncedSyndicationRanges:forGUID:", v13, v11);

  }
  else if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "No message item present in recordNameToMessageItemMap!", v16, 2u);
    }

  }
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "recordName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@", (uint8_t *)&v23, 0x16u);

    }
  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extractServerRecordFromCKServerErrorRecordChanged:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDUpdateV2RecordStore recordNameToMessageItemMap](self, "recordNameToMessageItemMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longLongValue");
  if (v14)
  {
    v20 = v19;
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v10;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v23, 0xCu);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleMessageUpdateConflictType:serverRecord:localRowID:", CFSTR("UT2"), v14, v20);

  }
}

- (NSMutableDictionary)recordNameToMessageItemMap
{
  return self->_recordNameToMessageItemMap;
}

- (void)setRecordNameToMessageItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_recordNameToMessageItemMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNameToMessageItemMap, 0);
}

@end
