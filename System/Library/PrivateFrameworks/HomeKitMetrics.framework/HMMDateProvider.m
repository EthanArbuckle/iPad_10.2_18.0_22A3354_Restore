@implementation HMMDateProvider

- (id)startOfCurrentDay
{
  void *v3;
  void *v4;
  void *v5;

  +[HMMDateProvider gmtCalendar](HMMDateProvider, "gmtCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMDateProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)currentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

+ (NSCalendar)gmtCalendar
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HMMDateProvider_gmtCalendar__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gmtCalendar_onceToken != -1)
    dispatch_once(&gmtCalendar_onceToken, block);
  return (NSCalendar *)(id)gmtCalendar_gmtCalendar;
}

- (HMMDateProvider)init
{
  void *v3;
  HMMDateProvider *v4;

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMDateProvider initWithLocalTimeZone:](self, "initWithLocalTimeZone:", v3);

  return v4;
}

- (HMMDateProvider)initWithLocalTimeZone:(id)a3
{
  id v4;
  HMMDateProvider *v5;
  uint64_t v6;
  NSCalendar *localCalendar;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMDateProvider;
  v5 = -[HMMDateProvider init](&v9, sel_init);
  if (v5)
  {
    +[HMMDateProvider calendarForTimeZone:](HMMDateProvider, "calendarForTimeZone:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    localCalendar = v5->_localCalendar;
    v5->_localCalendar = (NSCalendar *)v6;

  }
  return v5;
}

- (id)startOfDayByAddingDayCount:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HMMDateProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMDateProvider startOfDateByAddingDayCount:toDate:](HMMDateProvider, "startOfDateByAddingDayCount:toDate:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)currentDayNumberOfWeek
{
  void *v2;
  int64_t v3;

  -[HMMDateProvider currentDate](self, "currentDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HMMDateProvider dayNumberOfWeekForDate:](HMMDateProvider, "dayNumberOfWeekForDate:", v2);

  return v3;
}

- (id)startOfCurrentWeek
{
  void *v2;
  void *v3;

  -[HMMDateProvider currentDate](self, "currentDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMDateProvider startOfWeekForDate:](HMMDateProvider, "startOfWeekForDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startOfCurrentMonth
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  +[HMMDateProvider gmtCalendar](HMMDateProvider, "gmtCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  -[HMMDateProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeOfUnit:startDate:interval:forDate:", 8, &v7, 0, v4);
  v5 = v7;

  return v5;
}

- (id)startOfCurrentYear
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  +[HMMDateProvider gmtCalendar](HMMDateProvider, "gmtCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  -[HMMDateProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeOfUnit:startDate:interval:forDate:", 4, &v7, 0, v4);
  v5 = v7;

  return v5;
}

- (int64_t)localHourOfDay
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[HMMDateProvider localCalendar](self, "localCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMDateProvider currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 32, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "hour");
  return v6;
}

- (NSCalendar)localCalendar
{
  return self->_localCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCalendar, 0);
}

+ (HMMDateProvider)sharedInstance
{
  if (sharedInstance__hmf_once_t0_1946 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0_1946, &__block_literal_global_1947);
  return (HMMDateProvider *)(id)sharedInstance__hmf_once_v1_1948;
}

+ (id)dateFromYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setYear:", a3);
  objc_msgSend(v8, "setMonth:", a4);
  objc_msgSend(v8, "setDay:", a5);
  +[HMMDateProvider gmtCalendar](HMMDateProvider, "gmtCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCalendar:", v9);

  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)calendarForTimeZone:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99D48];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v6, "setTimeZone:", v4);

  objc_msgSend(v6, "setFirstWeekday:", 2);
  return v6;
}

+ (id)startOfDayForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "gmtCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)startOfDateByAddingDayCount:(int64_t)a3 toDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0C99D78];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setDay:", a3);
  objc_msgSend(a1, "gmtCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v8, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "gmtCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startOfDayForDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (int64_t)daysFromDate:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "gmtCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "day");
  return v10;
}

+ (int64_t)dayNumberOfWeekForDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "startOfWeekForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "daysFromDate:toDate:", v5, v4);

  return v6 + 1;
}

+ (id)startOfWeekForDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v7;

  v3 = a3;
  +[HMMDateProvider gmtCalendar](HMMDateProvider, "gmtCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v7, 0, v3);

  v5 = v7;
  return v5;
}

void __30__HMMDateProvider_gmtCalendar__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "calendarForTimeZone:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gmtCalendar_gmtCalendar;
  gmtCalendar_gmtCalendar = v2;

}

void __33__HMMDateProvider_sharedInstance__block_invoke()
{
  HMMDateProvider *v0;
  void *v1;

  v0 = objc_alloc_init(HMMDateProvider);
  v1 = (void *)sharedInstance__hmf_once_v1_1948;
  sharedInstance__hmf_once_v1_1948 = (uint64_t)v0;

}

@end
