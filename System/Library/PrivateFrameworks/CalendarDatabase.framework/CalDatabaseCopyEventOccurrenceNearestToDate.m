@implementation CalDatabaseCopyEventOccurrenceNearestToDate

void __CalDatabaseCopyEventOccurrenceNearestToDate_block_invoke(uint64_t a1)
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
  uint64_t EventOccurrenceFromStatement;
  NSObject *v14;
  uint64_t v15;
  const os_unfair_lock *v16;
  void *v17;
  const os_unfair_lock *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const os_unfair_lock *v24;
  double Date;
  double v26;
  uint64_t v27;
  const void *v28;
  _OWORD v29[4];

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
    v29[2] = xmmword_1E4F8EE40;
    v29[3] = *(_OWORD *)&off_1E4F8EE50;
    if (__CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2875"))
    {
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
          EventOccurrenceFromStatement = _createEventOccurrenceFromStatement(v3, v11, *(const void **)(v12 + 32));
        }
        else
        {
          EventOccurrenceFromStatement = 0;
        }
        if (CDBLockingAssertionsEnabled)
        {
          if (*(_QWORD *)v11)
          {
            v15 = **(_QWORD **)v11;
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
        if (!v8)
        {
LABEL_29:
          v29[0] = xmmword_1E4F8EE60;
          v29[1] = *(_OWORD *)&off_1E4F8EE70;
          v17 = _CalFilterCopyQuery(*(void **)(a1 + 48));
          if (CDBLockingAssertionsEnabled)
          {
            if (*(_QWORD *)(v7 + 104))
            {
              v18 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v18)
                os_unfair_lock_assert_owner(v18 + 20);
            }
          }
          v19 = CPSqliteDatabaseStatementForReading();
          if (v19)
          {
            v20 = v19;
            sqlite3_bind_double(*(sqlite3_stmt **)(v19 + 8), 1, *(double *)(a1 + 56));
            sqlite3_bind_int(*(sqlite3_stmt **)(v20 + 8), 2, *(_DWORD *)(a1 + 64));
            if (sqlite3_step(*(sqlite3_stmt **)(v20 + 8)) == 100)
            {
              v21 = *(_QWORD *)(a1 + 40);
              _CalEventOccurrenceCacheLoadInfo(v21);
              v22 = _createEventOccurrenceFromStatement(v3, v20, *(const void **)(v21 + 32));
            }
            else
            {
              v22 = 0;
            }
            if (CDBLockingAssertionsEnabled)
            {
              if (*(_QWORD *)v20)
              {
                v23 = **(_QWORD **)v20;
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
            CPSqliteStatementReset();
            if (!v17)
              goto LABEL_47;
          }
          else
          {
            v22 = 0;
            if (!v17)
            {
LABEL_47:
              if (EventOccurrenceFromStatement && v22)
              {
                Date = CalEventOccurrenceGetDate(EventOccurrenceFromStatement);
                v26 = CalEventOccurrenceGetDate(v22);
                v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
                if (Date - *(double *)(a1 + 56) <= *(double *)(a1 + 56) - v26)
                {
                  *(_QWORD *)(v27 + 24) = EventOccurrenceFromStatement;
                  v28 = (const void *)v22;
                }
                else
                {
                  *(_QWORD *)(v27 + 24) = v22;
                  v28 = (const void *)EventOccurrenceFromStatement;
                }
                CFRelease(v28);
              }
              else if (EventOccurrenceFromStatement)
              {
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = EventOccurrenceFromStatement;
              }
              else if (v22)
              {
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v22;
              }
              __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2947");
              return;
            }
          }
          CFRelease(v17);
          goto LABEL_47;
        }
      }
      else
      {
        EventOccurrenceFromStatement = 0;
        if (!v8)
          goto LABEL_29;
      }
      CFRelease(v8);
      goto LABEL_29;
    }
    v14 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_1A5CCB000, v14, OS_LOG_TYPE_ERROR, "Couldn't begin transaction", (uint8_t *)v29, 2u);
    }
  }
}

@end
