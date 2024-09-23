@implementation NSDate(ITK)

- (uint64_t)itk_isToday
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToDate:", v7);

  return v8;
}

- (uint64_t)itk_isYesterday
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setDay:", -1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "isEqualToDate:", v9);
  return v10;
}

- (uint64_t)itk_localDateWithSeconds
{
  if (itk_localDateWithSeconds_localFormatterOnceToken != -1)
    dispatch_once(&itk_localDateWithSeconds_localFormatterOnceToken, &__block_literal_global_1);
  return objc_msgSend((id)itk_localDateWithSeconds_localFormatter, "stringFromDate:", a1);
}

- (id)itk_shortFormattedDate
{
  uint64_t *v2;

  if ((objc_msgSend(a1, "itk_isToday") & 1) != 0 || objc_msgSend(a1, "itk_isYesterday"))
  {
    if (itk_shortFormattedDate_shortRelativeOnceToken != -1)
      dispatch_once(&itk_shortFormattedDate_shortRelativeOnceToken, &__block_literal_global_4);
    v2 = &itk_shortFormattedDate_shortRelativeformatter;
  }
  else
  {
    if (itk_shortFormattedDate_shortStandardOnceToken != -1)
      dispatch_once(&itk_shortFormattedDate_shortStandardOnceToken, &__block_literal_global_5);
    v2 = &itk_shortFormattedDate_shortStandardformatter;
  }
  objc_msgSend((id)*v2, "stringFromDate:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)itk_briefFormattedDate
{
  return objc_msgSend(a1, "itk_briefFormattedDate:", 0);
}

- (uint64_t)itk_briefFormattedDateForAccessibility
{
  return objc_msgSend(a1, "itk_briefFormattedDate:", 1);
}

- (id)itk_briefFormattedDate:()ITK
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;

  v4 = a1;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  if (objc_msgSend(v4, "itk_isToday"))
  {
    if (itk_briefFormattedDate__briefTodayOnceToken != -1)
      dispatch_once(&itk_briefFormattedDate__briefTodayOnceToken, &__block_literal_global_6);
    objc_msgSend((id)itk_briefFormattedDate__briefTodayFormatter, "stringFromDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 28, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, -1, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "compare:", v13) == 1 || objc_msgSend(v4, "compare:", v14) != 1)
    {
      if (a3)
      {
        if (itk_briefFormattedDate__templateOnceToken_10 != -1)
          dispatch_once(&itk_briefFormattedDate__templateOnceToken_10, &__block_literal_global_11);
        v15 = &itk_briefFormattedDate__accessibilityDateFormatter;
      }
      else
      {
        if (itk_briefFormattedDate__briefRelativeOnceToken != -1)
          dispatch_once(&itk_briefFormattedDate__briefRelativeOnceToken, &__block_literal_global_12);
        v15 = &itk_briefFormattedDate__briefRelativeFormatter;
      }
    }
    else
    {
      if (itk_briefFormattedDate__templateOnceToken != -1)
        dispatch_once(&itk_briefFormattedDate__templateOnceToken, &__block_literal_global_7);
      v15 = &itk_briefFormattedDate__templateFormatter;
    }
    objc_msgSend((id)*v15, "stringFromDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)itk_isEarlierThanDate:()ITK
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)itk_isLaterThanDate:()ITK
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end
