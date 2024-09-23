@implementation HKDateCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekendDays, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_endOfRollingYear, 0);
  objc_storeStrong((id *)&self->_startOfRollingYear, 0);
  objc_storeStrong((id *)&self->_endOfRollingMonthMidnight, 0);
  objc_storeStrong((id *)&self->_startOfRollingMonthMidnight, 0);
  objc_storeStrong((id *)&self->_endOfRollingWeekMidnight, 0);
  objc_storeStrong((id *)&self->_startOfRollingWeekMidnight, 0);
  objc_storeStrong((id *)&self->_endOfTomorrowMidnight, 0);
  objc_storeStrong((id *)&self->_startOfTomorrowMidnight, 0);
  objc_storeStrong((id *)&self->_oneSecondBeforeEndOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_oneMinuteBeforeEndOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_endOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_startOfDayMidnight, 0);
  objc_storeStrong((id *)&self->_endOfYesterdayMidnight, 0);
  objc_storeStrong((id *)&self->_startOfYesterdayMidnight, 0);
}

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKDateCache;
  -[HKDateCache dealloc](&v4, sel_dealloc);
}

- (HKDateCache)initWithCalendar:(id)a3
{
  id v5;
  HKDateCache *v6;
  uint64_t v7;
  NSHashTable *observers;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDateCache;
  v6 = -[HKDateCache init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_calendar, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__flushCacheAndNotifyObservers_, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__flushCacheAndNotifyObservers_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__flushCacheAndNotifyObservers_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v6;
}

- (BOOL)isDateInToday:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL IsSmaller;

  v4 = a3;
  -[HKDateCache startOfDayMidnight](self, "startOfDayMidnight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    -[HKDateCache startOfTomorrowMidnight](self, "startOfTomorrowMidnight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);

  }
  else
  {
    IsSmaller = 0;
  }

  return IsSmaller;
}

- (NSDate)startOfDayMidnight
{
  NSDate *startOfDayMidnight;
  NSCalendar *calendar;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  startOfDayMidnight = self->_startOfDayMidnight;
  if (!startOfDayMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache _currentDate](self, "_currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar startOfDayForDate:](calendar, "startOfDayForDate:", v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_startOfDayMidnight;
    self->_startOfDayMidnight = v6;

    startOfDayMidnight = self->_startOfDayMidnight;
  }
  return startOfDayMidnight;
}

- (NSDate)startOfTomorrowMidnight
{
  NSDate *startOfTomorrowMidnight;
  NSCalendar *calendar;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *v8;

  startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  if (!startOfTomorrowMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache _currentDate](self, "_currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", v6);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v8 = self->_startOfTomorrowMidnight;
    self->_startOfTomorrowMidnight = v7;

    startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  }
  return startOfTomorrowMidnight;
}

