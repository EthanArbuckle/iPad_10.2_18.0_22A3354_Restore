@implementation HMELastEventStore

- (HMELastEventStore)initWithFileName:(id)a3
{
  return -[HMELastEventStore initWithFileName:useWal:](self, "initWithFileName:useWal:", a3, 1);
}

- (id)initInMemoryStore
{
  return -[HMELastEventStore initWithFileName:](self, "initWithFileName:", CFSTR(":memory:"));
}

- (BOOL)startup
{
  NSObject *logger;
  os_unfair_lock_s *p_lock;
  char v5;
  uint8_t v7[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Starting up last event store", v7, 2u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[HMELastEventStore _startupWithRepair:](self, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (HMELastEventStore)initWithFileName:(id)a3 useWal:(BOOL)a4
{
  NSString *v6;
  HMELastEventStore *v7;
  os_log_t v8;
  OS_os_log *logger;
  NSString *fileName;
  objc_super v12;

  v6 = (NSString *)a3;
  v12.receiver = self;
  v12.super_class = (Class)HMELastEventStore;
  v7 = -[HMELastEventStore init](&v12, sel_init);
  v8 = os_log_create("com.apple.HomeKitEventRouter", "HMELastEventStore");
  logger = v7->_logger;
  v7->_logger = (OS_os_log *)v8;

  v7->_lock._os_unfair_lock_opaque = 0;
  fileName = v7->_fileName;
  v7->_fileName = v6;

  v7->_useWal = a4;
  return v7;
}

- (uint64_t)_startupWithRepair:(void *)a1
{
  uint64_t v2;
  id v4;
  sqlite3 **v5;
  int v6;
  NSObject *v7;
  void *v9;
  int v10;
  id v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int *v20;
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  sqlite3 *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  BOOL v44;
  id v45;
  BOOL v46;
  id v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  const char *v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  char *value;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  _WORD v73[17];

  v2 = (uint64_t)a1;
  *(_QWORD *)&v73[13] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  objc_msgSend(a1, "setReadJournalMode:", 0);
  objc_msgSend((id)v2, "setIntegrityCheckError:", 0);
  objc_msgSend((id)v2, "fileName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3 **)(v2 + 16);
  v6 = sqlite3_open_v2((const char *)objc_msgSend(v4, "UTF8String"), (sqlite3 **)(v2 + 16), 6, 0);

  if (!v6)
  {
    objc_msgSend((id)v2, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR(":memory:"));

    if ((v10 & 1) == 0)
    {
      LOBYTE(value) = -1;
      objc_msgSend((id)v2, "fileName");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = setxattr((const char *)objc_msgSend(v11, "UTF8String"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);

      if (v12 < 0)
      {
        v16 = *(NSObject **)(v2 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          objc_msgSend((id)v2, "fileName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *__error();
          v20 = __error();
          v21 = strerror(*v20);
          *(_DWORD *)buf = 138412802;
          v71 = v18;
          v72 = 1024;
          *(_DWORD *)v73 = v19;
          v73[2] = 2080;
          *(_QWORD *)&v73[3] = v21;
          _os_log_error_impl(&dword_19B524000, v17, OS_LOG_TYPE_ERROR, "Could not set RunningBoard file lock exception attribute at %@: [%i] %s", buf, 0x1Cu);

        }
        return 0;
      }
    }
    value = 0;
    if (objc_msgSend((id)v2, "useWal"))
    {
      if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma journal_mode;",
             (int (__cdecl *)(void *, int, char **, char **))pragmaCallback,
             (void *)v2,
             &value))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(NSObject **)(v2 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v13;
          _os_log_error_impl(&dword_19B524000, v14, OS_LOG_TYPE_ERROR, "Unable to read journal_mode %@", buf, 0xCu);
          if (a2)
            goto LABEL_12;
        }
        else if (a2)
        {
LABEL_12:
          v15 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19B524000, v15, OS_LOG_TYPE_ERROR, "Already attempted repair, fail.", buf, 2u);
          }
          sqlite3_close_v2(*v5);
          v2 = 0;
          *v5 = 0;
LABEL_66:

          return v2;
        }
        if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma integrity_check;",
               (int (__cdecl *)(void *, int, char **, char **))integrityCheckCallback,
               (void *)v2,
               &value))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
          v52 = objc_claimAutoreleasedReturnValue();

          v53 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = (void *)v52;
            _os_log_error_impl(&dword_19B524000, v53, OS_LOG_TYPE_ERROR, "Could not perform integrity check failed %@", buf, 0xCu);
          }
          sqlite3_close_v2(*(sqlite3 **)(v2 + 16));
          *(_QWORD *)(v2 + 16) = 0;
          v2 = -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((_QWORD *)v2);
          v13 = (void *)v52;
        }
        else
        {
          objc_msgSend((id)v2, "integrityCheckError");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            v2 = -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((_QWORD *)v2);
          }
          else
          {
            v55 = *(NSObject **)(v2 + 8);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19B524000, v55, OS_LOG_TYPE_ERROR, "Unable to read journal mode but no integrity error, fail.", buf, 2u);
            }
            v2 = 0;
          }
        }
        goto LABEL_66;
      }
      objc_msgSend((id)v2, "readJournalMode");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        objc_msgSend((id)v2, "useWal");
        goto LABEL_39;
      }
      v23 = (void *)v22;
      objc_msgSend((id)v2, "readJournalMode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("wal"));

      if ((v26 & 1) != 0 || (a2 & 1) != 0)
      {
LABEL_31:
        v34 = objc_msgSend((id)v2, "useWal");
        if ((v26 & 1) == 0 && v34)
        {
          if (sqlite3_exec(*v5, "pragma journal_mode=wal;", 0, 0, &value))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
LABEL_35:
              sqlite3_close_v2(*v5);
              *v5 = 0;

              return 0;
            }
            *(_DWORD *)buf = 138412290;
            v71 = v27;
            v59 = "Setting WAL failed %@";
LABEL_76:
            _os_log_error_impl(&dword_19B524000, v35, OS_LOG_TYPE_ERROR, v59, buf, 0xCu);
            goto LABEL_35;
          }
          v36 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B524000, v36, OS_LOG_TYPE_DEFAULT, "Successfully set WAL Mode.", buf, 2u);
          }
        }
