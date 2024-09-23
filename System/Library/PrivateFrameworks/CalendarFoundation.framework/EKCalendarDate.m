@implementation EKCalendarDate

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_21);
}

uint64_t __28__EKCalendarDate_initialize__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_dateComponentCache;
  _dateComponentCache = (uint64_t)v0;

  return objc_msgSend((id)_dateComponentCache, "setCountLimit:", 1000);
}

+ (id)calendarDateWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:components:timeZone:", v7, 0, v6);

  return v8;
}

+ (id)calendarDateWithDateComponents:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:components:timeZone:", 0, v7, v6);

  return v8;
}

+ (id)calendarDateWithAbsoluteTime:(double)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDate:components:timeZone:", v8, 0, v6);

  return v9;
}

+ (id)calendarDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 timeZone:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setEra:", 1);
  objc_msgSend(v11, "setYear:", a3);
  objc_msgSend(v11, "setMonth:", a4);
  objc_msgSend(v11, "setDay:", a5);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:components:timeZone:", 0, v11, v10);

  return v12;
}

- (EKCalendarDate)initWithDate:(id)a3 timeZone:(id)a4
{
  return -[EKCalendarDate initWithDate:components:timeZone:](self, "initWithDate:components:timeZone:", a3, 0, a4);
}

- (EKCalendarDate)initWithDate:(id)a3 calendar:(id)a4
{
  return -[EKCalendarDate initWithDate:components:calendar:](self, "initWithDate:components:calendar:", a3, 0, a4);
}

- (EKCalendarDate)initWithAbsoluteTime:(double)a3 timeZone:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  EKCalendarDate *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithTimeIntervalSinceReferenceDate:", a3);
  v9 = -[EKCalendarDate initWithDate:components:timeZone:](self, "initWithDate:components:timeZone:", v8, 0, v7);

  return v9;
}

- (EKCalendarDate)initWithDateComponents:(id)a3 timeZone:(id)a4
{
  return -[EKCalendarDate initWithDate:components:timeZone:](self, "initWithDate:components:timeZone:", 0, a3, a4);
}

- (EKCalendarDate)initWithDateComponents:(id)a3 calendar:(id)a4
{
  return -[EKCalendarDate initWithDate:components:calendar:](self, "initWithDate:components:calendar:", 0, a3, a4);
}

- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 timeZone:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  EKCalendarDate *v12;

  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "CalGregorianCalendarForTimeZone:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKCalendarDate initWithDate:components:calendar:](self, "initWithDate:components:calendar:", v10, v9, v11);

  return v12;
}

- (EKCalendarDate)initWithDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  EKCalendarDate *v12;
  EKCalendarDate *v13;
  uint64_t v14;
  NSCalendar *calendar;
  NSDate *v16;
  NSDate *date;
  void *components;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 | v9 && v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)EKCalendarDate;
    v13 = -[EKCalendarDate init](&v22, sel_init);
    if (!v13)
      goto LABEL_22;
    v14 = objc_msgSend(v11, "copy");
    calendar = v13->_calendar;
    v13->_calendar = (NSCalendar *)v14;

    if (v8)
    {
      v16 = (NSDate *)(id)v8;
    }
    else
    {
      -[NSCalendar dateFromComponents:](v13->_calendar, "dateFromComponents:", v9);
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    date = v13->_date;
    v13->_date = v16;

    if (!v9
      || objc_msgSend((id)v9, "era") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "year") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "month") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "day") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "hour") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "minute") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "second") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend((id)v9, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_22;
    }
    objc_msgSend((id)v9, "timeZone");
    components = (void *)objc_claimAutoreleasedReturnValue();
    if (components
      && objc_msgSend((id)v9, "weekday") != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend((id)v9, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = objc_msgSend((id)v9, "weekOfYear");

      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_22:
        self = v13;
        v12 = self;
        goto LABEL_23;
      }
      v20 = objc_msgSend((id)v9, "copy");
      components = v13->_components;
      v13->_components = (NSDateComponents *)v20;
    }

    goto LABEL_22;
  }
LABEL_23:

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[EKCalendarDate initWithDate:components:calendar:]([EKMutableCalendarDate alloc], "initWithDate:components:calendar:", self->_date, self->_components, self->_calendar);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "absoluteTime");
    v6 = v5;
    -[EKCalendarDate absoluteTime](self, "absoluteTime");
    v8 = vabdd_f64(v6, v7) < 2.22044605e-16;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_6_0);
  os_unfair_lock_lock((os_unfair_lock_t)&description_lock);
  objc_msgSend((id)description_formatter, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToTimeZone:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)description_formatter;
    -[EKCalendarDate timeZone](self, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

  }
  v8 = (void *)description_formatter;
  -[EKCalendarDate date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&description_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p> { date = %@ }"), objc_opt_class(), self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __29__EKCalendarDate_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  objc_msgSend((id)description_formatter, "setDateStyle:", 4);
  return objc_msgSend((id)description_formatter, "setTimeStyle:", 3);
}

