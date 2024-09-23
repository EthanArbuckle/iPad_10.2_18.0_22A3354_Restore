@implementation FIUIDateFormattingUtilities

+ (id)timeFormatter
{
  if (timeFormatter_onceToken != -1)
    dispatch_once(&timeFormatter_onceToken, &__block_literal_global_217);
  return (id)timeFormatter___timeFormatter;
}

void __44__FIUIDateFormattingUtilities_timeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)timeFormatter___timeFormatter;
  timeFormatter___timeFormatter = (uint64_t)v0;

  objc_msgSend((id)timeFormatter___timeFormatter, "setDateStyle:", 0);
  FIUIBundle(objc_msgSend((id)timeFormatter___timeFormatter, "setTimeStyle:", 1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AM_SYMBOL_OVERRIDE"), &stru_24CF339D8, CFSTR("Localizable"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v6, "length");
  if (v3)
  {
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("-"));
    if ((v3 & 1) == 0)
      v3 = objc_msgSend((id)timeFormatter___timeFormatter, "setAMSymbol:", v6);
  }
  FIUIBundle(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PM_SYMBOL_OVERRIDE"), &stru_24CF339D8, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", CFSTR("-")) & 1) == 0)
    objc_msgSend((id)timeFormatter___timeFormatter, "setPMSymbol:", v5);
  objc_msgSend((id)timeFormatter___timeFormatter, "fu_observeTimeZoneAndLocaleChanges");

}

+ (id)timeRangeStringFromDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "timeFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeStringWithSpaceRemoved:date:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timeFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timeStringWithSpaceRemoved:date:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TIME_RANGE_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v14, v7, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)timeStringWithSpaceRemoved:(id)a3 date:(id)a4
{
  id v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  objc_msgSend(v5, "stringFromDate:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "AMSymbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR(" %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AMSymbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "PMSymbol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PMSymbol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "AMSymbol");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AMSymbol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "PMSymbol");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR(" %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PMSymbol");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)stringWithLongestStyleDate:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDateStyle:", 3);
  objc_msgSend(v10, "stringFromDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_dateStringFits:font:maxWidth:", v11, v9, a5) & 1) == 0)
  {
    objc_msgSend(v10, "setDateStyle:", 2);
    objc_msgSend(v10, "stringFromDate:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(a1, "_dateStringFits:font:maxWidth:", v12, v9, a5) & 1) != 0)
    {
      v11 = v12;
    }
    else
    {
      objc_msgSend(v10, "setDateStyle:", 1);
      objc_msgSend(v10, "stringFromDate:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v13 = v11;

  return v13;
}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_9);
  return (id)_dateFormatter___dateFormatter;
}

uint64_t __45__FIUIDateFormattingUtilities__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter___dateFormatter;
  _dateFormatter___dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_dateFormatter___dateFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)_dateFormatter___dateFormatter, "fu_observeTimeZoneAndLocaleChanges");
}

+ (BOOL)_dateStringFits:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = *MEMORY[0x24BEBB360];
  v15[0] = a4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sizeWithAttributes:", v10);
  v12 = v11;

  return v12 <= a5;
}

+ (id)stringWithShortStyleDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateStyle:", 1);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_localizedTodayFormatterWithTemplate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v5, "setDateStyle:", 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("'%@'"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v12 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFormatFromTemplate:options:locale:", v4, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(EE+|cc+)"), 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v14, 0, 0, objc_msgSend(v14, "length"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDateFormat:", v16);

  return v11;
}

+ (id)stringWithEitherTodayOrLongStyleDateFromDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t *v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__FIUIDateFormattingUtilities_stringWithEitherTodayOrLongStyleDateFromDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringWithEitherTodayOrLongStyleDateFromDate__onceToken != -1)
    dispatch_once(&stringWithEitherTodayOrLongStyleDateFromDate__onceToken, block);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  v7 = &stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter;
  if (!v6)
    v7 = &stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter;
  objc_msgSend((id)*v7, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __76__FIUIDateFormattingUtilities_stringWithEitherTodayOrLongStyleDateFromDate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_localizedTodayFormatterWithTemplate:", CFSTR("EEEEMMMMdy"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter;
  stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter = v1;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v4 = (void *)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter;
  stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter = (uint64_t)v3;

  objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter, "setDateStyle:", 3);
  objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter, "setDoesRelativeDateFormatting:", 0);
  objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter, "fu_observeTimeZoneAndLocaleChanges");
  return objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter, "fu_observeTimeZoneAndLocaleChanges");
}

+ (id)stringWithDayNameAndShortMonthFromDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t *v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__FIUIDateFormattingUtilities_stringWithDayNameAndShortMonthFromDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringWithDayNameAndShortMonthFromDate__onceToken != -1)
    dispatch_once(&stringWithDayNameAndShortMonthFromDate__onceToken, block);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  v7 = &stringWithDayNameAndShortMonthFromDate____todayFormatter;
  if (!v6)
    v7 = &stringWithDayNameAndShortMonthFromDate____notTodayFormatter;
  objc_msgSend((id)*v7, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __70__FIUIDateFormattingUtilities_stringWithDayNameAndShortMonthFromDate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_localizedTodayFormatterWithTemplate:", CFSTR("EEEEMMMdy"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stringWithDayNameAndShortMonthFromDate____todayFormatter;
  stringWithDayNameAndShortMonthFromDate____todayFormatter = v1;

  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v4 = (void *)stringWithDayNameAndShortMonthFromDate____notTodayFormatter;
  stringWithDayNameAndShortMonthFromDate____notTodayFormatter = (uint64_t)v3;

  v5 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("EEEEMMMdy"), 0, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter, "setFormattingContext:", 2);
  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter, "setDateFormat:", v7);
  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____todayFormatter, "fu_observeTimeZoneAndLocaleChanges");
  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter, "fu_observeTimeZoneAndLocaleChanges");

}

@end
