@implementation CalEventOccurrenceCacheCopyEventOccurrencesAfterDate

void __CalEventOccurrenceCacheCopyEventOccurrencesAfterDate_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  void *v9;
  const os_unfair_lock *v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t v13;
  const os_unfair_lock *v14;
  uint64_t v15;
  const os_unfair_lock *v16;
  NSObject *v17;
  uint8_t buf[8];
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;

  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  if (CDBLockingAssertionsEnabled)
    v3 = RecordStore == 0;
  else
    v3 = 1;
  if (!v3)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context)
      os_unfair_lock_assert_owner(Context + 20);
  }
  Database = CPRecordStoreGetDatabase();
  if (Database)
  {
    v6 = Database;
    if (__CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2021"))
    {
      v7 = *(_DWORD *)(a1 + 64);
      v8 = CFSTR("ORDER BY occurrence_date");
      if (v7 <= 0)
        v8 = 0;
      *(_QWORD *)buf = CFSTR("SELECT event_id, occurrence_date FROM OccurrenceCache");
      v19 = CFSTR("occurrence_date > ?");
      v20 = v8;
      v21 = v7;
      v9 = _CalFilterCopyQuery(*(void **)(a1 + 48));
      if (CDBLockingAssertionsEnabled)
      {
        if (*(_QWORD *)(v6 + 104))
        {
          v10 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v10)
            os_unfair_lock_assert_owner(v10 + 20);
        }
      }
      v11 = CPSqliteDatabaseStatementForReading();
      if (v11)
      {
        v12 = (uint64_t **)v11;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        _CalEventOccurrenceCacheLoadInfo(*(_QWORD *)(a1 + 40));
        sqlite3_bind_int((sqlite3_stmt *)v12[1], 1, (int)*(double *)(a1 + 56));
        if (CDBLockingAssertionsEnabled)
        {
          if (*v12)
          {
            v13 = **v12;
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
        CPSqliteStatementSendResults();
        if (CDBLockingAssertionsEnabled)
        {
          if (*v12)
          {
            v15 = **v12;
            if (v15)
            {
              if (*(_QWORD *)(v15 + 104))
              {
                v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v16)
                  os_unfair_lock_assert_owner(v16 + 20);
              }
            }
          }
        }
        CPSqliteStatementReset();
      }
      if (v9)
        CFRelease(v9);
      __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2046");
    }
    else
    {
      v17 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5CCB000, v17, OS_LOG_TYPE_ERROR, "Unable to begin transaction", buf, 2u);
      }
    }
  }
}

@end
