@implementation CalRecurrenceGenerator

- (CalRecurrenceGenerator)init
{
  CalRecurrenceGenerator *v2;
  void *v3;
  uint64_t v4;
  NSCalendar *calendar;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalRecurrenceGenerator;
  v2 = -[CalRecurrenceGenerator init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v4;

  }
  return v2;
}

- (id)copyOccurrenceDatesWithInitialDate:(id)a3 allDay:(BOOL)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7 limit:(int64_t)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v11 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  -[CalRecurrenceGenerator setEventStartDate:](self, "setEventStartDate:", v17);
  -[CalRecurrenceGenerator setEventEndDate:](self, "setEventEndDate:", v17);

  -[CalRecurrenceGenerator setEventTimeZone:](self, "setEventTimeZone:", v14);
  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", v11);
  v18 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", v16, v15, v14, a8);

  return v18;
}

- (id)computeRecurrenceEndDate:(unint64_t)a3
{
  NSDate *eventStartDate;
  void *v6;
  id v7;
  void *v8;

  eventStartDate = self->_eventStartDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1577840000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:", eventStartDate, v6, self->_eventTimeZone, a3);

  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isSimpleYearlyRecurrence
{
  return self->_frequency == 4
      && self->_interval == 1
      && !self->_endDate
      && !self->_daysOfTheWeek
      && !self->_daysOfTheMonth
      && !self->_daysOfTheYear
      && !self->_weeksOfTheYear
      && !self->_monthsOfTheYear
      && self->_setPositions == 0;
}

- (double)duration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CalRecurrenceGenerator eventEndDate](self, "eventEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[CalRecurrenceGenerator eventStartDate](self, "eventStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v5 - v7;

  return v8;
}

- (double)convertAbsoluteTime:(double)a3 fromTimeZone:(id)a4 toTimeZone:(id)a5
{
  const __CFTimeZone *v7;
  double AbsoluteTimeWithFallbackToDefaultTimeZone;
  CFGregorianDate v10;

  v7 = (const __CFTimeZone *)a5;
  *(_QWORD *)&v10.year = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone((const __CFTimeZone *)a4, a3);
  AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v10, v7);

  return AbsoluteTimeWithFallbackToDefaultTimeZone;
}

