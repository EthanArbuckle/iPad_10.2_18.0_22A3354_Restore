@implementation CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch

void __CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  uint64_t v3;
  BOOL v4;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v7;
  void *v8;
  const os_unfair_lock *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const os_unfair_lock *v14;
  void *v15;
  const os_unfair_lock *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const os_unfair_lock *v21;
  NSObject *v22;
  uint8_t buf[16];
  __int128 v24;

  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = RecordStore;
  if (CDBLockingAssertionsEnabled)
    v4 = RecordStore == 0;
  else
    v4 = 1;
  if (!v4)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context)
      os_unfair_lock_assert_owner(Context + 20);
  }
  Database = CPRecordStoreGetDatabase();
  if (Database)
  {
    v7 = Database;
    if (__CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2962"))
    {
      *(_OWORD *)buf = xmmword_1E4F8EE80;
      v24 = *(_OWORD *)&off_1E4F8EE90;
      v8 = _CalFilterCopyQuery(*(void **)(a1 + 48));
      if (CDBLockingAssertionsEnabled)
      {
        if (*(_QWORD *)(v7 + 104))
        {
          v9 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v9)
            os_unfair_lock_assert_owner(v9 + 20);
        }
      }
      v10 = CPSqliteDatabaseStatementForReading();
      if (v10)
      {
        v11 = v10;
        sqlite3_bind_double(*(sqlite3_stmt **)(v10 + 8), 1, *(double *)(a1 + 56));
        sqlite3_bind_int(*(sqlite3_stmt **)(v11 + 8), 2, *(_DWORD *)(a1 + 64));
        if (sqlite3_step(*(sqlite3_stmt **)(v11 + 8)) == 100)
        {
          v12 = *(_QWORD *)(a1 + 40);
          _CalEventOccurrenceCacheLoadInfo(v12);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _createEventOccurrenceFromStatement(v3, v11, *(const void **)(v12 + 32));
        }
        if (CDBLockingAssertionsEnabled)
        {
          if (*(_QWORD *)v11)
          {
            v13 = **(_QWORD **)v11;
            if (v13)
            {
              if (*(_QWORD *)(v13 + 104))
              {
                v14 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v14)
                  os_unfair_lock_assert_owner(v14 + 20);
              }
            }
          }
        }
        CPSqliteStatementReset();
      }
      if (v8)
        CFRelease(v8);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v15 = _CalFilterCopyQuery(*(void **)(a1 + 48));
        if (CDBLockingAssertionsEnabled)
        {
          if (*(_QWORD *)(v7 + 104))
          {
            v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v16)
              os_unfair_lock_assert_owner(v16 + 20);
          }
        }
        v17 = CPSqliteDatabaseStatementForReading();
        if (v17)
        {
          v18 = v17;
          sqlite3_bind_double(*(sqlite3_stmt **)(v17 + 8), 1, *(double *)(a1 + 56));
          sqlite3_bind_int(*(sqlite3_stmt **)(v18 + 8), 2, *(_DWORD *)(a1 + 64));
          if (sqlite3_step(*(sqlite3_stmt **)(v18 + 8)) == 100)
          {
            v19 = *(_QWORD *)(a1 + 40);
            _CalEventOccurrenceCacheLoadInfo(v19);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _createEventOccurrenceFromStatement(v3, v18, *(const void **)(v19 + 32));
          }
          if (CDBLockingAssertionsEnabled)
          {
            if (*(_QWORD *)v18)
            {
              v20 = **(_QWORD **)v18;
              if (v20)
              {
                if (*(_QWORD *)(v20 + 104))
                {
                  v21 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v21)
                    os_unfair_lock_assert_owner(v21 + 20);
                }
              }
            }
          }
          CPSqliteStatementReset();
        }
        if (v15)
          CFRelease(v15);
      }
      __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:3002");
    }
    else
    {
      v22 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5CCB000, v22, OS_LOG_TYPE_ERROR, "Couldn't begin transaction", buf, 2u);
      }
    }
  }
}

@end