- (id)date
{
  return self->_date;
}

- (double)absoluteTime
{
  void *v2;
  double v3;
  double v4;

  -[EKCalendarDate date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (id)allComponents
{
  void *v4;
  NSString *dateCacheKey;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSDateComponents *v14;
  NSDateComponents *components;
  NSCalendar *calendar;
  void *v17;
  NSDateComponents *v18;
  NSDateComponents *v19;

  if (!self->_components)
  {
    -[EKCalendarDate date](self, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      dateCacheKey = self->_dateCacheKey;
      if (!dateCacheKey)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        -[EKCalendarDate date](self, "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceReferenceDate");
        v9 = v8;
        -[EKCalendarDate calendar](self, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%f-%@"), v9, v11);
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v13 = self->_dateCacheKey;
        self->_dateCacheKey = v12;

        dateCacheKey = self->_dateCacheKey;
      }
      objc_msgSend((id)_dateComponentCache, "objectForKey:", dateCacheKey);
      v14 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
      components = self->_components;
      self->_components = v14;

      if (!self->_components)
      {
        calendar = self->_calendar;
        -[EKCalendarDate date](self, "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 2142974, v17);
        v18 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
        v19 = self->_components;
        self->_components = v18;

        objc_msgSend((id)_dateComponentCache, "setObject:forKey:", self->_components, self->_dateCacheKey);
      }
    }
  }
  return (id)-[NSDateComponents copy](self->_components, "copy");
}

- (id)dayTimeComponents
{
  void *v2;
  void *v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setMonth:", objc_msgSend(v2, "month"));
  objc_msgSend(v3, "setDay:", objc_msgSend(v2, "day"));
  objc_msgSend(v3, "setHour:", objc_msgSend(v2, "hour"));
  objc_msgSend(v3, "setMinute:", objc_msgSend(v2, "minute"));
  objc_msgSend(v3, "setSecond:", objc_msgSend(v2, "second"));
  objc_msgSend(v3, "setNanosecond:", objc_msgSend(v2, "nanosecond"));

  return v3;
}

- (id)dayComponents
{
  void *v2;
  void *v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setMonth:", objc_msgSend(v2, "month"));
  objc_msgSend(v3, "setDay:", objc_msgSend(v2, "day"));

  return v3;
}

- (id)timeComponents
{
  void *v2;
  void *v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setHour:", objc_msgSend(v2, "hour"));
  objc_msgSend(v3, "setMinute:", objc_msgSend(v2, "minute"));
  objc_msgSend(v3, "setSecond:", objc_msgSend(v2, "second"));
  objc_msgSend(v3, "setNanosecond:", objc_msgSend(v2, "nanosecond"));

  return v3;
}

- (id)weekComponents
{
  void *v2;
  void *v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEra:", objc_msgSend(v2, "era"));
  objc_msgSend(v3, "setYear:", objc_msgSend(v2, "year"));
  objc_msgSend(v3, "setWeekOfYear:", objc_msgSend(v2, "weekOfYear"));

  return v3;
}

- (id)calendar
{
  return (id)-[NSCalendar copy](self->_calendar, "copy");
}

- (id)timeZone
{
  void *v2;
  void *v3;

  -[NSCalendar timeZone](self->_calendar, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (int64_t)secondsFromGMT
{
  void *v3;
  void *v4;
  int64_t v5;

  -[EKCalendarDate timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "secondsFromGMTForDate:", v4);

  return v5;
}

- (id)calendarDateByAddingComponents:(id)a3
{
  NSCalendar *calendar;
  id v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  calendar = self->_calendar;
  v5 = a3;
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateByAddingComponents:toDate:options:](calendar, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EKCalendarDate initWithDate:calendar:]([EKCalendarDate alloc], "initWithDate:calendar:", v7, self->_calendar);
  return v8;
}

- (id)calendarDateByAddingSeconds:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", (double)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingMinutes:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingMinutes:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingHours:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingHours:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingDays:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingDays:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingWeeks:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingWeeks:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingMonths:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingMonths:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByAddingYears:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingYears:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateByComponentwiseAddingComponents:(id)a3
{
  id v4;
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v4 = a3;
  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CalDateByComponentwiseAddingComponents:inCalendar:", v4, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);
  return v8;
}

- (id)calendarDateByComponentwiseAddingSeconds:(int64_t)a3
{
  EKCalendarDate *v5;
  void *v6;
  void *v7;
  EKCalendarDate *v8;

  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CalDateByComponentwiseAddingSeconds:inCalendar:", a3, self->_calendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKCalendarDate initWithDate:calendar:](v5, "initWithDate:calendar:", v7, self->_calendar);

  return v8;
}

- (id)calendarDateInTimeZone:(id)a3
{
  id v4;
  EKCalendarDate *v5;
  void *v6;
  EKCalendarDate *v7;

  v4 = a3;
  v5 = [EKCalendarDate alloc];
  -[EKCalendarDate dayTimeComponents](self, "dayTimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKCalendarDate initWithDateComponents:timeZone:](v5, "initWithDateComponents:timeZone:", v6, v4);

  return v7;
}

- (EKCalendarDate)calendarDateWithDate:(id)a3
{
  id v4;
  EKCalendarDate *v5;

  v4 = a3;
  v5 = -[EKCalendarDate initWithDate:calendar:]([EKCalendarDate alloc], "initWithDate:calendar:", v4, self->_calendar);

  return v5;
}

- (id)differenceAsDateComponents:(id)a3 units:(unint64_t)a4
{
  NSCalendar *calendar;
  void *v7;
  void *v8;
  void *v9;

  calendar = self->_calendar;
  objc_msgSend(a3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:toDate:options:](calendar, "components:fromDate:toDate:options:", a4, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)differenceInYears:(id)a3
{
  void *v3;
  int64_t v4;

  -[EKCalendarDate differenceAsDateComponents:units:](self, "differenceAsDateComponents:units:", a3, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "year");

  return v4;
}

- (int64_t)differenceInMonths:(id)a3
{
  void *v3;
  int64_t v4;

  -[EKCalendarDate differenceAsDateComponents:units:](self, "differenceAsDateComponents:units:", a3, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "month");

  return v4;
}

- (int64_t)differenceInDays:(id)a3
{
  void *v3;
  int64_t v4;

  -[EKCalendarDate differenceAsDateComponents:units:](self, "differenceAsDateComponents:units:", a3, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "day");

  return v4;
}

- (double)differenceInSeconds:(id)a3
{
  void *v3;
  double v4;

  -[EKCalendarDate differenceAsDateComponents:units:](self, "differenceAsDateComponents:units:", a3, 128);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "second");

  return v4;
}

- (int64_t)era
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "era");

  return v3;
}

- (int64_t)year
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "year");

  return v3;
}

- (int64_t)month
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "month");

  return v3;
}

