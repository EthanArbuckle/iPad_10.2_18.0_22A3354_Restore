@implementation CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate

void __CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v6;
  uint64_t Count;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  const os_unfair_lock *v10;
  uint64_t **v11;
  uint64_t v12;
  const os_unfair_lock *v13;
  uint64_t v14;
  const os_unfair_lock *v15;
  CFNumberRef v16;
  int v17;
  int valuePtr;

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
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), i);
        valuePtr = 0;
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
        v17 = 0;
        if (CDBLockingAssertionsEnabled)
        {
          if (*(_QWORD *)(v6 + 104))
          {
            v10 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v10)
              os_unfair_lock_assert_owner(v10 + 20);
          }
        }
        v11 = (uint64_t **)CPSqliteDatabaseStatementForReading();
        sqlite3_bind_int((sqlite3_stmt *)v11[1], 1, (int)*(double *)(a1 + 56));
        sqlite3_bind_int((sqlite3_stmt *)v11[1], 2, valuePtr);
        if (v11)
        {
          if (CDBLockingAssertionsEnabled)
          {
            if (*v11)
            {
              v12 = **v11;
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
        }
        v17 = CPSqliteStatementIntegerResult();
        if (v11)
        {
          if (CDBLockingAssertionsEnabled)
          {
            if (*v11)
            {
              v14 = **v11;
              if (v14)
              {
                if (*(_QWORD *)(v14 + 104))
                {
                  v15 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v15)
                    os_unfair_lock_assert_owner(v15 + 20);
                }
              }
            }
          }
        }
        CPSqliteStatementReset();
        v17 = v17 > 0;
        v16 = CFNumberCreate(0, kCFNumberIntType, &v17);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v16);
        CFRelease(v16);
      }
    }
  }
}

@end
