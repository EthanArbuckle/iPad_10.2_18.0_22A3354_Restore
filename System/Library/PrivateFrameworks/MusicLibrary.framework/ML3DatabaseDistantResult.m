@implementation ML3DatabaseDistantResult

- (ML3DatabaseDistantResult)initWithDistantConnection:(id)a3 sql:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  ML3DatabaseDistantResult *v12;
  ML3DatabaseDistantResult *v13;
  uint64_t v14;
  NSString *sql;
  NSArray *cachedRows;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ML3DatabaseDistantResult;
  v12 = -[ML3DatabaseResult initWithStatement:connection:](&v18, sel_initWithStatement_connection_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_distantConnection, a3);
    v14 = objc_msgSend(v10, "copy");
    sql = v13->_sql;
    v13->_sql = (NSString *)v14;

    objc_storeStrong((id *)&v13->_parameters, a5);
    cachedRows = v13->_cachedRows;
    v13->_cachedRows = 0;

  }
  return v13;
}

- (ML3DatabaseDistantResult)initWithStatement:(id)a3
{
  objc_class *v4;
  void *v5;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ initWithStatement:] is invalid for distant results. Use -[%@ initWithTransactionID:] instead."), v5, v5);

  return 0;
}

- (ML3DatabaseDistantResult)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ init] is unsupported. Use -[%@ initWithTransactionID:] instead."), v4, v4);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3DatabaseDistantResult;
  -[ML3DatabaseDistantResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, sql = \"%@\", parameters = %@"), v4, self->_sql, self->_parameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ML3DatabaseDistantResult columnNameIndexMap](self, "columnNameIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (id)columnNameIndexMap
{
  NSDictionary *cachedColumnNameIndexMap;
  _QWORD v5[5];

  cachedColumnNameIndexMap = self->_cachedColumnNameIndexMap;
  if (!cachedColumnNameIndexMap)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__ML3DatabaseDistantResult_columnNameIndexMap__block_invoke;
    v5[3] = &unk_1E5B65EE0;
    v5[4] = self;
    -[ML3DatabaseDistantResult _localEnumerateRowsWithBlock:](self, "_localEnumerateRowsWithBlock:", v5);
    cachedColumnNameIndexMap = self->_cachedColumnNameIndexMap;
  }
  return cachedColumnNameIndexMap;
}

- (void)enumerateRowsWithBlock:(id)a3
{
  ML3DatabaseDistantConnection *distantConnection;
  id v5;

  distantConnection = self->_distantConnection;
  v5 = a3;
  if (-[ML3DatabaseConnection isInTransaction](distantConnection, "isInTransaction"))
    -[ML3DatabaseDistantResult _remoteEnumerateRowsWithBlock:](self, "_remoteEnumerateRowsWithBlock:", v5);
  else
    -[ML3DatabaseDistantResult _localEnumerateRowsWithBlock:](self, "_localEnumerateRowsWithBlock:", v5);

}

- (void)_remoteEnumerateRowsWithBlock:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ML3DatabaseDistantResult _fetchRowsIfEmpty](self, "_fetchRowsIfEmpty"))
  {
    v11[0] = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_cachedRows;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*((void (**)(id, _QWORD, _QWORD, uint8_t *))v4 + 2))(v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, v11);
        if (v11[0])
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "Distant result fetch failed. Trying to fallback to a local connection...", v11, 2u);
    }

    -[ML3DatabaseDistantResult _localEnumerateRowsWithBlock:](self, "_localEnumerateRowsWithBlock:", v4);
  }

}

- (void)_localEnumerateRowsWithBlock:(id)a3
{
  id v4;
  ML3DatabaseDistantConnection *distantConnection;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *sql;
  NSArray *parameters;
  void *v12;
  void *v13;
  ML3DatabaseDistantConnection *v14;
  NSObject *v15;
  ML3DatabaseDistantConnection *v16;
  int v17;
  ML3DatabaseDistantConnection *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  distantConnection = self->_distantConnection;
  if (distantConnection)
  {
    -[ML3DatabaseConnection _owningPool](distantConnection, "_owningPool");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ML3DatabaseConnection _owningPool](self->_distantConnection, "_owningPool");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject _connectionForWriting:useThreadConnection:storeThreadLocalConnection:](v7, "_connectionForWriting:useThreadConnection:storeThreadLocalConnection:", 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3DatabaseResult limitProperty](self, "limitProperty");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      sql = self->_sql;
      parameters = self->_parameters;
      if (v9)
      {
        -[ML3DatabaseResult limitProperty](self, "limitProperty");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "executeQuery:withParameters:limitProperty:limitValue:", sql, parameters, v12, -[ML3DatabaseResult limitValue](self, "limitValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
LABEL_5:
          objc_msgSend(v13, "enumerateRowsWithBlock:", v4);
LABEL_12:
          -[NSObject checkInConnection:](v7, "checkInConnection:", v8);

          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend(v8, "executeQuery:withParameters:", self->_sql, self->_parameters);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_5;
      }
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "sqliteError");
        v16 = (ML3DatabaseDistantConnection *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Could not fallback to local connection. Local result could not be obtained from query. %{public}@", (uint8_t *)&v17, 0xCu);

      }
      goto LABEL_12;
    }
  }
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_distantConnection;
    v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Could not fallback to local connection. Result does not have a connection or a pool reference. %{public}@", (uint8_t *)&v17, 0xCu);
  }