- (int64_t)day
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "day");

  return v3;
}

- (int64_t)hour
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hour");

  return v3;
}

- (int64_t)minute
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minute");

  return v3;
}

- (int64_t)second
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "second");

  return v3;
}

- (int64_t)dayOfWeek
{
  void *v2;
  int64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "weekday");

  return v3;
}

- (unint64_t)dayOfYear
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSCalendar ordinalityOfUnit:inUnit:forDate:](calendar, "ordinalityOfUnit:inUnit:forDate:", 16, 4, v3);

  return v4;
}

- (unint64_t)weekOfMonth
{
  void *v2;
  unint64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "weekOfMonth");

  return v3;
}

- (unint64_t)weekOfYear
{
  void *v2;
  unint64_t v3;

  -[EKCalendarDate allComponents](self, "allComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "weekOfYear");

  return v3;
}

- (unint64_t)daysInMonth
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSCalendar daysInMonthContainingDate:](calendar, "daysInMonthContainingDate:", v3);

  return v4;
}

- (unint64_t)daysInYear
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSCalendar CalDaysInYearContainingDate:](calendar, "CalDaysInYearContainingDate:", v3);

  return v4;
}

- (unint64_t)weeksInMonth
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSCalendar CalWeeksInMonthContainingDate:](calendar, "CalWeeksInMonthContainingDate:", v3);

  return v4;
}

- (unint64_t)weeksInYear
{
  NSCalendar *calendar;
  void *v3;
  unint64_t v4;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSCalendar CalWeeksInYearContainingDate:](calendar, "CalWeeksInYearContainingDate:", v3);

  return v4;
}

