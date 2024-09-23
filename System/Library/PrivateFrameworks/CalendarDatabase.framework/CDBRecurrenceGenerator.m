@implementation CDBRecurrenceGenerator

- (void)_setupForCalEvent:(void *)a3 locked:(BOOL)a4
{
  os_unfair_lock_s *RecordLock;
  void *v7;
  void *v8;
  void *started;
  uint64_t Calendar;
  CFTypeRef Store;
  _BOOL8 v12;

  if (a4)
  {
    RecordLock = 0;
  }
  else
  {
    RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
    os_unfair_lock_lock(RecordLock);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", COERCE_DOUBLE(_CalEventGetStartDate((uint64_t)a3)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", _CalRecurrenceGetEndDate((uint64_t)a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v8);

  started = (void *)_CalCalendarItemCopyStartTimeZone((uint64_t)a3);
  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", started);

  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", _CalEventIsAllDay((uint64_t)a3));
  Calendar = _CalEventGetCalendar((uint64_t)a3);
  v12 = Calendar
     && (Store = _CalCalendarGetStore(Calendar)) != 0
     && _CalStoreAreRecurrencesPinnedToMonthDays((uint64_t)Store);
  -[CalRecurrenceGenerator setShouldPinMonthDays:](self, "setShouldPinMonthDays:", v12);
  if (RecordLock)
  {
    if (CDBLockingAssertionsEnabled)
      os_unfair_lock_assert_owner(RecordLock);
    os_unfair_lock_unlock(RecordLock);
  }
}

- (id)_copyOccurrenceDatesWithBirthdayEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;

  v8 = a8;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v8)
    v15 = _CalCalendarItemCopyCalendarScale((uint64_t)a3);
  else
    v15 = CalCalendarItemCopyCalendarScale((uint64_t)a3);
  v32 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0C99D48], "CalCalendarWithUnsanitizedCalendarIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimeZone:", v17);
  v34 = v12;
  objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v12, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  objc_msgSend(v18, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v21, v22);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", COERCE_DOUBLE(_CalEventCopyStartDateWhileLocked((uint64_t)a3, v8)));
  CalDateTimeRelease();
  objc_msgSend(v23, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v24, "CalIsAfterOrSameAsDate:", v25);

  if ((_DWORD)v22)
  {
    v26 = objc_alloc(MEMORY[0x1E0D0C2B8]);
    objc_msgSend(v23, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithStartDate:endDate:", v24, v27);

    v23 = (void *)v28;
  }
  objc_msgSend(v16, "components:fromDate:", 24, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimeZone:", v14);
  objc_msgSend(v16, "CalOccurrencesForBirthday:inDateRange:", v29, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[CDBRecurrenceGenerator copyOccurrenceDatesWithCalEvent:startDate:endDate:timeZone:limit:includeExtraOccurrencesPastEndDate:locked:](self, "copyOccurrenceDatesWithCalEvent:startDate:endDate:timeZone:limit:includeExtraOccurrencesPastEndDate:locked:", a3, a4, a5, a6, a7, 0, v9);
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 includeExtraOccurrencesPastEndDate:(BOOL)a7 locked:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[CDBRecurrenceGenerator copyOccurrenceDatesWithCalEvent:startDate:endDate:timeZone:limit:includeExtraOccurrencesPastEndDate:locked:](self, "copyOccurrenceDatesWithCalEvent:startDate:endDate:timeZone:limit:includeExtraOccurrencesPastEndDate:locked:", a3, a4, a5, a6, 0, a7, v9);
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 includeExtraOccurrencesPastEndDate:(BOOL)a8 locked:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  const void *v17;
  id v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFIndex Count;
  void *v22;
  void *v23;
  id v24;
  id v25;
  CFIndex i;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  _BOOL4 v35;
  id v36;

  v35 = a8;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  -[CDBRecurrenceGenerator _setupForCalEvent:locked:](self, "_setupForCalEvent:locked:", a3, a9);
  if (a9)
  {
    v17 = (const void *)_CalEventCopyContactIdentifier((uint64_t)a3);
    if (v17)
    {
LABEL_3:
      CFRelease(v17);
      v18 = -[CDBRecurrenceGenerator _copyOccurrenceDatesWithBirthdayEvent:startDate:endDate:timeZone:limit:locked:](self, "_copyOccurrenceDatesWithBirthdayEvent:startDate:endDate:timeZone:limit:locked:", a3, v14, v15, v16, a7, a9);
      goto LABEL_23;
    }
  }
  else
  {
    v17 = (const void *)CalEventCopyContactIdentifier((uint64_t)a3);
    if (v17)
      goto LABEL_3;
  }
  v19 = _CalCalendarItemCopyRecurrencesWhileLocked((uint64_t)a3, a9);
  if (!v19)
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_23;
  }
  v20 = v19;
  Count = CFArrayGetCount(v19);
  v36 = v15;
  if (Count >= 2)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 0);
    v23 = 0;
    goto LABEL_10;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v22 = 0;
  if (Count == 1)
  {
LABEL_10:
    v34 = v22;
    v24 = v16;
    v25 = v14;
    for (i = 0; i != Count; ++i)
    {
      v27 = -[CDBRecurrenceGenerator _prepareForCalRecurrence:locked:](self, "_prepareForCalRecurrence:locked:", CFArrayGetValueAtIndex(v20, i), a9);
      v28 = (void *)MEMORY[0x1A85B514C](v27);
      if (a7)
        v29 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v25, v15, v24, a7);
      else
        v29 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:plusExtraOccurrencePastEnd:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:plusExtraOccurrencePastEnd:", v25, v15, v24, v35);
      v30 = v29;
      if (v23)
        v31 = v23;
      else
        v31 = v34;
      objc_msgSend(v31, "addObjectsFromArray:", v30, v34);

      objc_autoreleasePoolPop(v28);
      v15 = v36;
    }
    v14 = v25;
    v16 = v24;
    v22 = v34;
  }
  CFRelease(v20);
  if (v23)
  {
    v18 = v23;
  }
  else
  {
    objc_msgSend(v22, "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortedArrayUsingSelector:", sel_compare_);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v36;
  }

