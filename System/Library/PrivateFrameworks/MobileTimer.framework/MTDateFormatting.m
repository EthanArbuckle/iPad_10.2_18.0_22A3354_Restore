@implementation MTDateFormatting

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  return (id)sharedInstance_sSharedFormatter;
}

- (BOOL)timeDesignatorAppearsBeforeTime
{
  return self->_timeDesignatorAppearsBeforeTime;
}

- (id)localizedTimeStringFromDate:(id)a3 forTimeZone:(id)a4 timeDesignator:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[MTDateFormatting _timeOnlyFormatter](self, "_timeOnlyFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToTimeZone:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_msgSend(v11, "copy");

      objc_msgSend(v14, "setTimeZone:", v9);
      v11 = v14;
    }
  }
  if (a5)
  {
    -[MTDateFormatting timeDesignatorForDate:timeZone:](self, "timeDesignatorForDate:timeZone:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "stringFromDate:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)timeDesignatorForDate:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (self->_use24HourTime)
  {
    v8 = &stru_1E39CF258;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
      objc_msgSend(v9, "setTimeZone:", v7);
    if (objc_msgSend(v10, "component:fromDate:", 32, v6) < 12)
      -[MTDateFormatting amString](self, "amString");
    else
      -[MTDateFormatting pmString](self, "pmString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)amString
{
  NSString *amString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  amString = self->_amString;
  if (!amString)
  {
    -[MTDateFormatting _dateOnlyFormatter](self, "_dateOnlyFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AMSymbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_amString;
    self->_amString = v6;

    amString = self->_amString;
  }
  return amString;
}

- (id)_timeOnlyFormatter
{
  NSDateFormatter *timeOnlyFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  timeOnlyFormatter = self->_timeOnlyFormatter;
  if (!timeOnlyFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_timeOnlyFormatter;
    self->_timeOnlyFormatter = v4;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_timeOnlyFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
    timeOnlyFormatter = self->_timeOnlyFormatter;
  }
  return timeOnlyFormatter;
}

- (id)_dateOnlyFormatter
{
  NSDateFormatter *dateOnlyFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dateOnlyFormatter = self->_dateOnlyFormatter;
  if (!dateOnlyFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dateOnlyFormatter;
    self->_dateOnlyFormatter = v4;

    v6 = self->_dateOnlyFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setDateStyle:](self->_dateOnlyFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](self->_dateOnlyFormatter, "setTimeStyle:", 0);
    dateOnlyFormatter = self->_dateOnlyFormatter;
  }
  return dateOnlyFormatter;
}

void __34__MTDateFormatting_sharedInstance__block_invoke()
{
  MTDateFormatting *v0;
  void *v1;

  v0 = objc_alloc_init(MTDateFormatting);
  v1 = (void *)sharedInstance_sSharedFormatter;
  sharedInstance_sSharedFormatter = (uint64_t)v0;

}

- (MTDateFormatting)init
{
  MTDateFormatting *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTDateFormatting;
  v2 = -[MTDateFormatting init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__reloadLocaleInfo, *MEMORY[0x1E0C99720], 0);

    -[MTDateFormatting _loadLocaleInfo](v2, "_loadLocaleInfo");
  }
  return v2;
}

- (void)_loadLocaleInfo
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v11, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v11, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;
  self->_use24HourTime = v5;
  v6 = objc_msgSend(v11, "rangeOfString:", CFSTR("a"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    v9 = objc_msgSend(v11, "rangeOfString:options:", CFSTR("h"), 1);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = objc_msgSend(v11, "rangeOfString:options:", CFSTR("k"), 1);
    v7 = v9 != 0x7FFFFFFFFFFFFFFFLL && v8 < v9;
  }
  self->_timeDesignatorAppearsBeforeTime = v7;

}

- (void)dealloc
{
  objc_super v3;

  -[MTDateFormatting _clearLocaleDependentState](self, "_clearLocaleDependentState");
  v3.receiver = self;
  v3.super_class = (Class)MTDateFormatting;
  -[MTDateFormatting dealloc](&v3, sel_dealloc);
}

- (void)_clearLocaleDependentState
{
  NSString *amString;
  NSString *pmString;
  NSDateFormatter *dateOnlyFormatter;
  NSDateFormatter *timeOnlyFormatter;

  amString = self->_amString;
  self->_amString = 0;

  pmString = self->_pmString;
  self->_pmString = 0;

  dateOnlyFormatter = self->_dateOnlyFormatter;
  self->_dateOnlyFormatter = 0;

  timeOnlyFormatter = self->_timeOnlyFormatter;
  self->_timeOnlyFormatter = 0;

}

- (void)_reloadLocaleInfo
{
  id v3;

  -[MTDateFormatting _clearLocaleDependentState](self, "_clearLocaleDependentState");
  -[MTDateFormatting _loadLocaleInfo](self, "_loadLocaleInfo");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MTDateFormattingLocaleDidChangeNotification"), 0);

}

- (NSString)pmString
{
  NSString *pmString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  pmString = self->_pmString;
  if (!pmString)
  {
    -[MTDateFormatting _dateOnlyFormatter](self, "_dateOnlyFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PMSymbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_pmString;
    self->_pmString = v6;

    pmString = self->_pmString;
  }
  return pmString;
}

- (id)localizedTimeStringFromDate:(id)a3 timeDesignator:(id *)a4
{
  return -[MTDateFormatting localizedTimeStringFromDate:forTimeZone:timeDesignator:](self, "localizedTimeStringFromDate:forTimeZone:timeDesignator:", a3, 0, a4);
}

- (id)timeDesignatorForDate:(id)a3
{
  return -[MTDateFormatting timeDesignatorForDate:timeZone:](self, "timeDesignatorForDate:timeZone:", a3, 0);
}

- (BOOL)use24HourTime
{
  return self->_use24HourTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOnlyFormatter, 0);
  objc_storeStrong((id *)&self->_dateOnlyFormatter, 0);
  objc_storeStrong((id *)&self->_pmString, 0);
  objc_storeStrong((id *)&self->_amString, 0);
}

@end