- (BOOL)requiresEndDateConversionFromGMTToEventTimeZone
{
  return self->_eventTimeZone == 0;
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6
{
  return -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:plusExtraOccurrencePastEnd:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:plusExtraOccurrencePastEnd:", a3, a4, a5, a6, 0);
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 plusExtraOccurrencePastEnd:(BOOL)a6
{
  return -[CalRecurrenceGenerator copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:plusExtraOccurrencePastEnd:](self, "copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:plusExtraOccurrencePastEnd:", a3, a4, a5, 0, a6);
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6 plusExtraOccurrencePastEnd:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSTimeZone *v17;
  NSTimeZone *v18;
  NSTimeZone *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CFTimeZoneRef v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  _BOOL8 v71;
  id v72;
  char v73;
  void *v74;
  uint64_t v75;
  id v77;
  _BOOL4 allDay;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  _QWORD v87[5];

  v7 = a7;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CalRecurrenceGenerator eventStartDate](self, "eventStartDate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        -[CalRecurrenceGenerator eventEndDate](self, "eventEndDate"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("CalRecurrenceGenerator must have start date and end date set before calling -copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:."));
  }
  v17 = (NSTimeZone *)v11;
  v18 = v17;
  v19 = v17;
  if (self->_eventTimeZone)
  {
    v19 = v17;
    if ((-[NSTimeZone isEqual:](v17, "isEqual:") & 1) == 0)
    {
      v19 = self->_eventTimeZone;

    }
  }
  if (v19)
  {
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v20);

  }
  +[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v13, v19);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  +[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v12, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", self->_eventStartDate, self->_eventTimeZone);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "calendarDateInTimeZone:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  v26 = v25;
  if (-[CalRecurrenceGenerator requiresEndDateConversionFromGMTToEventTimeZone](self, "requiresEndDateConversionFromGMTToEventTimeZone")&& v26 != 0.0)
  {
    v27 = CalTimeZoneCopyCFTimeZone(CFSTR("GMT"));
    -[CalRecurrenceGenerator convertAbsoluteTime:fromTimeZone:toTimeZone:](self, "convertAbsoluteTime:fromTimeZone:toTimeZone:", v27, v19, v26);
    v26 = v28;
    CFRelease(v27);
  }
  objc_msgSend(v24, "absoluteTime");
  v30 = v29;
  objc_msgSend(v22, "absoluteTime");
  if (v30 > v31
    || self->_endDate
    && (objc_msgSend(v21, "absoluteTime"),
        v33 = v32,
        -[CalRecurrenceGenerator duration](self, "duration"),
        v33 > v26 + v34))
  {
    v35 = 0;
  }
  else
  {
    objc_msgSend(v21, "absoluteTime");
    v37 = v36;
    objc_msgSend(v24, "absoluteTime");
    if (v37 <= v38)
      goto LABEL_20;
    objc_msgSend(v24, "absoluteTime");
    v40 = v39;
    -[CalRecurrenceGenerator duration](self, "duration");
    v42 = v40 + v41;
    objc_msgSend(v21, "absoluteTime");
    if (v42 <= v43 || (objc_msgSend(v24, "absoluteTime"), v45 = v44, objc_msgSend(v21, "absoluteTime"), v45 >= v46))
    {
      v85 = v7;
      objc_msgSend(v21, "dayTimeComponents");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allComponents");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setHour:", objc_msgSend(v49, "hour"));
      objc_msgSend(v48, "setMinute:", objc_msgSend(v49, "minute"));
      objc_msgSend(v48, "setSecond:", objc_msgSend(v49, "second"));
      objc_msgSend(v48, "setNanosecond:", objc_msgSend(v49, "nanosecond"));
      +[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v48, v19);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "absoluteTime");
      v51 = v50;
      objc_msgSend(v47, "absoluteTime");
      v53 = v51 - v52;
      if (v53 <= 0.0)
      {
        v84 = v49;
        v56 = (void *)objc_opt_new();
        -[CalRecurrenceGenerator duration](self, "duration");
        objc_msgSend(v56, "setSecond:", (uint64_t)v57);
        if (self->_allDay)
        {
          -[CalRecurrenceGenerator duration](self, "duration");
          objc_msgSend(v56, "setDay:", (int)fmax((v58 + 1.0) / *(double *)&CalTimeInterval_OneDayInSeconds, 0.0));
          objc_msgSend(v56, "setSecond:", -1);
        }
        v83 = v56;
        objc_msgSend(v47, "calendarDateByComponentwiseAddingComponents:", v56);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "dayTimeComponents");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setMonth:", objc_msgSend(v21, "month"));
        objc_msgSend(v59, "setDay:", objc_msgSend(v21, "day"));
        objc_msgSend(v59, "setYear:", (int)objc_msgSend(v21, "year"));
        v82 = v59;
        +[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v59, v19);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = v60;
        objc_msgSend(v60, "absoluteTime");
        v62 = v61;
        objc_msgSend(v21, "absoluteTime");
        v79 = v48;
        if (v62 >= v63)
        {
          v64 = (void *)objc_opt_new();
          allDay = self->_allDay;
          -[CalRecurrenceGenerator duration](self, "duration");
          if (allDay)
          {
            objc_msgSend(v64, "setDay:", (uint64_t)-fmax((v67 + 1.0) / *(double *)&CalTimeInterval_OneDayInSeconds, 0.0));
            v68 = 1;
          }
          else
          {
            v68 = (uint64_t)-v67;
          }
          objc_msgSend(v64, "setSecond:", v68);
          v65 = v81;
          objc_msgSend(v81, "calendarDateByComponentwiseAddingComponents:", v64);
          v77 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v77 = v47;
          v64 = v21;
          v65 = v81;
        }

        v21 = v77;
        v48 = v79;
        v66 = v83;
        v49 = v84;
      }
      else
      {
        -[CalRecurrenceGenerator duration](self, "duration");
        if (v53 >= v54)
        {
          objc_msgSend(v47, "calendarDateByAddingDays:", 1);
          v55 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = v47;
        }
        v66 = v21;
        v21 = v55;
      }

      v7 = v85;
    }
    else
    {
LABEL_20:
      v47 = v21;
      v21 = v24;
    }

    if (self->_endDate && (objc_msgSend(v22, "absoluteTime"), v69 > v26))
    {
      +[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v19, v26 + 1.0);
      v70 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v7) = 0;
      v71 = 0;
      v22 = (void *)v70;
    }
    else
    {
      v71 = v7;
    }
    switch(self->_frequency)
    {
      case 1:
        v72 = -[CalRecurrenceGenerator _copyDailyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:](self, "_copyDailyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:", v24, v21, v22, a6, v71);
        goto LABEL_46;
      case 2:
        v72 = -[CalRecurrenceGenerator _copyWeeklyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:](self, "_copyWeeklyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:", v24, v21, v22, a6, v71);
        goto LABEL_46;
      case 3:
        v72 = -[CalRecurrenceGenerator _copyMonthlyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:](self, "_copyMonthlyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:", v24, v21, v22, a6, v71);
        goto LABEL_46;
      case 4:
        v72 = -[CalRecurrenceGenerator _copyYearlyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:](self, "_copyYearlyOccurrencesWithInitialDate:startDate:endDate:count:countPastEndDate:", v24, v21, v22, a6, v71);
LABEL_46:
        v35 = v72;
        break;
      default:
        v35 = 0;
        break;
    }
    v73 = !v7;
    if (!self->_endDate)
      v73 = 1;
    if ((v73 & 1) == 0)
    {
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __112__CalRecurrenceGenerator_copyOccurrenceDatesBetweenStartDate_endDate_timeZone_limit_plusExtraOccurrencePastEnd___block_invoke;
      v87[3] = &__block_descriptor_40_e33_B24__0__NSDate_8__NSDictionary_16l;
      *(double *)&v87[4] = v26;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v87);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "filteredArrayUsingPredicate:", v74);
      v75 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v75;
    }
  }

  return v35;
}

BOOL __112__CalRecurrenceGenerator_copyOccurrenceDatesBetweenStartDate_endDate_timeZone_limit_plusExtraOccurrencePastEnd___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  return v3 <= *(double *)(a1 + 32);
}

