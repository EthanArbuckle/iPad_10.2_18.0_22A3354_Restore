@implementation CalDatabaseGetEventOccurrenceAtDayAndOffset

void __CalDatabaseGetEventOccurrenceAtDayAndOffset_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  const os_unfair_lock *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const os_unfair_lock *v10;

  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
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
    if (CDBLockingAssertionsEnabled)
    {
      if (*(_QWORD *)(Database + 104))
      {
        v6 = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (v6)
          os_unfair_lock_assert_owner(v6 + 20);
      }
    }
    v7 = CPSqliteDatabaseStatementForReading();
    if (v7)
    {
      v8 = v7;
      sqlite3_bind_double(*(sqlite3_stmt **)(v7 + 8), 1, *(double *)(a1 + 40));
      sqlite3_bind_int(*(sqlite3_stmt **)(v8 + 8), 2, *(_DWORD *)(a1 + 64));
      if (sqlite3_step(*(sqlite3_stmt **)(v8 + 8)) == 100)
      {
        **(_DWORD **)(a1 + 48) = sqlite3_column_int(*(sqlite3_stmt **)(v8 + 8), 0);
        **(double **)(a1 + 56) = sqlite3_column_double(*(sqlite3_stmt **)(v8 + 8), 1);
      }
      if (CDBLockingAssertionsEnabled)
      {
        if (*(_QWORD *)v8)
        {
          v9 = **(_QWORD **)v8;
          if (v9)
          {
            if (*(_QWORD *)(v9 + 104))
            {
              v10 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v10)
                os_unfair_lock_assert_owner(v10 + 20);
            }
          }
        }
      }
      CPSqliteStatementReset();
    }
    CFRelease(CFSTR("SELECT event_id, occurrence_date FROM OccurrenceCache WHERE day = ? ORDER BY occurrence_date ASC LIMIT 1 OFFSET ?"));
  }
}

@end