LABEL_13:

}

- (BOOL)_fetchRowsIfEmpty
{
  NSString *sql;
  BOOL v4;
  ML3DatabaseDistantConnection *distantConnection;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  ML3DatabaseDistantConnection *v16;
  NSString *v17;
  NSArray *parameters;
  NSArray *v19;
  NSObject *v20;
  NSArray *cachedRows;
  NSArray *v22;
  _QWORD v24[4];
  NSArray *v25;
  ML3DatabaseDistantResult *v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  ML3DatabaseDistantConnection *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  sql = self->_sql;
  if (!sql)
    return 1;
  v4 = 1;
  if (-[NSString length](sql, "length"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 1;
    if (!self->_cachedRows)
    {
      distantConnection = self->_distantConnection;
      if (distantConnection)
      {
        -[ML3DatabaseDistantConnection currentTransactionID](distantConnection, "currentTransactionID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[ML3DatabaseConnection pushTransaction](self->_distantConnection, "pushTransaction");
          +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = dispatch_semaphore_create(0);
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[ML3DatabaseResult limitProperty](self, "limitProperty");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (v11)
          {
            v14 = 0;
          }
          else
          {
            v33[0] = CFSTR("MLDatabaseQueryOptionLimitPropertyKey");
            -[ML3DatabaseResult limitProperty](self, "limitProperty");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v33[1] = CFSTR("MLDatabaseQueryOptionLimitValueKey");
            v34[0] = v12;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ML3DatabaseResult limitValue](self, "limitValue"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v17 = self->_sql;
          parameters = self->_parameters;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __45__ML3DatabaseDistantResult__fetchRowsIfEmpty__block_invoke;
          v24[3] = &unk_1E5B65CA0;
          v19 = (NSArray *)v9;
          v28 = &v29;
          v25 = v19;
          v26 = self;
          v20 = v8;
          v27 = v20;
          objc_msgSend(v7, "executeQuery:withParameters:options:onTransaction:withCompletionHandler:", v17, parameters, v14, v6, v24);
          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
          cachedRows = self->_cachedRows;
          self->_cachedRows = v19;
          v22 = v19;

          v4 = *((_BYTE *)v30 + 24) != 0;
          goto LABEL_17;
        }
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_distantConnection;
          *(_DWORD *)buf = 138543362;
          v36 = v16;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Tried to fetch distant result set without a transaction ID. (Connection used: %{public}@)", buf, 0xCu);
        }
      }
      else
      {
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Tried to fetch distant result set without a connection.", buf, 2u);
        }
      }

      v4 = 0;
    }
LABEL_17:
    _Block_object_dispose(&v29, 8);
  }
  return v4;
}

- (ML3DatabaseDistantConnection)distantConnection
{
  return self->_distantConnection;
}

- (NSString)sql
{
  return self->_sql;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_distantConnection, 0);
  objc_storeStrong((id *)&self->_cachedColumnNameIndexMap, 0);
  objc_storeStrong((id *)&self->_cachedRows, 0);
}

void __45__ML3DatabaseDistantResult__fetchRowsIfEmpty__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  ML3DatabaseCachedRow *v16;
  ML3DatabaseCachedRow *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch results for distant result set. %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    MSVPropertyListDataClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v16 = [ML3DatabaseCachedRow alloc];
          v17 = -[ML3DatabaseCachedRow initWithArray:](v16, "initWithArray:", v15, (_QWORD)v18);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "popTransactionAndCommit:", 1, (_QWORD)v18);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __46__ML3DatabaseDistantResult_columnNameIndexMap__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  if (v12)
  {
    objc_msgSend(v12, "parentResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "columnNameIndexMap");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 64);
    *(_QWORD *)(v10 + 64) = v9;

  }
  if (a4)
    *a4 = 1;

}

@end
