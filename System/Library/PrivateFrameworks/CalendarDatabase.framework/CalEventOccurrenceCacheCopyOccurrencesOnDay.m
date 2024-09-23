@implementation CalEventOccurrenceCacheCopyOccurrencesOnDay

void __CalEventOccurrenceCacheCopyOccurrencesOnDay_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const os_unfair_lock *v15;
  uint64_t v16;
  uint64_t **v17;
  sqlite3_stmt *v18;
  double v19;
  uint64_t v20;
  const os_unfair_lock *v21;
  uint64_t v22;
  const os_unfair_lock *v23;

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
    __CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:1956");
    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    _CalEventOccurrenceCacheLoadInfo(v8);
    v9 = *(id *)(v8 + 32);
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 30, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _CalFilterCopyQuery(*(void **)(a1 + 48));
    if (CDBLockingAssertionsEnabled)
    {
      if (*(_QWORD *)(v6 + 104))
      {
        v15 = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (v15)
          os_unfair_lock_assert_owner(v15 + 20);
      }
    }
    v16 = CPSqliteDatabaseStatementForReading();
    if (v16)
    {
      v17 = (uint64_t **)v16;
      sqlite3_bind_int(*(sqlite3_stmt **)(v16 + 8), 1, (int)*(double *)(a1 + 56));
      v18 = (sqlite3_stmt *)v17[1];
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      sqlite3_bind_double(v18, 2, v19);
      if (CDBLockingAssertionsEnabled)
      {
        if (*v17)
        {
          v20 = **v17;
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
      CPSqliteStatementSendResults();
      if (CDBLockingAssertionsEnabled)
      {
        if (*v17)
        {
          v22 = **v17;
          if (v22)
          {
            if (*(_QWORD *)(v22 + 104))
            {
              v23 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v23)
                os_unfair_lock_assert_owner(v23 + 20);
            }
          }
        }
      }
      CPSqliteStatementReset();
    }
    CFRelease(v14);
    __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:1986");

  }
}

@end
