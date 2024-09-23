@implementation FLSQLiteDatabaseConnection

- (FLSQLiteDatabaseConnection)initWithStorePath:(id)a3
{
  id v4;
  FLSQLiteDatabaseConnection *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLSQLiteDatabaseConnection;
  v5 = -[FLSQLiteDatabaseConnection init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByRemovingPercentEncoding");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (id)v6;
    else
      v8 = v4;
    -[FLSQLiteDatabaseConnection setStorePath:](v5, "setStorePath:", v8);

    flLogForObject(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLSQLiteDatabaseConnection setLog:](v5, "setLog:", v9);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[FLSQLiteDatabaseConnection close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)FLSQLiteDatabaseConnection;
  -[FLSQLiteDatabaseConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)open
{
  sqlite3 **p_db;
  NSObject *v4;
  BOOL v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_db = &self->_db;
  if (self->_db)
  {
    -[FLSQLiteDatabaseConnection log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[FLSQLiteDatabaseConnection storePath](self, "storePath");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_1B512E000, v4, OS_LOG_TYPE_DEBUG, "Re-using already opened SQLite store %@", (uint8_t *)&v11, 0xCu);

    }
    v5 = 1;
  }
  else
  {
    -[FLSQLiteDatabaseConnection storePath](self, "storePath");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = sqlite3_open_v2((const char *)-[NSObject UTF8String](v4, "UTF8String"), p_db, 3211270, 0);
    v5 = v6 == 0;
    if (v6)
    {
      v7 = v6;
      -[FLSQLiteDatabaseConnection close](self, "close");
      -[FLSQLiteDatabaseConnection log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 67109120;
        LODWORD(v12) = v7;
        _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "SQLite open failed: %d", (uint8_t *)&v11, 8u);
      }
    }
    else
    {
      sqlite3_busy_timeout(self->_db, 250);
      -[FLSQLiteDatabaseConnection log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_debug_impl(&dword_1B512E000, v8, OS_LOG_TYPE_DEBUG, "Opened SQLite store %@", (uint8_t *)&v11, 0xCu);
      }
    }

  }
  return v5;
}

- (void)close
{
  sqlite3 *db;
  int v4;
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  db = self->_db;
  if (db)
  {
    v4 = sqlite3_close_v2(db);
    if (v4)
    {
      v5 = v4;
      -[FLSQLiteDatabaseConnection log](self, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67109120;
        v7[1] = v5;
        _os_log_error_impl(&dword_1B512E000, v6, OS_LOG_TYPE_ERROR, "SQLite close connection failed: %d", (uint8_t *)v7, 8u);
      }

    }
  }
  self->_db = 0;
}

- (sqlite3)db
{
  return self->_db;
}

- (NSString)storePath
{
  return self->_storePath;
}

- (void)setStorePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_storePath, 0);
}

@end