LABEL_23:
  return v18;
}

- (id)copyOccurrenceDatesWithInitialDate:(id)a3 calRecurrences:(id)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v27 = a5;
  v14 = a6;
  v15 = a7;
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v12);
  v16 = v12;
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v12);
  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", v15);
  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v13;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v22 = (void *)MEMORY[0x1A85B514C](-[CDBRecurrenceGenerator _prepareForCalRecurrence:locked:](self, "_prepareForCalRecurrence:locked:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21), 0));
        v23 = -[CalRecurrenceGenerator copyOccurrenceDatesWithInitialDate:allDay:rangeStart:rangeEnd:timeZone:limit:](self, "copyOccurrenceDatesWithInitialDate:allDay:rangeStart:rangeEnd:timeZone:limit:", v16, 0, v27, v14, v15, 0);
        objc_msgSend(v17, "addObjectsFromArray:", v23);

        objc_autoreleasePoolPop(v22);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  v24 = (void *)objc_msgSend(v17, "copy");
  return v24;
}

- (id)nextOccurrenceDateWithCalRecurrences:(id)a3 exceptionDates:(id)a4 initialDate:(id)a5 afterDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  CDBRecurrenceGenerator *v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v14);

  objc_msgSend(v12, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v15);

  objc_msgSend(v12, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", v16);

  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", 0);
  v17 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1577840000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v12;
  objc_msgSend(v12, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendarDateWithDate:timeZone:", v18, v19);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v10;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v54;
LABEL_3:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v45)
        objc_enumerationMutation(obj);
      v21 = (void *)MEMORY[0x1A85B514C](-[CDBRecurrenceGenerator _prepareForCalRecurrence:locked:](self, "_prepareForCalRecurrence:locked:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v20), 0));
      objc_msgSend(v13, "calendarDateByAddingSeconds:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalRecurrenceGenerator endDate](self, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0D0C420];
        -[CalRecurrenceGenerator endDate](self, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeZone");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "calendarDateWithDate:timeZone:", v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dateByAddingTimeInterval:", 1.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v43, "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v30 = objc_msgSend(v11, "count") + 1;
      objc_msgSend(v22, "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeZone");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v31, v29, v32, v30);

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v34 = v33;
      v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v35)
      {
        v47 = v22;
        v48 = v21;
        v36 = self;
        v37 = v13;
        v38 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v38)
              objc_enumerationMutation(v34);
            v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v11, "containsObject:", v40) & 1) == 0)
            {
              v35 = v40;
              goto LABEL_19;
            }
          }
          v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v35)
            continue;
          break;
        }
