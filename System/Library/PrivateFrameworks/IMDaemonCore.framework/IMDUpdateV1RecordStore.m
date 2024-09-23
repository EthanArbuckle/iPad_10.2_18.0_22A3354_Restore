@implementation IMDUpdateV1RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *recordNameToRowIDMap;
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
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  __int128 v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "messagesPendingUpdateT1ToCloudKitWithLimit:", a4);

  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  recordNameToRowIDMap = self->_recordNameToRowIDMap;
  self->_recordNameToRowIDMap = v9;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v42;
    *(_QWORD *)&v12 = 138412290;
    v38 = v12;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1E0D398B8];
        +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance", v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateRecordZoneID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cachedSalt");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v16, "createCKRecordForUpdateT1:zoneID:salt:", v15, v18, v20);

        if (v21)
        {
          -[IMDUpdateV1RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "recordName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (!v27)
            goto LABEL_15;
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "setObject:forKey:", v21, v29);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ROWID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDUpdateV1RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "recordName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v33);

        }
        else
        {
          if (IMOSLoggingEnabled(v22))
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v38;
              v46 = v15;
              _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "**** T1 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
            }

          }
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ROWID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "longLongValue");

          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "markMessageAsCleanWithROWID:", v36);
        }

LABEL_15:
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v11);
  }

  return v39;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  -[IMDUpdateV1RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "longLongValue");
    IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit();
  }
  else if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "No rowID present in recordNameToRowIDMap! ", v11, 2u);
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
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      v22 = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@", (uint8_t *)&v22, 0x16u);

    }
  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extractServerRecordFromCKServerErrorRecordChanged:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDUpdateV1RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "longLongValue");
  if (v14)
  {
    v19 = v18;
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v10;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v22, 0xCu);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleMessageUpdateConflictType:serverRecord:localRowID:", CFSTR("UT1"), v14, v19);

  }
}

- (NSMutableDictionary)recordNameToRowIDMap
{
  return self->_recordNameToRowIDMap;
}

- (void)setRecordNameToRowIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_recordNameToRowIDMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNameToRowIDMap, 0);
}

@end