- (id)_copyDailyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  unint64_t interval;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  BOOL (*v21)(void *, void *);
  unint64_t v22;
  void *v23;
  BOOL (**v24)(unint64_t, void *);
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  BOOL v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  _BOOL4 v44;
  BOOL v45;
  char v46;
  NSArray *v48;
  void *v49;
  NSArray *v50;
  NSArray *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v59[8];

  v59[6] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  interval = self->_interval;
  if ((_DWORD)interval)
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    objc_msgSend(v11, "calendarDateForDay");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendarDateForDay");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v15;
    v16 = objc_msgSend(v52, "differenceInDays:", v15) % interval;
    if (v16)
    {
      objc_msgSend(v12, "calendarDateByAddingDays:", interval - v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v17;
    }
    v18 = self->_daysOfTheWeek;
    v19 = self->_monthsOfTheYear;
    if (v19)
    {
      v20 = self->_daysOfTheMonth;
      v59[0] = _EKRecurrenceByMonthFilter;
      v59[1] = v19;
      v48 = v20;
      if (-[NSArray count](v20, "count"))
      {
        v21 = _EKRecurrenceByMonthDayFilterPinned;
        if (!self->_shouldPinMonthDays)
          v21 = _EKRecurrenceByMonthDayFilter;
        v59[2] = v21;
        v59[3] = v20;
        v22 = 2;
      }
      else
      {
        v22 = 1;
      }
    }
    else
    {
      v48 = 0;
      v22 = 0;
    }
    v50 = v19;
    v51 = v18;
    if (-[NSArray count](v18, "count", v48))
    {
      v24 = (BOOL (**)(unint64_t, void *))&v59[2 * v22];
      *v24 = _EKRecurrenceByDayMaskFilter;
      ++v22;
      v24[1] = (BOOL (*)(unint64_t, void *))_EKRecurrenceByDayMaskFromArrayByDayItems(v18);
    }
    objc_msgSend(v12, "allComponents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHour:", objc_msgSend(v11, "hour"));
    objc_msgSend(v25, "setMinute:", objc_msgSend(v11, "minute"));
    objc_msgSend(v25, "setSecond:", objc_msgSend(v11, "second"));
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v27, "setDay:", interval);
    objc_msgSend(v13, "absoluteTime");
    v29 = v28;
    v55 = v12;
    if (a6)
    {
      v30 = fabs(v28);
      if (v29 > 1577840000.0 || v30 < 2.22044605e-16)
        v29 = 1577840000.0;
    }
    v54 = v13;
    v56 = v11;
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    v32 = a7 != 0;
    if (v33 < v29 || a7)
    {
      v35 = a6;
      do
      {
        if (!v22
          || (objc_msgSend(v55, "timeZone"),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              +[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v25, v36), v37 = (void *)objc_claimAutoreleasedReturnValue(), v36, LODWORD(v36) = _EKRecurrenceApplyFiltersToSingleDate(v37, (uint64_t)v59, v22, v56, -[CalRecurrenceGenerator onlyIncludeInitialDateIfItMatchesRecurrence](self, "onlyIncludeInitialDateIfItMatchesRecurrence")), v37, (_DWORD)v36))
        {
          objc_msgSend(v57, "addObject:", v26);
          if (v35)
            --v35;
          else
            v35 = 0;
          if (v32)
          {
            objc_msgSend(v26, "timeIntervalSinceReferenceDate");
            if (v38 >= v29)
              --a7;
          }
          else
          {
            a7 = 0;
          }
        }
        -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v27, v26, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 254, v39);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v34, "hour");
        if (v40 == objc_msgSend(v25, "hour")
          && (v41 = objc_msgSend(v34, "minute"), v41 == objc_msgSend(v25, "minute"))
          && (v42 = objc_msgSend(v34, "second"), v42 == objc_msgSend(v25, "second")))
        {
          v26 = v39;
        }
        else
        {
          objc_msgSend(v34, "setHour:", objc_msgSend(v25, "hour"));
          objc_msgSend(v34, "setMinute:", objc_msgSend(v25, "minute"));
          objc_msgSend(v34, "setSecond:", objc_msgSend(v25, "second"));
          -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v34);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v26, "timeIntervalSinceReferenceDate");
        v32 = a7 != 0;
        if (a7)
          v44 = 1;
        else
          v44 = v43 < v29;
        if (a6)
          v45 = v35 == 0;
        else
          v45 = 0;
        v46 = !v45;
        if (!v44)
          break;
        v25 = v34;
      }
      while ((v46 & 1) != 0);
    }
    else
    {
      v34 = v25;
    }
    v23 = (void *)objc_msgSend(v57, "copy");

    v12 = v55;
    v11 = v56;
    v13 = v54;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_copyWeeklyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  id v11;
  id v12;
  unint64_t interval;
  unint64_t weekStart;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  NSCalendar *calendar;
  void *v21;
  uint64_t v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  BOOL (**v26)(uint64_t, void *);
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CFAbsoluteTime v34;
  void *v35;
  void *v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  BOOL v41;
  BOOL v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  BOOL v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  BOOL v65;
  int v66;
  BOOL v67;
  void *v68;
  NSArray *v70;
  NSArray *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  id v84;
  NSArray *v85;
  id v86;
  CFIndex v88;
  uint64_t v89;
  void *v90;
  id v91;
  unint64_t v92;
  uint64_t v93;
  _QWORD v94[6];

  v94[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v84 = a5;
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  interval = self->_interval;
  v93 = 0;
  weekStart = self->_weekStart;
  objc_msgSend(v11, "calendarDateForWeekWithWeekStart:", weekStart);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendarDateForWeekWithWeekStart:daysSinceWeekStart:", weekStart, &v93);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)v15;
  v16 = objc_msgSend(v74, "differenceInDays:", v15) / 7 % interval;
  v17 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v18 = v17;
  v19 = 7 * (interval - v16);
  if (!v16)
    v19 = 0;
  objc_msgSend(v17, "setDay:", v19 - v93);
  calendar = self->_calendar;
  v76 = v12;
  objc_msgSend(v12, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v18;
  -[NSCalendar dateByAddingComponents:toDate:options:](calendar, "dateByAddingComponents:toDate:options:", v18, v21, 0);
  v22 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v22;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 254, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHour:", objc_msgSend(v11, "hour"));
  objc_msgSend(v23, "setMinute:", objc_msgSend(v11, "minute"));
  v80 = v11;
  objc_msgSend(v23, "setSecond:", objc_msgSend(v11, "second"));
  v77 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v77, "setDay:", 7 * interval);
  v24 = self->_daysOfTheWeek;
  v85 = self->_setPositions;
  v25 = self->_monthsOfTheYear;
  v92 = a7;
  v88 = 0;
  v89 = 0;
  v70 = v25;
  if (v25)
  {
    v94[0] = _EKRecurrenceByMonthFilter;
    v94[1] = v25;
    v83 = 1;
  }
  else
  {
    v83 = 0;
  }
  v90 = 0;
  v91 = 0;
  if (!-[NSArray count](v85, "count"))
  {
    v90 = v76;
    v91 = v84;
    v26 = (BOOL (**)(uint64_t, void *))&v94[2 * v83++];
    *v26 = _EKRecurrenceRangeFilter;
    v26[1] = (BOOL (*)(uint64_t, void *))&v90;
  }
  if (-[NSArray count](v24, "count"))
    v78 = _EKRecurrenceByDayMaskFromArrayByDayItems(v24);
  else
    v78 = 1 << (objc_msgSend(v11, "dayOfWeek") - 1);
  if (weekStart != 1)
    v78 = ((v78 >> (weekStart - 1)) | (v78 << (8 - weekStart)));
  v27 = a6;
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    objc_msgSend(v80, "absoluteTime");
    v29 = v28;
    objc_msgSend(v76, "absoluteTime");
    v27 = a6;
    if (v29 >= v30)
    {
      if (!v84
        || (objc_msgSend(v80, "absoluteTime"), v32 = v31, objc_msgSend(v84, "absoluteTime"), v27 = a6, v32 < v33))
      {
        objc_msgSend(v80, "absoluteTime");
        _InsertAbsoluteTimeIntoArrayAtIndex(v82, v34);
        v27 = a6 ? a6 - 1 : 0;
        if (v85)
          v88 = 1;
      }
    }
  }
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v23);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v36 = v84;
  if (v84)
    objc_msgSend(v84, "absoluteTime");
  else
    v37 = 0.0;
  v38 = v37 == 0.0;
  if (v37 > 1577840000.0)
    v38 = 1;
  if (a6 != 0 && v38)
    v39 = 1577840000.0;
  else
    v39 = v37;
  objc_msgSend(v35, "timeIntervalSinceReferenceDate");
  if (v27)
    v41 = 0;
  else
    v41 = a6 != 0;
  if (v92)
    v42 = 1;
  else
    v42 = v40 < v39;
  v71 = v24;
  if (!v42 || v41)
  {
    v60 = v23;
    v44 = v35;
    goto LABEL_102;
  }
  v43 = v80;
  if (v85)
    v43 = 0;
  v81 = v43;
  v44 = v35;
  while (2)
  {
    v79 = v23;
    v45 = weekStart;
    v46 = v78;
    do
    {
      if ((v46 & 1) == 0)
        goto LABEL_59;
      v47 = weekStart;
      v48 = 7;
      if (v45 >= weekStart)
        v48 = 0;
      objc_msgSend(v86, "setDay:", v45 - weekStart + v48);
      v49 = v44;
      -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v86, v44, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_onlyIncludeInitialDateIfItMatchesRecurrence
        || (objc_msgSend(v80, "date"),
            v53 = (void *)objc_claimAutoreleasedReturnValue(),
            v54 = objc_msgSend(v50, "isEqualToDate:", v53),
            v53,
            !v54)
        || v85)
      {
        -[NSCalendar timeZone](self->_calendar, "timeZone");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83
          && !_EKRecurrenceApplyFiltersToSingleDate(v52, (uint64_t)v94, v83, v81, -[CalRecurrenceGenerator onlyIncludeInitialDateIfItMatchesRecurrence](self, "onlyIncludeInitialDateIfItMatchesRecurrence")))
        {
          v36 = v84;
          v44 = v49;
          weekStart = v47;
          goto LABEL_57;
        }
        objc_msgSend(v82, "addObject:", v50);
        v36 = v84;
        if (v85)
        {
          v44 = v49;
        }
        else
        {
          if (v27)
            --v27;
          else
            v27 = 0;
          v44 = v49;
          if (v92)
          {
            objc_msgSend(v50, "timeIntervalSinceReferenceDate");
            weekStart = v47;
            if (v56 >= v39)
              --v92;
            goto LABEL_52;
          }
        }
        weekStart = v47;
LABEL_52:
        ++v89;
LABEL_57:

        goto LABEL_58;
      }
      v44 = v49;
      weekStart = v47;
