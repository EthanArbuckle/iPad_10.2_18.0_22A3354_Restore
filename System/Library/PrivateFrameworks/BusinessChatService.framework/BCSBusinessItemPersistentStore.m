@implementation BCSBusinessItemPersistentStore

+ (const)debugQueueName
{
  return "com.apple.businesschat.persistentStore.businessItems";
}

- (id)databasePath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (self)
  {
    if (!objc_msgSend((id)_databasePath_databasePath_0, "length"))
    {
      +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "documentsURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("business_items.db"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)_databasePath_databasePath_0;
      _databasePath_databasePath_0 = v5;

    }
    self = (BCSBusinessItemPersistentStore *)(id)_databasePath_databasePath_0;
  }
  return self;
}

- (int64_t)schemaVersion
{
  return 5;
}

- (const)schema
{
  return "create table if not exists business_items (id integer primary key autoincrement, biz_id text, phone_number text"
         ", name text, phone_hash integer, square_logo_url text, wide_logo_url text, tint_color integer, background_color"
         " integer, call_to_actions_data blob, is_verified integer, messaging_open_hours_data blob, calling_open_hours_da"
         "ta blob, last_retrieved_date integer, time_to_live_date double, intent_id text, group_id text, visibility_items blob)";
}

- (BOOL)insertOrReplaceBusinessItem:(id)a3 withTTL:(double)a4
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
  void *v17;
  void *v18;
  void *v19;
  sqlite3_stmt *v20;
  id v21;
  BOOL v22;
  sqlite3_stmt *v23;
  id v24;
  sqlite3_stmt *v25;
  id v26;
  sqlite3_stmt *v27;
  void *v28;
  id v29;
  sqlite3_stmt *v30;
  void *v31;
  id v32;
  sqlite3_stmt *v33;
  id v34;
  sqlite3_stmt *v35;
  id v36;
  sqlite3_stmt *v37;
  id v38;
  sqlite3_stmt *v39;
  void *v40;
  double v41;
  sqlite3_stmt *v42;
  void *v43;
  void *v44;
  double v45;
  sqlite3_stmt *v46;
  id v47;
  sqlite3_stmt *v48;
  id v49;
  sqlite3_stmt *v50;
  id v51;
  int v52;
  NSObject *v53;
  const char *v55;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if (!self)
    return 0;
  v6 = a3;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  -[BCSBusinessItemPersistentStore deleteBusinessItem:](self, "deleteBusinessItem:", v6);
  v7 = v6;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  ppStmt = 0;
  v8 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v7, "messagingOpenHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v7, "callingOpenHours");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v7, "callToActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v7, "visibilityItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), (const char *)objc_msgSend(CFSTR("insert into business_items (biz_id, phone_number, name, phone_hash, square_logo_url, wide_logo_url, tint_color, background_color, call_to_actions_data, is_verified, messaging_open_hours_data, calling_open_hours_data, last_retrieved_date, time_to_live_date, intent_id, group_id, visibility_items) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"), "UTF8String"), -1, &ppStmt, 0))
  {
    goto LABEL_7;
  }
  v20 = ppStmt;
  objc_msgSend(v7, "bizID");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = 1;
  sqlite3_bind_text(v20, 1, (const char *)objc_msgSend(v21, "UTF8String"), -1, 0);

  v23 = ppStmt;
  objc_msgSend(v7, "phoneNumber");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v23, 2, (const char *)objc_msgSend(v24, "UTF8String"), -1, 0);

  v25 = ppStmt;
  objc_msgSend(v7, "name");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v25, 3, (const char *)objc_msgSend(v26, "UTF8String"), -1, 0);

  sqlite3_bind_int64(ppStmt, 4, objc_msgSend(v7, "phoneHash"));
  v27 = ppStmt;
  objc_msgSend(v7, "squareLogoURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "absoluteString");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v27, 5, (const char *)objc_msgSend(v29, "UTF8String"), -1, 0);

  v30 = ppStmt;
  objc_msgSend(v7, "wideLogoURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "absoluteString");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v30, 6, (const char *)objc_msgSend(v32, "UTF8String"), -1, 0);

  sqlite3_bind_int(ppStmt, 7, objc_msgSend(v7, "tintColor"));
  sqlite3_bind_int(ppStmt, 8, objc_msgSend(v7, "backgroundColor"));
  v33 = ppStmt;
  v34 = objc_retainAutorelease(v16);
  sqlite3_bind_blob(v33, 9, (const void *)objc_msgSend(v34, "bytes"), objc_msgSend(v34, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(ppStmt, 10, objc_msgSend(v7, "isVerified"));
  v35 = ppStmt;
  v36 = objc_retainAutorelease(v10);
  sqlite3_bind_blob(v35, 11, (const void *)objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v37 = ppStmt;
  v38 = objc_retainAutorelease(v13);
  sqlite3_bind_blob(v37, 12, (const void *)objc_msgSend(v38, "bytes"), objc_msgSend(v38, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v39 = ppStmt;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timeIntervalSince1970");
  sqlite3_bind_int(v39, 13, (int)v41);

  v42 = ppStmt;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "dateByAddingTimeInterval:", a4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "timeIntervalSince1970");
  sqlite3_bind_double(v42, 14, v45);

  v46 = ppStmt;
  objc_msgSend(v7, "intentID");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v46, 15, (const char *)objc_msgSend(v47, "UTF8String"), -1, 0);

  v48 = ppStmt;
  objc_msgSend(v7, "groupID");
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v48, 16, (const char *)objc_msgSend(v49, "UTF8String"), -1, 0);

  v50 = ppStmt;
  v51 = objc_retainAutorelease(v19);
  sqlite3_bind_blob(v50, 17, (const void *)objc_msgSend(v51, "bytes"), objc_msgSend(v51, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v52 = sqlite3_step(ppStmt);
  sqlite3_finalize(ppStmt);
  if (v52 != 101)
  {
    ABSLogCommon();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v55 = sqlite3_errmsg(-[BCSPersistentStore openedDatabase](self, "openedDatabase"));
      *(_DWORD *)buf = 134218242;
      v58 = v52;
      v59 = 2080;
      v60 = v55;
      _os_log_error_impl(&dword_20ACAD000, v53, OS_LOG_TYPE_ERROR, "Error while finalizing insert business item %lu %s", buf, 0x16u);
    }

LABEL_7:
    v22 = 0;
  }
  -[BCSPersistentStore endBatch](self, "endBatch");

  -[BCSPersistentStore endBatch](self, "endBatch");
  return v22;
}

- (BOOL)updateTTL:(double)a3 forBusinessItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  id v18;
  const char *v19;
  BOOL v20;
  void *v22;
  BCSBusinessItemPersistentStore *v23;
  sqlite3_stmt *ppStmt;

  v6 = a4;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  ppStmt = 0;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;
  objc_msgSend(v6, "bizID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  v22 = v8;
  v23 = self;
  if (v13)
  {
    objc_msgSend(v6, "bizID");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_24C39D888;
  }
  objc_msgSend(v6, "phoneNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  if (v16)
  {
    objc_msgSend(v6, "phoneNumber");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_24C39D888;
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("UPDATE business_items SET time_to_live_date = \"%u\" WHERE biz_id = \"%@\" OR phone_number = \"%@\"), (int)v11, v14, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (const char *)objc_msgSend(v18, "UTF8String");

  if (v16)
  if (v13)

  if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](v23, "openedDatabase"), v19, -1, &ppStmt, 0)
    || sqlite3_step(ppStmt) != 101)
  {
    v20 = 0;
  }
  else
  {
    sqlite3_finalize(ppStmt);
    v20 = 1;
  }
  -[BCSPersistentStore endBatch](v23, "endBatch");

  return v20;
}

- (BOOL)updateLastRetrievedDateForBusinessItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  id v18;
  const char *v19;
  BOOL v20;
  void *v22;
  sqlite3_stmt *ppStmt;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (self)
  {
    v8 = v6;
    -[BCSPersistentStore beginBatch](self, "beginBatch");
    ppStmt = 0;
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "timeIntervalSince1970");
    v11 = v10;

    objc_msgSend(v7, "bizID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v22 = v6;
    if (v13)
    {
      objc_msgSend(v7, "bizID");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &stru_24C39D888;
    }
    objc_msgSend(v7, "phoneNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    if (v16)
    {
      objc_msgSend(v7, "phoneNumber");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_24C39D888;
    }
    objc_msgSend(v9, "stringWithFormat:", CFSTR("UPDATE business_items SET last_retrieved_date = \"%u\" WHERE biz_id = \"%@\" OR phone_number = \"%@\"), (int)v11, v14, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");

    if (v16)
    v6 = v22;
    if (v13)

    if (sqlite3_prepare_v2(-[BCSPersistentStore openedDatabase](self, "openedDatabase"), v19, -1, &ppStmt, 0)
      || sqlite3_step(ppStmt) != 101)
    {
      v20 = 0;
    }
    else
    {
      sqlite3_finalize(ppStmt);
      v20 = 1;
    }
    -[BCSPersistentStore endBatch](self, "endBatch");
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)fetchPersistentBusinessItemObjectWithBizID:(id)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select * from business_items where biz_id=\"%@\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return -[BCSBusinessItemPersistentStore _executeFetchPersistentBusinessItemObjectSQLQuery:](self, v5);
}

- (BCSPersistentBusinessItemObject)_executeFetchPersistentBusinessItemObjectSQLQuery:(void *)a1
{
  BCSPersistentBusinessItemObject *v4;
  id v5;
  id v6;
  id v7;
  const unsigned __int8 *v8;
  void *v9;
  id v10;
  void *v11;
  const unsigned __int8 *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  const void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  const void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  Class v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  const void *v36;
  void *v37;
  void *v38;
  void *v39;
  Class v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  const void *v46;
  void *v47;
  void *v48;
  void *v49;
  Class v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  BCSBusinessItem *v56;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __CFString *v70;
  int v71;
  void *v72;
  void *v73;
  sqlite3_int64 v74;
  __CFString *v75;
  void *v76;
  void *v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  const char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return (BCSPersistentBusinessItemObject *)0;
  objc_msgSend(a1, "beginBatch");
  ppStmt = 0;
  v4 = 0;
  if (!sqlite3_prepare_v2((sqlite3 *)objc_msgSend(a1, "openedDatabase"), a2, -1, &ppStmt, 0))
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      if (sqlite3_column_text(ppStmt, 1))
      {
        v5 = objc_alloc(MEMORY[0x24BDD17C8]);
        v80 = (__CFString *)objc_msgSend(v5, "initWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      }
      else
      {
        v80 = &stru_24C39D888;
      }
      if (sqlite3_column_text(ppStmt, 2))
      {
        v6 = objc_alloc(MEMORY[0x24BDD17C8]);
        v79 = (__CFString *)objc_msgSend(v6, "initWithUTF8String:", sqlite3_column_text(ppStmt, 2));
      }
      else
      {
        v79 = &stru_24C39D888;
      }
      if (sqlite3_column_text(ppStmt, 3))
      {
        v7 = objc_alloc(MEMORY[0x24BDD17C8]);
        v78 = (__CFString *)objc_msgSend(v7, "initWithUTF8String:", sqlite3_column_text(ppStmt, 3));
      }
      else
      {
        v78 = &stru_24C39D888;
      }
      v74 = sqlite3_column_int64(ppStmt, 4);
      v8 = sqlite3_column_text(ppStmt, 5);
      v9 = (void *)MEMORY[0x24BDBCF48];
      if (v8)
      {
        v10 = objc_alloc(MEMORY[0x24BDD17C8]);
        v11 = (void *)objc_msgSend(v10, "initWithUTF8String:", sqlite3_column_text(ppStmt, 5));
        objc_msgSend(v9, "URLWithString:", v11);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24C39D888);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = sqlite3_column_text(ppStmt, 6);
      v13 = (void *)MEMORY[0x24BDBCF48];
      if (v12)
      {
        v14 = objc_alloc(MEMORY[0x24BDD17C8]);
        v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", sqlite3_column_text(ppStmt, 6));
        objc_msgSend(v13, "URLWithString:", v15);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24C39D888);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v64 = sqlite3_column_int(ppStmt, 7);
      v63 = sqlite3_column_int(ppStmt, 8);
      v71 = sqlite3_column_int(ppStmt, 10);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)sqlite3_column_int(ppStmt, 13));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 14));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (sqlite3_column_text(ppStmt, 15))
      {
        v16 = objc_alloc(MEMORY[0x24BDD17C8]);
        v75 = (__CFString *)objc_msgSend(v16, "initWithUTF8String:", sqlite3_column_text(ppStmt, 15));
      }
      else
      {
        v75 = &stru_24C39D888;
      }
      if (sqlite3_column_text(ppStmt, 16))
      {
        v17 = objc_alloc(MEMORY[0x24BDD17C8]);
        v70 = (__CFString *)objc_msgSend(v17, "initWithUTF8String:", sqlite3_column_text(ppStmt, 16));
      }
      else
      {
        v70 = &stru_24C39D888;
      }
      v18 = sqlite3_column_blob(ppStmt, 9);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v18, sqlite3_column_bytes(ppStmt, 9));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD1620];
      v21 = (void *)MEMORY[0x24BDBCF20];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, NSClassFromString(CFSTR("BCSCallToActionItem")), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0;
      v69 = (void *)v19;
      objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v23, v19, &v84);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v84;

      if (v24)
      {
        ABSLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v58 = sqlite3_errmsg((sqlite3 *)objc_msgSend(a1, "openedDatabase"));
          *(_DWORD *)buf = 134218242;
          v87 = v24;
          v88 = 2080;
          v89 = v58;
          _os_log_error_impl(&dword_20ACAD000, v25, OS_LOG_TYPE_ERROR, "error while unarchiving BCSCallToActionItem %lu %s", buf, 0x16u);
        }

      }
      v67 = v24;
      v26 = sqlite3_column_blob(ppStmt, 11);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v26, sqlite3_column_bytes(ppStmt, 11));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD1620];
      v29 = (void *)MEMORY[0x24BDBCF20];
      v30 = NSClassFromString(CFSTR("BCSOpenHours"));
      v31 = objc_opt_class();
      objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v66 = (void *)v27;
      objc_msgSend(v28, "unarchivedObjectOfClasses:fromData:error:", v32, v27, &v83);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v83;

      if (v34)
      {
        ABSLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v59 = sqlite3_errmsg((sqlite3 *)objc_msgSend(a1, "openedDatabase"));
          *(_DWORD *)buf = 134218242;
          v87 = v34;
          v88 = 2080;
          v89 = v59;
          _os_log_error_impl(&dword_20ACAD000, v35, OS_LOG_TYPE_ERROR, "error while unarchiving BCSOpenHours %lu %s", buf, 0x16u);
        }

      }
      v65 = v34;
      v36 = sqlite3_column_blob(ppStmt, 12);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v36, sqlite3_column_bytes(ppStmt, 12));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x24BDD1620];
      v39 = (void *)MEMORY[0x24BDBCF20];
      v40 = NSClassFromString(CFSTR("BCSOpenHours"));
      v41 = objc_opt_class();
      objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      objc_msgSend(v38, "unarchivedObjectOfClasses:fromData:error:", v42, v37, &v82);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v82;

      if (v44)
      {
        ABSLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v60 = sqlite3_errmsg((sqlite3 *)objc_msgSend(a1, "openedDatabase"));
          *(_DWORD *)buf = 134218242;
          v87 = v44;
          v88 = 2080;
          v89 = v60;
          _os_log_error_impl(&dword_20ACAD000, v45, OS_LOG_TYPE_ERROR, "error while unarchiving BCSOpenHours %lu %s", buf, 0x16u);
        }

      }
      v46 = sqlite3_column_blob(ppStmt, 17);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v46, sqlite3_column_bytes(ppStmt, 17));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)MEMORY[0x24BDD1620];
      v49 = (void *)MEMORY[0x24BDBCF20];
      v50 = NSClassFromString(CFSTR("BCSVisibilityItem"));
      v51 = objc_opt_class();
      objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      objc_msgSend(v48, "unarchivedObjectOfClasses:fromData:error:", v52, v47, &v81);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v81;

      if (v54)
      {
        ABSLogCommon();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v61 = sqlite3_errmsg((sqlite3 *)objc_msgSend(a1, "openedDatabase"));
          *(_DWORD *)buf = 134218242;
          v87 = v54;
          v88 = 2080;
          v89 = v61;
          _os_log_error_impl(&dword_20ACAD000, v55, OS_LOG_TYPE_ERROR, "error while unarchiving BCSVisibilityItem %lu %s", buf, 0x16u);
        }

      }
      sqlite3_finalize(ppStmt);
      LOBYTE(v62) = v71 == 1;
      v56 = -[BCSBusinessItem initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:]([BCSBusinessItem alloc], "initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:", v80, v79, v78, v74, v77, v76, v64, v63, v68, v33, v43, v62, v75, v70, v53);
      v4 = -[BCSPersistentBusinessItemObject initWithBusinessItem:lastRetrievedDate:TTLDate:]([BCSPersistentBusinessItemObject alloc], "initWithBusinessItem:lastRetrievedDate:TTLDate:", v56, v73, v72);

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend(a1, "endBatch");
  return v4;
}

