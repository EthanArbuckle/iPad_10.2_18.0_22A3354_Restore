@implementation IMDDatabase

- (id)loadRecoverableMessagesMetadataGroupedByChatGUID
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint8_t v6[8];
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin counting recoverable messages per chat", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = sub_1ABC052F4;
  v12 = sub_1ABC05304;
  v13 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABB69BC4;
  v7[3] = &unk_1E5ABBCF8;
  v7[4] = buf;
  IMDRunSqlOperation((uint64_t)v7);
  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Recently Deleted | Finished counting recoverable messages per chat", v6, 2u);
  }

  v4 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v4;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  IMDPredicateToSQLConverter *v15;
  void *v16;
  IMDPredicateToSQLConverter *v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *MessageDateAndFilteredUsingPredicateWithLimitQuery;
  IMDPredicateToSQLConverter *v23;
  _QWORD v24[4];
  IMDPredicateToSQLConverter *v25;
  id v26;
  IMDDatabase *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v10 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1ABC052F4;
  v34 = sub_1ABC05304;
  v35 = 0;
  if (v12)
  {
    v15 = [IMDPredicateToSQLConverter alloc];
    +[IMDChatRecord keyPathsToColumns](IMDChatRecord, "keyPathsToColumns");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v15, "initWithPredicate:keyPathsToColumns:", v12, v16);

    if (!v17)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderTha"
                "n:limit:completionHandler:]";
          v38 = 2112;
          v39 = v12;
          _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      if (v14)
        v14[2](v14, MEMORY[0x1E0C9AA60]);
      goto LABEL_19;
    }
  }
  else
  {
    v17 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      if (!v12)
        v20 = CFSTR("NO");
      v37 = (const char *)v20;
      v38 = 2112;
      v39 = v13;
      v40 = 2048;
      v41 = a6;
      _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Fetching chats sorted by recent and filtered by predicate: %@ olderThan: %@ limit: %llu", buf, 0x20u);
    }

  }
  -[IMDPredicateToSQLConverter expression](v17, "expression");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MessageDateAndFilteredUsingPredicateWithLimitQuery = (void *)IMDChatRecordCopyChatsSortedByLastMessageDateAndFilteredUsingPredicateWithLimitQuery(v10, (uint64_t)v13, (uint64_t)v21);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1ABB69E98;
  v24[3] = &unk_1E5AB6290;
  v23 = v17;
  v25 = v23;
  v28 = &v30;
  v29 = a6;
  v26 = v13;
  v27 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)MessageDateAndFilteredUsingPredicateWithLimitQuery, (uint64_t)v24);
  if (v14)
    v14[2](v14, v31[5]);

LABEL_19:
  _Block_object_dispose(&v30, 8);

}

- (id)_copyChatRecordsFromCoreSDBResults:(id)a3
{
  return _IMDChatRecordCopyChatsFromRecords(a3);
}

+ (IMDRemoteDatabaseProtocol)synchronousDatabase
{
  if (objc_msgSend(a1, "isServerProcess"))
    objc_msgSend(a1, "_databaseServer");
  else
    objc_msgSend(a1, "_databaseClient");
  return (IMDRemoteDatabaseProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_databaseServer
{
  if (qword_1ED0D37E8 != -1)
    dispatch_once(&qword_1ED0D37E8, &unk_1E5AAF188);
  return (id)qword_1ED0D37F0;
}

+ (id)_databaseClient
{
  if (qword_1ED0D3908 != -1)
    dispatch_once(&qword_1ED0D3908, &unk_1E5AAEAE0);
  return (id)qword_1ED0D3910;
}

- (void)fetchDataForKey:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a4;
  IMDKVValueForKey(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v5);

}

- (void)fetchInteger64ForKey:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v5, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1ABB6D2D4;
    v7[3] = &unk_1E5AAF570;
    v8 = v5;
    v9 = &v10;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT value FROM kvtable WHERE key = ?"), (uint64_t)v7);
    if (v6)
      v6[2](v6, v11[3]);

    _Block_object_dispose(&v10, 8);
  }

}

- (void)storeData:(id)a3 forKey:(id)a4
{
  IMDKVPersistValueForKey((uint64_t)a4, (uint64_t)a3);
}

- (void)fetchCountOfRecordType:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  __CFString *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (a3 >= 4)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1ABC56048(a3, v11, v12);

    v5[2](v5, 0);
  }
  else
  {
    v6 = off_1E5AAF590[a3];
    v14 = 0;
    v7 = IMDRowCountForTable((uint64_t)v6, (uint64_t)&v14);
    v8 = v14;
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1ABC55FCC((uint64_t)v6, (uint64_t)v8, v10);
      v7 = 0;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v6;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Total row count for table %{public}@: %@", buf, 0x16u);

    }
    v5[2](v5, v7);

  }
}

- (id)_copyHandleRecordsFromCoreSDBResults:(id)a3
{
  return _IMDHandleRecordCopyHandlesFromRecords(a3);
}

- (id)handleRecordsFilteredByPredicate:(id)a3
{
  id v4;
  IMDPredicateToSQLConverter *v5;
  void *v6;
  IMDPredicateToSQLConverter *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v13;
  _QWORD v14[4];
  IMDPredicateToSQLConverter *v15;
  IMDDatabase *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1ABB71130;
  v22 = sub_1ABB71140;
  v23 = 0;
  if (v4)
  {
    v5 = [IMDPredicateToSQLConverter alloc];
    +[IMDHandleRecord keyPathsToColumns](IMDHandleRecord, "keyPathsToColumns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v5, "initWithPredicate:keyPathsToColumns:", v4, v6);

    if (v7)
    {
      if (_IMWillLog())
      {
        v13 = CFSTR("YES");
        _IMAlwaysLog();
      }
      -[IMDPredicateToSQLConverter expression](v7, "expression", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)IMDHandleRecordCopyHandlesFilteredUsingPredicateQuery(v8);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1ABB71148;
      v14[3] = &unk_1E5AB0530;
      v16 = self;
      v17 = &v18;
      v15 = v7;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v9, (uint64_t)v14);
      v10 = (void *)v19[5];
      if (!v10)
        v10 = (void *)MEMORY[0x1E0C9AA60];
      v11 = v10;

    }
    else
    {
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
      v11 = 0;
    }

  }
  else
  {
    if ((_IMWillLog() & 1) != 0)
      _IMAlwaysLog();
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)fetchHandleRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v8;
  IMDPredicateToSQLConverter *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  IMDSortDescriptorToSQLConverter *v17;
  void *v18;
  IMDSortDescriptorToSQLConverter *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  unint64_t v26;
  id v29;
  void *v30;
  IMDPredicateToSQLConverter *v31;
  void (**v32)(id, _QWORD);
  _QWORD v33[4];
  IMDPredicateToSQLConverter *v34;
  IMDDatabase *v35;
  uint64_t *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  v32 = (void (**)(id, _QWORD))a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_1ABB71130;
  v46 = sub_1ABB71140;
  v47 = 0;
  v30 = v8;
  if (v8)
  {
    v9 = [IMDPredicateToSQLConverter alloc];
    +[IMDHandleRecord keyPathsToColumns](IMDHandleRecord, "keyPathsToColumns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v9, "initWithPredicate:keyPathsToColumns:", v8, v10);

    if (!v31)
    {
      if ((_IMWillLog() & 1) != 0)
        _IMAlwaysLog();
      if (v32)
        v32[2](v32, MEMORY[0x1E0C9AA60]);
      goto LABEL_28;
    }
  }
  else
  {
    v31 = 0;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v29;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v17 = [IMDSortDescriptorToSQLConverter alloc];
        +[IMDHandleRecord keyPathsToColumns](IMDHandleRecord, "keyPathsToColumns");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[IMDSortDescriptorToSQLConverter initWithSortDescriptor:keyPathsToColumns:](v17, "initWithSortDescriptor:keyPathsToColumns:", v16, v18);

        if (!v19)
        {
          if ((_IMWillLog() & 1) != 0)
            _IMAlwaysLog();
          if (v32)
            v32[2](v32, MEMORY[0x1E0C9AA60]);
          goto LABEL_27;
        }
        -[IMDSortDescriptorToSQLConverter expression](v19, "expression");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v20);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (_IMWillLog())
  {
    v21 = objc_msgSend(v12, "count");
    v22 = CFSTR("YES");
    if (!v30)
      v22 = CFSTR("NO");
    v25 = v21;
    v26 = a5;
    v24 = v22;
    _IMAlwaysLog();
  }
  -[IMDPredicateToSQLConverter expression](v31, "expression", v24, v25, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)IMDHandleRecordCopySortedHandlesFilteredUsingPredicateWithLimitQuery(v23, v11);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1ABB715E4;
  v33[3] = &unk_1E5AB0558;
  v36 = &v42;
  v37 = a5;
  v34 = v31;
  v35 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v12, (uint64_t)v33);
  if (v32)
    v32[2](v32, v43[5]);

LABEL_27:
LABEL_28:
  _Block_object_dispose(&v42, 8);

}

- (id)_copyMessageRecordsFromCoreSDBResults:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int ID;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = *MEMORY[0x1E0C9AE00];
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      ID = CSDBRecordGetID();
      v8 = (void *)IMDMessageRecordCreateFromRecordIDUnlocked(v6, ID);
      if (v8)
        objc_msgSend(v4, "addObject:", v8);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

- (void)fetchLastMessageRecordForChatRecordWithRowID:(int64_t)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  _OWORD *v6;
  void *v7;
  void *Message;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v6 = IMDChatRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E0C9AE00], a3);
  v7 = v6;
  if (v6)
  {
    Message = (void *)IMDChatRecordCopyLastMessage((uint64_t)v6);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = (int64_t)Message;
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Fetched last message %@ for chat with rowID: %lld", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = a3;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "No chat record for chat with rowID: %lld", (uint8_t *)&v11, 0xCu);
      }

    }
    Message = 0;
  }
  if (v5)
    v5[2](v5, Message);

}

- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8
{
  const __CFString *v11;
  IMDPredicateToSQLConverter *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const __CFString *v20;
  IMDSortDescriptorToSQLConverter *v21;
  void *v22;
  IMDSortDescriptorToSQLConverter *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  const __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  char *v34;
  __CFString *v35;
  id v36;
  IMDPredicateToSQLConverter *v37;
  void (**v38)(id, _QWORD);
  _QWORD v39[4];
  char *v40;
  IMDPredicateToSQLConverter *v41;
  IMDDatabase *v42;
  uint64_t *v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  unint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v31 = a6;
  v64 = *MEMORY[0x1E0C80C00];
  v34 = (char *)a3;
  v11 = (const __CFString *)a4;
  v36 = a5;
  v38 = (void (**)(id, _QWORD))a8;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1ABBA57AC;
  v53 = sub_1ABBA57BC;
  v54 = 0;
  v35 = (__CFString *)v11;
  if (v11)
  {
    v12 = [IMDPredicateToSQLConverter alloc];
    +[IMDMessageRecord keyPathsToColumns](IMDMessageRecord, "keyPathsToColumns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v12, "initWithPredicate:keyPathsToColumns:", v11, v13);

    if (!v37)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[IMDDatabase(Messages) _fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDesc"
                "riptors:parentedOnly:limit:completionHandler:]";
          v57 = 2112;
          v58 = v11;
          _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      if (v38)
        v38[2](v38, MEMORY[0x1E0C9AA60]);
      goto LABEL_37;
    }
  }
  else
  {
    v37 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = v36;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v16);
        v20 = *(const __CFString **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v21 = [IMDSortDescriptorToSQLConverter alloc];
        +[IMDMessageRecord keyPathsToColumns](IMDMessageRecord, "keyPathsToColumns");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[IMDSortDescriptorToSQLConverter initWithSortDescriptor:keyPathsToColumns:](v21, "initWithSortDescriptor:keyPathsToColumns:", v20, v22);

        if (!v23)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMEventCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v56 = "-[IMDDatabase(Messages) _fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsing"
                    "Descriptors:parentedOnly:limit:completionHandler:]";
              v57 = 2112;
              v58 = v20;
              _os_log_impl(&dword_1ABB60000, v30, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }

          }
          if (v38)
            ((void (*)(void))v38[2])();
          goto LABEL_36;
        }
        -[IMDSortDescriptorToSQLConverter expression](v23, "expression");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v24);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      if (v17)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v16, "count");
      v27 = CFSTR("YES");
      *(_DWORD *)buf = 138413058;
      v57 = 2112;
      v56 = v34;
      if (!v35)
        v27 = CFSTR("NO");
      v58 = v27;
      v59 = 2048;
      v60 = v26;
      v61 = 2048;
      v62 = a7;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Fetching messages for chat: %@ filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x2Au);
    }

  }
  -[IMDPredicateToSQLConverter expression](v37, "expression");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v34)
    v29 = IMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimitQuery((uint64_t)v28, v15);
  else
    v29 = IMDMessageRecordCopySortedMessagesFilteredUsingPredicateWithLimitQuery(v28, v15, v31);
  v16 = (id)v29;

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1ABBA57C4;
  v39[3] = &unk_1E5AB6290;
  v40 = v34;
  v43 = &v49;
  v44 = a7;
  v41 = v37;
  v42 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v16, (uint64_t)v39);
  if (v38)
    v38[2](v38, v50[5]);

LABEL_36:
LABEL_37:
  _Block_object_dispose(&v49, 8);

}

