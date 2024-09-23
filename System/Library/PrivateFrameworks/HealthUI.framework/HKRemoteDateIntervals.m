@implementation HKRemoteDateIntervals

- (HKRemoteDateIntervals)initWithDisplayType:(id)a3 fromEndDate:(id)a4
{
  id v6;
  void *v7;
  HKRemoteDateIntervals *v8;

  v6 = a4;
  objc_msgSend(a3, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKRemoteDateIntervals initWithQueryAlignment:fromEndDate:](self, "initWithQueryAlignment:fromEndDate:", objc_msgSend(v7, "preferredCalendarDayAlignment"), v6);

  return v8;
}

- (id)dateIntervalForTimeScope:(int64_t)a3 withGregorianCalendar:(id)a4 error:(id *)a5
{
  id v8;
  NSMutableDictionary *dateIntervals;
  void *v10;
  void *v11;
  id v12;
  NSDate *endDate;
  int64_t calendarDayAlignment;
  HKRemoteDateIntervals *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  void *v19;

  v8 = a4;
  dateIntervals = self->_dateIntervals;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dateIntervals, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    switch(a3)
    {
      case 0:
        -[HKRemoteDateIntervals _dateIntervalFromDate:forUnit:withValue:queryAlignment:gregorianCalendar:](self, "_dateIntervalFromDate:forUnit:withValue:queryAlignment:gregorianCalendar:", self->_endDate, 4, -10, self->_calendarDayAlignment, v8);

        goto LABEL_5;
      case 1:
LABEL_5:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 4;
        v17 = -5;
        goto LABEL_14;
      case 2:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 4;
        goto LABEL_13;
      case 3:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 0x2000;
        v17 = -26;
        goto LABEL_14;
      case 4:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 16;
        v17 = -31;
        goto LABEL_14;
      case 5:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 16;
        v17 = -7;
        goto LABEL_14;
      case 6:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 16;
        goto LABEL_13;
      case 7:
        calendarDayAlignment = self->_calendarDayAlignment;
        endDate = self->_endDate;
        v15 = self;
        v16 = 32;
LABEL_13:
        v17 = -1;
LABEL_14:
        -[HKRemoteDateIntervals _dateIntervalFromDate:forUnit:withValue:queryAlignment:gregorianCalendar:](v15, "_dateIntervalFromDate:forUnit:withValue:queryAlignment:gregorianCalendar:", endDate, v16, v17, calendarDayAlignment, v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 8:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("HKTimeScopeCount is not a valid time scope for a date interval."));
        v12 = 0;
        break;
      default:
        v12 = 0;
LABEL_15:
        v18 = self->_dateIntervals;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, v19);

        break;
    }
  }

  return v12;
}

- (id)_dateIntervalFromDate:(id)a3 forUnit:(unint64_t)a4 withValue:(int64_t)a5 queryAlignment:(int64_t)a6 gregorianCalendar:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a7;
  objc_msgSend(a3, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", a4, 1, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", a4, a5, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v13);
  objc_msgSend(v15, "hk_dateIntervalShiftedToQueryAlignment:calendar:", a6, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_dateIntervals, 0);
}

- (HKRemoteDateIntervals)initWithQueryAlignment:(int64_t)a3 fromEndDate:(id)a4
{
  id v7;
  HKRemoteDateIntervals *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *dateIntervals;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKRemoteDateIntervals;
  v8 = -[HKRemoteDateIntervals init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dateIntervals = v8->_dateIntervals;
    v8->_dateIntervals = v9;

    v8->_calendarDayAlignment = a3;
    objc_storeStrong((id *)&v8->_endDate, a4);
  }

  return v8;
}

@end
