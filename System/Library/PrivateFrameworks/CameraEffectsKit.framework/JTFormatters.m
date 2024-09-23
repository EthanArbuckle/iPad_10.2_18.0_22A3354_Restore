@implementation JTFormatters

+ (id)dateFormatter
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormattersDateFormatterKeyForCurrentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setDateStyle:", 2);
    objc_msgSend(v4, "setTimeStyle:", 0);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FormattersDateFormatterKeyForCurrentThread"));
  }

  return v4;
}

+ (id)dateFormatterLongStyle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormattersDateFormatterLongStyleKeyForCurrentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setDateStyle:", 3);
    objc_msgSend(v4, "setTimeStyle:", 0);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FormattersDateFormatterLongStyleKeyForCurrentThread"));
  }

  return v4;
}

+ (id)dateFormatterMonthDay
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormattersDateFormatterMonthDayKeyForCurrentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMd"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FormattersDateFormatterMonthDayKeyForCurrentThread"));
  }

  return v4;
}

+ (id)dateFormatterDayOfWeekMonthDayYear
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormattersDateFormatterDayOfWeekMonthDayYearKeyForCurrentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", CFSTR("EMMMdyyyy"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FormattersDateFormatterDayOfWeekMonthDayYearKeyForCurrentThread"));
  }

  return v4;
}

+ (id)dateFormatterDebugDate
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormattersDateFormatterDebugDateForCurrentThread"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FormattersDateFormatterDebugDateForCurrentThread"));
  }

  return v4;
}

+ (id)dateComponentsFormatterHourMinSec
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DateComponentsFormatterHourMinSecKeyForCurrentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setUnitsStyle:", 0);
    objc_msgSend(v4, "setAllowedUnits:", 224);
    objc_msgSend(v4, "setFormattingContext:", 2);
    objc_msgSend(v4, "setMaximumUnitCount:", 3);
    objc_msgSend(v4, "setZeroFormattingBehavior:", 0);
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("DateComponentsFormatterHourMinSecKeyForCurrentThread"));

  }
  return v4;
}

+ (id)dateComponentsFormatterMinSec
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDateComponentsFormatterMinSecKeyForCurrentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setUnitsStyle:", 0);
    objc_msgSend(v4, "setAllowedUnits:", 192);
    objc_msgSend(v4, "setFormattingContext:", 2);
    objc_msgSend(v4, "setMaximumUnitCount:", 2);
    objc_msgSend(v4, "setZeroFormattingBehavior:", 0x10000);
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("kDateComponentsFormatterMinSecKeyForCurrentThread"));

  }
  return v4;
}

@end
