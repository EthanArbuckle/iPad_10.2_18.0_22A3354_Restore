@implementation CalEventOccurrenceCacheCount

uint64_t __CalEventOccurrenceCacheCount_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t result;
  const os_unfair_lock *v6;
  uint64_t **v7;
  BOOL v8;
  uint64_t v9;
  const os_unfair_lock *v10;
  BOOL v11;
  uint64_t v12;
  const os_unfair_lock *v13;

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
  result = CPRecordStoreGetDatabase();
  if (result)
  {
    if (CDBLockingAssertionsEnabled)
    {
      if (*(_QWORD *)(result + 104))
      {
        v6 = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (v6)
          os_unfair_lock_assert_owner(v6 + 20);
      }
    }
    v7 = (uint64_t **)CPSqliteDatabaseStatementForReading();
    sqlite3_bind_int((sqlite3_stmt *)v7[1], 1, (int)*(double *)(a1 + 48));
    sqlite3_bind_int((sqlite3_stmt *)v7[1], 2, (int)*(double *)(a1 + 56));
    if (v7)
      v8 = CDBLockingAssertionsEnabled == 0;
    else
      v8 = 1;
    if (!v8)
    {
      if (*v7)
      {
        v9 = **v7;
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
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CPSqliteStatementIntegerResult();
    if (v7)
      v11 = CDBLockingAssertionsEnabled == 0;
    else
      v11 = 1;
    if (!v11)
    {
      if (*v7)
      {
        v12 = **v7;
        if (v12)
        {
          if (*(_QWORD *)(v12 + 104))
          {
            v13 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v13)
              os_unfair_lock_assert_owner(v13 + 20);
          }
        }
      }
    }
    return CPSqliteStatementReset();
  }
  return result;
}

@end
