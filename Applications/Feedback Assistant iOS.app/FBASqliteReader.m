@implementation FBASqliteReader

- (FBASqliteReader)initWithFile:(id)a3
{
  id v4;
  FBASqliteReader *v5;
  FBASqliteReader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBASqliteReader;
  v5 = -[FBASqliteReader init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FBASqliteReader setDbFile:](v5, "setDbFile:", v4);

  return v6;
}

- (void)setDbFile:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSURL *dbFile;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    objc_storeStrong((id *)&self->_dbFile, a3);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10009A8EC(v9);

    dbFile = self->_dbFile;
    self->_dbFile = 0;

  }
}

- (id)tableNames
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteReader runQuery:](self, "runQuery:", CFSTR("SELECT name FROM sqlite_master WHERE type='table'")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("name")));

  return v3;
}

- (id)allRowsForTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  v4 = a3;
  if (!v4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("passed nil tableName to rowsForTable:"), 0));
    objc_exception_throw(v9);
  }
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %@"), v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteReader runQuery:](self, "runQuery:", v6));

  return v7;
}

- (id)csvRepresentationForTable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  OSStatus (__cdecl **v13)(SystemSoundID);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  OSStatus (__cdecl **v21)(SystemSoundID);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteReader allRowsForTable:](self, "allRowsForTable:", v4));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v8 = v6;
    v28 = v4;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    v12 = CFSTR("\n");
    v13 = &AudioServicesDisposeSystemSoundID_ptr;
    do
    {
      v14 = 0;
      v15 = v9;
      v29 = v8;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v5);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14);
        if (!v10)
        {
          v10 = (void *)objc_opt_new(NSMutableString, v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
          v18 = v17;
          if (v17 && objc_msgSend(v17, "count"))
          {
            v19 = v11;
            v20 = v12;
            v21 = v13;
            v22 = v5;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(",")));
            objc_msgSend(v10, "appendString:", v23);

            v5 = v22;
            v13 = v21;
            v12 = v20;
            v11 = v19;
            v8 = v29;
          }
          objc_msgSend(v10, "appendString:", v12);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allValues"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR(",")));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[230], "stringWithFormat:", CFSTR("%@\n"), v9));
        objc_msgSend(v10, "appendString:", v25);

        v14 = (char *)v14 + 1;
        v15 = v9;
      }
      while (v8 != v14);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
    if (v10)
      v26 = (__CFString *)objc_msgSend(objc_alloc((Class)v13[230]), "initWithString:", v10);
    else
      v26 = &stru_1000EA660;
    v4 = v28;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v26 = &stru_1000EA660;
  }

  return v26;
}

- (id)runQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  id v14;
  int v15;
  NSString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  sqlite3_stmt *ppStmt;
  sqlite3 *ppDb;

  v4 = a3;
  if (!self->_dbFile)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("invalid database file"), 0));
    objc_exception_throw(v31);
  }
  v5 = v4;
  ppDb = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBASqliteReader dbFile](self, "dbFile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  v8 = objc_retainAutorelease(v7);
  v9 = 0;
  v10 = 0;
  if (!sqlite3_open((const char *)objc_msgSend(v8, "UTF8String"), &ppDb))
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), -1, &ppStmt, 0))
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10009A92C(&ppDb, v11);

      v9 = 0;
      v10 = 0;
    }
    else
    {
      v12 = sqlite3_column_count(ppStmt);
      v13 = v12;
      v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
      if (v12 >= 1)
      {
        v15 = 0;
        do
        {
          v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_name(ppStmt, v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(v14, "addObject:", v17);

          ++v15;
        }
        while ((_DWORD)v13 != v15);
      }
      v18 = objc_msgSend(v14, "copy");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v18));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v13));
      if (sqlite3_step(ppStmt) == 100)
      {
        v32 = v8;
        v33 = v5;
        do
        {
          v20 = (void *)objc_opt_new(NSMutableDictionary, v19);
          if ((int)v13 < 1)
          {
            v23 = 0;
            v22 = 0;
          }
          else
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            do
            {
              v24 = sqlite3_column_text(ppStmt, v21);
              if (v24)
              {
                v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24));

                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v21));
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, v26);
                v23 = (void *)v26;
                v22 = (void *)v25;
              }
              ++v21;
            }
            while (v13 != v21);
          }
          v27 = objc_msgSend(v20, "copy", v32, v33);
          objc_msgSend(v9, "addObject:", v27);

        }
        while (sqlite3_step(ppStmt) == 100);
        v8 = v32;
        v5 = v33;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  sqlite3_close(ppDb);
  v28 = objc_msgSend(v9, "copy");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v28));

  return v29;
}

- (NSURL)dbFile
{
  return self->_dbFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFile, 0);
}

@end