- (void)fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  IMDPredicateToSQLConverter *v11;
  void *v12;
  IMDPredicateToSQLConverter *v13;
  void *v14;
  void *v15;
  IMDPredicateToSQLConverter *v16;
  NSObject *v17;
  _QWORD v18[4];
  IMDPredicateToSQLConverter *v19;
  IMDDatabase *v20;
  _BYTE *v21;
  uint8_t v22[4];
  const char *v23;
  __int16 v24;
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Fetching unread messages for chat predicate: %@  limit: %llu", buf, 0x16u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = sub_1ABBA57AC;
  v28 = sub_1ABBA57BC;
  v29 = 0;
  if (!v8)
  {
    v15 = (void *)IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter(0, a4);
    v13 = 0;
    goto LABEL_9;
  }
  v11 = [IMDPredicateToSQLConverter alloc];
  +[IMDChatRecord keyPathsToColumns](IMDChatRecord, "keyPathsToColumns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v11, "initWithPredicate:keyPathsToColumns:", v8, v12);

  if (v13)
  {
    -[IMDPredicateToSQLConverter expression](v13, "expression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter((uint64_t)v14, a4);

LABEL_9:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1ABBA5B80;
    v18[3] = &unk_1E5AB0530;
    v16 = v13;
    v20 = self;
    v21 = buf;
    v19 = v16;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v15, (uint64_t)v18);
    v9[2](v9, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    goto LABEL_10;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 136315394;
      v23 = "-[IMDDatabase(Messages) fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:limit:completionHandler:]";
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", v22, 0x16u);
    }

  }
  if (v9)
    v9[2](v9, MEMORY[0x1E0C9AA60]);
LABEL_10:
  _Block_object_dispose(buf, 8);

}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 parentedOnly:(BOOL)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel__fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_parentedOnly_limit_completionHandler_);
}

- (void)fetchMessageRecordWithGUID:(id)a3 excludeRecoverableMessages:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  __CFString *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  __CFString *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[4];
  __CFString *v16;
  IMDDatabase *v17;
  _BYTE *v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8 && v9)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v20 = sub_1ABBA57AC;
    v21 = sub_1ABBA57BC;
    v22 = 0;
    if (v6)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1ABBA5E44;
      v15[3] = &unk_1E5AB0530;
      v17 = self;
      v18 = buf;
      v16 = v8;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message JOIN chat_message_join AS cmj ON message.ROWID = cmj.message_id WHERE message.guid = ?;"),
        (uint64_t)v15);
      v11 = v16;
    }
    else
    {
      v14 = IMDMessageRecordCopyMessageForGUID(v8);
      v11 = *(__CFString **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v14;
    }

    v10[2](v10, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = _Block_copy(v10);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Database | One or more invalid required parameters: messageGUID: %@, completionHandler: %@", buf, 0x16u);

    }
  }

}

- (void)fetchScheduledMessageRecordsForChatRecordWithGUID:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  const __CFString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDDatabase *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1ABBA57AC;
  v21 = sub_1ABBA57BC;
  v22 = 0;
  if (v8 && objc_msgSend(v8, "length"))
    v10 = CFSTR("SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE c.guid = ?  AND m.schedule_type == 2  AND (m.schedule_state == 1 OR m.schedule_state == 2)  ORDER BY m.date ASC LIMIT ?");
  else
    v10 = CFSTR("SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE m.schedule_type == 2  AND (m.schedule_state == 1 OR m.schedule_state == 2)  ORDER BY m.date ASC LIMIT ?");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABBA6018;
  v12[3] = &unk_1E5AB0558;
  v11 = v8;
  v15 = &v17;
  v16 = a4;
  v13 = v11;
  v14 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v10, (uint64_t)v12);
  if (v9)
    v9[2](v9, v18[5]);

  _Block_object_dispose(&v17, 8);
}

- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABBA6154;
  v9[3] = &unk_1E5AB62B8;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR(" INSERT INTO scheduled_messages_pending_cloudkit_delete (guid, recordID) VALUES (?, ?);"),
    (uint64_t)v9);

}

- (void)deleteTombstonedScheduledMessagesWithRecordIDs:(id)a3
{
  id v3;
  __CFString *MutableCopy;
  unint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("DELETE from scheduled_messages_pending_cloudkit_delete"));
  if (objc_msgSend(v3, "count"))
  {
    CFStringAppend(MutableCopy, CFSTR(" WHERE (recordID = ?"));
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v5 = 1;
      do
      {
        CFStringAppend(MutableCopy, CFSTR(" OR recordID = ?"));
        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count"));
    }
    CFStringAppend(MutableCopy, CFSTR(")"));
  }
  CFStringAppend(MutableCopy, CFSTR(";"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABBA62C4;
  v7[3] = &unk_1E5AB62E0;
  v8 = v3;
  v6 = v3;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)MutableCopy, (uint64_t)v7);

}

- (void)markMessageRecordsAsReadWithGUIDs:(id)a3
{
  id v3;
  const __CFAllocator *v4;
  void *v5;
  CFStringRef v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = IMDGenerateInClauseForCount(objc_msgSend(v3, "count"));
  v6 = CFStringCreateWithFormat(v4, 0, CFSTR("UPDATE   message SET   is_read = 1,   date_read = ? WHERE guid %@"), v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABBA63B4;
  v8[3] = &unk_1E5AB62E0;
  v9 = v3;
  v7 = v3;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v6, (uint64_t)v8);

}

- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  id v4;
  __CFDictionary *Row;
  id v6;
  NSObject *v7;
  id v9;
  _OWORD v10[2];
  _OWORD v11[9];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(v11, 0, sizeof(v11));
  memset(v10, 0, sizeof(v10));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v10);
  _IMDSqlOperationBeginQuery((uint64_t)v10, CFSTR(" select * from scheduled_messages_pending_cloudkit_delete where LENGTH(TRIM(recordID)) > 0 limit ?;"));
  IMDSqlStatementBindInt64((uint64_t)v11, a3);
  while (IMDSqlOperationHasRows((uint64_t)v10))
  {
    Row = IMDSqlStatementGetRow((sqlite3_stmt **)v11);
    if (Row)
      objc_msgSend(v4, "addObject:", Row);

  }
  IMDSqlOperationFinishQuery((uint64_t)v10);
  v9 = 0;
  IMDSqlOperationRelease((uint64_t)v10, &v9);
  v6 = v9;
  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Got error: %@ while trying to get scheduled messages pending cloudkit delete", buf, 0xCu);
    }

  }
  return v4;
}

- (id)_updateMessageSyncStateQueryFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "substitutionStringForCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@( %@)"), CFSTR("UPDATE message SET ck_sync_state = ? where guid in "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateMessagesSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v6;
  const __CFArray *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  _OWORD v16[2];
  _OWORD v17[8];
  __int128 v18;
  uint8_t buf[4];
  const __CFArray *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v16);
  _IMDSqlOperationBeginQuery((uint64_t)v16, (CFStringRef)-[IMDDatabase _updateMessageSyncStateQueryFor:](self, "_updateMessageSyncStateQueryFor:", objc_msgSend(v6, "count")));
  IMDSqlStatementBindInt64((uint64_t)v17, a3);
  v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v17, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v16))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "CloudSync.message | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = *((id *)&v18 + 1);
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC5A568((uint64_t)v7, v8);

  }
  IMDSqlOperationCommitOrRevertTransaction(v16);
  v15 = 0;
  v10 = IMDSqlOperationRelease((uint64_t)v16, &v15);
  v11 = v15;
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v13)
      sub_1ABC5A484();
  }
  else if (v13)
  {
    sub_1ABC5A4E8(v11, v12);
  }

  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }

}

- (BOOL)_updateSyndicatedMessageItem:(id)a3 newMessageItem:(id)a4 newSyndicationRange:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  void *v24;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    if (v8)
    {
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "guid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v28 = v12;
            v29 = 2112;
            v30 = v10;
            _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Updating syndication ranges for message item with guid %@. newSyndicationRange: %@", buf, 0x16u);

          }
        }
        objc_msgSend(v8, "syndicationRanges");
        v13 = objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v14 = (void *)MEMORY[0x1E0D39948];
        v33[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateMessagesRanges:withMessagePartSyndicationRanges:didUpdate:", v13, v15, &v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v8, "setSyndicationRanges:", v16);
          IMDUpdateIMMessageItemWithIMMessageItemForceReplaceReplaceError(v7, v8, 1, 0, 0, 1, 0);
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject guid](v17, "guid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          IMDCoreSpotlightAddMessageGUID(v18, 1);

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "guid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v28 = v20;
              _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Updated syndication ranges for message: %@", buf, 0xCu);

            }
          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
          {
LABEL_25:
            v21 = v26 != 0;

            goto LABEL_26;
          }
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "guid");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "description");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            -[NSObject componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR(",\n"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v28 = v22;
            v29 = 2112;
            v30 = v23;
            v31 = 2112;
            v32 = v24;
            _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Did NOT update syndication ranges for message: %@\nNew Range:\n%@\nOriginal Ranges:\n%@", buf, 0x20u);

          }
        }

        goto LABEL_25;
      }
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1ABC5A64C();
    }
    else
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1ABC5A620();
    }
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1ABC5A5F4();
  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (void)updateAttachmentSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  id v4;
  const __CFString *v5;
  NSObject *v6;
  const __CFArray **v7;
  const __CFArray **v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  int v25;
  int v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id obj;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSObject *v45;
  _BYTE v46[128];
  uint64_t v47;

  v35 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    IMMessageGuidFromIMFileTransferGuid();
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1ABC5A6EC();
      goto LABEL_58;
    }
    v7 = (const __CFArray **)IMDMessageRecordCopyMessageForGUID(v5);
    if (v7)
    {
      v8 = v7;
      v9 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v7, 0, 0, 0);
      CFRelease(v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
              v42 = 2112;
              v43 = v4;
              _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessageItem for attachment GUID %@", buf, 0x16u);
            }

          }
          -[NSObject fileTransferGUIDs](v9, "fileTransferGUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", v4);

          if (v12)
          {
            v13 = v4;
          }
          else
          {
            -[NSObject findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:](v9, "findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:", v4);
            v13 = objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              IMLogHandleForCategory();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                sub_1ABC5A8D8();

              IMLogHandleForCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                sub_1ABC5A84C(v9);
LABEL_57:

LABEL_58:
              goto LABEL_59;
            }
          }
          -[NSObject messageParts](v9, "messageParts");
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v37;
LABEL_27:
            v19 = 0;
            while (1)
            {
              if (*(_QWORD *)v37 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v19);
              objc_msgSend(v20, "transferGUID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[NSObject isEqualToString:](v13, "isEqualToString:", v21);

              if (v22)
                break;
              if (v17 == ++v19)
              {
                v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
                if (v17)
                  goto LABEL_27;
                goto LABEL_33;
              }
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
                v42 = 2112;
                v43 = v4;
                v44 = 2112;
                v45 = v13;
                _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessagePartDescriptor for attachment GUID %@ (actualAttachmentGUID %@)", buf, 0x20u);
              }

            }
            v24 = v20;

            if (v24)
            {
              -[IMDDatabase _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:](self, "_updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:", v9, v24, v35);

              goto LABEL_56;
            }
          }
          else
          {
LABEL_33:

          }
          v25 = -[NSObject isCMM](v9, "isCMM");
          v26 = IMOSLoggingEnabled();
          if (v25)
          {
            if (v26)
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1ABB60000, v27, OS_LOG_TYPE_INFO, "messageItem is CMM, routing to alternative path to handle IMMessagePartSyndicationAssetDescriptors", buf, 2u);
              }

            }
            v28 = +[IMDDatabase _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:](IMDDatabase, "_newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:", v9, v13, v35);
            if (v28
              && !-[IMDDatabase _updateSyndicatedMessageItem:newMessageItem:newSyndicationRange:](self, "_updateSyndicatedMessageItem:newMessageItem:newSyndicationRange:", v9, v9, v28)&& IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                -[NSObject guid](v9, "guid");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
                v42 = 2112;
                v43 = v30;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "%s message item with GUID %@ did not update its syndication ranges", buf, 0x16u);

              }
            }

          }
          else if (v26)
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v41 = (const char *)v13;
              _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "Failed to find matching messagePart for attachment GUID %@", buf, 0xCu);
            }

          }
LABEL_56:

          goto LABEL_57;
        }
LABEL_22:
        IMLogHandleForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_1ABC5A760();
        goto LABEL_58;
      }
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1ABC5A980();

    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1ABC5A7D4();
    }

    goto LABEL_22;
  }
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1ABC5A678(v6, v14, v15);
LABEL_59:

}

- (void)_updateMessageItemSyndicationRanges:(id)a3 messagePartDescriptor:(id)a4 shouldHideFromSyndication:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  int v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;
  NSRange v66;
  NSRange v67;
  NSRange v68;

  v5 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v11 = objc_msgSend(v9, "messagePartRange");
      if (!(v11 | v12))
      {
        IMLogHandleForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1ABC5AAE0(v8);
        goto LABEL_57;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v10, "messagePartIndex");
          v66.location = objc_msgSend(v10, "messagePartRange");
          NSStringFromRange(v66);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          v59 = 2112;
          v60 = v19;
          v61 = 2048;
          v62 = v20;
          v63 = 2112;
          v64 = v21;
          _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "%s Updating syndication ranges for message guid: %@, part %ld, range: %@", buf, 0x2Au);

        }
      }
      v22 = objc_msgSend(v10, "messagePartRange");
      v24 = v23;
      v25 = IMOSLoggingEnabled();
      if (v5)
      {
        if (v25)
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v67.location = v22;
            v67.length = v24;
            NSStringFromRange(v67);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "guid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            v59 = 2112;
            v60 = v27;
            v61 = 2112;
            v62 = (uint64_t)v28;
            _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "%s Removing message part range from syndication %@ for message item with GUID %@", buf, 0x20u);

          }
        }
        v29 = objc_alloc(MEMORY[0x1E0D39948]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v29, "initWithSyndicationType:messagePartRange:syndicationStartDate:", 4, v22, v24, v30);
      }
      else
      {
        if (v25)
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v68.location = v22;
            v68.length = v24;
            NSStringFromRange(v68);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "guid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            v59 = 2112;
            v60 = v32;
            v61 = 2112;
            v62 = (uint64_t)v33;
            _os_log_impl(&dword_1ABB60000, v31, OS_LOG_TYPE_INFO, "%s Unhiding syndication for message part range %@ for message item with GUID %@", buf, 0x20u);

          }
        }
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v8, "syndicationRanges", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v53;
LABEL_26:
          v37 = 0;
          while (1)
          {
            if (*(_QWORD *)v53 != v36)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v37);
            if (objc_msgSend(v38, "messagePartRange") == v22 && v39 == v24)
              break;
            if (v35 == ++v37)
            {
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
              if (v35)
                goto LABEL_26;
              goto LABEL_35;
            }
          }
          v30 = v38;

          if (v30 && (objc_msgSend(v30, "syndicationType") & 4) != 0)
          {
            v49 = objc_msgSend(v30, "syndicationType");
            v50 = objc_alloc(MEMORY[0x1E0D39948]);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v50, "initWithSyndicationType:messagePartRange:syndicationStartDate:", v49 & 0xFFFFFFFFFFFFFFFBLL, v22, v24, v51);

            goto LABEL_43;
          }
        }
        else
        {
LABEL_35:

          v30 = 0;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "guid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            v59 = 2112;
            v60 = v42;
            v61 = 2112;
            v62 = (uint64_t)v30;
            _os_log_impl(&dword_1ABB60000, v41, OS_LOG_TYPE_INFO, "%s NOT updating message syndication ranges for message item with GUID %@ because it is already unhidden. currentSyndicationRange: %@", buf, 0x20u);

          }
        }
        v13 = 0;
      }
