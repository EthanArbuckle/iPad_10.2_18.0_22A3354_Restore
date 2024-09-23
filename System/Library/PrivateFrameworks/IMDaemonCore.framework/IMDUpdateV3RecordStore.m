@implementation IMDUpdateV3RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *recordNameToRowIDMap;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v44;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "messagesPendingUpdateT3ToCloudKitWithLimit:", a4);

  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  recordNameToRowIDMap = self->_recordNameToRowIDMap;
  self->_recordNameToRowIDMap = v8;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v52 != v47)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "chatForMessageGUID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "cloudKitChatID");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
          {
            v55[0] = CFSTR("MID");
            v55[1] = CFSTR("CHATID");
            v56[0] = v12;
            v56[1] = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1E0D398B8];
            +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "updateRecordZoneID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "cachedSalt");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v18, "createCKRecordForUpdateT3:zoneID:salt:", v49, v20, v22);

            if (v23)
            {
              -[IMDUpdateV3RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "recordID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "recordName");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28 == 0;

              if (v29)
              {
                objc_msgSend(v44, "setObject:forKey:", v23, v12);
                objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ROWID"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDUpdateV3RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "recordID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "recordName");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v33);

                goto LABEL_26;
              }
            }
            else
            {
              if (IMOSLoggingEnabled(v24))
              {
                OSLogHandleForIMFoundationCategory();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v58 = v11;
                  _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
                }

              }
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ROWID"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "longLongValue");

              +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "markMessageAsCleanWithROWID:", v42);
LABEL_26:

            }
            goto LABEL_29;
          }
          if (IMOSLoggingEnabled(0))
          {
            OSLogHandleForIMFoundationCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v11;
              _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] chat had no cloudKitChatID!, marking it as clean and moving on.", buf, 0xCu);
            }

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ROWID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "longLongValue");

          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "markMessageAsCleanWithROWID:", v39);

        }
        else
        {
          if (IMOSLoggingEnabled(v15))
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v11;
              _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] could not find a chat as a source of truth, marking it as clean and moving on.", buf, 0xCu);
            }

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ROWID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "longLongValue");

          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "markMessageAsCleanWithROWID:", v36);
        }
LABEL_29:

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v48);
  }

  return v44;
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
  -[IMDUpdateV3RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
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

  -[IMDUpdateV3RecordStore recordNameToRowIDMap](self, "recordNameToRowIDMap");
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
    objc_msgSend(v21, "handleMessageUpdateConflictType:serverRecord:localRowID:", CFSTR("UT3"), v14, v19);

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
