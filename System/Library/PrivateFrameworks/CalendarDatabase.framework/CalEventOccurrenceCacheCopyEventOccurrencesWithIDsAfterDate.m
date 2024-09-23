@implementation CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate

void __CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CFIndex Count;
  __CFString *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const void *v18;
  const os_unfair_lock *v19;
  uint64_t v20;
  uint64_t **v21;
  int v22;
  uint64_t v23;
  const os_unfair_lock *v24;
  uint64_t v25;
  const os_unfair_lock *v26;
  NSObject *v27;
  uint8_t buf[8];
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;

  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));
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
    if (*(int *)(a1 + 80) < 1)
    {
      v7 = 0;
    }
    else if (*(_BYTE *)(a1 + 84))
    {
      v7 = CFSTR("ORDER BY occurrence_date DESC");
    }
    else
    {
      v7 = CFSTR("ORDER BY occurrence_date");
    }
    if (*(_BYTE *)(a1 + 85)
      && !__CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2076"))
    {
      v27 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5CCB000, v27, OS_LOG_TYPE_ERROR, "Could not begin transaction", buf, 2u);
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 86))
      {
        _CalEventOccurrenceCacheCreateOccurrenceCacheRange(*(_QWORD **)(a1 + 48));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
      *(_QWORD *)buf = CFSTR("SELECT event_id, occurrence_date FROM OccurrenceCache");
      v29 = CFSTR("occurrence_date > ? AND event_id IN (%@)");
      v30 = v7;
      v31 = 0;
      LODWORD(v31) = *(_DWORD *)(a1 + 80);
      if (Count == 1)
      {
        Mutable = 0;
        v29 = CFSTR("occurrence_date > ? AND event_id = ?");
      }
      else
      {
        Mutable = CFStringCreateMutable(0, 0);
        if (Count >= 1)
        {
          for (i = 0; i != Count; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
            if (i)
              CFStringAppendFormat(Mutable, 0, CFSTR(",%d"), ValueAtIndex);
            else
              CFStringAppendFormat(Mutable, 0, CFSTR("%d"), ValueAtIndex);
          }
        }
      }
      v15 = (const __CFString *)_CalFilterCopyQuery(*(void **)(a1 + 64));
      v16 = v15;
      if (Count == 1)
        v17 = (void *)CFRetain(v15);
      else
        v17 = (void *)CFStringCreateWithFormat(0, 0, v15, Mutable);
      v18 = v17;
      if (CDBLockingAssertionsEnabled)
      {
        if (*(_QWORD *)(v6 + 104))
        {
          v19 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v19)
            os_unfair_lock_assert_owner(v19 + 20);
        }
      }
      v20 = CPSqliteDatabaseStatementForReading();
      if (v20)
      {
        v21 = (uint64_t **)v20;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        _CalEventOccurrenceCacheLoadInfo(*(_QWORD *)(a1 + 48));
        sqlite3_bind_int((sqlite3_stmt *)v21[1], 1, (int)*(double *)(a1 + 72));
        if (Count == 1)
        {
          v22 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), 0);
          sqlite3_bind_int((sqlite3_stmt *)v21[1], 2, v22);
        }
        if (CDBLockingAssertionsEnabled)
        {
          if (*v21)
          {
            v23 = **v21;
            if (v23)
            {
              if (*(_QWORD *)(v23 + 104))
              {
                v24 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v24)
                  os_unfair_lock_assert_owner(v24 + 20);
              }
            }
          }
        }
        CPSqliteStatementSendResults();
        if (CDBLockingAssertionsEnabled)
        {
          if (*v21)
          {
            v25 = **v21;
            if (v25)
            {
              if (*(_QWORD *)(v25 + 104))
              {
                v26 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v26)
                  os_unfair_lock_assert_owner(v26 + 20);
              }
            }
          }
        }
        CPSqliteStatementReset();
      }
      if (*(_BYTE *)(a1 + 85))
        __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2133");
      if (v18)
        CFRelease(v18);
      CFRelease(v16);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
}

@end