LABEL_43:

      v43 = IMOSLoggingEnabled();
      if (!v13)
      {
        if (!v43)
          goto LABEL_57;
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          v59 = 2112;
          v60 = v48;
          _os_log_impl(&dword_1ABB60000, v46, OS_LOG_TYPE_INFO, "%s newSyndicationRange was nil. Did not update syndication ranges for message with GUID %@", buf, 0x16u);

        }
LABEL_56:

        goto LABEL_57;
      }
      if (v43)
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          v59 = 2112;
          v60 = v45;
          v61 = 2112;
          v62 = (uint64_t)v13;
          _os_log_impl(&dword_1ABB60000, v44, OS_LOG_TYPE_INFO, "%s Updating message syndication ranges for message item with GUID %@. newSyndicationRange: %@", buf, 0x20u);

        }
      }
      if (!-[IMDDatabase _updateSyndicatedMessageItem:newMessageItem:newSyndicationRange:](self, "_updateSyndicatedMessageItem:newMessageItem:newSyndicationRange:", v8, v8, v13)&& IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          v59 = 2112;
          v60 = v47;
          _os_log_impl(&dword_1ABB60000, v46, OS_LOG_TYPE_INFO, "%s message item with GUID %@ did not update its syndication ranges", buf, 0x16u);

        }
        goto LABEL_56;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1ABC5AA6C(v13, v16, v17);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1ABC5A9F8(v13, v14, v15);
  }
LABEL_57:

}

+ (id)_newSyndicationRangeForCMMMessageItem:(id)a3 syndicationIdentifier:(id)a4 shouldHideFromSyndication:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  unint64_t v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  unint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  int v105;
  NSObject *v106;
  void *v107;
  id v108;
  NSObject *v109;
  void *v110;
  uint64_t v111;
  NSObject *v112;
  id v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  unint64_t v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  _BYTE v140[128];
  _BYTE v141[128];
  void *v142;
  id v143;
  uint8_t v144[128];
  uint8_t buf[4];
  const char *v146;
  __int16 v147;
  unint64_t v148;
  __int16 v149;
  id v150;
  _BYTE v151[128];
  uint64_t v152;

  v5 = a5;
  v152 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v119 = a4;
  if (!v7)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC5AB6C(v15, v16, v17);
    goto LABEL_13;
  }
  objc_msgSend(v7, "fileTransferGUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_msgSend(v7, "fileTransferGUIDs"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        !v10))
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC5ABE0(v7);
    goto LABEL_13;
  }
  v11 = objc_msgSend(v7, "getCMMAssetOffset");
  v118 = IMCMMAssetIndexFromIMFileTransferGUID();
  objc_msgSend(v7, "fileTransferGUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 < v11)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1ABC5AC6C();

    goto LABEL_14;
  }
  if (v13 != v11)
  {
    if (v118 < v11)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Attachment is CMM preview, aborting since we don't care about donating preview to CoreSpotlight", buf, 2u);
        }

      }
      goto LABEL_14;
    }
    v114 = v13 - v11;
    objc_msgSend(v7, "fileTransferGUIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v117)
    {
      IMLogHandleForCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        sub_1ABC5AD6C(v7);
        goto LABEL_46;
      }
LABEL_47:
      v18 = 0;
      goto LABEL_131;
    }
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(v7, "messageParts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v133;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v133 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          objc_msgSend(v26, "transferGUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v117, "isEqualToString:", v27);

          if (v28)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
                v147 = 2112;
                v148 = (unint64_t)v117;
                v149 = 2112;
                v150 = v119;
                _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessagePartDescriptor for fileTransferGUID %@ (actualAttachmentGUID %@)", buf, 0x20u);
              }

            }
            v30 = objc_msgSend(v26, "messagePartRange");
            v115 = v31;
            v116 = v30;
            goto LABEL_40;
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
        if (v23)
          continue;
        break;
      }
    }
    v115 = 0x7FFFFFFFFFFFFFFFLL;
    v116 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_40:

    if (v116 == 0x7FFFFFFFFFFFFFFFLL && v115 == 0x7FFFFFFFFFFFFFFFLL)
    {
      IMLogHandleForCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        sub_1ABC5ADF8();
LABEL_46:
        v18 = 0;
        v33 = v32;
LABEL_131:

        goto LABEL_15;
      }
      goto LABEL_47;
    }
    objc_msgSend(v7, "syndicationRanges");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34
      || (objc_msgSend(v7, "syndicationRanges"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_msgSend(v35, "count") == 0,
          v35,
          v34,
          v36))
    {
      v111 = 0;
    }
    else
    {
      objc_msgSend(v7, "syndicationRanges");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v38, "copy");

    }
    v39 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v39)
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "guid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
          v147 = 2048;
          v148 = v118;
          v149 = 2112;
          v150 = v41;
          _os_log_impl(&dword_1ABB60000, v40, OS_LOG_TYPE_INFO, "%s Updating asset syndication descriptor to be hidden for asset index %ld on message item with GUID %@", buf, 0x20u);

        }
      }
      objc_msgSend(v7, "fileTransferGUIDs", v111);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "subarrayWithRange:", v11, v114);
      v113 = (id)objc_claimAutoreleasedReturnValue();

      if (!v112)
        goto LABEL_81;
      -[NSObject assetDescriptor](v112, "assetDescriptor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
        goto LABEL_81;
      -[NSObject assetDescriptor](v112, "assetDescriptor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "assetSyndications");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45 == 0;

      if (!v46)
      {
        v47 = (void *)MEMORY[0x1E0C99E08];
        -[NSObject assetDescriptor](v112, "assetDescriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "assetSyndications");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dictionaryWithDictionary:", v49);
        v50 = (id)objc_claimAutoreleasedReturnValue();

        if (!v50
          || (objc_msgSend(v50, "objectForKey:", &unk_1E5ADC030),
              v51 = (void *)objc_claimAutoreleasedReturnValue(),
              v52 = v51 == 0,
              v51,
              v52))
        {
          v60 = 0;
        }
        else
        {
          objc_msgSend(v50, "objectForKeyedSubscript:", &unk_1E5ADC030);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v53, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v118);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56
            && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v118),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v54, "objectForKeyedSubscript:", v57),
                v58 = (void *)objc_claimAutoreleasedReturnValue(),
                v59 = objc_msgSend(v58, "intValue"),
                v58,
                v57,
                v59 != 4))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v118);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_1E5ADC048, v99);

            v60 = v54;
          }
          else
          {
            v60 = 0;
          }

        }
      }
      else
      {
LABEL_81:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v113, "count"));
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v50 = v113;
        v70 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v129;
          do
          {
            for (j = 0; j != v70; ++j)
            {
              if (*(_QWORD *)v129 != v71)
                objc_enumerationMutation(v50);
              if (*(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j))
              {
                v73 = IMCMMAssetIndexFromIMFileTransferGUID();
                if (v73 >= v11)
                {
                  if (v73 == v118)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "setObject:forKeyedSubscript:", &unk_1E5ADC048, v74);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "setObject:forKeyedSubscript:", &unk_1E5ADC030, v74);
                  }

                }
              }
            }
            v70 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
          }
          while (v70);
        }
      }

      if (v60)
      {
        v100 = objc_alloc(MEMORY[0x1E0D39940]);
        v142 = &unk_1E5ADC030;
        v143 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)objc_msgSend(v100, "initWithAssetSyndications:", v101);

        v103 = objc_alloc(MEMORY[0x1E0D39948]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v103, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v116, v115, v104, 0, v102);

LABEL_120:
        v105 = IMOSLoggingEnabled();
        if (v18)
        {
          if (v105)
          {
            OSLogHandleForIMFoundationCategory();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v7, "guid");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
              v147 = 2112;
              v148 = (unint64_t)v107;
              v149 = 2112;
              v150 = v18;
              _os_log_impl(&dword_1ABB60000, v106, OS_LOG_TYPE_INFO, "%s Updating message syndication ranges for message item with GUID %@. newSyndicationRange: %@", buf, 0x20u);

            }
          }
          v108 = v18;
        }
        else if (v105)
        {
          OSLogHandleForIMFoundationCategory();
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "guid");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
            v147 = 2112;
            v148 = (unint64_t)v110;
            _os_log_impl(&dword_1ABB60000, v109, OS_LOG_TYPE_INFO, "%s newSyndicationRange was nil. Did not update syndication ranges for message with GUID %@", buf, 0x16u);

          }
        }

        v33 = v112;
        goto LABEL_131;
      }
    }
    else
    {
      if (v39)
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "guid");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
          v147 = 2048;
          v148 = v118;
          v149 = 2112;
          v150 = v62;
          _os_log_impl(&dword_1ABB60000, v61, OS_LOG_TYPE_INFO, "%s Updating asset syndication descriptor to be not hidden for part index %ld on message item with GUID %@", buf, 0x20u);

        }
      }
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      objc_msgSend(v7, "syndicationRanges", v111);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
      if (!v64)
      {
LABEL_80:

LABEL_102:
        objc_msgSend(v7, "fileTransferGUIDs");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "subarrayWithRange:", v11, v114);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v60 = v83;
        v85 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
        if (v85)
        {
          v86 = *(_QWORD *)v121;
          do
          {
            for (k = 0; k != v85; ++k)
            {
              if (*(_QWORD *)v121 != v86)
                objc_enumerationMutation(v60);
              if (*(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k))
              {
                v88 = IMCMMAssetIndexFromIMFileTransferGUID();
                if (v88 >= v11)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v88);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "setObject:forKeyedSubscript:", &unk_1E5ADC030, v89);

                }
              }
            }
            v85 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
          }
          while (v85);
        }

        v90 = objc_alloc(MEMORY[0x1E0D39940]);
        v138 = &unk_1E5ADC030;
        v139 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)objc_msgSend(v90, "initWithAssetSyndications:", v91);

        v93 = objc_alloc(MEMORY[0x1E0D39948]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (void *)objc_msgSend(v93, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v116, v115, v94, 0, v92);

        v113 = v95;
        v18 = v113;
        goto LABEL_120;
      }
      v65 = *(_QWORD *)v125;
LABEL_71:
      v66 = 0;
      while (1)
      {
        if (*(_QWORD *)v125 != v65)
          objc_enumerationMutation(v63);
        v67 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v66);
        if (objc_msgSend(v67, "messagePartRange") == v116 && v68 == v115)
          break;
        if (v64 == ++v66)
        {
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
          if (v64)
            goto LABEL_71;
          goto LABEL_80;
        }
      }
      v113 = v67;

      if (!v113)
        goto LABEL_102;
      objc_msgSend(v113, "syndicationForPartIndex:asset:", v118, 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v75;
      if (v75)
      {
        v76 = objc_msgSend(v75, "intValue");
        v77 = v76;
        if ((v76 & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v118);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = v96;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v77 & 0xFFFFFFFFFFFFFFFBLL);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = v97;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D39948], "updateAssetInfoWith:asset:range:", v98, 0, v113);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_120;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "guid");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "assetDescriptor");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "serializedString");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
            v147 = 2112;
            v148 = (unint64_t)v79;
            v149 = 2112;
            v150 = v81;
            _os_log_impl(&dword_1ABB60000, v78, OS_LOG_TYPE_INFO, "%s NOT updating CMM asset syndication for message item with GUID %@ because it is already unhidden. current syndications: %@", buf, 0x20u);

          }
        }
      }
    }
    v18 = 0;
    goto LABEL_120;
  }
  IMLogHandleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1ABC5ACE0(v7);
LABEL_13:

LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (void)updateMessageSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  _BOOL8 v4;
  const __CFString *v6;
  __CFString *v7;
  const __CFArray **v8;
  const __CFArray **v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFString *)a3;
  v7 = (__CFString *)v6;
  if (v6)
  {
    v8 = (const __CFArray **)IMDMessageRecordCopyMessageForGUID(v6);
    if (v8)
    {
      v9 = v8;
      v10 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v8, 0, 0, 0);
      CFRelease(v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if (v11)
        {
          v12 = v11;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
              v36 = 2112;
              v37 = v7;
              _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "%s Found IMMessageItem for message GUID %@", buf, 0x16u);
            }

          }
          v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D39930]), "initWithEncodedMessagePartGUID:", v7);
          if (v14)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                v16 = -[NSObject partNumber](v14, "partNumber");
                *(_DWORD *)buf = 136315650;
                v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
                v36 = 2048;
                v37 = (__CFString *)v16;
                v38 = 2112;
                v39 = v7;
                _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "%s Found partNumber %ld for message GUID %@", buf, 0x20u);
              }

            }
            -[NSObject body](v12, "body");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "__im_messagePartMatchingPartIndex:", -[NSObject partNumber](v14, "partNumber"));
            v18 = (id)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              -[IMDDatabase _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:](self, "_updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:", v12, v18, v4);
            }
            else
            {
              IMLogHandleForCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                sub_1ABC5AFF4(v14, (uint64_t)v7, v28);

            }
          }
          else
          {
            -[NSObject messageParts](v12, "messageParts");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                v24 = objc_msgSend(v22, "count");
                *(_DWORD *)buf = 136315650;
                v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
                v36 = 2112;
                v37 = v7;
                v38 = 2048;
                v39 = (__CFString *)v24;
                _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "%s messagePart number not foound for message GUID %@, updating all %ld parts", buf, 0x20u);
              }

            }
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v18 = v22;
            v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v30 != v26)
                    objc_enumerationMutation(v18);
                  -[IMDDatabase _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:](self, "_updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:", v12, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v4, (_QWORD)v29);
                }
                v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v25);
            }

          }
