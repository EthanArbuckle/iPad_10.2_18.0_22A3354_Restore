@implementation EKRecurrenceGenerator

- (void)_prepareForEKRecurrence:(id)a3 forCalendarItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[CalRecurrenceGenerator setInterval:](self, "setInterval:", objc_msgSend(v22, "interval"));
  -[CalRecurrenceGenerator setFrequency:](self, "setFrequency:", objc_msgSend((id)objc_opt_class(), "_convertEKRecurrenceFrequencyToCalRecurrenceFrequency:", objc_msgSend(v22, "frequency")));
  -[CalRecurrenceGenerator setWeekStart:](self, "setWeekStart:", (int)objc_msgSend(v22, "firstDayOfTheWeek"));
  if (!-[CalRecurrenceGenerator weekStart](self, "weekStart"))
    -[CalRecurrenceGenerator setWeekStart:](self, "setWeekStart:", 2);
  objc_msgSend(v6, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setShouldPinMonthDays:](self, "setShouldPinMonthDays:", objc_msgSend(v7, "recurrencesShouldPinToMonthDays"));

  objc_msgSend(v22, "daysOfTheWeek");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v8);

  objc_msgSend(v22, "daysOfTheMonth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v9);

  objc_msgSend(v22, "daysOfTheYear");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setDaysOfTheYear:](self, "setDaysOfTheYear:", v10);

  objc_msgSend(v22, "weeksOfTheYear");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setWeeksOfTheYear:](self, "setWeeksOfTheYear:", v11);

  objc_msgSend(v22, "monthsOfTheYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v12);

  objc_msgSend(v22, "setPositions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setSetPositions:](self, "setSetPositions:", v13);

  -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", 0);
  objc_msgSend(v22, "recurrenceEnd");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "occurrenceCount");

  objc_msgSend(v22, "recurrenceEnd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    -[CalRecurrenceGenerator computeRecurrenceEndDate:](self, "computeRecurrenceEndDate:", objc_msgSend(v16, "occurrenceCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v18);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v16, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v19);

  if (-[CalRecurrenceGenerator allDay](self, "allDay"))
  {
    -[CalRecurrenceGenerator endDate](self, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateInTimeZone:fromTimeZone:", 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEndDate:](self, "setEndDate:", v21);

    goto LABEL_7;
  }
LABEL_8:

}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7 inclusive:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  EKRecurrenceGenerator *v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  id v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v52 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v15, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v17);

  objc_msgSend(v15, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v18);

  objc_msgSend(v15, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", v19);

  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", 0);
  v20 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1577840000.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  objc_msgSend(v15, "timeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "calendarDateWithDate:timeZone:", v21, v22);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v13;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v60;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v49)
        objc_enumerationMutation(obj);
      v24 = (void *)MEMORY[0x1A85847F4](-[EKRecurrenceGenerator _prepareForEKRecurrence:forCalendarItem:](self, "_prepareForEKRecurrence:forCalendarItem:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v23), v52));
      if (a8)
      {
        v25 = objc_msgSend(v16, "copy");
      }
      else
      {
        objc_msgSend(v16, "calendarDateByAddingSeconds:", 1);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (void *)v25;
      -[CalRecurrenceGenerator endDate](self, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x1E0D0C420];
        -[CalRecurrenceGenerator endDate](self, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeZone");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "calendarDateWithDate:timeZone:", v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dateByAddingTimeInterval:", 1.0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v47, "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = objc_msgSend(v14, "count") + 1;
      objc_msgSend(v26, "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeZone");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v35, v33, v36, v34);

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v38 = v37;
      v39 = (id)objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v39)
      {
        v53 = v26;
        v54 = v24;
        v40 = self;
        v41 = v16;
        v42 = *(_QWORD *)v56;
        while (2)
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(_QWORD *)v56 != v42)
              objc_enumerationMutation(v38);
            v44 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v14, "containsObject:", v44) & 1) == 0)
            {
              v39 = v44;
              goto LABEL_22;
            }
          }
          v39 = (id)objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v39)
            continue;
          break;
        }
LABEL_22:
        v16 = v41;
        self = v40;
        v26 = v53;
        v24 = v54;
      }

      objc_autoreleasePoolPop(v24);
      if (v39)
        break;
      if (++v23 == v50)
      {
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v50)
          goto LABEL_3;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v39 = 0;
  }

  return v39;
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7
{
  return -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:inclusive:](self, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:inclusive:", a3, a4, a5, a6, a7, 0);
}

+ (int)_convertEKRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 1;
  else
    return a3 + 1;
}

