@implementation UTCDateFormatter

- (UTCDateFormatter)initWithDateCache:(id)a3
{
  id v5;
  UTCDateFormatter *v6;
  UTCDateFormatter *v7;
  NSDateFormatter *v8;
  NSDateFormatter *monthDayYearFormatter;
  NSDateFormatter *v10;
  void *v11;
  NSDateFormatter *v12;
  NSDateFormatter *shortMonthDayFormatter;
  NSDateFormatter *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDateFormatter *v19;
  NSDateFormatter *shortMonthYearFormatter;
  NSDateFormatter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDateFormatter *v26;
  NSDateFormatter *todayFormatter;
  NSDateFormatter *v28;
  void *v29;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)UTCDateFormatter;
  v6 = -[UTCDateFormatter init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateCache, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthDayYearFormatter = v7->_monthDayYearFormatter;
    v7->_monthDayYearFormatter = v8;

    v10 = v7->_monthDayYearFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v10, "setTimeZone:", v11);

    -[NSDateFormatter setDateStyle:](v7->_monthDayYearFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v7->_monthDayYearFormatter, "setTimeStyle:", 0);
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    shortMonthDayFormatter = v7->_shortMonthDayFormatter;
    v7->_shortMonthDayFormatter = v12;

    v14 = v7->_shortMonthDayFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v14, "setTimeZone:", v15);

    v16 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateFormatFromTemplate:options:locale:", CFSTR("MMM d"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDateFormatter setDateFormat:](v7->_shortMonthDayFormatter, "setDateFormat:", v18);
    v19 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    shortMonthYearFormatter = v7->_shortMonthYearFormatter;
    v7->_shortMonthYearFormatter = v19;

    v21 = v7->_shortMonthYearFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v21, "setTimeZone:", v22);

    v23 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateFormatFromTemplate:options:locale:", CFSTR("MMM y"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDateFormatter setDateFormat:](v7->_shortMonthYearFormatter, "setDateFormat:", v25);
    v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    todayFormatter = v7->_todayFormatter;
    v7->_todayFormatter = v26;

    v28 = v7->_todayFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v28, "setTimeZone:", v29);

    -[NSDateFormatter setDateStyle:](v7->_todayFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v7->_todayFormatter, "setDoesRelativeDateFormatting:", 1);

  }
  return v7;
}

- (id)relativeStringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  -[UTCDateFormatter dateCache](self, "dateCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDateInToday:", v4))
  {

LABEL_4:
    v8 = 32;
    goto LABEL_7;
  }
  -[UTCDateFormatter dateCache](self, "dateCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDateInYesterday:", v4);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "component:fromDate:", 4, v10);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "component:fromDate:", 4, v4);

  v8 = 24;
  if (v13 == v11)
    v8 = 16;
LABEL_7:
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "stringFromDate:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDateFormatter)monthDayYearFormatter
{
  return self->_monthDayYearFormatter;
}

- (NSDateFormatter)shortMonthDayFormatter
{
  return self->_shortMonthDayFormatter;
}

- (NSDateFormatter)shortMonthYearFormatter
{
  return self->_shortMonthYearFormatter;
}

- (NSDateFormatter)todayFormatter
{
  return self->_todayFormatter;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_todayFormatter, 0);
  objc_storeStrong((id *)&self->_shortMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_shortMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayYearFormatter, 0);
}

@end