LABEL_42:

          goto LABEL_43;
        }
      }
      else
      {
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1ABC5B09C();

      }
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1ABC5AF80();
      v12 = 0;
      goto LABEL_42;
    }
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC5AF0C();
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC5AE98(v12, v19, v20);
  }
LABEL_43:

}

- (id)_updateMessageSyncedSyndicationRangesQueryFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "substitutionStringForCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), CFSTR("update message set synced_syndication_ranges=syndication_ranges where guid in"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateMessagesSyncedSyndicationRangesForGUIDs:(id)a3 toStatus:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    v9 = v6;
    v8 = objc_msgSend(v6, "count");
    v7 = v9;
    if (v8)
    {
      -[IMDDatabase _updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:](self, "_updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:", v9);
      v7 = v9;
    }
  }

}

- (void)_updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:(id)a3
{
  id v4;
  const __CFArray *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  _OWORD v14[2];
  _OWORD v15[8];
  __int128 v16;
  uint8_t buf[4];
  const __CFArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v14);
  IMDSqlOperationBeginTransaction(v14);
  _IMDSqlOperationBeginQuery((uint64_t)v14, (CFStringRef)-[IMDDatabase _updateMessageSyncedSyndicationRangesQueryFor:](self, "_updateMessageSyncedSyndicationRangesQueryFor:", objc_msgSend(v4, "count")));
  v5 = (const __CFArray *)v4;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v15, v5);
  if (IMDSqlOperationFinishQuery((uint64_t)v14))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "CloudSync.message | updated synced syndication ranges for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    v6 = *((id *)&v16 + 1);
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC5B1F4((uint64_t)v5, v6);

  }
  IMDSqlOperationCommitOrRevertTransaction(v14);
  v13 = 0;
  v8 = IMDSqlOperationRelease((uint64_t)v14, &v13);
  v9 = v13;
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      sub_1ABC5B110();
  }
  else if (v11)
  {
    sub_1ABC5B174(v9, v10);
  }

  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating synced syndication ranges for: %@", buf, 0xCu);
  }

}

- (void)moveMessageRecordsToRecoveryForMessageGUIDs:(id)a3 deleteDate:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  sqlite3_int64 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  __CFString *v13;
  sqlite3_int64 v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  _BYTE v34[16];
  _BYTE v35[128];
  uint8_t buf[32];
  _BYTE v37[128];
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin moving messages to recoverable message table with deleteDate: %@ for %lu unique messages", buf, 0x16u);
    }

  }
  v8 = objc_msgSend(v25, "__im_nanosecondTimeInterval");
  v38 = 0u;
  memset(v37, 0, sizeof(v37));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(const __CFString **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v13 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v12);
        v14 = -[__CFString rowID](v13, "rowID");
        _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("INSERT OR REPLACE INTO chat_recoverable_message_join (chat_id, message_id, delete_date)   SELECT chat_id, message_id, ?   FROM chat_message_join AS cmj   JOIN message AS m   ON m.ROWID = cmj.message_id AND m.guid = ?;"));
        IMDSqlStatementBindInt64((uint64_t)v37, v8);
        IMDSqlStatementBindTextFromCFString((uint64_t)v37, (uint64_t)v12);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          v17 = *((id *)&v38 + 1);
          IMLogHandleForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_1ABC5B354();

          goto LABEL_21;
        }
        _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("DELETE FROM chat_message_join WHERE message_id = ? AND message_id IN(SELECT message_id FROM chat_recoverable_message_join WHERE message_id = ?);"));
        IMDSqlStatementBindInt64((uint64_t)v37, v14);
        IMDSqlStatementBindInt64((uint64_t)v37, v14);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          v15 = *((id *)&v38 + 1);
          IMLogHandleForCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_1ABC5B304((uint64_t)v34, (uint64_t)v15);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_21:

  IMDSqlOperationCommitOrRevertTransaction(buf);
  v27 = 0;
  v19 = IMDSqlOperationRelease((uint64_t)buf, &v27);
  v20 = v27;
  if (v19)
  {
    IMDCoreSpotlightDeleteMessageGUIDS(obj, 1005);
    IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
  }
  else
  {
    IMLogHandleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1ABC5B280(v20, v21);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(obj, "count");
      *(_DWORD *)v32 = 134217984;
      v33 = v23;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recoverable message table for %lu unique messages", v32, 0xCu);
    }

  }
}

- (void)deleteRecoverableMessagesOlderThanDays:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_dateByAddingDays:", -a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[IMDDatabase _permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:beforeDate:](self, "_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:beforeDate:", 0, v7);
}

- (void)deleteJunkMessagesOlderThanDays:(int64_t)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_dateByAddingDays:", -a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[IMDDatabase _permanentlyDeleteJunkMessagesBeforeDate:](self, "_permanentlyDeleteJunkMessagesBeforeDate:", v6);
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[IMDDatabase _permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:beforeDate:](self, "_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:beforeDate:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v6);

}

- (id)_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 beforeDate:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  int *v31;
  id obj;
  id v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *theString;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[4];
  uint64_t v44;
  _BYTE v45[4];
  int v46;
  _BYTE v47[128];
  _OWORD buf[2];
  _BYTE v49[128];
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t)a3;
  v7 = (unint64_t)a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 134217984;
      *(_QWORD *)((char *)buf + 4) = objc_msgSend((id)v6, "count");
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin permanently deleting recoverable messages for %lu chatGUIDs", (uint8_t *)buf, 0xCu);
    }

  }
  if (!(v6 | v7))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Cannot delete recoverable messages in chats without chatGUIDs or beforeDate", (uint8_t *)buf, 2u);
      }

    }
    v33 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_55;
  }
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_msgSend((id)v7, "__im_nanosecondTimeInterval");
  v10 = CFSTR("INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid = ? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.delete_date < ? AND crmj.ck_sync_state=1 UNION ALL SELECT c.guid, m.guid, rmp.part_index FROM recoverable_message_part AS rmp JOIN chat AS c  ON c.ROWID=rmp.chat_id JOIN message AS m  ON m.ROWID=rmp.message_id AND rmp.delete_date < ? AND rmp.ck_sync_state=1;");
  if (v7)
  {
    v11 = CFSTR("DELETE FROM message AS m WHERE m.ROWID IN( SELECT crmj.message_id   FROM chat_recoverable_message_join AS crmj   JOIN message AS m   ON crmj.message_id = m.ROWID   JOIN chat AS c ON crmj.chat_id = c.ROWID and c.guid = ?   WHERE crmj.delete_date < ?    AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join))));");
  }
  else
  {
    v10 = CFSTR("INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid=? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.ck_sync_state=1;");
    v11 = CFSTR("DELETE FROM message WHERE NOT (group_action_type IN (1,3) AND (ROWID IN (SELECT message_id FROM message_attachment_join))) AND (ROWID IN (SELECT message_id                FROM chat_recoverable_message_join AS crmj                JOIN chat AS c                ON c.ROWID = crmj.chat_id AND c.guid = ?));");
  }
  theString = v10;
  v35 = v11;
  v50 = 0u;
  memset(v49, 0, sizeof(v49));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  if (!v6)
  {
    -[IMDDatabase _chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:operation:](self, "_chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:operation:", v7, buf);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)v6;
  v12 = 0;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (!v13)
    goto LABEL_42;
  v34 = *(_QWORD *)v40;
  v31 = &v46;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v40 != v34)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      -[IMDDatabase _mostRecentRecoverableMessageDateForChatWithGUID:operation:](self, "_mostRecentRecoverableMessageDateForChatWithGUID:operation:", v15, buf);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _IMDSqlOperationBeginQuery((uint64_t)buf, theString);
      IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
      if (v7)
        IMDSqlStatementBindInt64((uint64_t)v49, v37);
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        v17 = *((id *)&v50 + 1);
        IMLogHandleForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1ABC5B57C((uint64_t)v45, (uint64_t)v17);

      }
      _IMDSqlOperationBeginQuery((uint64_t)buf, v35);
      IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
      if (v7)
        IMDSqlStatementBindInt64((uint64_t)v49, v37);
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        v20 = *((id *)&v50 + 1);
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1ABC5B4F0();
        goto LABEL_41;
      }
      v12 += IMDMessageRecordCountChangesUnlocked();
      if (!v7)
      {
        -[IMDDatabase _deleteTransfersInMessagePartsForChatGUID:](self, "_deleteTransfersInMessagePartsForChatGUID:", v15);
        _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("DELETE FROM recoverable_message_part AS rmp WHERE rmp.chat_id IN( SELECT c.ROWID  FROM chat AS c  WHERE c.guid = ?);"));
        IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          v20 = *((id *)&v50 + 1);
          IMLogHandleForCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_1ABC5B464();
LABEL_41:

          goto LABEL_42;
        }
      }
      -[IMDDatabase _deleteChatIfEmptyWithGUID:lastMessageDate:operation:](self, "_deleteChatIfEmptyWithGUID:lastMessageDate:operation:", v15, v16, buf, v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v33, "addObject:", v19);

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v13)
      continue;
    break;
  }
LABEL_42:

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v24 = 4;
  else
    v24 = 1;
  objc_msgSend(v22, "trackDeleteMessages:sourceType:", v23, v24, v31);

  IMDSqlOperationCommitOrRevertTransaction(buf);
  v38 = 0;
  v25 = IMDSqlOperationRelease((uint64_t)buf, &v38);
  v26 = v38;
  if (v25)
  {
    IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
  }
  else
  {
    IMLogHandleForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1ABC5B3E0(v26, v27);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend(obj, "count");
      *(_DWORD *)v43 = 134217984;
      v44 = v29;
      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Recently Deleted | Finished permanently deleting recoverable messages for %lu chatGUIDs", v43, 0xCu);
    }

  }
LABEL_55:

  return v33;
}

- (id)_mostRecentRecoverableMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;
  IMDSqlOperation *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1ABBA9F80;
  v11[3] = &unk_1E5AB6308;
  v13 = a4;
  v7 = v5;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = sub_1ABBA9F8C;
  v10[3] = &unk_1E5AB2298;
  v10[4] = &v14;
  v10[5] = a4;
  _IMDSqlOperationRunQuery((uint64_t)a4, CFSTR("SELECT m.date FROM chat_recoverable_message_join AS crmj JOIN chat AS c ON c.ROWID = crmj.chat_id AND c.guid = ? JOIN message AS m ON m.ROWID = crmj.message_id ORDER BY m.date DESC LIMIT 1 "), (uint64_t)v11, (uint64_t)v10);
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v15[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_permanentlyDeleteJunkMessagesBeforeDate:(id)a3
{
  id v4;
  NSObject *v5;
  sqlite3_int64 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  __int128 v29;
  _OWORD v30[8];
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Junk Messages | Will begin permanently deleting junk messages", buf, 2u);
    }

  }
  v22 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "__im_nanosecondTimeInterval");
    v31 = 0u;
    v29 = 0u;
    memset(v30, 0, sizeof(v30));
    *(_OWORD *)buf = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    IMDSqlOperationBeginTransaction(buf);
    -[IMDDatabase _chatGUIDsForChatsWithJunkMessagesOlderThanDate:operation:](self, "_chatGUIDsForChatsWithJunkMessagesOlderThanDate:operation:", v4, buf);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[IMDDatabase _mostRecentJunkMessageDateForChatWithGUID:operation:](self, "_mostRecentJunkMessageDateForChatWithGUID:operation:", v11, buf, v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("DELETE FROM message AS m WHERE m.ROWID IN( SELECT cmj.message_id   FROM chat_message_join AS cmj   JOIN message AS m   ON cmj.message_id = m.ROWID   JOIN chat AS c ON cmj.chat_id = c.ROWID and c.guid = ?   WHERE m.date < ?);"));
          IMDSqlStatementBindTextFromCFString((uint64_t)v30, v11);
          IMDSqlStatementBindInt64((uint64_t)v30, v6);
          if (!IMDSqlOperationFinishQuery((uint64_t)buf))
          {
            v15 = *((id *)&v31 + 1);
            IMLogHandleForCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              sub_1ABC5B5CC();

            goto LABEL_18;
          }
          v13 = IMDMessageRecordCountChangesUnlocked();
          v14 = -[IMDDatabase _deleteChatIfEmptyWithGUID:lastMessageDate:operation:](self, "_deleteChatIfEmptyWithGUID:lastMessageDate:operation:", v11, v12, buf);

          v7 += v13;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackDeleteMessages:sourceType:", v18, 5);

    IMDSqlOperationCommitOrRevertTransaction(buf);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = objc_msgSend(obj, "count");
        *(_DWORD *)v32 = 134217984;
        v33 = v20;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Junk Messages | Finished permanently deleting junk messages for %lu chatGUIDs", v32, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Junk Messages | Cannot delete junk messages in chats without beforeDate", buf, 2u);
    }

  }
}

