@implementation CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts

BOOL __CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v6;
  void *v7;
  const os_unfair_lock *v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t v11;
  const os_unfair_lock *v12;
  uint64_t v13;
  const os_unfair_lock *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  CFTypeRef Store;
  uint64_t ID;
  CFMutableArrayRef Mutable;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const os_unfair_lock *v31;
  uint64_t v32;
  uint64_t **v33;
  sqlite3_stmt *v34;
  double v35;
  uint64_t v36;
  const os_unfair_lock *v37;
  uint64_t v38;
  const os_unfair_lock *v39;
  void *v40;
  const void *v41;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[18];

  v49[16] = *MEMORY[0x1E0C80C00];
  __CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:1874");
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
    v7 = _CalFilterCopyQuery(*(void **)(a1 + 48));
    if (CDBLockingAssertionsEnabled)
    {
      if (*(_QWORD *)(v6 + 104))
      {
        v8 = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (v8)
          os_unfair_lock_assert_owner(v8 + 20);
      }
    }
    v9 = (uint64_t **)CPSqliteDatabaseStatementForReading();
    if (v9)
    {
      v10 = v9;
      if (CDBLockingAssertionsEnabled)
      {
        if (*v9)
        {
          v11 = **v9;
          if (v11)
          {
            if (*(_QWORD *)(v11 + 104))
            {
              v12 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v12)
                os_unfair_lock_assert_owner(v12 + 20);
            }
          }
        }
      }
      CPSqliteStatementSendResults();
      if (CDBLockingAssertionsEnabled)
      {
        if (*v10)
        {
          v13 = **v10;
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
    CFRelease(v7);
    v43 = *(_QWORD *)(a1 + 40);
    v15 = _CalFilterCopyVisibleCalendars(*(void **)(a1 + 48));
    v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          Store = _CalCalendarGetStore(*(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          if (Store && _CalStoreGetType((uint64_t)Store) == 6)
          {
            ID = CPRecordGetID();
            if (objc_msgSend(v16, "length"))
              objc_msgSend(v16, "appendString:", CFSTR(", "));
            objc_msgSend(v16, "appendFormat:", CFSTR("%i"), ID);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v16, "length"))
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v49[0] = Mutable;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT day, COUNT() FROM OccurrenceCache WHERE next_reminder_date IS NOT NULL AND (next_reminder_date >= ?) AND calendar_id IN (%@) GROUP BY day"), v16);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _CalEventOccurrenceCacheLoadInfo(v43);
      v26 = *(id *)(v43 + 32);
      objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateByAddingUnit:value:toDate:options:", 16, 1, v25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "components:fromDate:", 30, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateFromComponents:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (CDBLockingAssertionsEnabled)
      {
        if (*(_QWORD *)(v6 + 104))
        {
          v31 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v31)
            os_unfair_lock_assert_owner(v31 + 20);
        }
      }
      v32 = CPSqliteDatabaseStatementForReading();
      if (v32)
      {
        v33 = (uint64_t **)v32;
        v34 = *(sqlite3_stmt **)(v32 + 8);
        objc_msgSend(v30, "timeIntervalSinceReferenceDate");
        sqlite3_bind_double(v34, 1, v35);
        if (CDBLockingAssertionsEnabled)
        {
          if (*v33)
          {
            v36 = **v33;
            if (v36)
            {
              if (*(_QWORD *)(v36 + 104))
              {
                v37 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v37)
                  os_unfair_lock_assert_owner(v37 + 20);
              }
            }
          }
        }
        CPSqliteStatementSendResults();
        if (CDBLockingAssertionsEnabled)
        {
          if (*v33)
          {
            v38 = **v33;
            if (v38)
            {
              if (*(_QWORD *)(v38 + 104))
              {
                v39 = (const os_unfair_lock *)CPRecordStoreGetContext();
                if (v39)
                  os_unfair_lock_assert_owner(v39 + 20);
              }
            }
          }
        }
        CPSqliteStatementReset();
        Mutable = (CFMutableArrayRef)v49[0];
      }

    }
    else
    {
      Mutable = 0;
    }

    if (-[__CFArray count](Mutable, "count"))
    {
      CalEventOccurrenceCacheMergeCounts(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), Mutable);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (v40 != v41)
        {
          CFRelease(v41);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v40;
        }
      }

    }
  }
  return __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:1902");
}

@end