LABEL_39:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA cache_size = %@;"), &unk_1E3B35020);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *v5;
        v39 = objc_retainAutorelease(v37);
        if (sqlite3_exec(v38, (const char *)objc_msgSend(v39, "UTF8String"), 0, 0, &value))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v41 = *(NSObject **)(v2 + 8);
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
LABEL_41:
            v2 = 0;
LABEL_48:

            return v2;
          }
          *(_DWORD *)buf = 138412546;
          v71 = &unk_1E3B35020;
          v72 = 2112;
          *(_QWORD *)v73 = v40;
          v56 = "Unable to set hme sqlite cache size to %@, %@";
          v57 = v41;
          v58 = 22;
LABEL_68:
          _os_log_error_impl(&dword_19B524000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
          goto LABEL_41;
        }
        if (sqlite3_exec(*v5, "CREATE TABLE IF NOT EXISTS eventstore (id integer primary key autoincrement, key string not null unique, value blob not null, m_source string not null, m_timestamp double not null, m_cachepolicy integer not null, m_combinetype not null, m_qos integer not null);",
               0,
               0,
               &value))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v42 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v43 = "Unable to create eventstore table %@";
LABEL_83:
            _os_log_error_impl(&dword_19B524000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);
            goto LABEL_47;
          }
          goto LABEL_47;
        }
        if (sqlite3_exec(*v5, "CREATE INDEX IF NOT EXISTS eventstore_key_index on eventstore (key);", 0, 0, &value))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v42 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v43 = "Unable to create index %@";
            goto LABEL_83;
          }
