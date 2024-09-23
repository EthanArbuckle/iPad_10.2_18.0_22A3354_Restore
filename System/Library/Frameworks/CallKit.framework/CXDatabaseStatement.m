@implementation CXDatabaseStatement

- (BOOL)executeWithError:(id *)a3
{
  return -[CXDatabaseStatement executeWithExpectedColumnCount:resultRowHandler:error:](self, "executeWithExpectedColumnCount:resultRowHandler:error:", 0, 0, a3);
}

- (CXDatabaseStatement)initWithSQL:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CXDatabaseStatement *v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CXDatabaseStatement;
  v10 = -[CXDatabaseStatement init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_retainAutorelease(v8);
    v12 = sqlite3_prepare_v2((sqlite3 *)objc_msgSend(v9, "database"), (const char *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v11, "length") + 1, &v10->_statement, 0);
    if ((_DWORD)v12)
    {
      if (a5)
      {
        v13 = v12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_prepare_v2 for query '%@' returned %d errorMessage '%s'"), v11, v12, sqlite3_errmsg((sqlite3 *)objc_msgSend(v9, "database")));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2D50];
        v20[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v13, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
    }
    else
    {
      v10->_database = (sqlite3 *)objc_msgSend(v9, "database");
    }
  }

  return v10;
}

- (BOOL)bind:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  id v16;
  const void *v17;
  int v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v25;
  objc_class *v26;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (!v7)
    goto LABEL_22;
  v8 = v7;
  v9 = 1;
  v10 = *(_QWORD *)v29;
  v27 = a4;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_retainAutorelease(v12);
        v14 = (const char *)objc_msgSend(v13, "UTF8String");
        if (!v14)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSString %@ returned a nil UTF-8 string"), v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = *MEMORY[0x1E0CB2D50];
            v35 = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "errorWithDomain:code:userInfo:", v22, 3, v23);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if (!-[CXDatabaseStatement bindText:ofLength:atIndex:error:](self, "bindText:ofLength:atIndex:error:", v14, strlen(v14), v9 + i, a4))goto LABEL_26;

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!-[CXDatabaseStatement bindInt64:atIndex:error:](self, "bindInt64:atIndex:error:", objc_msgSend(v12, "longLongValue"), v9 + i, a4))goto LABEL_27;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            sqlite3_bind_null(-[CXDatabaseStatement statement](self, "statement"), v9 + i);
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
              goto LABEL_28;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object %@ not a supported binding class"), v12);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0CB35C8];
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = *MEMORY[0x1E0CB2D50];
            v33 = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "errorWithDomain:code:userInfo:", v19, 1, v22);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
LABEL_27:
            LOBYTE(a4) = 0;
            goto LABEL_28;
          }
          v15 = v6;
          v16 = objc_retainAutorelease(v12);
          v17 = (const void *)objc_msgSend(v16, "bytes");
          if (v17)
            v18 = objc_msgSend(v16, "length");
          else
            v18 = 0;
          sqlite3_bind_blob(-[CXDatabaseStatement statement](self, "statement"), v9 + i, v17, v18, 0);

          v6 = v15;
          a4 = v27;
        }
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    v9 = (v9 + i);
    if (v8)
      continue;
    break;
  }
LABEL_22:
  LOBYTE(a4) = 1;
LABEL_28:

  return (char)a4;
}