- (id)_mostRecentJunkMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;
  IMDSqlOperation *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1ABBAA62C;
  v11[3] = &unk_1E5AB6308;
  v13 = a4;
  v7 = v5;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = sub_1ABBAA638;
  v10[3] = &unk_1E5AB2298;
  v10[4] = &v14;
  v10[5] = a4;
  _IMDSqlOperationRunQuery((uint64_t)a4, CFSTR("SELECT m.date FROM chat_message_join AS cmj JOIN chat AS c ON c.ROWID = cmj.chat_id AND c.guid = ? JOIN message AS m ON m.ROWID = cmj.message_id ORDER BY m.date DESC LIMIT 1 "), (uint64_t)v11, (uint64_t)v10);
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v15[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (int64_t)_countMessagesExcludingGroupPhotosInChatWithGUID:(id)a3 isRecoverable:(BOOL)a4 operation:(IMDSqlOperation *)a5
{
  _BOOL4 v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  IMDSqlOperation *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  v7 = a3;
  v8 = CFSTR("SELECT COUNT(*) FROM chat_message_join AS cmj JOIN message AS m ON cmj.message_id = m.ROWID JOIN chat AS c ON cmj.chat_id = c.ROWID WHERE c.guid = ? AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join)))");
  if (v6)
    v8 = CFSTR("SELECT COUNT(*) FROM chat_recoverable_message_join AS crmj JOIN message AS m ON crmj.message_id = m.ROWID JOIN chat AS c ON crmj.chat_id = c.ROWID WHERE c.guid = ? AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join)))");
  v9 = v8;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABBAA914;
  v15[3] = &unk_1E5AB6308;
  v17 = a5;
  v11 = v7;
  v16 = v11;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = sub_1ABBAA920;
  v14[3] = &unk_1E5AB2298;
  v14[4] = &v18;
  v14[5] = a5;
  _IMDSqlOperationRunQuery((uint64_t)a5, v9, (uint64_t)v15, (uint64_t)v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v9[16];
  _QWORD v10[6];
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | retrieving recoverable messages pending cloudkit update with resultLimit: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x3032000000;
  v13 = sub_1ABBA57AC;
  v14 = sub_1ABBA57BC;
  v15 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABBAACA4;
  v10[3] = &unk_1E5AB22C0;
  v10[4] = &buf;
  v10[5] = a3;
  IMDRunSqlOperation((uint64_t)v10);
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Finished fetching messages metadata pending update", v9, 2u);
  }

  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v9[16];
  _QWORD v10[6];
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | retrieving recoverable messages pending cloudkit delete with resultLimit: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x3032000000;
  v13 = sub_1ABBA57AC;
  v14 = sub_1ABBA57BC;
  v15 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABBAB5F8;
  v10[3] = &unk_1E5AB22C0;
  v10[4] = &buf;
  v10[5] = a3;
  IMDRunSqlOperation((uint64_t)v10);
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Finished fetching messages metadata pending delete", v9, 2u);
  }

  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  sqlite3_int64 v12;
  sqlite3_int64 v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _QWORD buf[4];
  _OWORD v41[8];
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf[0]) = 138412802;
    *(_QWORD *)((char *)buf + 4) = v9;
    WORD2(buf[1]) = 2112;
    *(_QWORD *)((char *)&buf[1] + 6) = v10;
    HIWORD(buf[2]) = 2112;
    buf[3] = v11;
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | setting recoverable sync state: %@ for message rowID: %@ partIndex: %@", (uint8_t *)buf, 0x20u);

  }
  v42 = 0u;
  memset(v41, 0, sizeof(v41));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  if (a5 == -1)
  {
    _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("UPDATE chat_recoverable_message_join AS crmj SET ck_sync_state = ? WHERE crmj.message_id = ?;"));
    v12 = a3;
    v13 = a4;
  }
  else
  {
    _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("UPDATE recoverable_message_part AS rmp SET ck_sync_state = ? WHERE rmp.message_id = ? AND rmp.part_index = ?;"));
    IMDSqlStatementBindInt64((uint64_t)v41, a3);
    v12 = a4;
    v13 = a5;
  }
  IMDSqlStatementBindInt64((uint64_t)v41, v12);
  IMDSqlStatementBindInt64((uint64_t)v41, v13);
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    v14 = *((id *)&v42 + 1);
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138413058;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      _os_log_error_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed setting recoverable sync state: %@ with op finish error: %@ for message rowID: %@ partIndex: %@", v32, 0x2Au);

    }
  }
  v31 = 0;
  v16 = IMDSqlOperationRelease((uint64_t)buf, &v31);
  v17 = v31;
  IMLogHandleForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138412802;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Successfully set recoverable sync state: %@ for message rowID: %@ partIndex: %@", v32, 0x20u);

    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v32 = 138413058;
    v33 = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 2112;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    _os_log_error_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed setting recoverable sync state: %@ with op release error: %@ for message rowID: %@ partIndex: %@", v32, 0x2Au);

  }
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageGUIDs:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  const __CFArray *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const __CFArray *v19;
  void *v20;
  const __CFArray *v21;
  id v22;
  uint8_t v23[4];
  void *v24;
  __int16 v25;
  const __CFArray *v26;
  __int16 v27;
  const __CFArray *v28;
  uint8_t buf[32];
  _OWORD v30[8];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | setting recoverable sync state: %@ for message guids: %@", buf, 0x16u);

  }
  v31 = 0u;
  memset(v30, 0, sizeof(v30));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  -[IMDDatabase _updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:](self, "_updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:", objc_msgSend(v6, "count"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _IMDSqlOperationBeginQuery((uint64_t)buf, v9);
  IMDSqlStatementBindInt64((uint64_t)v30, a3);
  v10 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v30, v10);
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    v11 = *((id *)&v31 + 1);
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v19 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412802;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed bulk updating recoverable messages sync state: %@ with op finish error: %@ for message guids: %@", v23, 0x20u);

    }
  }
  v22 = 0;
  v13 = IMDSqlOperationRelease((uint64_t)buf, &v22);
  v14 = v22;
  IMLogHandleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Recently Deleted | Successfully bulk updated recoverable sync state: %@ for message guids: %@", v23, 0x16u);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedDescription");
    v21 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138412802;
    v24 = v20;
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v10;
    _os_log_error_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed bulk updating recoverable sync state: %@ with op release error: %@ for message guids: %@", v23, 0x20u);

  }
}

- (void)storeRecoverableMessagePartWithBody:(id)a3 forMessageWithGUID:(id)a4 deleteDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  sqlite3_int64 v11;
  void *v12;
  void *v13;
  sqlite3_int64 v14;
  const __CFData *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t v26[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  _QWORD buf[4];
  _OWORD v33[8];
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 138412546;
    *(_QWORD *)((char *)buf + 4) = v8;
    WORD2(buf[1]) = 2112;
    *(_QWORD *)((char *)&buf[1] + 6) = v9;
    _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin storing message part body for message with GUID: %@ at deleteDate: %@", (uint8_t *)buf, 0x16u);
  }

  v11 = objc_msgSend(v9, "__im_nanosecondTimeInterval");
  objc_msgSend(v7, "attributesAtIndex:effectiveRange:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D366B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "integerValue");
    JWEncodeCodableObject();
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v34 = 0u;
      memset(v33, 0, sizeof(v33));
      memset(buf, 0, sizeof(buf));
      IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
      IMDSqlOperationBeginTransaction(buf);
      _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("INSERT INTO recoverable_message_part (chat_id, message_id, part_index, delete_date, part_text, ck_sync_state)   SELECT cmj.chat_id, cmj.message_id, ?, ?, ?, 0   FROM chat_message_join AS cmj   JOIN message AS m   ON m.ROWID = cmj.message_id AND m.guid = ?;"));
      IMDSqlStatementBindInt64((uint64_t)v33, v14);
      IMDSqlStatementBindInt64((uint64_t)v33, v11);
      IMDSqlStatementBindBlob((uint64_t)v33, v15);
      IMDSqlStatementBindTextFromCFString((uint64_t)v33, (uint64_t)v8);
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        v16 = *((id *)&v34 + 1);
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v26 = 138412802;
          v27 = v23;
          v28 = 2112;
          v29 = v8;
          v30 = 2112;
          v31 = v9;
          _os_log_error_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed with error: %@ storing message part body for message with GUID: %@ at deleteDate: %@", v26, 0x20u);

        }
      }
      IMDSqlOperationCommitOrRevertTransaction(buf);
      v24 = 0;
      v18 = IMDSqlOperationRelease((uint64_t)buf, &v24);
      v19 = v24;
      if (v18)
      {
        v25 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        IMDCoreSpotlightDeleteMessageGUIDS(v20, 1005);

        IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
      }
      else
      {
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1ABC5B6B0(v19, v21);

      }
      IMLogHandleForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v26 = 138412546;
        v27 = v8;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Recently Deleted | Finished storing message part body for message with GUID: %@ at deleteDate: %@", v26, 0x16u);
      }

    }
    else
    {
      IMLogHandleForCategory();
      v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        sub_1ABC5B684();
    }
  }
  else
  {
    IMLogHandleForCategory();
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      sub_1ABC5B658();
  }

}

- (void)clearRecoverableMessageTombStones
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[8];
  id v10;
  uint8_t buf[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin clearing recoverable message tombstones", buf, 2u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buf = 0u;
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("DELETE FROM unsynced_removed_recoverable_messages;"));
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    v3 = *((id *)&v21 + 1);
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1ABC5B818(v3, v4);

  }
  IMDSqlOperationCommitOrRevertTransaction(buf);
  v10 = 0;
  v5 = IMDSqlOperationRelease((uint64_t)buf, &v10);
  v6 = v10;
  if (!v5)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC5B798(v6, v7);

  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Finished clearing recoverable message tombstones", v9, 2u);
  }

}

- (id)_updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "substitutionStringForCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), CFSTR("SELECT rowid FROM message WHERE guid IN"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), CFSTR("UPDATE chat_recoverable_message_join AS crmj SET ck_sync_state = ? WHERE crmj.message_id IN"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (IMDRemoteDatabaseProtocol)database
{
  if (objc_msgSend(a1, "isServerProcess"))
    objc_msgSend(a1, "_databaseServer");
  else
    objc_msgSend(a1, "_databaseClient");
  return (IMDRemoteDatabaseProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sendLegacyXPCCommandWithObject:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  xpc_object_t empty;
  _BOOL4 v8;
  int64_t int64;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  empty = xpc_dictionary_create_empty();
  v8 = v5 != 0;
  int64 = xpc_dictionary_get_int64(v6, "__xpc__event_code__");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABBBC9CC;
  v12[3] = &unk_1E5AB1E98;
  v13 = empty;
  v14 = v5;
  v10 = v5;
  v11 = empty;
  __IMDPersistenceIPCServer_command_dispatcher(int64, 0, v6, v8, (uint64_t)v11, (uint64_t)v12);

}

- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4
{
  IMDCoreSpotlightDeleteAttachmentGUIDs(a3, a4);
}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  char *v3;
  IMDPredicateToSQLConverter *v4;
  void *v5;
  IMDPredicateToSQLConverter *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  IMDPredicateToSQLConverter *v12;
  _QWORD v13[4];
  IMDPredicateToSQLConverter *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (char *)a3;
  if (v3)
  {
    v4 = [IMDPredicateToSQLConverter alloc];
    +[IMDAttachmentRecord keyPathsToColumns](IMDAttachmentRecord, "keyPathsToColumns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v4, "initWithPredicate:keyPathsToColumns:", v3, v5);

    if (!v6)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "-[IMDDatabase(Attachments) deleteAttachmentsDirectWithPredicate:]";
          v17 = 2112;
          v18 = v3;
          _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      goto LABEL_13;
    }
  }
  else
  {
    v6 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Deleting attachments filtered by predicate %@", buf, 0xCu);
    }

  }
  -[IMDPredicateToSQLConverter expression](v6, "expression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)IMDAttachmentRecordDeleteUsingPredicateQuery((uint64_t)v9);

  v11 = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1ABBEADDC;
  v13[3] = &unk_1E5AB62E0;
  v14 = v6;
  v12 = v6;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v11, (uint64_t)v13);

LABEL_13:
}

- (id)_updateAttachmentsSyncStateQueryFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "substitutionStringForCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@( %@)"), CFSTR("UPDATE attachment SET ck_sync_state = ? WHERE guid IN "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateAttachmentsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v6;
  const __CFArray *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _OWORD v17[2];
  _OWORD v18[8];
  __int128 v19;
  uint8_t buf[4];
  const __CFArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v17);
  IMDSqlOperationBeginTransaction(v17);
  _IMDSqlOperationBeginQuery((uint64_t)v17, (CFStringRef)-[IMDDatabase _updateAttachmentsSyncStateQueryFor:](self, "_updateAttachmentsSyncStateQueryFor:", objc_msgSend(v6, "count")));
  IMDSqlStatementBindInt64((uint64_t)v18, a3);
  v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v18, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v17))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "CloudSync.message | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = *((id *)&v19 + 1);
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC5F84C((uint64_t)v7, v8, v9);

  }
  IMDSqlOperationCommitOrRevertTransaction(v17);
  v16 = 0;
  v10 = IMDSqlOperationRelease((uint64_t)v17, &v16);
  v11 = v16;
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v13)
      sub_1ABC5F754((uint64_t)v7, v12, v14);
  }
  else if (v13)
  {
    sub_1ABC5F7C0(v11, v12);
  }

  IMLogHandleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }

}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  IMDPredicateToSQLConverter *v10;
  void *v11;
  IMDPredicateToSQLConverter *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  IMDPredicateToSQLConverter *v18;
  _QWORD v19[4];
  IMDPredicateToSQLConverter *v20;
  IMDDatabase *v21;
  _BYTE *v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    v10 = [IMDPredicateToSQLConverter alloc];
    +[IMDAttachmentRecord keyPathsToColumns](IMDAttachmentRecord, "keyPathsToColumns");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v10, "initWithPredicate:keyPathsToColumns:", v8, v11);

    if (!v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:limit:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      v9[2](v9, MEMORY[0x1E0C9AA60]);
      goto LABEL_18;
    }
  }
  else
  {
    v12 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("YES");
      if (!v8)
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Fetching attachments filtered by predicate: %@ limit: %llu", buf, 0x16u);
    }

  }
  -[IMDPredicateToSQLConverter expression](v12, "expression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)IMDAttachmentRecordCopyFilteredUsingPredicateWithLimitQuery((uint64_t)v16);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = sub_1ABBEB4A8;
  v25 = sub_1ABBEB4B8;
  v26 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1ABBEB4C0;
  v19[3] = &unk_1E5AB0530;
  v18 = v12;
  v21 = self;
  v22 = buf;
  v20 = v18;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v17, (uint64_t)v19);
  if (v9)
    v9[2](v9, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
LABEL_18:

}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v8;
  IMDPredicateToSQLConverter *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  IMDSortDescriptorToSQLConverter *v18;
  void *v19;
  IMDSortDescriptorToSQLConverter *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  void *v30;
  id v31;
  IMDPredicateToSQLConverter *v32;
  void (**v33)(id, _QWORD);
  _QWORD v34[4];
  IMDPredicateToSQLConverter *v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  unint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v33 = (void (**)(id, _QWORD))a6;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1ABBEB4A8;
  v47 = sub_1ABBEB4B8;
  v48 = 0;
  v30 = v8;
  if (v8)
  {
    v9 = [IMDPredicateToSQLConverter alloc];
    +[IMDAttachmentRecord keyPathsToColumns](IMDAttachmentRecord, "keyPathsToColumns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v9, "initWithPredicate:keyPathsToColumns:", v8, v10);

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:com"
                "pletionHandler:]";
          v51 = 2112;
          v52 = (uint64_t)v8;
          _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      if (v33)
        v33[2](v33, MEMORY[0x1E0C9AA60]);
      goto LABEL_34;
    }
  }
  else
  {
    v32 = 0;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v31;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v18 = [IMDSortDescriptorToSQLConverter alloc];
        +[IMDAttachmentRecord keyPathsToColumns](IMDAttachmentRecord, "keyPathsToColumns");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[IMDSortDescriptorToSQLConverter initWithSortDescriptor:keyPathsToColumns:](v18, "initWithSortDescriptor:keyPathsToColumns:", v17, v19);

        if (!v20)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMEventCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v50 = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit"
                    ":completionHandler:]";
              v51 = 2112;
              v52 = (uint64_t)v17;
              _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }

          }
          if (v33)
            ((void (*)(void))v33[2])();
          goto LABEL_33;
        }
        -[IMDSortDescriptorToSQLConverter expression](v20, "expression");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v21);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v13, "count");
      v24 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      if (!v30)
        v24 = CFSTR("NO");
      v50 = (const char *)v24;
      v51 = 2048;
      v52 = v23;
      v53 = 2048;
      v54 = a5;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Fetching attachments filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x20u);
    }

  }
  -[IMDPredicateToSQLConverter expression](v32, "expression", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)IMDAttachmentRecordCopySortedAttachmentsFilteredUsingPredicateWithLimitQuery(v25, v12);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1ABBEBA84;
  v34[3] = &unk_1E5AB0558;
  v37 = &v43;
  v38 = a5;
  v35 = v32;
  v36 = v28;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v13, (uint64_t)v34);
  if (v33)
    v33[2](v33, v44[5]);