LABEL_47:
          sqlite3_close_v2(*v5);
          v2 = 0;
          *v5 = 0;
          goto LABEL_48;
        }
        v68 = 0;
        v44 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "replace into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
                (sqlite3_stmt **)(v2 + 24),
                &v68);
        v45 = v68;
        v40 = v45;
        if (v44)
        {
          v67 = v45;
          v46 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;",
                  (sqlite3_stmt **)(v2 + 40),
                  &v67);
          v47 = v67;

          if (!v46)
          {
            v61 = *(NSObject **)(v2 + 8);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v47;
              v62 = "Unable to prepare select event statement error: %@";
LABEL_79:
              _os_log_error_impl(&dword_19B524000, v61, OS_LOG_TYPE_ERROR, v62, buf, 0xCu);
            }
LABEL_85:
            v2 = 0;
            goto LABEL_86;
          }
          v66 = v47;
          v48 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where key = ?1;",
                  (sqlite3_stmt **)(v2 + 48),
                  &v66);
          v40 = v66;

          if (v48)
          {
            v65 = v40;
            v49 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where key like '%' || ?1 || '%';",
                    (sqlite3_stmt **)(v2 + 56),
                    &v65);
            v47 = v65;

            if (!v49)
            {
              v61 = *(NSObject **)(v2 + 8);
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                goto LABEL_85;
              *(_DWORD *)buf = 138412290;
              v71 = v47;
              v62 = "Unable to prepare delete event like statement error: %@";
              goto LABEL_79;
            }
            v64 = v47;
            v50 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where m_timestamp < ?1;",
                    (sqlite3_stmt **)(v2 + 64),
                    &v64);
            v40 = v64;

            if (v50)
            {
              v63 = v40;
              v51 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "insert into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7) on conflict(key) do update set value=excluded.value, m_source = excluded.m_source, m_timestamp = excluded.m_timestamp, m_cachepolicy = excluded.m_cachepolicy, m_combinetype = excluded.m_combinetype, m_qos = excluded.m_qos where (excluded.m_timestamp > eventstore.m_timestamp OR excluded.m_source != eventstore.m_source);",
                      (sqlite3_stmt **)(v2 + 32),
                      &v63);
              v47 = v63;

              if (v51)
              {
                v2 = 1;
LABEL_86:
                v40 = v47;
                goto LABEL_48;
              }
              v61 = *(NSObject **)(v2 + 8);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v47;
                v62 = "Unable to prepare insert if most recent event statement: %@";
                goto LABEL_79;
              }
              goto LABEL_85;
            }
            v60 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              goto LABEL_41;
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v56 = "Unable to prepare delete before timestamp statement error: %@";
          }
          else
          {
            v60 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              goto LABEL_41;
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v56 = "Unable to prepare delete event statement error: %@";
          }
        }
        else
        {
          v60 = *(NSObject **)(v2 + 8);
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_DWORD *)buf = 138412290;
          v71 = v40;
          v56 = "Unable to prepare insert statement error: %@";
        }
        v57 = v60;
        v58 = 12;
        goto LABEL_68;
      }
      if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma integrity_check;",
             (int (__cdecl *)(void *, int, char **, char **))integrityCheckCallback,
             (void *)v2,
             &value))
      {
        if (value)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", value, 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
        v35 = *(NSObject **)(v2 + 8);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          goto LABEL_35;
        *(_DWORD *)buf = 138412290;
        v71 = v27;
        v59 = "Integrity check failed %@";
        goto LABEL_76;
      }
      objc_msgSend((id)v2, "integrityCheckError");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        return -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((_QWORD *)v2);
    }
    v26 = 0;
    goto LABEL_31;
  }
  v7 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v28 = v7;
    objc_msgSend((id)v2, "fileName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR(":memory:"));

    if (v30)
      v31 = CFSTR("in memory");
    else
      v31 = CFSTR("on disk");
    objc_msgSend((id)v2, "fileName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v71 = (void *)v31;
    v72 = 2112;
    *(_QWORD *)v73 = v32;
    _os_log_error_impl(&dword_19B524000, v28, OS_LOG_TYPE_ERROR, "Unable to open %@ sqlite DB (%@)", buf, 0x16u);

  }
  sqlite3_close_v2(*v5);
  v2 = 0;
  *v5 = 0;
  return v2;
}