LABEL_58:

LABEL_59:
      v55 = v36 != 0;
      if (v45 + 1 <= 7)
        ++v45;
      else
        v45 = 1;
      if (a6)
        v55 = v27 != 0;
      if (v46 < 2)
        break;
      if (v45 == weekStart)
        break;
      v46 >>= 1;
    }
    while (v55);
    if (!v85)
    {
      v57 = v79;
      goto LABEL_83;
    }
    v57 = v79;
    if (v89 < 1)
      goto LABEL_83;
    _EKRecurrenceApplyBySetPosToRange(v82, v85, &v88, v76, v36, v80, v27, &v92);
    if (v27)
    {
      v27 -= v89;
      goto LABEL_83;
    }
    if (v89 || !v92)
    {
LABEL_83:
      -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v77, v44, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 254, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "hour");
      if (v61 == objc_msgSend(v57, "hour")
        && (v62 = objc_msgSend(v60, "minute"), v62 == objc_msgSend(v57, "minute"))
        && (v63 = objc_msgSend(v60, "second"), v63 == objc_msgSend(v57, "second")))
      {
        v44 = v59;
      }
      else
      {
        objc_msgSend(v60, "setHour:", objc_msgSend(v57, "hour"));
        objc_msgSend(v60, "setMinute:", objc_msgSend(v57, "minute"));
        objc_msgSend(v60, "setSecond:", objc_msgSend(v57, "second"));
        -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v60);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v88 += v89;
      v89 = 0;
      objc_msgSend(v44, "timeIntervalSinceReferenceDate");
      if (a6)
        v65 = v27 == 0;
      else
        v65 = 0;
      v66 = v65;
      if (v92)
        v67 = 1;
      else
        v67 = v64 < v39;
      if (!v67)
        goto LABEL_102;
      v23 = v60;
      if (v66)
        goto LABEL_102;
      continue;
    }
    break;
  }
  objc_msgSend(v44, "timeIntervalSinceReferenceDate");
  if (v58 < v39)
  {
    v27 = 0;
    goto LABEL_83;
  }
  v60 = v79;