LABEL_33:
LABEL_34:
  _Block_object_dispose(&v43, 8);

}

- (id)_copyAttachmentRecordsFromCoreSDBResults:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int ID;
  const void *v8;
  const void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      v6 = *MEMORY[0x1E0C9AE00];
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v5);
        ID = CSDBRecordGetID();
        v8 = IMDAttachmentRecordCreateFromRecordID(v6, ID);
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v4, "addObject:", v8);
          CFRelease(v9);
        }
        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count"));
    }
    v10 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138413058;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Asked to post Started SharePlay from Messages notification for chat GUID %@, FaceTime conversation UUID %@, handleIdentifier %@, and localizedApplicationName %@", (uint8_t *)&v15, 0x2Au);
    }

  }
  +[IMDNotificationsController sharedInstance](IMDNotificationsController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postSharePlayNotificationForChatGUID:faceTimeConversationUUID:handleIdentifier:localizedApplicationName:", v9, v10, v11, v12);

}

- (id)chatRecordsFilteredByPredicate:(id)a3
{
  id v4;
  IMDPredicateToSQLConverter *v5;
  void *v6;
  IMDPredicateToSQLConverter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[4];
  IMDPredicateToSQLConverter *v17;
  IMDDatabase *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1ABC052F4;
  v24 = sub_1ABC05304;
  v25 = 0;
  if (v4)
  {
    v5 = [IMDPredicateToSQLConverter alloc];
    +[IMDChatRecord keyPathsToColumns](IMDChatRecord, "keyPathsToColumns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v5, "initWithPredicate:keyPathsToColumns:", v4, v6);

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = CFSTR("YES");
          _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Fetching chats filtered by predicate: %@", buf, 0xCu);
        }

      }
      -[IMDPredicateToSQLConverter expression](v7, "expression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)IMDChatRecordCopyChatsFilteredUsingPredicateQuery((uint64_t)v9);

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1ABC0530C;
      v16[3] = &unk_1E5AB0530;
      v18 = self;
      v19 = &v20;
      v17 = v7;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v10, (uint64_t)v16);
      v11 = (void *)v21[5];
      if (!v11)
        v11 = (void *)MEMORY[0x1E0C9AA60];
      v12 = v11;

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[IMDDatabase(Chats) chatRecordsFilteredByPredicate:]";
          v28 = 2112;
          v29 = v4;
          _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      v12 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[IMDDatabase(Chats) chatRecordsFilteredByPredicate:]";
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "No predicate provided to %s", buf, 0xCu);
      }

    }
    v12 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v8;
  IMDPredicateToSQLConverter *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  IMDSortDescriptorToSQLConverter *v18;
  void *v19;
  IMDSortDescriptorToSQLConverter *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  void *v30;
  id v31;
  IMDPredicateToSQLConverter *v32;
  void (**v33)(id, _QWORD);
  _QWORD v34[4];
  IMDPredicateToSQLConverter *v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  unint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v33 = (void (**)(id, _QWORD))a6;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1ABC052F4;
  v47 = sub_1ABC05304;
  v48 = 0;
  v30 = v8;
  if (v8)
  {
    v9 = [IMDPredicateToSQLConverter alloc];
    +[IMDChatRecord keyPathsToColumns](IMDChatRecord, "keyPathsToColumns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[IMDPredicateToSQLConverter initWithPredicate:keyPathsToColumns:](v9, "initWithPredicate:keyPathsToColumns:", v8, v10);

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:]";
          v51 = 2112;
          v52 = (uint64_t)v8;
          _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }

      }
      if (v33)
        v33[2](v33, MEMORY[0x1E0C9AA60]);
      goto LABEL_34;
    }
  }
  else
  {
    v32 = 0;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v31;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v18 = [IMDSortDescriptorToSQLConverter alloc];
        +[IMDChatRecord keyPathsToColumns](IMDChatRecord, "keyPathsToColumns");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[IMDSortDescriptorToSQLConverter initWithSortDescriptor:keyPathsToColumns:](v18, "initWithSortDescriptor:keyPathsToColumns:", v17, v19);

        if (!v20)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMEventCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v50 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:]";
              v51 = 2112;
              v52 = (uint64_t)v17;
              _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }

          }
          if (v33)
            ((void (*)(void))v33[2])();
          goto LABEL_33;
        }
        -[IMDSortDescriptorToSQLConverter expression](v20, "expression");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v21);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v13, "count");
      v24 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      if (!v30)
        v24 = CFSTR("NO");
      v50 = (const char *)v24;
      v51 = 2048;
      v52 = v23;
      v53 = 2048;
      v54 = a5;
      _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Fetching chats filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x20u);
    }

  }
  -[IMDPredicateToSQLConverter expression](v32, "expression", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)IMDChatRecordCopySortedChatsFilteredUsingPredicateWithLimitQuery((uint64_t)v25, v12);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1ABC058CC;
  v34[3] = &unk_1E5AB0558;
  v37 = &v43;
  v38 = a5;
  v35 = v32;
  v36 = v28;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v13, (uint64_t)v34);
  if (v33)
    v33[2](v33, v44[5]);

LABEL_33:
LABEL_34:
  _Block_object_dispose(&v43, 8);

}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  -[IMDDatabase fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:completionHandler:](self, "fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:completionHandler:", a3, a4, 0, a5, a6);
}

- (id)chatRecordsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  IMDDatabase *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1ABC052F4;
  v17 = sub_1ABC05304;
  v18 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABC05B44;
    v9[3] = &unk_1E5AB0530;
    v11 = self;
    v12 = &v13;
    v10 = v4;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT ROWID, guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, is_archived, last_addressed_handle, display_name, group_id, is_filtered, successful_query, engram_id, server_change_token, ck_sync_state, original_group_id, last_read_message_timestamp, cloudkit_record_id, last_addressed_sim_id, is_blackholed, syndication_date, syndication_type, is_recovered, is_deleting_incoming_messages FROM chat WHERE    chat_identifier = ? ORDER BY chat.ROWID ASC;"),
      (uint64_t)v9);
    v5 = (void *)v14[5];
    if (!v5)
      v5 = (void *)MEMORY[0x1E0C9AA60];
    v6 = v5;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[IMDDatabase(Chats) chatRecordsWithIdentifier:]";
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "No identifier provided to %s", buf, 0xCu);
      }

    }
    v6 = (id)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (void)fetchChatRecordsWithPinningIdentifier:(id)a3 completionHandler:(id)a4
{
  __CFString *v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  IMDChatRecordBatchFetcher *v16;
  void *v17;
  IMDChatRecordBatchFetcher *v18;
  uint64_t v19;
  uint64_t v20;
  char **v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, void *))a4;
  if (-[__CFString length](v6, "length"))
  {
    -[IMDDatabase chatRecordsWithIdentifier:](self, "chatRecordsWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v38 = objc_msgSend(v8, "count");
        v39 = 2112;
        v40 = (const char *)v6;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Found %llu pinned chats using chatIdentifier %@", buf, 0x16u);
      }

    }
    if (objc_msgSend(v8, "count"))
    {
      v10 = v8;
    }
    else
    {
      v12 = (void *)IMDChatRecordCopyChatsWithGroupID(v6);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134218242;
          v38 = v14;
          v39 = 2112;
          v40 = (const char *)v6;
          _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Found %llu pinned chats using groupID %@", buf, 0x16u);
        }

      }
      v10 = v12;
    }
    v31 = v10;
    if (objc_msgSend(v10, "count"))
    {
      v15 = v31;
    }
    else
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = objc_alloc_init(IMDChatRecordBatchFetcher);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x1E0D37870], *MEMORY[0x1E0D38F58]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRecordBatchFetcher setPredicate:](v16, "setPredicate:", v17);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v16;
      v19 = -[IMDRecordBatchFetcher countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v33;
        v21 = &selRef_addCollaborationDictionary_forConversation_fromMe_;
        while (2)
        {
          v22 = 0;
          v23 = v21[104];
          do
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v22);
            objc_msgSend(v24, "handleRecords");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "arrayByApplyingSelector:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            IMSHA1HashFromStrings();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[__CFString isEqualToString:](v6, "isEqualToString:", v27))
            {
              objc_msgSend(v30, "addObject:", v24);

              goto LABEL_31;
            }

            ++v22;
          }
          while (v19 != v22);
          v19 = -[IMDRecordBatchFetcher countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          v21 = &selRef_addCollaborationDictionary_forConversation_fromMe_;
          if (v19)
            continue;
          break;
        }
      }
LABEL_31:

      v15 = (void *)objc_msgSend(v30, "copy");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 134218242;
          v38 = v29;
          v39 = 2112;
          v40 = (const char *)v6;
          _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Found %llu pinned chats using participantHash %@", buf, 0x16u);
        }

      }
    }
    if (v7)
      v7[2](v7, v15);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v38 = (uint64_t)v6;
        v39 = 2080;
        v40 = "-[IMDDatabase(Chats) fetchChatRecordsWithPinningIdentifier:completionHandler:]";
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "No pinning identifier (%@) provided to %s", buf, 0x16u);
      }

    }
    if (v7)
      v7[2](v7, (void *)MEMORY[0x1E0C9AA60]);
  }

}

- (void)_fetchChatRecordsWithHandles:(id)a3 allowSubsetMatching:(BOOL)a4 serviceName:(id)a5 displayName:(id)a6 groupID:(id)a7 style:(unsigned __int8)a8 useOriginalGroupID:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  uint64_t v29;
  IMDDatabase *v30;
  unsigned __int8 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  IMDDatabase *v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  BOOL v41;
  unsigned __int8 v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (void (**)(id, _QWORD))a10;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1ABC052F4;
  v48 = sub_1ABC05304;
  v49 = 0;
  if (objc_msgSend(v16, "count") && objc_msgSend(v17, "length"))
  {
    v30 = self;
    v31 = a8;
    v21 = objc_msgSend(v18, "length");
    v22 = v18;
    v23 = v21 != 0;
    v24 = v19;
    if (objc_msgSend(v19, "length"))
      v25 = !a9;
    else
      v25 = 0;
    v26 = objc_msgSend(v16, "count");
    v27 = IMDChatRecordCopyChatsWithHandlesOnServiceWithDisplayNameGroupIDStyleQuery(v26, a4, v21 != 0, v25, 0);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1ABC063E4;
    v32[3] = &unk_1E5ABBC38;
    v33 = v16;
    v34 = v17;
    v40 = v23;
    v35 = v22;
    v41 = v25;
    v42 = v31;
    v43 = a4;
    v38 = &v44;
    v39 = v26;
    v36 = v24;
    v37 = v30;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v27, (uint64_t)v32);
    if (v20)
      v20[2](v20, v45[5]);

    v18 = v22;
    v19 = v24;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134218498;
        v51 = v29;
        v52 = 2112;
        v53 = v17;
        v54 = 2080;
        v55 = "-[IMDDatabase(Chats) _fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:styl"
              "e:useOriginalGroupID:completionHandler:]";
        _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "No handles (%llu) or service (%@) provided to %s", buf, 0x20u);
      }

    }
    if (v20)
      v20[2](v20, MEMORY[0x1E0C9AA60]);
  }
  _Block_object_dispose(&v44, 8);

}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  return -[IMDDatabase chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:](self, "chatRecordsWithHandles:serviceName:displayName:groupID:style:useOriginalGroupID:", a3, a4, a5, a6, a7, 0);
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1ABC052F4;
  v26 = sub_1ABC05304;
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1ABC0660C;
  v21[3] = &unk_1E5AB0468;
  v21[4] = &v22;
  LOBYTE(v20) = a8;
  -[IMDDatabase _fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:style:useOriginalGroupID:completionHandler:](self, "_fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:style:useOriginalGroupID:completionHandler:", v14, 0, v15, v16, v17, v9, v20, v21);
  v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v18;
}