- (BOOL)bindText:(const char *)a3 ofLength:(int)a4 atIndex:(int)a5 error:(id *)a6
{
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v10 = strnlen(a3, a4);
  else
    v10 = 0;
  v11 = sqlite3_bind_text(-[CXDatabaseStatement statement](self, "statement"), a5, a3, v10, 0);
  v12 = v11;
  if (a6 && (_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLite bind attempt returned %d errorMessage '%s'"), v11, sqlite3_errmsg(-[CXDatabaseStatement database](self, "database")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v12, v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12 == 0;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (BOOL)executeWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v7;
  BOOL v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  double v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v27 = *MEMORY[0x1E0CB2D50];
  v8 = 1;
  v9 = 0.0;
  v10 = 0.0;
  while (1)
  {
    v11 = sqlite3_step(-[CXDatabaseStatement statement](self, "statement"));
    v12 = v11;
    if ((v11 - 7) < 0xFFFFFFFE)
    {
      v10 = 0.0;
      v9 = 0.0;
    }
    if ((v11 - 5) >= 2)
      break;
    v13 = sqlite3_errmsg(-[CXDatabaseStatement database](self, "database"));
    v14 = sqlite3_extended_errcode(-[CXDatabaseStatement database](self, "database"));
    if (v10 > 300.0)
    {
      if (!a5)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_step for query '%s' returned %d (%d) errorMessage '%s' after retrying for %f seconds"), sqlite3_sql(-[CXDatabaseStatement statement](self, "statement")), v12, v14, v13, *(_QWORD *)&v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = v12;
      v39 = v27;
      v40[0] = v19;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = (void **)v40;
      v24 = &v39;
      goto LABEL_25;
    }
    if (v9 == 0.0)
      v15 = -0.0;
    else
      v15 = v9 * 1.2;
    if (v9 == 0.0)
      v9 = 0.2;
    else
      v9 = v9 * 1.2;
    CXDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      v32 = v12;
      v33 = 1024;
      v34 = v14;
      v35 = 2080;
      v36 = v13;
      v37 = 2048;
      v38 = v9;
      _os_log_impl(&dword_1A402D000, v16, OS_LOG_TYPE_DEFAULT, "[WARN] sqlite3_step returned %d (%d) errorMessage '%s', so retrying query after %f seconds", buf, 0x22u);
    }
    v10 = v10 + v15;

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v9);
LABEL_18:
    if (!v8)
      goto LABEL_27;
  }
  if ((_DWORD)v11 == 100)
  {
    if (v7)
      v8 = -[CXDatabaseStatement processResultsWithExpectedColumnCount:resultRowHandler:error:](self, "processResultsWithExpectedColumnCount:resultRowHandler:error:", a3, v7, a5);
    goto LABEL_18;
  }
  if ((_DWORD)v11 == 101)
    goto LABEL_27;
  if (a5)
  {
    v17 = sqlite3_sql(-[CXDatabaseStatement statement](self, "statement"));
    v18 = sqlite3_errmsg(-[CXDatabaseStatement database](self, "database"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sqlite3_step for query '%s' returned %d (%d) errorMessage '%s'"), v17, v12, sqlite3_extended_errcode(-[CXDatabaseStatement database](self, "database")), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = (int)v12;
    v29 = v27;
    v30 = v19;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v30;
    v24 = &v29;
LABEL_25:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v21, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_26:
  v8 = 0;
LABEL_27:
  sqlite3_reset(-[CXDatabaseStatement statement](self, "statement"));
  sqlite3_clear_bindings(-[CXDatabaseStatement statement](self, "statement"));

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CXDatabaseStatement finalize](self, "finalize");
  v3.receiver = self;
  v3.super_class = (Class)CXDatabaseStatement;
  -[CXDatabaseStatement dealloc](&v3, sel_dealloc);
}

- (void)finalize
{
  if (-[CXDatabaseStatement statement](self, "statement"))
  {
    sqlite3_finalize(-[CXDatabaseStatement statement](self, "statement"));
    -[CXDatabaseStatement setStatement:](self, "setStatement:", 0);
  }
}

- (CXDatabaseStatement)init
{

  return 0;
}

- (BOOL)bindInt64:(int64_t)a3 atIndex:(int)a4 error:(id *)a5
{
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = sqlite3_bind_int64(-[CXDatabaseStatement statement](self, "statement"), a4, a3);
  v8 = v7;
  if (a5 && (_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLite bind attempt returned %d errorMessage '%s'"), v7, sqlite3_errmsg(-[CXDatabaseStatement database](self, "database")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.callkit.database.sqlite"), v8, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8 == 0;
}

- (BOOL)processResultsWithExpectedColumnCount:(int64_t)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  void (**v8)(id, void *);
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  const void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a4;
  v9 = sqlite3_column_count(-[CXDatabaseStatement statement](self, "statement"));
  if (v9 == a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)v9 >= 1)
    {
      v11 = 0;
      do
      {
        switch(sqlite3_column_type(-[CXDatabaseStatement statement](self, "statement"), v11))
        {
          case 1:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(-[CXDatabaseStatement statement](self, "statement"), v11));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          case 2:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(-[CXDatabaseStatement statement](self, "statement"), v11));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          case 3:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(-[CXDatabaseStatement statement](self, "statement"), v11));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          case 4:
            v13 = sqlite3_column_blob(-[CXDatabaseStatement statement](self, "statement"), v11);
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, sqlite3_column_bytes(-[CXDatabaseStatement statement](self, "statement"), v11));
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          case 5:
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
            v14 = (void *)v12;
            objc_msgSend(v10, "addObject:", v12);

            break;
          default:
            break;
        }
        ++v11;
      }
      while ((_DWORD)v9 != v11);
    }
    v8[2](v8, v10);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Columns returned by query (%d) did not match expected number of columns (%ld)"), v9, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v18, 2, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == a3;
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

@end
