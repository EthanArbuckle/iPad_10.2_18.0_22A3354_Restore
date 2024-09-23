@implementation CalEventOccurrenceCacheProcessEventOccurrencesInDateRange

void ___CalEventOccurrenceCacheProcessEventOccurrencesInDateRange_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t RecordStore;
  BOOL v7;
  const os_unfair_lock *Context;
  uint64_t Database;
  uint64_t v10;
  void *v11;
  const os_unfair_lock *v12;
  uint64_t v13;
  uint64_t **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  sqlite3_stmt *v26;
  double v27;
  sqlite3_stmt *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const os_unfair_lock *v36;
  uint64_t v37;
  const os_unfair_lock *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const __CFArray *v42;
  const void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  void *v55;
  uint8_t v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[8];
  const __CFString *v61;
  const __CFString *v62;
  uint64_t v63;
  CFRange v64;

  if (__CalDatabaseBeginReadTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2663"))
  {
    if (*(_BYTE *)(a1 + 128))
    {
      _CalEventOccurrenceCacheCreateOccurrenceCacheRange(*(_QWORD **)(a1 + 104));
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    _CalEventOccurrenceCacheGetCacheCalendar(*(_QWORD *)(a1 + 104));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 129))
      goto LABEL_5;
    v44 = *(_QWORD *)(a1 + 104);
    _CalEventOccurrenceCacheLoadInfo(v44);
    v45 = objc_retainAutorelease(*(id *)(v44 + 40));
    v46 = objc_retainAutorelease(*(id *)(v44 + 48));
    v47 = v45;
    v48 = v46;
    objc_msgSend(v5, "timeZone");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "isAfterDate:", *(_QWORD *)(a1 + 32)) & 1) == 0
      && (objc_msgSend(v48, "isBeforeDate:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToTimeZone:", v49) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "dateInTimeZone:fromTimeZone:", v49, *(_QWORD *)(a1 + 48));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "dateInTimeZone:fromTimeZone:", v49, *(_QWORD *)(a1 + 48));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "isAfterDate:", v50))
        {

          goto LABEL_53;
        }
        v54 = objc_msgSend(v48, "isBeforeDate:", v51);

        if (v54)
          goto LABEL_53;
      }

LABEL_5:
      RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 24));
      if (CDBLockingAssertionsEnabled)
        v7 = RecordStore == 0;
      else
        v7 = 1;
      if (!v7)
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context)
          os_unfair_lock_assert_owner(Context + 20);
      }
      Database = CPRecordStoreGetDatabase();
      if (Database)
      {
        v10 = Database;
        *(_QWORD *)buf = CFSTR("SELECT event_id, IFNULL(occurrence_start_date, occurrence_date) AS fetched_occurrence_start_date, occurrence_end_date FROM OccurrenceCache");
        v61 = CFSTR("day >= ? AND day < ?");
        v62 = CFSTR("GROUP BY event_id, fetched_occurrence_start_date");
        v63 = 0;
        LODWORD(v63) = *(_DWORD *)(a1 + 120);
        v11 = _CalFilterCopyQuery(*(void **)(a1 + 112));
        if (CDBLockingAssertionsEnabled)
        {
          if (*(_QWORD *)(v10 + 104))
          {
            v12 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v12)
              os_unfair_lock_assert_owner(v12 + 20);
          }
        }
        v13 = CPSqliteDatabaseStatementForReading();
        if (v13)
        {
          v14 = (uint64_t **)v13;
          objc_msgSend(v5, "startOfDayForDate:", *(_QWORD *)(a1 + 32));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 32);
          objc_msgSend(v5, "timeZone");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dateInTimeZone:fromTimeZone:", v17, *(_QWORD *)(a1 + 48));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v18;
          if (objc_msgSend(v18, "CalIsBeforeDate:", v15))
          {
            objc_msgSend(v15, "dateByAddingDays:inCalendar:", -1, v5);
            v19 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v19;
          }
          objc_msgSend(v5, "components:fromDate:", 30, *(_QWORD *)(a1 + 40));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setHour:", 23);
          objc_msgSend(v20, "setMinute:", 59);
          objc_msgSend(v20, "setSecond:", 59);
          objc_msgSend(v5, "dateFromComponents:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 40);
          objc_msgSend(v5, "timeZone");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateInTimeZone:fromTimeZone:", v23, *(_QWORD *)(a1 + 48));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "CalIsAfterDate:", v21))
          {
            objc_msgSend(v21, "dateByAddingDays:inCalendar:", 1, v5);
            v25 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v25;
          }
          v26 = (sqlite3_stmt *)v14[1];
          objc_msgSend(v15, "timeIntervalSinceReferenceDate");
          sqlite3_bind_double(v26, 1, v27);
          v28 = (sqlite3_stmt *)v14[1];
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          sqlite3_bind_double(v28, 2, v29);
          if (!*(_DWORD *)(a1 + 124))
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CFSetCreateMutable(0, 0, 0);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = CFArrayCreateMutable(0, 0, 0);
          objc_msgSend(*(id *)(a1 + 32), "earlierDate:", v55);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "laterDate:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
          *(_QWORD *)v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          v57 = v32;
          objc_msgSend(v30, "timeIntervalSinceReferenceDate");
          v58 = v33;
          objc_msgSend(v31, "timeIntervalSinceReferenceDate");
          v59 = v34;
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              v35 = **v14;
              if (v35)
              {
                if (*(_QWORD *)(v35 + 104))
                {
                  v36 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v36)
                    os_unfair_lock_assert_owner(v36 + 20);
                }
              }
            }
          }
          CPSqliteStatementSendResults();
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              v37 = **v14;
              if (v37)
              {
                if (*(_QWORD *)(v37 + 104))
                {
                  v38 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v38)
                    os_unfair_lock_assert_owner(v38 + 20);
                }
              }
            }
          }
          CPSqliteStatementReset();
          objc_msgSend(v5, "timeZone");
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = v39;

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = _CalEventOccurrenceCacheCopyBatchOfEvents(*(_QWORD *)(a1 + 104), *(const __CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24), *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 24), 0, *(_DWORD *)(a1 + 124), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88)+ 8)+ 40), *(void **)(a1 + 48));
          if (!*(_DWORD *)(a1 + 124))
          {
            v42 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
            v64.length = CFArrayGetCount(v42);
            v64.location = 0;
            CFArraySortValues(v42, v64, (CFComparatorFunction)_CompareCalEventOccurrences, *(void **)(*(_QWORD *)(a1 + 104) + 24));
          }
          v43 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          if (v43)
            CFRelease(v43);

        }
        else
        {
          v53 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_1A5CCB000, v53, OS_LOG_TYPE_ERROR, "Failed to get SQL statement when fetching event occurrences", v56, 2u);
          }
        }
        if (v11)
          CFRelease(v11);
      }
      else
      {
        v52 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5CCB000, v52, OS_LOG_TYPE_ERROR, "Failed to get db handle when fetching event occurrences", buf, 2u);
        }
      }
      __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2774");
      goto LABEL_54;
    }
LABEL_53:
    __CalDatabaseRollbackTransaction(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2691");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_54:
  }
}

__CFArray *___CalEventOccurrenceCacheProcessEventOccurrencesInDateRange_block_invoke_314(uint64_t a1)
{
  __CFArray *result;

  result = _CalEventOccurrenceCacheCopyBatchOfEvents(*(_QWORD *)(a1 + 80), 0, *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 88), *(_DWORD *)(a1 + 96), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

@end