- (BOOL)_prepare:(sqlite3_stmt *)a3 preparedStatement:(_QWORD *)a4 error:
{
  int v8;
  _BOOL8 result;
  id v10;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 72));
  v8 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 16), a2, -1, a3, 0);
  result = v8 == 0;
  if (a4)
  {
    if (v8)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v10;
    }
  }
  return result;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)readJournalMode
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)useWal
{
  return self->_useWal;
}

- (void)setReadJournalMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setIntegrityCheckError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)dealloc
{
  sqlite3_stmt *insertEventPreparedStatement;
  sqlite3_stmt *replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  sqlite3_stmt *selectEventByKeyPreparedStatement;
  sqlite3_stmt *deleteEventByKeyPreparedStatement;
  sqlite3_stmt *deleteEventByKeyLikePreparedStatement;
  sqlite3_stmt *deleteBeforeTimestampPreparedStatement;
  sqlite3 *db;
  objc_super v10;

  insertEventPreparedStatement = self->insertEventPreparedStatement;
  if (insertEventPreparedStatement)
  {
    sqlite3_finalize(insertEventPreparedStatement);
    self->insertEventPreparedStatement = 0;
  }
  replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  if (replaceEventIfMoreRecentOrDifferentSourcePreparedStatement)
  {
    sqlite3_finalize(replaceEventIfMoreRecentOrDifferentSourcePreparedStatement);
    self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = 0;
  }
  selectEventByKeyPreparedStatement = self->selectEventByKeyPreparedStatement;
  if (selectEventByKeyPreparedStatement)
  {
    sqlite3_finalize(selectEventByKeyPreparedStatement);
    self->selectEventByKeyPreparedStatement = 0;
  }
  deleteEventByKeyPreparedStatement = self->deleteEventByKeyPreparedStatement;
  if (deleteEventByKeyPreparedStatement)
  {
    sqlite3_finalize(deleteEventByKeyPreparedStatement);
    self->deleteEventByKeyPreparedStatement = 0;
  }
  deleteEventByKeyLikePreparedStatement = self->deleteEventByKeyLikePreparedStatement;
  if (deleteEventByKeyLikePreparedStatement)
  {
    sqlite3_finalize(deleteEventByKeyLikePreparedStatement);
    self->deleteEventByKeyLikePreparedStatement = 0;
  }
  deleteBeforeTimestampPreparedStatement = self->deleteBeforeTimestampPreparedStatement;
  if (deleteBeforeTimestampPreparedStatement)
  {
    sqlite3_finalize(deleteBeforeTimestampPreparedStatement);
    self->deleteBeforeTimestampPreparedStatement = 0;
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close_v2(db);
    self->_db = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)HMELastEventStore;
  -[HMELastEventStore dealloc](&v10, sel_dealloc);
}