- (id)calendarDateForDay
{
  NSCalendar *calendar;
  void *v4;
  void *v5;
  void *v6;

  calendar = self->_calendar;
  -[EKCalendarDate date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar startOfDayForDate:](calendar, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate calendarDateWithDate:](self, "calendarDateWithDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)calendarDateForEndOfDay
{
  void *v3;
  EKCalendarDate *v4;

  -[EKCalendarDate dayTimeComponents](self, "dayTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  v4 = -[EKCalendarDate initWithDateComponents:calendar:]([EKCalendarDate alloc], "initWithDateComponents:calendar:", v3, self->_calendar);

  return v4;
}

- (id)calendarDateForWeekWithWeekStart:(int64_t)a3
{
  return -[EKCalendarDate calendarDateForWeekWithWeekStart:daysSinceWeekStart:](self, "calendarDateForWeekWithWeekStart:daysSinceWeekStart:", a3, 0);
}

- (id)calendarDateForWeekWithWeekStart:(int64_t)a3 daysSinceWeekStart:(int64_t *)a4
{
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;

  v7 = -[EKCalendarDate dayOfWeek](self, "dayOfWeek");
  v8 = 7;
  if (v7 >= a3)
    v8 = 0;
  v9 = v7 - a3 + v8;
  if (a4)
    *a4 = v9;
  -[EKCalendarDate calendarDateByAddingDays:](self, "calendarDateByAddingDays:", -v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarDateForDay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)calendarDateForEndOfWeekWithWeekStart:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[EKCalendarDate calendarDateForWeekWithWeekStart:daysSinceWeekStart:](self, "calendarDateForWeekWithWeekStart:daysSinceWeekStart:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateByAddingWeeks:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarDateByAddingSeconds:", -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calendarDateForMonth
{
  void *v3;
  EKCalendarDate *v4;

  -[EKCalendarDate dayComponents](self, "dayComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDay:", 1);
  v4 = -[EKCalendarDate initWithDateComponents:calendar:]([EKCalendarDate alloc], "initWithDateComponents:calendar:", v3, self->_calendar);

  return v4;
}

- (id)calendarDateForEndOfMonth
{
  void *v2;
  void *v3;
  void *v4;

  -[EKCalendarDate calendarDateForMonth](self, "calendarDateForMonth");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarDateByAddingMonths:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateByAddingSeconds:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)calendarDateForYear
{
  void *v3;
  EKCalendarDate *v4;

  -[EKCalendarDate dayComponents](self, "dayComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMonth:", 1);
  objc_msgSend(v3, "setDay:", 1);
  v4 = -[EKCalendarDate initWithDateComponents:calendar:]([EKCalendarDate alloc], "initWithDateComponents:calendar:", v3, self->_calendar);

  return v4;
}

- (id)calendarDateForEndOfYear
{
  void *v2;
  void *v3;
  void *v4;

  -[EKCalendarDate calendarDateForYear](self, "calendarDateForYear");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarDateByAddingYears:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateByAddingSeconds:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)earlierDate:(id)a3
{
  EKCalendarDate *v4;
  void *v5;
  void *v6;
  int v7;
  EKCalendarDate *v8;
  EKCalendarDate *v9;

  v4 = (EKCalendarDate *)a3;
  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate date](v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "CalIsBeforeOrSameAsDate:", v6);

  if (v7)
    v8 = self;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (id)laterDate:(id)a3
{
  EKCalendarDate *v4;
  void *v5;
  void *v6;
  int v7;
  EKCalendarDate *v8;
  EKCalendarDate *v9;

  v4 = (EKCalendarDate *)a3;
  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarDate date](v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "CalIsAfterOrSameAsDate:", v6);

  if (v7)
    v8 = self;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[EKCalendarDate isEqual:](self, "isEqual:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[EKCalendarDate date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "compare:", v7);

  }
  return v5;
}

- (id)calendarDateByAddingGregorianUnits:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setYear:", a3->var0);
  objc_msgSend(v5, "setMonth:", a3->var1);
  objc_msgSend(v5, "setDay:", a3->var2);
  objc_msgSend(v5, "setHour:", a3->var3);
  objc_msgSend(v5, "setMinute:", a3->var4);
  objc_msgSend(v5, "setSecond:", (uint64_t)a3->var5);
  -[EKCalendarDate calendarDateByComponentwiseAddingComponents:](self, "calendarDateByComponentwiseAddingComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- ($0E169193D3AAAEB5DA6AAED42404BC6F)differenceAsGregorianUnits:(SEL)a3 flags:(id)a4
{
  char v5;
  $0E169193D3AAAEB5DA6AAED42404BC6F *result;
  id v8;

  v5 = a5;
  -[EKCalendarDate differenceAsDateComponents:units:](self, "differenceAsDateComponents:units:", a4, 4 * (a5 & 0x3F));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if ((v5 & 1) != 0)
  {
    retstr->var0 = objc_msgSend(v8, "year");
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  retstr->var1 = objc_msgSend(v8, "month");
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  retstr->var2 = objc_msgSend(v8, "day");
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    retstr->var4 = objc_msgSend(v8, "minute");
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  retstr->var3 = objc_msgSend(v8, "hour");
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
LABEL_7:
    retstr->var5 = (double)(int)objc_msgSend(v8, "second");
LABEL_8:

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCacheKey, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
