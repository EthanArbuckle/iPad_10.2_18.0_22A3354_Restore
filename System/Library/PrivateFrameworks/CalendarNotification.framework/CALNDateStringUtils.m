@implementation CALNDateStringUtils

+ (id)dateTimeStringForEventDate:(id)a3 alwaysIncludeDate:(BOOL)a4 allDayEvent:(BOOL)a5 dateProvider:(id)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v9 = a3;
  objc_msgSend(a6, "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  if (a4 || v11 < 0.0 || v11 >= 43200.0)
  {
    v13 = (void *)objc_opt_class();
    if (v7)
      objc_msgSend(v13, "_allDayFormatter");
    else
      objc_msgSend(v13, "_dateTimeFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v9, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_allDayFormatter
{
  if (_allDayFormatter_onceToken != -1)
    dispatch_once(&_allDayFormatter_onceToken, &__block_literal_global_4);
  return (id)_allDayFormatter_allDayFormatter;
}

uint64_t __39__CALNDateStringUtils__allDayFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_allDayFormatter_allDayFormatter;
  _allDayFormatter_allDayFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_allDayFormatter_allDayFormatter, "setLocale:", v2);

  objc_msgSend((id)_allDayFormatter_allDayFormatter, "setDateStyle:", 3);
  objc_msgSend((id)_allDayFormatter_allDayFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)_allDayFormatter_allDayFormatter, "setDoesRelativeDateFormatting:", 1);
}

+ (id)_dateTimeFormatter
{
  if (_dateTimeFormatter_onceToken != -1)
    dispatch_once(&_dateTimeFormatter_onceToken, &__block_literal_global_2);
  return (id)_dateTimeFormatter_dateTimeFormatter;
}

uint64_t __41__CALNDateStringUtils__dateTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateTimeFormatter_dateTimeFormatter;
  _dateTimeFormatter_dateTimeFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dateTimeFormatter_dateTimeFormatter, "setLocale:", v2);

  objc_msgSend((id)_dateTimeFormatter_dateTimeFormatter, "setDateStyle:", 3);
  objc_msgSend((id)_dateTimeFormatter_dateTimeFormatter, "setTimeStyle:", 1);
  return objc_msgSend((id)_dateTimeFormatter_dateTimeFormatter, "setDoesRelativeDateFormatting:", 1);
}

@end