- (id)fetchPersistentBusinessItemObjectWithPhoneNumber:(id)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select * from business_items where phone_number=\"%@\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return -[BCSBusinessItemPersistentStore _executeFetchPersistentBusinessItemObjectSQLQuery:](self, v5);
}

- (BOOL)deleteBusinessItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[BCSPersistentStore beginBatch](self, "beginBatch");
  objc_msgSend(v4, "bizID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSBusinessItemPersistentStore deleteBusinessItemWithBizID:](self, "deleteBusinessItemWithBizID:", v5);

  objc_msgSend(v4, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[BCSBusinessItemPersistentStore deleteBusinessItemWithPhoneNumber:](self, "deleteBusinessItemWithPhoneNumber:", v7);
  -[BCSPersistentStore endBatch](self, "endBatch");
  return v6 | v4;
}

- (BOOL)deleteBusinessItemWithBizID:(id)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("delete from business_items where biz_id=\"%@\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return -[BCSBusinessItemPersistentStore _executeDeleteBusinessItemSQLQuery:](self, v5);
}

- (BOOL)_executeDeleteBusinessItemSQLQuery:(void *)a1
{
  _BOOL8 v4;
  sqlite3_stmt *ppStmt;

  if (!a1)
    return 0;
  objc_msgSend(a1, "beginBatch");
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)objc_msgSend(a1, "openedDatabase"), a2, -1, &ppStmt, 0))
    v4 = 0;
  else
    v4 = sqlite3_step(ppStmt) == 101;
  objc_msgSend(a1, "endBatch");
  return v4;
}

- (BOOL)deleteBusinessItemWithPhoneNumber:(id)a3
{
  id v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("delete from business_items where phone_number=\"%@\"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return -[BCSBusinessItemPersistentStore _executeDeleteBusinessItemSQLQuery:](self, v5);
}

@end