- (void)fetchChatRecordsWithAtLeastHandles:(id)a3 serviceName:(id)a4 style:(unsigned __int8)a5 completionHandler:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[IMDDatabase _fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:style:useOriginalGroupID:completionHandler:](self, "_fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:style:useOriginalGroupID:completionHandler:", a3, 1, a4, 0, 0, a5, v6, a6);
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void (**v22)(id, void *);
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = (void (**)(id, void *))a4;
  v21 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v6)
    {
      v25 = *MEMORY[0x1E0D37788];
      v26 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v26)
            objc_enumerationMutation(obj);
          v8 = *(const __CFString **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v9 = (void *)IMDChatRecordCopyChatsWithGroupID(v8);
          objc_msgSend(v9, "lastObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "properties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v25);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v32 = (const char *)v12;
              v33 = 2112;
              v34 = v8;
              _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Found groupPhotoGUID %@ for chat with groupID %@", buf, 0x16u);
            }

          }
          if (-[__CFString length](v12, "length"))
          {
            v14 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(v12);
            -[__CFString path](v14, "path");
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v16 = -[__CFString transferState](v14, "transferState");
            if (-[__CFString length](v15, "length"))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39A08]), "initWithFileURL:", v17);
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v8);

            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v32 = (const char *)v12;
                v33 = 2112;
                v34 = v15;
                v35 = 1024;
                v36 = v16;
                _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Transfer invalid for groupPhotoGUID: %@ filename: %@ state: %d", buf, 0x1Cu);
              }

            }
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v6);
    }

    if (v22)
      v22[2](v22, v23);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[IMDDatabase(Chats) fetchGroupPhotoPathsForChatsWithGroupIDs:completionHandler:]";
        _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "No group IDs provided to %s", buf, 0xCu);
      }

    }
    if (v22)
      v22[2](v22, 0);
  }

}

- (void)resolveInconsistentGUIDForChatRecordWithGUID:(id)a3 newGUID:(id)a4 completionHandler:(id)a5
{
  __CFString *v7;
  id v8;
  void (**v9)(id, BOOL);
  NSObject *v10;
  CFStringRef v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = (void (**)(id, BOOL))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Updating chat GUID from %@ to %@ to resolve inconsistent properties", (uint8_t *)&v15, 0x16u);
    }

  }
  if (-[__CFString length](v7, "length") && objc_msgSend(v8, "length"))
  {
    v11 = IMDChatRecordCopyChatForGUID(v7);
    v12 = (__CFString *)v11;
    if (v11)
    {
      _IMDChatRecordSetGUID((uint64_t)v11, (uint64_t)v8);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Failed to find a chat with GUID %@", (uint8_t *)&v15, 0xCu);
      }

    }
    if (v9)
      v9[2](v9, v12 != 0);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412546;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Current GUID %@ or new GUID %@ has zero length", (uint8_t *)&v15, 0x16u);
      }

    }
    if (v9)
      v9[2](v9, 0);
  }

}

- (void)moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:(id)a3 deleteDate:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  NSObject *v23;
  __CFString *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *theString;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  __int128 v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE v70[128];
  uint8_t buf[32];
  _BYTE v72[128];
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v42, "count");
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin moving messages to recoverable message table with deleteDate: %@ for %lu chatGUIDs", buf, 0x16u);
    }

  }
  v40 = objc_msgSend(v43, "__im_nanosecondTimeInterval");
  v73 = 0u;
  memset(v72, 0, sizeof(v72));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    IMDChatRecordRowIDsWithChatGUIDsQuery(v5);
    theString = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)theString;
    if (theString)
    {
      _IMDSqlOperationBeginQuery((uint64_t)buf, theString);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v59 != v12)
              objc_enumerationMutation(v10);
            IMDSqlStatementBindTextFromCFString((uint64_t)v72, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v11);
      }

      if (IMDSqlOperationHasRows((uint64_t)buf))
      {
        v14 = MEMORY[0x1E0C809B0];
        do
        {
          *(_QWORD *)&v65 = 0;
          *((_QWORD *)&v65 + 1) = &v65;
          v66 = 0x3032000000;
          v67 = sub_1ABC052F4;
          v68 = sub_1ABC05304;
          v69 = 0;
          v57[0] = v14;
          v57[1] = 3221225472;
          v57[2] = sub_1ABC07430;
          v57[3] = &unk_1E5AB2AC0;
          v57[4] = &v65;
          IMDSqlOperationIterateRow((uint64_t)buf, (uint64_t)v57);
          if (*(_QWORD *)(*((_QWORD *)&v65 + 1) + 40))
            objc_msgSend(v8, "addObject:");
          _Block_object_dispose(&v65, 8);

        }
        while (IMDSqlOperationHasRows((uint64_t)buf));
      }
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        v15 = *((id *)&v73 + 1);
        IMLogHandleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1ABC61D68(v15);

      }
      IMDInsertMessagesFromChatsWihGUIDsIntoRecoverableMessageJoinQuery(v8);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        _IMDSqlOperationBeginQuery((uint64_t)buf, v17);
        IMDSqlStatementBindInt64((uint64_t)v72, v40);
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v18 = v8;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v54 != v20)
                objc_enumerationMutation(v18);
              IMDSqlStatementBindInt64((uint64_t)v72, objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "longLongValue"));
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
          }
          while (v19);
        }

        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          v22 = *((id *)&v73 + 1);
          IMLogHandleForCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_1ABC61CEC(v22);

        }
        IMDDeleteFromChatMessageJoinWhereMessageInRecoveryForChatsWithGUIDsQuery(v18);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          _IMDSqlOperationBeginQuery((uint64_t)buf, v24);
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v25 = v18;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v50;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v50 != v27)
                  objc_enumerationMutation(v25);
                IMDSqlStatementBindInt64((uint64_t)v72, objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "longLongValue"));
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
            }
            while (v26);
          }

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v29 = v25;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v46;
            do
            {
              for (m = 0; m != v30; ++m)
              {
                if (*(_QWORD *)v46 != v31)
                  objc_enumerationMutation(v29);
                IMDSqlStatementBindInt64((uint64_t)v72, objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * m), "longLongValue"));
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
            }
            while (v30);
          }

          if (!IMDSqlOperationFinishQuery((uint64_t)buf))
          {
            v33 = *((id *)&v73 + 1);
            IMLogHandleForCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              sub_1ABC61C70(v33);

          }
          IMDSqlOperationCommitOrRevertTransaction(buf);
          v44 = 0;
          v35 = IMDSqlOperationRelease((uint64_t)buf, &v44);
          v36 = v44;
          if (v35)
          {
            objc_msgSend(v42, "enumerateObjectsUsingBlock:", &unk_1E5AAF2E8);
            IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
          }
          else
          {
            IMLogHandleForCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              sub_1ABC61BF4(v36);

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = objc_msgSend(v42, "count");
              LODWORD(v65) = 134217984;
              *(_QWORD *)((char *)&v65 + 4) = v39;
              _os_log_impl(&dword_1ABB60000, v38, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recoverable message table for %lu chatGUIDs", (uint8_t *)&v65, 0xCu);
            }

          }
        }

      }
      v9 = (__CFString *)theString;
    }

  }
}

- (void)recoverMessageRecordsForChatRecordsWithGUIDs:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[4];
  uint64_t v44;
  _BYTE v45[128];
  __int128 buf;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin recovering messages for %lu unique chatGUIDs", (uint8_t *)&buf, 0xCu);
    }

  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  buf = 0u;
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)&buf);
  IMDSqlOperationBeginTransaction(&buf);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
  if (!v25)
    goto LABEL_28;
  v24 = *(_QWORD *)v29;
  v7 = MEMORY[0x1E0C809B0];
  while (2)
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v29 != v24)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      _IMDSqlOperationBeginQuery((uint64_t)&buf, CFSTR(" SELECT m.guid FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON crmj.chat_id = c.ROWID AND c.guid = ? JOIN message AS m  ON crmj.message_id = m.ROWID;"));
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v9);
      while (IMDSqlOperationHasRows((uint64_t)&buf))
      {
        *(_QWORD *)v32 = 0;
        *(_QWORD *)&v32[8] = v32;
        *(_QWORD *)&v33 = 0x3032000000;
        *((_QWORD *)&v33 + 1) = sub_1ABC052F4;
        *(_QWORD *)&v34 = sub_1ABC05304;
        *((_QWORD *)&v34 + 1) = 0;
        v27[0] = v7;
        v27[1] = 3221225472;
        v27[2] = sub_1ABC07B34;
        v27[3] = &unk_1E5ABBC80;
        v27[4] = v9;
        v27[5] = v32;
        IMDSqlOperationIterateRow((uint64_t)&buf, (uint64_t)v27);
        if (*(_QWORD *)(*(_QWORD *)&v32[8] + 40))
          objc_msgSend(v6, "addObject:");
        _Block_object_dispose(v32, 8);

      }
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        v12 = *((id *)&v56 + 1);
        IMLogHandleForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1ABC61FE0(v9, v12);
        goto LABEL_27;
      }
      _IMDSqlOperationBeginQuery((uint64_t)&buf, CFSTR("INSERT INTO chat_message_join (chat_id, message_id, message_date) SELECT crmj.chat_id, crmj.message_id, m.date FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON crmj.chat_id = c.ROWID AND c.guid = ? JOIN message AS m  ON crmj.message_id = m.ROWID;"));
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v9);
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        v12 = *((id *)&v56 + 1);
        IMLogHandleForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1ABC61F50(v9, v12);
LABEL_27:

        goto LABEL_28;
      }
      _IMDSqlOperationBeginQuery((uint64_t)&buf, CFSTR("INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid=? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.ck_sync_state=1;"));
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v9);
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        v10 = *((id *)&v56 + 1);
        IMLogHandleForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1ABC61EDC(v43, v10, &v44, v11);

      }
    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
    if (v25)
      continue;
    break;
  }
LABEL_28:

  _IMDSqlOperationBeginQuery((uint64_t)&buf, CFSTR("DELETE FROM chat_recoverable_message_join WHERE message_id IN(SELECT message_id FROM chat_message_join);"));
  if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
  {
    v14 = *((id *)&v56 + 1);
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC61E60(v14);

  }
  v39 = v53;
  v40 = v54;
  v41 = v55;
  v42 = v56;
  v35 = v49;
  v36 = v50;
  v37 = v51;
  v38 = v52;
  *(_OWORD *)v32 = buf;
  v33 = v47;
  v34 = v48;
  -[IMDDatabase _recoverMessagePartsForChatRecordsWithGUIDs:operation:](self, "_recoverMessagePartsForChatRecordsWithGUIDs:operation:", obj, v32);
  IMDSqlOperationCommitOrRevertTransaction(&buf);
  v26 = 0;
  v16 = IMDSqlOperationRelease((uint64_t)&buf, &v26);
  v17 = v26;
  if (v16)
  {
    IMDCoreSpotlightAddChatGUIDs(obj, 1005);
    if (objc_msgSend(v6, "count"))
      IMDCoreSpotlightAddMessageGUIDs(v6, 1005);
  }
  else
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1ABC61DE4(v17);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(obj, "count");
      *(_DWORD *)v32 = 134217984;
      *(_QWORD *)&v32[4] = v20;
      _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Finished recovering messages for %lu unique chatGUIDs", v32, 0xCu);
    }

  }
}

- (void)_recoverMessagePartsForChatRecordsWithGUIDs:(id)a3 operation:(IMDSqlOperation *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id obj;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v42 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Will begin recovering message parts for %lu unique chatGUIDs", buf, 0xCu);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[IMDDatabase _loadRecoverableMessagePartsMetadataForChatGUID:](self, "_loadRecoverableMessagePartsMetadataForChatGUID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1ABC07FE0;
          v24[3] = &unk_1E5ABBCA8;
          v24[4] = self;
          v14 = *(_OWORD *)&a4->var4.var7.var4;
          v33 = *(_OWORD *)&a4->var4.var7.var2;
          v34 = v14;
          v35 = *(_OWORD *)&a4->var4.var7.var6;
          v15 = *(_OWORD *)&a4->var4.var7.var0.var0;
          v29 = *(_OWORD *)&a4->var4.var4;
          v30 = v15;
          v16 = *(_OWORD *)&a4->var4.var7.var0.var4;
          v31 = *(_OWORD *)&a4->var4.var7.var0.var2;
          v32 = v16;
          v17 = *(_OWORD *)&a4->var2;
          v25 = *(_OWORD *)&a4->var0;
          v26 = v17;
          v18 = *(_OWORD *)&a4->var4.var2;
          v27 = *(_OWORD *)&a4->var4.var0;
          v28 = v18;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v24);
        }
        else
        {
          IMLogHandleForCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v12;
            _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: No parts metadata found for chatGUID: %@. This state is valid if there are no message part deletions.", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v9);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 134217984;
      v42 = v21;
      _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Recently Deleted | Finished recovering message parts for %lu unique chatGUIDs", buf, 0xCu);
    }

  }
}

- (id)_restoredAttributedBodyForMessageGUID:(id)a3 withRecoveredAttributedParts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDDatabase _loadAttributedBodyTextForMessageWithGUID:](self, "_loadAttributedBodyTextForMessageWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v7;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = v12;
      v20 = v9;
      v21 = v7;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v17 = objc_msgSend(v10, "__im_insertionIndexForMessagePartBody:", v16, v20, v21);
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            IMLogHandleForCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v6;
              _os_log_error_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_ERROR, "Recently Deleted | Cannot recover: message part number already exists. Not inserting into main message body for messageGUID: %@", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v10, "insertAttributedString:atIndex:", v16, v17);
          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v13);
      v9 = v20;
      v7 = v21;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1ABC62070();
    v10 = 0;
  }

  return v10;
}