LABEL_102:
  v68 = (void *)objc_msgSend(v82, "copy");

  return v68;
}

- (id)_copyMonthlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t interval;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  NSArray *v24;
  NSArray *v25;
  BOOL (*v26)(void *, void *);
  BOOL (**v27)(void *, void *);
  NSArray **v28;
  void (*v29)(void *, CFRange *, void *, void *, uint64_t, void *, void *, void *, void *, uint64_t, unint64_t, char);
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BOOL (**v33)(uint64_t, void *);
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CFAbsoluteTime v40;
  double v41;
  double v42;
  double v44;
  double v45;
  id v47;
  unint64_t *v48;
  unint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  char v68;
  NSArray *v69;
  NSArray *v70;
  void *v71;
  void *v72;
  NSArray *v73;
  uint64_t v74;
  _QWORD *v75;
  unint64_t *v76;
  unint64_t *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  unint64_t v85;
  void (*v86)(void *, CFRange *, void *, void *, uint64_t, void *, void *, void *, void *, uint64_t, unint64_t, char);
  NSArray *v87;
  CFIndex v88;
  uint64_t v89;
  id v90;
  id v91;
  unint64_t v92;
  unint64_t v93;
  _QWORD v94[8];

  v94[6] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v83 = a5;
  v85 = a6;
  v93 = a6;
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  interval = self->_interval;
  objc_msgSend(v12, "calendarDateForMonth");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendarDateForMonth");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)v15;
  v16 = objc_msgSend(v71, "differenceInMonths:", v15) % interval;
  objc_msgSend(v13, "calendarDateByAddingDays:", 1 - objc_msgSend(v13, "day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v16 >= 1)
    objc_msgSend(v18, "addMonths:", (int)interval - v16);
  v80 = v13;
  v19 = self->_setPositions;
  v20 = self->_monthsOfTheYear;
  v90 = 0;
  v91 = 0;
  v92 = a7;
  v88 = 0;
  v89 = 0;
  v21 = -[NSArray count](v20, "count");
  v70 = v20;
  if (v21)
  {
    v94[0] = _EKRecurrenceByMonthFilter;
    v94[1] = v20;
    v74 = 1;
  }
  else
  {
    v74 = 0;
  }
  v22 = v83;
  v23 = v85;
  v24 = self->_daysOfTheMonth;
  v25 = self->_daysOfTheWeek;
  v86 = 0;
  v87 = 0;
  v73 = v24;
  v69 = v25;
  if (!-[NSArray count](v25, "count"))
  {
    if (!-[NSArray count](v24, "count"))
    {
      v82 = 0;
      v32 = 1;
      v30 = v21;
      v31 = v80;
      goto LABEL_20;
    }
    v82 = 0;
    v29 = _EKRecurrenceByMonthDayGeneratorPinned;
    if (!self->_shouldPinMonthDays)
      v29 = _EKRecurrenceByMonthDayGenerator;
    v86 = v29;
    v28 = &v87;
    goto LABEL_15;
  }
  v86 = _EKRecurrenceByDayGenerator;
  v87 = v25;
  if (-[NSArray count](v24, "count"))
  {
    v26 = _EKRecurrenceByMonthDayFilterPinned;
    if (!self->_shouldPinMonthDays)
      v26 = _EKRecurrenceByMonthDayFilter;
    v27 = (BOOL (**)(void *, void *))&v94[2 * v74];
    *v27 = v26;
    v28 = (NSArray **)(v27 + 1);
    v82 = 1;
LABEL_15:
    v30 = v21;
    *v28 = v24;
    goto LABEL_17;
  }
  v82 = 0;
  v30 = v21;
LABEL_17:
  v31 = v80;
  v32 = 0;
  if (!-[NSArray count](v19, "count"))
  {
    v90 = v80;
    v91 = v83;
    v33 = (BOOL (**)(uint64_t, void *))&v94[2 * v82++ + 2 * v74];
    *v33 = _EKRecurrenceRangeFilter;
    v33[1] = (BOOL (*)(uint64_t, void *))&v90;
  }
LABEL_20:
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    objc_msgSend(v12, "absoluteTime");
    v35 = v34;
    objc_msgSend(v31, "absoluteTime");
    if (v35 >= v36)
    {
      if (v83)
      {
        objc_msgSend(v12, "absoluteTime");
        v38 = v37;
        objc_msgSend(v83, "absoluteTime");
        if (v38 >= v39)
          goto LABEL_29;
      }
      objc_msgSend(v12, "absoluteTime");
      _InsertAbsoluteTimeIntoArrayAtIndex(v84, v40);
      if (v85)
        v93 = v85 - 1;
      if (v19)
        v88 = 1;
    }
  }
  if (v83)
  {
LABEL_29:
    objc_msgSend(v83, "absoluteTime");
    v68 = 0;
    goto LABEL_31;
  }
  v41 = 0.0;
  v68 = 1;
LABEL_31:
  v42 = 1577840000.0;
  if (v41 <= 1577840000.0 && v41 != 0.0)
    v42 = v41;
  if (v85)
    v44 = v42;
  else
    v44 = v41;
  objc_msgSend(v18, "timeComponents");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "absoluteTime");
  if (v45 < v44 || v92 != 0)
  {
    if (v19)
      v47 = 0;
    else
      v47 = v12;
    v48 = &v93;
    if (v19)
      v48 = 0;
    v77 = v48;
    v78 = v47;
    v79 = v30;
    if (v19)
      v49 = 0;
    else
      v49 = &v92;
    v75 = &v94[2 * v74];
    v76 = v49;
    while (1)
    {
      if (v23 && !v93)
        goto LABEL_89;
      if (v30
        && !_EKRecurrenceApplyFiltersToSingleDate(v18, (uint64_t)v94, 1uLL, v12, -[CalRecurrenceGenerator onlyIncludeInitialDateIfItMatchesRecurrence](self, "onlyIncludeInitialDateIfItMatchesRecurrence")))
      {
        goto LABEL_72;
      }
      if ((v32 & 1) != 0)
      {
        v50 = interval;
        v51 = v32;
        objc_msgSend(v18, "dayComponents");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setDay:", objc_msgSend(v12, "day"));
        if (self->_shouldPinMonthDays)
        {
          v53 = objc_msgSend(v18, "daysInMonth");
          if (objc_msgSend(v52, "day") > v53)
            objc_msgSend(v52, "setDay:", v53);
        }
        objc_msgSend(v18, "calendar");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v52, "isValidDateInCalendar:", v54);

        if (!v55)
          goto LABEL_62;
        objc_msgSend(v52, "setHour:", objc_msgSend(v81, "hour"));
        objc_msgSend(v52, "setMinute:", objc_msgSend(v81, "minute"));
        objc_msgSend(v52, "setSecond:", objc_msgSend(v81, "second"));
        objc_msgSend(v18, "calendar");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dateFromComponents:", v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeIntervalSinceReferenceDate");
        v59 = v58;

        objc_msgSend(v31, "absoluteTime");
        if (v59 >= v60)
        {
          v22 = v83;
          if (((v68 & 1) != 0 || (objc_msgSend(v83, "absoluteTime"), v59 < v65) || v92)
            && (self->_onlyIncludeInitialDateIfItMatchesRecurrence
             || (objc_msgSend(v12, "absoluteTime"), vabdd_f64(v59, v64) >= 2.22044605e-16)))
          {
            _AppendAbsoluteTimeToArray(v84, v59);
            if (!v19)
            {
              if (v93)
                --v93;
              if (v92 && v59 >= v44)
                --v92;
            }
            v89 = 1;
            v61 = 1;
          }
          else
          {
            v61 = 0;
          }
        }
        else
        {
LABEL_62:
          v61 = 0;
          v22 = v83;
        }

        v32 = v51;
        interval = v50;
        v30 = v79;
        if (!v19)
          goto LABEL_73;
      }
      else
      {
        v61 = _EKRecurrenceApplyGenerator(v84, (uint64_t)&v86, (uint64_t)v75, v82, v78, v31, v22, v18, 3u, v77, v76, self->_onlyIncludeInitialDateIfItMatchesRecurrence);
        v89 = v61;
        if (!v19)
          goto LABEL_73;
      }
      if (v61 >= 1)
        break;
