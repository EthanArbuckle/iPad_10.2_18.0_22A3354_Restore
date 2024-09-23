@implementation _GEOConfigDB

- (_GEOConfigDBOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setFunction
{
  return self->_setFunction;
}

- (GEOSQLiteDB)db
{
  return self->_db;
}

- (void)clearFunction
{
  return self->_clearFunction;
}

- (id)init:(id)a3 cache:(id)a4 operationQueue:(id)a5 clearFunction:(void *)a6 setFunction:(void *)a7 addFunction:(void *)a8 tableName:(id)a9
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  sqlite3 *v22;
  id v23;
  id v25;
  uint64_t v26;
  objc_super v27;

  v16 = a3;
  v25 = a5;
  v17 = a9;
  v18 = a4;
  objc_msgSend(v16, "isolationQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v27.receiver = self;
  v27.super_class = (Class)_GEOConfigDB;
  v20 = -[_GEOConfigCache init:](&v27, sel_init_, v18);

  if (v20)
  {
    objc_storeStrong((id *)v20 + 4, a3);
    objc_storeStrong((id *)v20 + 5, a5);
    *((_QWORD *)v20 + 6) = a6;
    *((_QWORD *)v20 + 7) = a7;
    *((_QWORD *)v20 + 8) = a8;
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT max(rowid) FROM %@"), v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (sqlite3 *)objc_msgSend(*((id *)v20 + 4), "sqliteDB");
    v23 = objc_retainAutorelease(v21);
    sqlite3_exec(v22, (const char *)objc_msgSend(v23, "UTF8String"), (int (__cdecl *)(void *, int, char **, char **))_getFirstColumnInt64, &v26, 0);
    atomic_store(v26 + 1, (unint64_t *)v20 + 3);

  }
  return v20;
}

- (int64_t)nextId
{
  int64_t *p_lastId;
  int64_t result;

  p_lastId = &self->_lastId;
  do
    result = __ldaxr((unint64_t *)p_lastId);
  while (__stlxr(result + 1, (unint64_t *)p_lastId));
  return result;
}

- (void)addFunction
{
  return self->_addFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