- (void)_setupForEKEvent:(id)a3 adjustDatesForAllDayEvents:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  objc_msgSend(v17, "initialStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v6);

  objc_msgSend(v17, "initialEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v7);

  objc_msgSend(v17, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", v8);

  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", objc_msgSend(v17, "isAllDay"));
  if (v4 && objc_msgSend(v17, "isFloating"))
  {
    -[CalRecurrenceGenerator eventStartDate](self, "eventStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateInTimeZone:fromTimeZone:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v12);

    -[CalRecurrenceGenerator eventEndDate](self, "eventEndDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "eventStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateInTimeZone:fromTimeZone:", 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v16);

  }
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[EKRecurrenceGenerator copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](self, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", a3, a4, a5, a6, 0, a7, v8);
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 exceptionDates:(id)a7 limit:(int64_t)a8 adjustDatesForAllDayEvents:(BOOL)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v34 = a4;
  v33 = a5;
  v35 = a6;
  v32 = a7;
  -[EKRecurrenceGenerator _setupForEKEvent:adjustDatesForAllDayEvents:](self, "_setupForEKEvent:adjustDatesForAllDayEvents:", v15, a9);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = v15;
  objc_msgSend(v15, "recurrenceRules");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)MEMORY[0x1A85847F4](-[EKRecurrenceGenerator _prepareForEKRecurrence:forCalendarItem:](self, "_prepareForEKRecurrence:forCalendarItem:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v17));
        v24 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v34, v33, v35, a8);
        objc_msgSend(v16, "addObjectsFromArray:", v24);

        objc_autoreleasePoolPop(v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v20);
  }

  -[EKRecurrenceGenerator adjustedExceptionDatesFromDates:fromGMTToTimeZone:](self, "adjustedExceptionDatesFromDates:fromGMTToTimeZone:", v32, v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v16, "removeObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v27);
  }
  v30 = (void *)objc_msgSend(v16, "copy");

  return v30;
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 limit:(int64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return -[EKRecurrenceGenerator _copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](self, "_copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", a3, a4, a5, a6, a7, 0, a8, v9);
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10
{
  return -[EKRecurrenceGenerator _copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](self, "_copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", a3, a4, a5, a6, a7, a8);
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return -[EKRecurrenceGenerator _copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](self, "_copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (id)_copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *context;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  -[EKRecurrenceGenerator _setupForEKEvent:adjustDatesForAllDayEvents:](self, "_setupForEKEvent:adjustDatesForAllDayEvents:", v16, a10);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v36 = v17;
  v23 = v17;
  v24 = v18;
  context = (void *)MEMORY[0x1A85847F4](-[EKRecurrenceGenerator _prepareForEKRecurrence:forCalendarItem:](self, "_prepareForEKRecurrence:forCalendarItem:", v23, v16));
  v35 = v19;
  v25 = v19;
  v26 = v21;
  v27 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v18, v25, v20, a9);
  objc_msgSend(v22, "addObjectsFromArray:", v27);
  -[EKRecurrenceGenerator adjustedExceptionDatesFromDates:fromGMTToTimeZone:](self, "adjustedExceptionDatesFromDates:fromGMTToTimeZone:", v21, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v38;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v22, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v32++));
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v30);
  }

  objc_autoreleasePoolPop(context);
  return v22;
}

- (id)adjustedExceptionDatesFromDates:(id)a3 fromGMTToTimeZone:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[CalRecurrenceGenerator requiresEndDateConversionFromGMTToEventTimeZone](self, "requiresEndDateConversionFromGMTToEventTimeZone");
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v6;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0, v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          -[CalRecurrenceGenerator convertAbsoluteTime:fromTimeZone:toTimeZone:](self, "convertAbsoluteTime:fromTimeZone:toTimeZone:", v15, v7);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v6 = v18;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (BOOL)isOccurrenceDate:(id)a3 validForEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "recurrenceRules", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (-[EKRecurrenceGenerator occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:](self, "occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v7, 0))
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)occurrenceDate:(id)a3 matchesRecurrenceRule:(id)a4 forEvent:(id)a5 includeDetachedEventsInSeries:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v32;
  void *v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[EKRecurrenceGenerator _setupForEKEvent:adjustDatesForAllDayEvents:](self, "_setupForEKEvent:adjustDatesForAllDayEvents:", v12, 1);
  objc_msgSend(v10, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1A85847F4](-[EKRecurrenceGenerator _prepareForEKRecurrence:forCalendarItem:](self, "_prepareForEKRecurrence:forCalendarItem:", v11, v12));
  objc_msgSend(v10, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v13, v14, v16, 1);

  if (objc_msgSend(v17, "count"))
  {
    v33 = v15;
    v18 = a6;
    objc_msgSend(v17, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
    {
      objc_msgSend(v12, "exceptionDatesAdjustedForFloatingEvents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        objc_msgSend(v12, "exceptionDatesAdjustedForFloatingEvents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = objc_msgSend(v24, "containsObject:", v19);

      }
      v25 = 1;
      if ((v23 & 1) == 0 && !v18)
      {
        v26 = v23;
        objc_msgSend(v12, "detachedItems");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v28)
        {
          objc_msgSend(v12, "detachedItems");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "valueForKey:", CFSTR("startDate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "containsObject:", v19);

          v25 = v32 ^ 1;
        }
        else
        {
          v25 = 1;
        }
        LOBYTE(v23) = v26;
      }
      LOBYTE(v21) = v25 & ~(_BYTE)v23;
    }
    v15 = v33;

  }
  else
  {
    LOBYTE(v21) = 0;
  }

  objc_autoreleasePoolPop(v15);
  return v21;
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6
{
  return -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:initialDate:afterDate:inclusive:](self, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:initialDate:afterDate:inclusive:", a3, a4, a5, a6, 0);
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6 inclusive:(BOOL)a7
{
  return -[EKRecurrenceGenerator nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:inclusive:](self, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:inclusive:", a3, a4, 0, a5, a6, a7);
}

+ (id)datesByExpandingRule:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimezone:(id)a6 isAllDay:(BOOL)a7 lunarCalendarString:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char isKindOfClass;
  void *v43;
  void *v44;
  _BOOL4 v45;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  objc_msgSend(a5, "dateByAddingTimeInterval:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "_isLunarBirthdayRecurrenceRule:lunarCalendarString:", v14, v17))
  {
    objc_msgSend(MEMORY[0x1E0DDB850], "recurrenceRuleFromICSString:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v19 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v21 = (void *)objc_opt_new();
    objc_msgSend(v20, "freq");
    objc_msgSend(v21, "setFrequency:", CalRecurrenceFrequencyFromICSFrequency());
    objc_msgSend(v20, "interval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v9;
    v23 = objc_msgSend(v22, "intValue");

    if (v23 <= 1)
      v24 = 1;
    else
      v24 = v23;
    v25 = v45;
    objc_msgSend(v21, "setInterval:", v24);
    objc_msgSend(v21, "setWeekStart:", objc_msgSend(a1, "_weekStartFromICSRule:", v20));
    objc_msgSend(a1, "_daysOfWeekFromICSRule:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDaysOfTheWeek:", v26);

    objc_msgSend(v20, "bysetpos");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSetPositions:", v27);

    objc_msgSend(v20, "bymonth");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMonthsOfTheYear:", v28);

    objc_msgSend(v20, "bymonthday");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDaysOfTheMonth:", v29);

    objc_msgSend(v20, "byweekno");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWeeksOfTheYear:", v30);

    objc_msgSend(v21, "setEventStartDate:", v15);
    if (v45)
    {
      objc_msgSend(v15, "ek_ios_dateForEndOfDayInTimeZone:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setEventEndDate:", v31);

    }
    else
    {
      objc_msgSend(v21, "setEventEndDate:", v15);
    }
    objc_msgSend(v20, "count");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v20, "count");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "computeRecurrenceEndDate:", objc_msgSend(v33, "unsignedIntegerValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setEndDate:", v34);
    }
    else
    {
      objc_msgSend(v20, "until");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
LABEL_18:
        objc_msgSend(v21, "setEventTimeZone:", v16);
        objc_msgSend(v21, "setAllDay:", v25);
        v19 = (void *)objc_msgSend(v21, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v15, v18, v16, 0);

        goto LABEL_19;
      }
      v36 = objc_alloc(MEMORY[0x1E0DDB800]);
      objc_msgSend(v20, "until");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v36, "initWithValue:", v37);

      objc_msgSend(v33, "components");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTimeZone:", v16);
      v44 = v38;
      objc_msgSend(v38, "dateFromComponents:", v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "until");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v40 = v43;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v43, "dateForEndOfDayInTimeZone:", v16);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v21, "setEndDate:", v40);

    }
    v25 = v45;
    goto LABEL_18;
  }
  v19 = (void *)objc_msgSend(a1, "_copyDatesForLunarBirthdayFromDate:toDate:inTimeZone:lunarCalendarString:", v15, v18, v16, v17);
LABEL_20:

  return v19;
}

+ (unint64_t)_weekStartFromICSRule:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "wkst");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "wkst");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

    if (v6 - 1 >= 7)
      v7 = 2;
    else
      v7 = v6;
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

+ (id)_daysOfWeekFromICSRule:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "byday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "byday");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "byday", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
          v14 = objc_alloc(MEMORY[0x1E0D0C378]);
          v15 = objc_msgSend(v13, "weekday");
          objc_msgSend(v13, "number");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v14, "initWithDayOfTheWeek:weekNumber:", v15, objc_msgSend(v16, "integerValue"));

          objc_msgSend(v7, "addObject:", v17);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v18 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_copyDatesForLunarBirthdayFromDate:(id)a3 toDate:(id)a4 inTimeZone:(id)a5 lunarCalendarString:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = (void *)MEMORY[0x1E0C99D48];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "CalCalendarWithUnsanitizedCalendarIdentifier:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v14);
  objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  objc_msgSend(v15, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

  objc_msgSend(v13, "components:fromDate:", 24, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTimeZone:", v10);
  objc_msgSend(v13, "CalOccurrencesForBirthday:inDateRange:", v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)_isLunarBirthdayRecurrenceRule:(id)a3 lunarCalendarString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FREQ=YEARLY")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("FREQ=YEARLY;INTERVAL=1")) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKRecurrenceGenerator(Deprecated) _isLunarBirthdayRecurrenceRule:lunarCalendarString:].cold.1((uint64_t)v5, (uint64_t)v7, v10);
  }
  v8 = 0;
LABEL_7:

  return v8;
}

@end