- (void)resetEventStore
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *logger;
  char *errmsg;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  errmsg = 0;
  if (sqlite3_exec(self->_db, "DELETE FROM eventstore;", 0, 0, &errmsg))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", errmsg, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Unable to reset events in sqlite DB %@", buf, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)eventsForTopicFilters:(id)a3 sinceReferenceTimestamp:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  double v15;
  HMEEventMetadata *v16;
  id v17;
  HMEEvent *v18;
  NSObject *logger;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  int v27;
  int v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v22 = 0;
        v12 = -[HMELastEventStore _executeSelectEventByKeyStatementWithKey:outResult:error:]((uint64_t)self, v11, (uint64_t)&v23, &v22);
        v13 = v22;
        if (v12)
        {
          v14 = v24;
          if (v24)
          {
            v15 = v26;
            if (v26 >= a4)
            {
              v16 = [HMEEventMetadata alloc];
              v17 = -[HMEEventMetadata _initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:](v16, "_initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:", v25, v27, v28, v29, v15);
              v18 = -[HMEEvent initWithEventData:metadata:]([HMEEvent alloc], "initWithEventData:metadata:", v14, v17);
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v11);

            }
          }
        }
        else
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v11;
            v36 = 2112;
            v37 = v13;
            _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing select for topic: %@, error: %@", buf, 0x16u);
          }
          v14 = v24;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v8);
  }

  return v21;
}

- (id)eventsForTopicFilters:(id)a3
{
  return -[HMELastEventStore eventsForTopicFilters:sinceReferenceTimestamp:](self, "eventsForTopicFilters:sinceReferenceTimestamp:", a3, 0.0);
}

- (id)lastEventForTopic:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  HMEEventMetadata *v8;
  id v9;
  HMEEvent *v10;
  NSObject *logger;
  void *v12;
  HMEEvent *v13;
  id v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  int v20;
  int v21;
  int v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v15 = 0;
  v5 = -[HMELastEventStore _executeSelectEventByKeyStatementWithKey:outResult:error:]((uint64_t)self, v4, (uint64_t)&v16, &v15);
  v6 = v15;
  if (v5)
  {
    v7 = v17;
    if (v17)
    {
      v8 = [HMEEventMetadata alloc];
      v9 = -[HMEEventMetadata _initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:](v8, "_initWithSource:rawCachePolicy:rawCombineType:rawQos:timestamp:", v18, v20, v21, v22, v19);
      v10 = -[HMEEvent initWithEventData:metadata:]([HMEEvent alloc], "initWithEventData:metadata:", v7, v9);

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing select for topic: %@, error: %@", buf, 0x16u);
    }
    v10 = 0;
    v7 = v17;
  }
  v12 = v16;
  v13 = v10;

  return v13;
}