LABEL_73:
      objc_msgSend(v18, "addMonths:", interval);
      v88 += v61;
      v89 = 0;
      objc_msgSend(v18, "absoluteTime");
      v23 = v85;
      if (v63 >= v44 && !v92)
        goto LABEL_89;
    }
    _EKRecurrenceApplyBySetPosToRange(v84, v19, &v88, v31, v22, v12, v93, &v92);
    v61 = v89;
    if (v93)
    {
      v93 -= v89;
      goto LABEL_73;
    }
    if (v89 || !v92)
      goto LABEL_73;
    objc_msgSend(v18, "absoluteTime");
    if (v62 >= v44)
      goto LABEL_89;
LABEL_72:
    v61 = 0;
    goto LABEL_73;
  }
LABEL_89:
  v66 = (void *)objc_msgSend(v84, "copy");

  return v66;
}

- (BOOL)_validateCalDate:(id)a3 pinned:(BOOL)a4
{
  return (int)CalGregorianDateGetDaysInMonth(*(unint64_t *)&a3.var0) >= (uint64_t)a3.var2 || a4;
}

- (id)_copyYearlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t interval;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  unint64_t v24;
  void (*v25)(void *, CFRange *, void *, void *, uint64_t, void *, void *, void *, void *, uint64_t, unint64_t, char);
  NSArray *v26;
  uint64_t (*v27)(void *, void *);
  int v28;
  uint64_t (**v29)(void *, void *);
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  CFTypeRef v38;
  void *v39;
  CFTypeRef v40;
  BOOL (**v41)(uint64_t, void *);
  BOOL (**v42)(uint64_t, void *);
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CFAbsoluteTime v49;
  double v50;
  double v51;
  double v52;
  double v54;
  void *v55;
  id v57;
  unint64_t *v58;
  unint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  EKCalendarDate *v63;
  void *v64;
  EKCalendarDate *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  NSArray *v84;
  NSArray *v85;
  NSArray *v86;
  void *v87;
  void *v88;
  NSArray *v89;
  NSArray *v90;
  uint64_t (*v91)(void *, void *);
  unint64_t *v92;
  unint64_t *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  void *v97;
  id v98;
  CFIndex v99;
  uint64_t v100;
  void *v101;
  id v102;
  unint64_t v103;
  unint64_t weekStart;
  NSArray *v105;
  void (*v106)(void *, CFRange *, void *, void *, uint64_t, void *, void *, void *, void *, uint64_t, unint64_t, char);
  CFTypeRef v107;
  unint64_t v108;
  _QWORD v109[10];

  v109[8] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v98 = a5;
  v95 = a6;
  v108 = a6;
  v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  interval = self->_interval;
  objc_msgSend(v12, "calendarDateForYear");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendarDateForYear");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)v15;
  v16 = objc_msgSend(v87, "differenceInYears:", v15) % interval;
  v97 = v13;
  objc_msgSend(v13, "calendarDateByAddingDays:", (int)(1 - objc_msgSend(v13, "dayOfYear")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = interval;
  if (v16 >= 1)
    objc_msgSend(v18, "addYears:", (int)interval - v16);
  v106 = 0;
  v107 = 0;
  weekStart = 0;
  v105 = 0;
  v101 = 0;
  v102 = 0;
  v103 = a7;
  v20 = self->_daysOfTheYear;
  v21 = self->_daysOfTheWeek;
  v22 = self->_daysOfTheMonth;
  v89 = self->_weeksOfTheYear;
  v23 = self->_setPositions;
  v90 = self->_monthsOfTheYear;
  v85 = v21;
  v86 = v20;
  v84 = v22;
  if (-[NSArray count](v20, "count"))
  {
    v24 = 0;
    v25 = _EKRecurrenceByYearDayGenerator;
    v106 = _EKRecurrenceByYearDayGenerator;
    v107 = v20;
LABEL_5:
    v26 = v89;
    goto LABEL_6;
  }
  if (-[NSArray count](v22, "count"))
  {
    if (self->_shouldPinMonthDays)
      v25 = _EKRecurrenceByMonthDayGeneratorPinned;
    else
      v25 = _EKRecurrenceByMonthDayGenerator;
    v106 = v25;
    v107 = v22;
    if (-[NSArray count](v21, "count"))
    {
      v109[0] = _EKRecurrenceByDayFilter;
      v109[1] = v21;
      v24 = 1;
      goto LABEL_5;
    }
LABEL_27:
    v24 = 0;
    goto LABEL_5;
  }
  if (-[NSArray count](v21, "count"))
  {
    v24 = 0;
    v25 = _EKRecurrenceByDayGenerator;
    v106 = _EKRecurrenceByDayGenerator;
    v107 = v21;
    goto LABEL_5;
  }
  if (-[NSArray count](v90, "count"))
  {
    if (self->_shouldPinMonthDays)
      v25 = _EKRecurrenceByMonthDayGeneratorPinned;
    else
      v25 = _EKRecurrenceByMonthDayGenerator;
    v106 = v25;
    v35 = (void *)MEMORY[0x1E0C99D20];
    v36 = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "day"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFRetain((CFTypeRef)objc_msgSend(v35, "arrayWithObject:", v37));
    v107 = CFAutorelease(v38);

    v19 = v36;
    goto LABEL_27;
  }
  v26 = v89;
  if (!-[NSArray count](v89, "count"))
  {
    v24 = 0;
    v28 = 0;
    v34 = (uint64_t)v90;
    if (v90)
      goto LABEL_18;
    goto LABEL_31;
  }
  +[CalRecurrenceDayOfWeek dayOfWeek:](CalRecurrenceDayOfWeek, "dayOfWeek:", objc_msgSend(v12, "dayOfWeek"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = _EKRecurrenceByDayGenerator;
  v106 = _EKRecurrenceByDayGenerator;
  v40 = CFRetain((CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v39));
  v107 = CFAutorelease(v40);

  v26 = v89;
  v24 = 0;
LABEL_6:
  v27 = (uint64_t (*)(void *, void *))v90;
  if (v90)
  {
    v28 = 1;
LABEL_8:
    v29 = (uint64_t (**)(void *, void *))&v109[2 * v24++];
    *v29 = _EKRecurrenceByMonthFilter;
    v29[1] = v27;
    v91 = v27;
    goto LABEL_32;
  }
  v28 = 1;
  if (-[NSArray count](v26, "count") || v25 == _EKRecurrenceByYearDayGenerator)
  {
    v91 = 0;
    goto LABEL_32;
  }
  v30 = (void *)MEMORY[0x1E0C99D20];
  v31 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "month"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v30;
  v26 = v89;
  objc_msgSend(v33, "arrayWithObject:", v32);
  v34 = objc_claimAutoreleasedReturnValue();

  v19 = v31;
  if (v34)
  {
LABEL_18:
    v27 = (uint64_t (*)(void *, void *))v34;
    goto LABEL_8;
  }
LABEL_31:
  v91 = 0;
LABEL_32:
  if (-[NSArray count](v26, "count"))
  {
    weekStart = self->_weekStart;
    v105 = v26;
    v41 = (BOOL (**)(uint64_t, void *))&v109[2 * v24++];
    *v41 = _EKRecurrenceByWeekNoFilter;
    v41[1] = (BOOL (*)(uint64_t, void *))&weekStart;
  }
  if (v28 && !-[NSArray count](v23, "count"))
  {
    v101 = v97;
    v102 = v98;
    v42 = (BOOL (**)(uint64_t, void *))&v109[2 * v24++];
    *v42 = _EKRecurrenceRangeFilter;
    v42[1] = (BOOL (*)(uint64_t, void *))&v101;
  }
  v99 = 0;
  v100 = 0;
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    objc_msgSend(v12, "absoluteTime");
    v44 = v43;
    objc_msgSend(v97, "absoluteTime");
    if (v44 >= v45)
    {
      if (!v98 || (objc_msgSend(v12, "absoluteTime"), v47 = v46, objc_msgSend(v98, "absoluteTime"), v47 < v48))
      {
        objc_msgSend(v12, "absoluteTime");
        _InsertAbsoluteTimeIntoArrayAtIndex(v96, v49);
        if (v108)
          --v108;
        if (v23)
          v99 = 1;
      }
    }
  }
  objc_msgSend(v98, "absoluteTime");
  v51 = v50;
  if (v95)
  {
    v52 = fabs(v50);
    if (v51 > 1577840000.0 || v52 < 2.22044605e-16)
      v51 = 1577840000.0;
  }
  objc_msgSend(v18, "absoluteTime");
  if (v54 < v51 || v103)
  {
    if (v23)
      v57 = 0;
    else
      v57 = v12;
    v58 = &v108;
    if (v23)
      v58 = 0;
    v93 = v58;
    v94 = v57;
    if (v23)
      v59 = 0;
    else
      v59 = &v103;
    v92 = v59;
    do
    {
      if (v95 && !v108)
        break;
      if (v28)
      {
        v60 = _EKRecurrenceApplyGenerator(v96, (uint64_t)&v106, (uint64_t)v109, v24, v94, v97, v98, v18, 4u, v93, v92, self->_onlyIncludeInitialDateIfItMatchesRecurrence);
        v100 = v60;
        if (v23)
          goto LABEL_88;
      }
      else
      {
        v61 = v19;
        objc_msgSend(v18, "dayTimeComponents");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setMonth:", objc_msgSend(v12, "month"));
        if (self->_shouldPinMonthDays)
        {
          v63 = [EKCalendarDate alloc];
          objc_msgSend(v12, "timeZone");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = -[EKCalendarDate initWithDateComponents:timeZone:](v63, "initWithDateComponents:timeZone:", v62, v64);

          v66 = -[EKCalendarDate daysInMonth](v65, "daysInMonth");
          if (objc_msgSend(v12, "day") <= v66)
            v66 = objc_msgSend(v12, "day");
          objc_msgSend(v62, "setDay:", v66);

        }
        else
        {
          objc_msgSend(v62, "setDay:", objc_msgSend(v12, "day"));
        }
        objc_msgSend(v12, "calendar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v62, "isValidDateInCalendar:", v67);

        if (v68)
        {
          objc_msgSend(v12, "timeZone");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          +[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v62, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "absoluteTime");
          v72 = v71;
          objc_msgSend(v97, "absoluteTime");
          if (v72 >= v73
            && (!v98
             || (objc_msgSend(v70, "absoluteTime"), v75 = v74, objc_msgSend(v98, "absoluteTime"), v75 < v76)
             || v103)
            && (self->_onlyIncludeInitialDateIfItMatchesRecurrence
             || (objc_msgSend(v70, "absoluteTime"),
                 v78 = v77,
                 objc_msgSend(v12, "absoluteTime"),
                 vabdd_f64(v78, v79) >= 2.22044605e-16))
            && (!v24
             || _EKRecurrenceApplyFiltersToSingleDate(v70, (uint64_t)v109, v24, v12, -[CalRecurrenceGenerator onlyIncludeInitialDateIfItMatchesRecurrence](self, "onlyIncludeInitialDateIfItMatchesRecurrence"))))
          {
            objc_msgSend(v70, "absoluteTime");
            _AppendAbsoluteTimeToArray(v96, v80);
            if (!v23)
            {
              if (v108)
                --v108;
              if (v103)
              {
                objc_msgSend(v70, "absoluteTime");
                if (v83 >= v51)
                  --v103;
              }
            }
            v100 = 1;
            v60 = 1;
          }
          else
          {
            v60 = 0;
          }

        }
        else
        {
          v60 = 0;
        }
        v19 = v61;

        if (v23)
        {
LABEL_88:
          if (v60 >= 1)
          {
            _EKRecurrenceApplyBySetPosToRange(v96, v23, &v99, v97, v98, v12, v108, &v103);
            v60 = v100;
            if (v108)
            {
              v108 -= v100;
            }
            else if (!v100 && v103)
            {
              objc_msgSend(v18, "absoluteTime");
              if (v81 >= v51)
                break;
              v60 = 0;
            }
          }
        }
      }
      objc_msgSend(v18, "addYears:", v19);
      v99 += v60;
      v100 = 0;
      objc_msgSend(v18, "absoluteTime");
    }
    while (v82 < v51 || v103);
  }
  v55 = (void *)objc_msgSend(v96, "copy");

  return v55;
}

- (NSDate)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setEventStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)eventEndDate
{
  return self->_eventEndDate;
}

- (void)setEventEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (void)setEventTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void)setDaysOfTheWeek:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (void)setDaysOfTheMonth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (void)setDaysOfTheYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (void)setWeeksOfTheYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (void)setMonthsOfTheYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (void)setSetPositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int)interval
{
  return self->_interval;
}

- (void)setInterval:(int)a3
{
  self->_interval = a3;
}

- (int)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int)a3
{
  self->_frequency = a3;
}

- (unint64_t)weekStart
{
  return self->_weekStart;
}

- (void)setWeekStart:(unint64_t)a3
{
  self->_weekStart = a3;
}

- (BOOL)shouldPinMonthDays
{
  return self->_shouldPinMonthDays;
}

- (void)setShouldPinMonthDays:(BOOL)a3
{
  self->_shouldPinMonthDays = a3;
}

- (BOOL)onlyIncludeInitialDateIfItMatchesRecurrence
{
  return self->_onlyIncludeInitialDateIfItMatchesRecurrence;
}

- (void)setOnlyIncludeInitialDateIfItMatchesRecurrence:(BOOL)a3
{
  self->_onlyIncludeInitialDateIfItMatchesRecurrence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