LABEL_19:
        v13 = v37;
        self = v36;
        v22 = v47;
        v21 = v48;
      }

      objc_autoreleasePoolPop(v21);
      if (v35)
        break;
      if (++v20 == v46)
      {
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v46)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    v35 = 0;
  }

  return v35;
}

- (void)_prepareForCalRecurrence:(void *)a3 locked:(BOOL)a4
{
  os_unfair_lock_s *RecordLock;
  uint64_t v7;
  const __CFArray *v8;
  void *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFArray *v16;
  void *v17;
  CFIndex v18;
  CFIndex v19;
  CFIndex j;
  int *ValueAtIndex;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  uint64_t k;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFArray *v31;
  void *v32;
  CFIndex v33;
  CFIndex v34;
  CFIndex m;
  void *v36;
  void *v37;
  uint64_t v38;
  const __CFArray *v39;
  void *v40;
  CFIndex v41;
  CFIndex v42;
  CFIndex n;
  void *v44;
  void *v45;
  uint64_t v46;
  const __CFArray *v47;
  void *v48;
  CFIndex v49;
  CFIndex v50;
  CFIndex ii;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;

  if (a4)
  {
    RecordLock = 0;
  }
  else
  {
    RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
    os_unfair_lock_lock(RecordLock);
  }
  -[CalRecurrenceGenerator setWeekStart:](self, "setWeekStart:", _CalRecurrenceGetWeekStart((uint64_t)a3) + 1);
  -[CalRecurrenceGenerator setFrequency:](self, "setFrequency:", _CalRecurrenceGetFrequency((uint64_t)a3));
  -[CalRecurrenceGenerator setInterval:](self, "setInterval:", _CalRecurrenceGetInterval((uint64_t)a3));
  v7 = _CalRecurrenceCopyBySetPos((uint64_t)a3);
  if (v7)
  {
    v8 = (const __CFArray *)v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      v11 = Count;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFArrayGetValueAtIndex(v8, i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
    }
    v14 = (void *)objc_msgSend(v9, "copy");
    -[CalRecurrenceGenerator setSetPositions:](self, "setSetPositions:", v14);

    CFRelease(v8);
  }
  v15 = _CalRecurrenceCopyByDayDays((uint64_t)a3);
  if (v15)
  {
    v16 = (const __CFArray *)v15;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v18 = CFArrayGetCount(v16);
    if (v18 >= 1)
    {
      v19 = v18;
      for (j = 0; j != v19; ++j)
      {
        ValueAtIndex = (int *)CFArrayGetValueAtIndex(v16, j);
        objc_msgSend(MEMORY[0x1E0D0C378], "dayOfWeek:weekNumber:", (ValueAtIndex[1] + 1), *ValueAtIndex);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);

      }
    }
    v23 = (void *)objc_msgSend(v17, "copy");
    -[CalRecurrenceGenerator setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v23);

    CFRelease(v16);
  }
  v24 = _CalRecurrenceGetByMonthMonths((uint64_t)a3);
  if (v24)
  {
    v25 = v24;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    for (k = 0; k != 12; ++k)
    {
      if (((1 << k) & v25) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (unint64_t)(log2((double)(1 << k)) + 1.0));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v28);

      }
    }
    v29 = (void *)objc_msgSend(v26, "copy");
    -[CalRecurrenceGenerator setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v29);

  }
  v30 = _CalRecurrenceCopyByMonthDayDays((uint64_t)a3);
  if (v30)
  {
    v31 = (const __CFArray *)v30;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v33 = CFArrayGetCount(v31);
    if (v33 >= 1)
    {
      v34 = v33;
      for (m = 0; m != v34; ++m)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFArrayGetValueAtIndex(v31, m));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v36);

      }
    }
    v37 = (void *)objc_msgSend(v32, "copy");
    -[CalRecurrenceGenerator setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v37);

    CFRelease(v31);
  }
  v38 = _CalRecurrenceCopyByWeekWeeks((uint64_t)a3);
  if (v38)
  {
    v39 = (const __CFArray *)v38;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v41 = CFArrayGetCount(v39);
    if (v41 >= 1)
    {
      v42 = v41;
      for (n = 0; n != v42; ++n)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFArrayGetValueAtIndex(v39, n));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v44);

      }
    }
    v45 = (void *)objc_msgSend(v40, "copy");
    -[CalRecurrenceGenerator setWeeksOfTheYear:](self, "setWeeksOfTheYear:", v45);

    CFRelease(v39);
  }
  v46 = _CalRecurrenceCopyByYearDayDays((uint64_t)a3);
  if (v46)
  {
    v47 = (const __CFArray *)v46;
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v49 = CFArrayGetCount(v47);
    if (v49 >= 1)
    {
      v50 = v49;
      for (ii = 0; ii != v50; ++ii)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFArrayGetValueAtIndex(v47, ii));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v52);

      }
    }
    v53 = (void *)objc_msgSend(v48, "copy");
    -[CalRecurrenceGenerator setDaysOfTheYear:](self, "setDaysOfTheYear:", v53);

    CFRelease(v47);
  }
  if (vabdd_f64(COERCE_DOUBLE(_CalRecurrenceCopyCachedEndDate((uint64_t)a3)), *MEMORY[0x1E0D0C490]) >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v60);

    CalDateTimeRelease();
    if (!RecordLock)
      return;
    goto LABEL_44;
  }
  if (vabdd_f64(_CalRecurrenceGetEndDate((uint64_t)a3), *MEMORY[0x1E0D0C490]) >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v61);