- (void)resetBeforeReferenceTimestamp:(double)a3
{
  id v5;
  NSObject *logger;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  int v11;
  BOOL v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if (!self->deleteBeforeTimestampPreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      v14 = 134217984;
      v15 = a3;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement timestamp: %f, deleteBeforeTimestampPreparedStatement is nil", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  if (sqlite3_bind_double(self->deleteBeforeTimestampPreparedStatement, 1, a3))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:
    v7 = v5;
LABEL_9:
    v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = *(double *)&v7;
      _os_log_error_impl(&dword_19B524000, v8, OS_LOG_TYPE_ERROR, "Error executing delete statement %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_11;
  }
  v9 = sqlite3_step(self->deleteBeforeTimestampPreparedStatement);
  if (v9 == 101)
  {
    v10 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = sqlite3_clear_bindings(self->deleteBeforeTimestampPreparedStatement);
  v13 = v9 == 101 && v11 == 0;
  if (v11)
  {
    if (!v10)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
  }
  if (sqlite3_reset(self->deleteBeforeTimestampPreparedStatement))
  {
    if (!v10)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v7 = v10;
  if (!v13)
    goto LABEL_9;
LABEL_11:

}

- (void)resetTopic:(id)a3
{
  id v4;
  sqlite3_stmt *deleteEventByKeyPreparedStatement;
  id v6;
  id v7;
  NSObject *logger;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  int v13;
  BOOL v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!self->deleteEventByKeyPreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement key: %@, deleteEventByKeyPreparedStatement is nil", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  deleteEventByKeyPreparedStatement = self->deleteEventByKeyPreparedStatement;
  v6 = objc_retainAutorelease(v4);
  if (sqlite3_bind_text(deleteEventByKeyPreparedStatement, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:

    v9 = v7;
LABEL_9:
    v10 = self->_logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_19B524000, v10, OS_LOG_TYPE_ERROR, "Error executing delete statement topic:%@ error:%@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_11;
  }
  v11 = sqlite3_step(self->deleteEventByKeyPreparedStatement);
  if (v11 == 101)
  {
    v12 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = sqlite3_clear_bindings(self->deleteEventByKeyPreparedStatement);
  v15 = v11 == 101 && v13 == 0;
  if (v13)
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
  }
  if (sqlite3_reset(self->deleteEventByKeyPreparedStatement))
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  v9 = v12;
  if (!v15)
    goto LABEL_9;
LABEL_11:

}

- (void)resetWildcardTopics:(id)a3
{
  id v4;
  sqlite3_stmt *deleteEventByKeyLikePreparedStatement;
  id v6;
  id v7;
  NSObject *logger;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  int v13;
  BOOL v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!self->deleteEventByKeyLikePreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement key: %@, deleteEventByKeyLikePreparedStatement is nil", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  deleteEventByKeyLikePreparedStatement = self->deleteEventByKeyLikePreparedStatement;
  v6 = objc_retainAutorelease(v4);
  if (sqlite3_bind_text(deleteEventByKeyLikePreparedStatement, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:

    v9 = v7;
LABEL_9:
    v10 = self->_logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_19B524000, v10, OS_LOG_TYPE_ERROR, "Error executing delete like statement topicSubstring:%@ error:%@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_11;
  }
  v11 = sqlite3_step(self->deleteEventByKeyLikePreparedStatement);
  if (v11 == 101)
  {
    v12 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = sqlite3_clear_bindings(self->deleteEventByKeyLikePreparedStatement);
  v15 = v11 == 101 && v13 == 0;
  if (v13)
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
  }
  if (sqlite3_reset(self->deleteEventByKeyLikePreparedStatement))
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  v9 = v12;
  if (!v15)
    goto LABEL_9;
LABEL_11:

}

- (void)writer:(id)a3 saveEvent:(id)a4 topic:(id)a5
{
  id v8;
  id v9;
  id v10;
  sqlite3_stmt *insertEventPreparedStatement;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *logger;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  insertEventPreparedStatement = self->insertEventPreparedStatement;
  if (insertEventPreparedStatement)
  {
    v26 = v8;
    objc_msgSend(v9, "encodedData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v9, "eventMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "rawCachePolicy");
    objc_msgSend(v9, "eventMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rawCombineType");
    objc_msgSend(v9, "eventMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    LOBYTE(v16) = -[HMELastEventStore _executeInsertWithStatement:query:key:value:eventSource:eventTimestamp:eventCachePolicy:eventCombineType:eventQOS:outDidChangeRow:error:]((uint64_t)self, insertEventPreparedStatement, (uint64_t)"replace into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
                    v10,
                    v24,
                    v23,
                    v16,
                    v18,
                    v14,
                    objc_msgSend(v19, "rawQOS"),
                    &v28,
                    &v27);
    v20 = v27;

    logger = self->_logger;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Saved event for topic: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, error: %@", buf, 0x16u);
    }

    v8 = v26;
  }
  else
  {
    v22 = self->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_error_impl(&dword_19B524000, v22, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, insertEventPreparedStatement is nil", buf, 0xCu);
    }
  }

}

- (BOOL)writer:(id)a3 saveEventIfAllowed:(id)a4 topic:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMELastEventStore _doesCachePolicyAllowSaveForEvent:]((uint64_t)self, v9);
  if (v11)
    -[HMELastEventStore writer:saveEvent:topic:](self, "writer:saveEvent:topic:", v8, v9, v10);

  return v11;
}

- (BOOL)writer:(id)a3 saveEventIfDifferent:(id)a4 topic:(id)a5
{
  id v7;
  id v8;
  sqlite3_stmt *replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  void *v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *logger;
  BOOL v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  unsigned __int8 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!-[HMELastEventStore _doesCachePolicyAllowSaveForEvent:]((uint64_t)self, v7))
  {
LABEL_8:
    v26 = 0;
    goto LABEL_12;
  }
  replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  if (!replaceEventIfMoreRecentOrDifferentSourcePreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v8;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, replaceEventIfMoreRecentOrDifferentSourcePreparedStatement is nil", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v33 = 0;
  objc_msgSend(v7, "encodedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "source");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "intervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v7, "eventMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rawCachePolicy");
  objc_msgSend(v7, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rawCombineType");
  objc_msgSend(v7, "eventMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v32 = 0;
  v18 = -[HMELastEventStore _executeInsertWithStatement:query:key:value:eventSource:eventTimestamp:eventCachePolicy:eventCombineType:eventQOS:outDidChangeRow:error:]((uint64_t)self, replaceEventIfMoreRecentOrDifferentSourcePreparedStatement, (uint64_t)"insert into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7) on conflict(key) do update set value=excluded.value, m_source = excluded.m_source, m_timestamp = excluded.m_timestamp, m_cachepolicy = excluded.m_cachepolicy, m_combinetype = excluded.m_combinetype, m_qos = excluded.m_qos where (excluded.m_timestamp > eventstore.m_timestamp OR excluded.m_source != eventstore.m_source);",
          v8,
          v10,
          v28,
          v14,
          v16,
          v12,
          objc_msgSend(v17, "rawQOS"),
          &v33,
          &v32);
  v19 = v32;

  v20 = self->_logger;
  if (v18)
  {
    v8 = v31;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v33;
      v23 = v20;
      objc_msgSend(v21, "numberWithBool:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_19B524000, v23, OS_LOG_TYPE_DEFAULT, "Processed save request for topic: %@, didChange: %@", buf, 0x16u);

    }
  }
  else
  {
    v8 = v31;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2112;
      v37 = v19;
      _os_log_error_impl(&dword_19B524000, v20, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, error: %@", buf, 0x16u);
    }
  }
  v26 = v33 != 0;

LABEL_12:
  return v26;
}

- (NSString)integrityCheckError
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integrityCheckError, 0);
  objc_storeStrong((id *)&self->_readJournalMode, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (uint64_t)_doesCachePolicyAllowSaveForEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cachePolicy");

    if (v6 == 2)
    {
      a1 = 1;
      goto LABEL_8;
    }
    if (v6)
      goto LABEL_6;
    v7 = *(NSObject **)(a1 + 8);
    a1 = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v7;
      objc_msgSend(v4, "eventMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "rawCachePolicy"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_19B524000, v9, OS_LOG_TYPE_DEFAULT, "Unrecognized cache policy, will not cache. %@", (uint8_t *)&v13, 0xCu);

LABEL_6:
      a1 = 0;
    }
  }
LABEL_8:

  return a1;
}

- (BOOL)_executeInsertWithStatement:(uint64_t)a3 query:(void *)a4 key:(void *)a5 value:(void *)a6 eventSource:(int)a7 eventTimestamp:(int)a8 eventCachePolicy:(double)a9 eventCombineType:(int)a10 eventQOS:(_BYTE *)a11 outDidChangeRow:(_QWORD *)a12 error:
{
  id v19;
  id v20;
  id v21;
  _BOOL8 v22;
  int v23;
  id v26;

  v19 = a4;
  v20 = a5;
  v26 = a6;
  if (!a1)
  {
    v22 = 0;
    goto LABEL_26;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if (!sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"), -1, 0))
  {
    v21 = objc_retainAutorelease(v20);
    if (!sqlite3_bind_blob64(a2, 2, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 0)
      && !sqlite3_bind_text(a2, 3, (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"), -1, 0)
      && !sqlite3_bind_double(a2, 4, a9)
      && !sqlite3_bind_int(a2, 5, a7)
      && !sqlite3_bind_int(a2, 6, a8)
      && !sqlite3_bind_int(a2, 7, a10))
    {
      v23 = sqlite3_step(a2);
      v22 = v23 == 101;
      if (v23 == 101)
      {
        if (sqlite3_changes(*(sqlite3 **)(a1 + 16)) >= 1)
          *a11 = 1;
      }
      else if (a12)
      {
        -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), 0);
        *a12 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (sqlite3_clear_bindings(a2))
      {
        if (a12 && !*a12)
        {
          -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), a3);
          v22 = 0;
          *a12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
      }
      if (!sqlite3_reset(a2))
        goto LABEL_25;
      if (a12 && !*a12)
        goto LABEL_10;
LABEL_24:
      v22 = 0;
      goto LABEL_25;
    }
  }
  if (!a12)
    goto LABEL_24;
LABEL_10:
  -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), a3);
  v22 = 0;
  *a12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
LABEL_26:

  return v22;
}

- (id)_errorFromSqlContext:(sqlite3 *)a1 statement:(uint64_t)a2
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_errcode(a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("extendedCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_extended_errcode(a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("text");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("command");
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E3B31538;
  }
  v13[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), 5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  return v10;
}

- (BOOL)_executeSelectEventByKeyStatementWithKey:(uint64_t)a3 outResult:(_QWORD *)a4 error:
{
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  int v10;
  uint64_t v11;
  void *v12;
  sqlite3_stmt *v13;
  const void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_32;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v8 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v7;
      _os_log_error_impl(&dword_19B524000, v8, OS_LOG_TYPE_ERROR, "Error executing select statement key: %@, selectEventByKeyPreparedStatement is nil", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, 0))
  {
    if (a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    goto LABEL_9;
  }
  v10 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  if (v10 == 100)
  {
    NSStringFromSQLiteStatement(*(sqlite3_stmt **)(a1 + 40), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)a3;
    *(_QWORD *)a3 = v11;

    v13 = *(sqlite3_stmt **)(a1 + 40);
    v14 = sqlite3_column_blob(v13, 1);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, sqlite3_column_bytes(v13, 1));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (sqlite3_column_type(v13, 1) == 5)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = *(void **)(a3 + 8);
    *(_QWORD *)(a3 + 8) = v15;

    NSStringFromSQLiteStatement(*(sqlite3_stmt **)(a1 + 40), 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a3 + 16);
    *(_QWORD *)(a3 + 16) = v17;

    *(double *)(a3 + 24) = sqlite3_column_double(*(sqlite3_stmt **)(a1 + 40), 3);
    *(_DWORD *)(a3 + 32) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 4);
    *(_DWORD *)(a3 + 36) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 5);
    *(_DWORD *)(a3 + 40) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 6);
    v10 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  }
  v9 = v10 == 101;
  if (v10 != 101)
  {
    v19 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_19B524000, v19, OS_LOG_TYPE_ERROR, "Unexpected status when performing select query", (uint8_t *)&v21, 2u);
      if (!a4)
        goto LABEL_21;
      goto LABEL_20;
    }
    if (a4)
    {
LABEL_20:
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_21:
  if (sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40)))
  {
    if (a4 && !*a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  if (sqlite3_reset(*(sqlite3_stmt **)(a1 + 40)))
  {
    if (a4 && !*a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
LABEL_32:

  return v9;
}

- (uint64_t)_cleanupResetRecreateAndRestartAfterIntegrityError
{
  sqlite3 *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v11[8];
  id v12;
  uint8_t buf[16];

  v2 = (sqlite3 *)a1[2];
  if (v2)
  {
    sqlite3_close_v2(v2);
    a1[2] = 0;
  }
  v3 = a1[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Recreating database on integrity check failure.", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v12);
  v7 = v12;

  if (v6)
  {
    v8 = a1[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19B524000, v8, OS_LOG_TYPE_DEFAULT, "Restart after DB removal.", v11, 2u);
    }
    v9 = -[HMELastEventStore _startupWithRepair:](a1, 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