- (void)_updateMessageRecordForGUID:(id)a3 withAttributedBody:(id)a4 operation:(IMDSqlOperation *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const __CFData *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __CFError *v19;
  NSObject *v20;
  NSObject *v21;
  _OWORD v22[11];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v22[0]) = 138412290;
    *(_QWORD *)((char *)v22 + 4) = v8;
    _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Writing restored part to message GUID: %@", (uint8_t *)v22, 0xCu);
  }

  JWEncodeCodableObject();
  v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  _IMDSqlOperationBeginQuery((uint64_t)a5, CFSTR("UPDATE message SET attributedBody = ?, text = ?   WHERE message.guid = ?;"));
  IMDSqlStatementBindBlob((uint64_t)&a5->var4, v11);
  objc_msgSend(v9, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  IMDSqlStatementBindTextFromCFString((uint64_t)&a5->var4, (uint64_t)v12);
  IMDSqlStatementBindTextFromCFString((uint64_t)&a5->var4, (uint64_t)v8);
  if (IMDSqlOperationFinishQuery((uint64_t)a5))
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(v22[0]) = 138412290;
      *(_QWORD *)((char *)v22 + 4) = v8;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | updated attributedbody for messageGUID: %@", (uint8_t *)v22, 0xCu);
    }

    v14 = *(_OWORD *)&a5->var4.var7.var4;
    v22[8] = *(_OWORD *)&a5->var4.var7.var2;
    v22[9] = v14;
    v22[10] = *(_OWORD *)&a5->var4.var7.var6;
    v15 = *(_OWORD *)&a5->var4.var7.var0.var0;
    v22[4] = *(_OWORD *)&a5->var4.var4;
    v22[5] = v15;
    v16 = *(_OWORD *)&a5->var4.var7.var0.var4;
    v22[6] = *(_OWORD *)&a5->var4.var7.var0.var2;
    v22[7] = v16;
    v17 = *(_OWORD *)&a5->var2;
    v22[0] = *(_OWORD *)&a5->var0;
    v22[1] = v17;
    v18 = *(_OWORD *)&a5->var4.var2;
    v22[2] = *(_OWORD *)&a5->var4.var0;
    v22[3] = v18;
    -[IMDDatabase _removeFromRecoverableMessagePartForMessageGUID:operation:](self, "_removeFromRecoverableMessagePartForMessageGUID:operation:", v8, v22);
    IMDCoreSpotlightAddMessageGUID(v8, 1005);
  }
  else
  {
    v19 = a5->var5;
    IMLogHandleForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1ABC620D8((uint64_t)v8, v19);

  }
  IMLogHandleForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LODWORD(v22[0]) = 138412290;
    *(_QWORD *)((char *)v22 + 4) = v8;
    _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished writing restored part to message GUID: %@", (uint8_t *)v22, 0xCu);
  }

}

- (void)_removeFromRecoverableMessagePartForMessageGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5;
  NSObject *v6;
  __CFError *v7;
  NSObject *v8;
  __CFError *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Removing recoverable message parts for message GUID: %@", (uint8_t *)&v12, 0xCu);
  }

  _IMDSqlOperationBeginQuery((uint64_t)a4, CFSTR("INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, rmp.part_index  FROM recoverable_message_part AS rmp  JOIN chat AS c   ON c.ROWID=rmp.chat_id  JOIN message AS m   ON m.ROWID=rmp.message_id AND m.guid=? AND rmp.ck_sync_state=1;"));
  IMDSqlStatementBindTextFromCFString((uint64_t)&a4->var4, (uint64_t)v5);
  if (!IMDSqlOperationFinishQuery((uint64_t)a4))
  {
    v7 = a4->var5;
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1ABC621DC(v7);

  }
  _IMDSqlOperationBeginQuery((uint64_t)a4, CFSTR("DELETE FROM recoverable_message_part WHERE message_id IN( SELECT ROWID  FROM message AS m  WHERE m.guid = ?);"));
  IMDSqlStatementBindTextFromCFString((uint64_t)&a4->var4, (uint64_t)v5);
  if (!IMDSqlOperationFinishQuery((uint64_t)a4))
  {
    v9 = a4->var5;
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1ABC62164(v9);

  }
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished removing recoverable message parts for message GUID: %@", (uint8_t *)&v12, 0xCu);
  }

}

- (id)_loadAttributedBodyTextForMessageWithGUID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  __int128 *p_buf;
  uint8_t v12[4];
  id v13;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Loading attributed message body for message GUID: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = sub_1ABC052F4;
  v17 = sub_1ABC05304;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABC08908;
  v9[3] = &unk_1E5ABBCD0;
  v5 = v3;
  v10 = v5;
  p_buf = &buf;
  IMDRunSqlOperation((uint64_t)v9);
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished loading attributed message body for message GUID: %@", v12, 0xCu);
  }

  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (id)_loadRecoverableMessagePartsMetadataForChatGUID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  __int128 *p_buf;
  uint8_t v12[4];
  id v13;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Loading message parts metadata for chat GUID: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = sub_1ABC052F4;
  v17 = sub_1ABC05304;
  v18 = 0;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1ABC08F78;
  v9[3] = &unk_1E5ABBCD0;
  v5 = v3;
  v10 = v5;
  p_buf = &buf;
  IMDRunSqlOperation((uint64_t)v9);
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished loading message parts metadata for chat GUID: %@", v12, 0xCu);
  }

  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (id)_chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  IMDSqlOperation *v19;
  _QWORD v20[4];
  id v21;
  IMDSqlOperation *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1ABC0982C;
  v20[3] = &unk_1E5AB6308;
  v22 = a4;
  v8 = v5;
  v21 = v8;
  v14 = v7;
  v15 = 3221225472;
  v16 = sub_1ABC09858;
  v17 = &unk_1E5AB6308;
  v19 = a4;
  v9 = v6;
  v18 = v9;
  _IMDSqlOperationRunQuery((uint64_t)a4, CFSTR("SELECT c.guid FROM chat_recoverable_message_join AS crmj JOIN message AS m ON m.ROWID = crmj.message_id  JOIN chat AS c ON c.ROWID = crmj.chat_id WHERE(  crmj.delete_date < ?  AND   NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join))) ) GROUP BY    c.guid  "), (uint64_t)v20, (uint64_t)&v14);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v9, "count", v14, v15, v16, v17);
      *(_DWORD *)buf = 134217984;
      v24 = v11;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Found %llu chats affected by message deletion", buf, 0xCu);
    }

  }
  v12 = (void *)objc_msgSend(v9, "copy", v14, v15, v16, v17);

  return v12;
}

- (id)_chatGUIDsForChatsWithJunkMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  IMDSqlOperation *v19;
  _QWORD v20[4];
  id v21;
  IMDSqlOperation *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1ABC09BC8;
  v20[3] = &unk_1E5AB6308;
  v22 = a4;
  v8 = v5;
  v21 = v8;
  v14 = v7;
  v15 = 3221225472;
  v16 = sub_1ABC09BF4;
  v17 = &unk_1E5AB6308;
  v19 = a4;
  v9 = v6;
  v18 = v9;
  _IMDSqlOperationRunQuery((uint64_t)a4, CFSTR("SELECT c.guid FROM chat_message_join AS cmj JOIN message AS m ON m.ROWID = cmj.message_id  JOIN chat AS c ON c.ROWID = cmj.chat_id WHERE(  m.date < ?  AND   c.is_filtered = 2) GROUP BY    c.guid  "), (uint64_t)v20, (uint64_t)&v14);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v9, "count", v14, v15, v16, v17);
      *(_DWORD *)buf = 134217984;
      v24 = v11;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Found %llu chats affected by message deletion", buf, 0xCu);
    }

  }
  v12 = (void *)objc_msgSend(v9, "copy", v14, v15, v16, v17);

  return v12;
}

- (id)_deleteChatIfEmptyWithGUID:(id)a3 lastMessageDate:(id)a4 operation:(IMDSqlOperation *)a5
{
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  int v37;
  __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = -[IMDDatabase _countMessagesExcludingGroupPhotosInChatWithGUID:isRecoverable:operation:](self, "_countMessagesExcludingGroupPhotosInChatWithGUID:isRecoverable:operation:", v8, 0, a5);
  v11 = -[IMDDatabase _countMessagesExcludingGroupPhotosInChatWithGUID:isRecoverable:operation:](self, "_countMessagesExcludingGroupPhotosInChatWithGUID:isRecoverable:operation:", v8, 1, a5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v37 = 138412802;
      v38 = v8;
      v39 = 2048;
      v40 = v10;
      v41 = 2048;
      v42 = v11;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Chat with guid %@ has %lld messages and %lld recoverable messages", (uint8_t *)&v37, 0x20u);
    }

  }
  v13 = 0;
  if (v10 <= 0 && v11 <= 0)
  {
    v14 = (__CFString *)IMDChatRecordCopyChatForGUID(v8);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[__CFString guid](v14, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D37778]);

    -[__CFString chatIdentifier](v14, "chatIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D37730]);

    -[__CFString serviceName](v14, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D37870]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[__CFString style](v14, "style"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D37878]);

    -[__CFString groupID](v14, "groupID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[__CFString groupID](v14, "groupID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D37780]);

    }
    -[__CFString originalGroupID](v14, "originalGroupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[__CFString originalGroupID](v14, "originalGroupID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D37810]);

    }
    -[__CFString accountID](v14, "accountID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[__CFString accountID](v14, "accountID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D37718]);

    }
    -[__CFString properties](v14, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[__CFString properties](v14, "properties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D37838]);

    }
    -[__CFString lastAddressedHandle](v14, "lastAddressedHandle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[__CFString lastAddressedHandle](v14, "lastAddressedHandle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D377D8]);

    }
    -[__CFString lastAddressedSIMID](v14, "lastAddressedSIMID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[__CFString lastAddressedSIMID](v14, "lastAddressedSIMID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D377E0]);

    }
    v32 = IMGetCachedDomainBoolForKey();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = CFSTR("NO");
        if (v32)
          v34 = CFSTR("YES");
        v37 = 138412546;
        v38 = v8;
        v39 = 2112;
        v40 = (uint64_t)v34;
        _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Deleting empty chat %@, cloud sync enabled is %@", (uint8_t *)&v37, 0x16u);
      }

    }
    if (v32)
    {
      -[__CFString cloudRecordID](v14, "cloudRecordID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      IMDChatInsertIntoDeletedChatsTable(v8, v35, objc_msgSend(v9, "__im_nanosecondTimeInterval"));

    }
    IMDChatRecordDeleteChatForGUID(v8);
    v13 = (void *)objc_msgSend(v15, "copy");

  }
  return v13;
}

- (void)_deleteTransfersInMessagePartsForChatGUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDDatabase _loadRecoverableMessagePartsMetadataForChatGUID:](self, "_loadRecoverableMessagePartsMetadataForChatGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &unk_1E5AAE9B8);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished deleting recoverable message parts transfers for chatGUID: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)_updateChatsSyncStateQueryFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "substitutionStringForCount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), CFSTR("UPDATE chat SET ck_sync_state = ? where guid in "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v6;
  const __CFArray *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _OWORD v16[2];
  _OWORD v17[8];
  __int128 v18;
  uint8_t buf[4];
  const __CFArray *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v16);
  _IMDSqlOperationBeginQuery((uint64_t)v16, (CFStringRef)-[IMDDatabase _updateChatsSyncStateQueryFor:](self, "_updateChatsSyncStateQueryFor:", objc_msgSend(v6, "count")));
  IMDSqlStatementBindInt64((uint64_t)v17, a3);
  v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v17, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v16))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "CloudSync | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = *((id *)&v18 + 1);
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC62314((uint64_t)v7, v8);

  }
  IMDSqlOperationCommitOrRevertTransaction(v16);
  v15 = 0;
  v10 = IMDSqlOperationRelease((uint64_t)v16, &v15);
  v11 = v15;
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "CloudSync.chat | Update status Query success for: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_1ABC6229C(v11);
  }

  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "CloudSync.chat | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }

}

- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1ABC052F4;
  v10 = sub_1ABC05304;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC0A9CC;
  v5[3] = &unk_1E5ABBD40;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT ROWID, guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, is_archived, last_addressed_handle, display_name, group_id, is_filtered, successful_query, engram_id, server_change_token, ck_sync_state, original_group_id, last_read_message_timestamp, cloudkit_record_id, last_addressed_sim_id, is_blackholed, syndication_date, syndication_type, is_recovered, is_deleting_incoming_messages    FROM chat c   WHERE style = 43   AND (SELECT count(*) FROM chat cdupe WHERE cdupe.group_id = c.group_id AND cdupe.service_name = c.service_name) > 1   LIMIT ?"), (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)checkSpotlightIndexCountWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("msg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v5, "setBundleIDs:", &unk_1E5ADC360);
  objc_msgSend(v5, "setCounting:", 1);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v4, v5);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1ABC3C5B0;
  v15[3] = &unk_1E5AB8938;
  v15[4] = v16;
  objc_msgSend(v6, "setCountChangedHandler:", v15);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = sub_1ABC3C5C8;
  v11[3] = &unk_1E5ABF9F8;
  v14 = v16;
  v8 = v4;
  v12 = v8;
  v9 = v3;
  v13 = v9;
  objc_msgSend(v6, "setCompletionHandler:", v11);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[IMDDatabase(Spotlight) checkSpotlightIndexCountWithCompletion:]";
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "%{public}s Starting query with string %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "start");

  _Block_object_dispose(v16, 8);
}

- (void)_validateSpotlightClientStateWithLastError:(id)a3 attempts:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  void (**v15)(id, uint64_t, _QWORD);
  int64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a4 < 5)
  {
    if (objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          v18 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
          _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "%{public}s CS already needs reindexing, not checking client state", buf, 0xCu);
        }

      }
      v9[2](v9, 1, 0);
    }
    else
    {
      IMCoreSpotlightIndex();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = sub_1ABC3C95C;
        v14[3] = &unk_1E5ABFA48;
        v16 = a4;
        v14[4] = self;
        v15 = v9;
        objc_msgSend(v12, "fetchLastClientStateWithCompletionHandler:", v14);

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136446210;
            v18 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
            _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "%{public}s Failed to fetch Spotlight index, bailing", buf, 0xCu);
          }

        }
        v9[2](v9, 1, 0);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1ABC6355C(v10);

    ((void (**)(id, uint64_t, id))v9)[2](v9, 1, v8);
  }

}

- (void)validateSpotlightClientStateWithCompletion:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__validateSpotlightClientStateWithLastError_attempts_completion_);
}

- (void)fetchSpotlightClientStateWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDSpotlightClientStateManager sharedManager](IMDSpotlightClientStateManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_currentClientStateWithCompletion:", v3);

}

- (void)invalidateSpotlightClientStateVersioningWithCompletion:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void (**)(id, id))a3;
  +[IMDSpotlightClientStateManager sharedManager](IMDSpotlightClientStateManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "currentClientStateWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v6)
  {
    objc_msgSend(v5, "setIndexRevision:", 0);
    objc_msgSend(v5, "setIndexVersion:", 0);
    +[IMDSpotlightClientStateManager sharedManager](IMDSpotlightClientStateManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v7, "saveClientState:withError:", v5, &v8);
    v6 = v8;

  }
  v3[2](v3, v6);

}

@end