LABEL_43:
    if (!RecordLock)
      return;
    goto LABEL_44;
  }
  if (!_CalRecurrenceGetCount((uint64_t)a3))
    goto LABEL_43;
  -[CalRecurrenceGenerator computeRecurrenceEndDate:](self, "computeRecurrenceEndDate:", _CalRecurrenceGetCount((uint64_t)a3));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v54);

  -[CalRecurrenceGenerator endDate](self, "endDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "timeIntervalSinceReferenceDate");
  v62 = v56;

  -[CalRecurrenceGenerator eventTimeZone](self, "eventTimeZone");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    -[CalRecurrenceGenerator eventTimeZone](self, "eventTimeZone", v62);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (const __CFString *)CalCFTimeZoneCopyCalTimeZone();

  }
  else
  {
    v59 = CFSTR("_float");
  }

  CalDateTimeSetTimeZone();
  _CalRecurrenceSetCachedEndDate((uint64_t)a3, v62);
  CalDateTimeRelease();
  CFRelease(v59);
  if (RecordLock)
  {
LABEL_44:
    if (CDBLockingAssertionsEnabled)
      os_unfair_lock_assert_owner(RecordLock);
    os_unfair_lock_unlock(RecordLock);
  }
}

- (id)computeRecurrenceEndDateForCalEvent:(void *)a3 recurrenceRule:(void *)a4 locked:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[CDBRecurrenceGenerator _setupForCalEvent:locked:](self, "_setupForCalEvent:locked:", a3, a5);
  -[CDBRecurrenceGenerator _prepareForCalRecurrence:locked:](self, "_prepareForCalRecurrence:locked:", a4, v5);
  return -[CalRecurrenceGenerator endDate](self, "endDate");
}

@end