- (NSDate)startOfRollingYearMidnight
{
  NSDate *startOfRollingYear;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  startOfRollingYear = self->_startOfRollingYear;
  if (!startOfRollingYear)
  {
    -[HKDateCache _currentDate](self, "_currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKCalendarDateTransformNone();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKStartOfRollingYearForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_startOfRollingYear;
    self->_startOfRollingYear = v6;

    startOfRollingYear = self->_startOfRollingYear;
  }
  return startOfRollingYear;
}

- (id)_currentDate
{
  NSDate *currentDate;

  currentDate = self->_currentDate;
  if (currentDate)
    return currentDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)endOfRollingYear:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache endOfRollingYearMidnight](self, "endOfRollingYearMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)endOfRollingYearMidnight
{
  NSDate *endOfRollingYear;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  endOfRollingYear = self->_endOfRollingYear;
  if (!endOfRollingYear)
  {
    -[HKDateCache startOfRollingYearMidnight](self, "startOfRollingYearMidnight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKEndOfRollingYearWithStart(v4);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingYear;
    self->_endOfRollingYear = v5;

    endOfRollingYear = self->_endOfRollingYear;
  }
  return endOfRollingYear;
}

- (id)startOfRollingYear:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache startOfRollingYearMidnight](self, "startOfRollingYearMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)startOfRollingMonth:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache startOfRollingMonthMidnight](self, "startOfRollingMonthMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)startOfRollingDay:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache startOfDayMidnight](self, "startOfDayMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)endOfRollingWeek:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache endOfRollingWeekMidnight](self, "endOfRollingWeekMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)endOfRollingWeekMidnight
{
  NSDate *endOfRollingWeekMidnight;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  if (!endOfRollingWeekMidnight)
  {
    -[HKDateCache startOfRollingWeekMidnight](self, "startOfRollingWeekMidnight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKEndOfRollingWeekWithStart(v4);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingWeekMidnight;
    self->_endOfRollingWeekMidnight = v5;

    endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  }
  return endOfRollingWeekMidnight;
}

- (id)startOfRollingWeek:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache startOfRollingWeekMidnight](self, "startOfRollingWeekMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)startOfRollingWeekMidnight
{
  NSDate *startOfRollingWeekMidnight;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  if (!startOfRollingWeekMidnight)
  {
    -[HKDateCache _currentDate](self, "_currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKCalendarDateTransformNone();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKStartOfRollingWeekForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_startOfRollingWeekMidnight;
    self->_startOfRollingWeekMidnight = v6;

    startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  }
  return startOfRollingWeekMidnight;
}

- (NSDate)endOfRollingMonthMidnight
{
  NSDate *endOfRollingMonthMidnight;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  if (!endOfRollingMonthMidnight)
  {
    -[HKDateCache startOfRollingMonthMidnight](self, "startOfRollingMonthMidnight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKEndOfRollingMonthWithStart(v4);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_endOfRollingMonthMidnight;
    self->_endOfRollingMonthMidnight = v5;

    endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  }
  return endOfRollingMonthMidnight;
}

- (NSDate)startOfRollingMonthMidnight
{
  NSDate *startOfRollingMonthMidnight;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  if (!startOfRollingMonthMidnight)
  {
    -[HKDateCache _currentDate](self, "_currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKCalendarDateTransformNone();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKStartOfRollingMonthForDate(v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_startOfRollingMonthMidnight;
    self->_startOfRollingMonthMidnight = v6;

    startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  }
  return startOfRollingMonthMidnight;
}

- (id)endOfRollingMonth:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache endOfRollingMonthMidnight](self, "endOfRollingMonthMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)endOfRollingDay:(id)a3
{
  NSCalendar *calendar;
  id v6;
  void *v7;
  void *v8;

  calendar = self->_calendar;
  v6 = a3;
  -[HKDateCache endOfDayMidnight](self, "endOfDayMidnight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, NSCalendar *, void *))a3 + 2))(v6, calendar, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)endOfDayMidnight
{
  NSDate *endOfDayMidnight;
  NSCalendar *calendar;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  endOfDayMidnight = self->_endOfDayMidnight;
  if (!endOfDayMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache startOfDayMidnight](self, "startOfDayMidnight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_endOfDayMidnight;
    self->_endOfDayMidnight = v6;

    endOfDayMidnight = self->_endOfDayMidnight;
  }
  return endOfDayMidnight;
}

- (HKDateCache)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)_setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  -[HKDateCache _flushCacheAndNotifyObservers:](self, "_flushCacheAndNotifyObservers:", 0);
}

- (NSDate)startOfYesterdayMidnight
{
  NSDate *startOfYesterdayMidnight;
  NSCalendar *calendar;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *v8;

  startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  if (!startOfYesterdayMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache _currentDate](self, "_currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 16, -1, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCalendar startOfDayForDate:](self->_calendar, "startOfDayForDate:", v6);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v8 = self->_startOfYesterdayMidnight;
    self->_startOfYesterdayMidnight = v7;

    startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  }
  return startOfYesterdayMidnight;
}

- (NSDate)oneMinuteBeforeEndOfDayMidnight
{
  NSDate *oneMinuteBeforeEndOfDayMidnight;
  NSCalendar *calendar;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  if (!oneMinuteBeforeEndOfDayMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache endOfDayMidnight](self, "endOfDayMidnight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 64, -1, v5, 0);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_oneMinuteBeforeEndOfDayMidnight;
    self->_oneMinuteBeforeEndOfDayMidnight = v6;

    oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  }
  return oneMinuteBeforeEndOfDayMidnight;
}

- (NSDate)oneSecondBeforeEndOfDayMidnight
{
  NSDate *oneSecondBeforeEndOfDayMidnight;
  NSCalendar *calendar;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  if (!oneSecondBeforeEndOfDayMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache endOfDayMidnight](self, "endOfDayMidnight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 128, -1, v5, 0);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_oneSecondBeforeEndOfDayMidnight;
    self->_oneSecondBeforeEndOfDayMidnight = v6;

    oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  }
  return oneSecondBeforeEndOfDayMidnight;
}

- (NSDate)endOfTomorrowMidnight
{
  NSDate *endOfTomorrowMidnight;
  NSCalendar *calendar;
  void *v5;
  NSDate *v6;
  NSDate *v7;

  endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  if (!endOfTomorrowMidnight)
  {
    calendar = self->_calendar;
    -[HKDateCache startOfTomorrowMidnight](self, "startOfTomorrowMidnight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingUnit:value:toDate:options:](calendar, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_endOfTomorrowMidnight;
    self->_endOfTomorrowMidnight = v6;

    endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  }
  return endOfTomorrowMidnight;
}

- (void)unregisterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversDidUpdateOnNotification:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "dateCacheDidUpdate:onNotification:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)weekendDays
{
  NSSet *weekendDays;
  NSSet *v4;
  NSSet *v5;

  weekendDays = self->_weekendDays;
  if (!weekendDays)
  {
    -[NSCalendar hk_weekendDays](self->_calendar, "hk_weekendDays");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_weekendDays;
    self->_weekendDays = v4;

    weekendDays = self->_weekendDays;
  }
  return weekendDays;
}

- (BOOL)isDateInYesterday:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL IsSmaller;

  v4 = a3;
  -[HKDateCache startOfYesterdayMidnight](self, "startOfYesterdayMidnight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    -[HKDateCache startOfDayMidnight](self, "startOfDayMidnight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);

  }
  else
  {
    IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateInTomorrow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL IsSmaller;

  v4 = a3;
  -[HKDateCache startOfTomorrowMidnight](self, "startOfTomorrowMidnight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    -[HKDateCache endOfTomorrowMidnight](self, "endOfTomorrowMidnight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);

  }
  else
  {
    IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateInThisCalendarMonth:(id)a3
{
  NSCalendar *calendar;
  id v5;
  void *v6;
  uint64_t v7;

  calendar = self->_calendar;
  v5 = a3;
  -[HKDateCache _currentDate](self, "_currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSCalendar compareDate:toDate:toUnitGranularity:](calendar, "compareDate:toDate:toUnitGranularity:", v5, v6, 8);

  return v7 == 0;
}

- (BOOL)isDateInThisCalendarYear:(id)a3
{
  NSCalendar *calendar;
  id v5;
  void *v6;
  uint64_t v7;

  calendar = self->_calendar;
  v5 = a3;
  -[HKDateCache _currentDate](self, "_currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSCalendar compareDate:toDate:toUnitGranularity:](calendar, "compareDate:toDate:toUnitGranularity:", v5, v6, 4);

  return v7 == 0;
}

- (BOOL)isDateWithinLastRollingMonth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL IsSmaller;

  v4 = a3;
  -[HKDateCache startOfRollingMonthMidnight](self, "startOfRollingMonthMidnight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    -[HKDateCache endOfRollingMonthMidnight](self, "endOfRollingMonthMidnight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);

  }
  else
  {
    IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDateWithinLastRollingYear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL IsSmaller;

  v4 = a3;
  -[HKDateCache startOfRollingYearMidnight](self, "startOfRollingYearMidnight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HKUIObjectIsLargerOrEqual(v4, (uint64_t)v5))
  {
    -[HKDateCache endOfRollingYearMidnight](self, "endOfRollingYearMidnight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmaller = HKUIObjectIsSmaller(v4, (uint64_t)v6);

  }
  else
  {
    IsSmaller = 0;
  }

  return IsSmaller;
}

- (BOOL)isDayOfWeekNumberOnWeekend:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HKDateCache weekendDays](self, "weekendDays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)flushCache
{
  NSDate *startOfYesterdayMidnight;
  NSDate *startOfDayMidnight;
  NSDate *endOfDayMidnight;
  NSDate *oneMinuteBeforeEndOfDayMidnight;
  NSDate *oneSecondBeforeEndOfDayMidnight;
  NSDate *startOfTomorrowMidnight;
  NSDate *endOfTomorrowMidnight;
  NSDate *startOfRollingWeekMidnight;
  NSDate *endOfRollingWeekMidnight;
  NSDate *startOfRollingMonthMidnight;
  NSDate *endOfRollingMonthMidnight;
  NSDate *startOfRollingYear;
  NSDate *endOfRollingYear;
  NSSet *weekendDays;

  startOfYesterdayMidnight = self->_startOfYesterdayMidnight;
  self->_startOfYesterdayMidnight = 0;

  startOfDayMidnight = self->_startOfDayMidnight;
  self->_startOfDayMidnight = 0;

  endOfDayMidnight = self->_endOfDayMidnight;
  self->_endOfDayMidnight = 0;

  oneMinuteBeforeEndOfDayMidnight = self->_oneMinuteBeforeEndOfDayMidnight;
  self->_oneMinuteBeforeEndOfDayMidnight = 0;

  oneSecondBeforeEndOfDayMidnight = self->_oneSecondBeforeEndOfDayMidnight;
  self->_oneSecondBeforeEndOfDayMidnight = 0;

  startOfTomorrowMidnight = self->_startOfTomorrowMidnight;
  self->_startOfTomorrowMidnight = 0;

  endOfTomorrowMidnight = self->_endOfTomorrowMidnight;
  self->_endOfTomorrowMidnight = 0;

  startOfRollingWeekMidnight = self->_startOfRollingWeekMidnight;
  self->_startOfRollingWeekMidnight = 0;

  endOfRollingWeekMidnight = self->_endOfRollingWeekMidnight;
  self->_endOfRollingWeekMidnight = 0;

  startOfRollingMonthMidnight = self->_startOfRollingMonthMidnight;
  self->_startOfRollingMonthMidnight = 0;

  endOfRollingMonthMidnight = self->_endOfRollingMonthMidnight;
  self->_endOfRollingMonthMidnight = 0;

  startOfRollingYear = self->_startOfRollingYear;
  self->_startOfRollingYear = 0;

  endOfRollingYear = self->_endOfRollingYear;
  self->_endOfRollingYear = 0;

  weekendDays = self->_weekendDays;
  self->_weekendDays = 0;

}

- (void)_flushCacheAndNotifyObservers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HKDateCache__flushCacheAndNotifyObservers___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __45__HKDateCache__flushCacheAndNotifyObservers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "flushCache");
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidUpdateOnNotification:", *(_QWORD *)(a1 + 40));
  ResetLocaleDependentFormatters();
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)endOfYesterdayMidnight
{
  return self->_endOfYesterdayMidnight;
}

@end
