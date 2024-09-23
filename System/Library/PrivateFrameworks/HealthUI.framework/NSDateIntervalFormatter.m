@implementation NSDateIntervalFormatter

id __65__NSDateIntervalFormatter_HealthUI__hk_hourDateIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__hourDateIntervalFormatter;
  if (!__hourDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__hourDateIntervalFormatter;
    __hourDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__hourDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__hourDateIntervalFormatter, "setBoundaryStyle:", 2);
    objc_msgSend((id)__hourDateIntervalFormatter, "setDateTemplate:", CFSTR("jj"));
    v0 = (void *)__hourDateIntervalFormatter;
  }
  return v0;
}

id __73__NSDateIntervalFormatter_HealthUI__hk_hourDateIntervalWithDateFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__hourDateIntervalWithDayFormatter;
  if (!__hourDateIntervalWithDayFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__hourDateIntervalWithDayFormatter;
    __hourDateIntervalWithDayFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__hourDateIntervalWithDayFormatter, "setLocale:", v3);

    objc_msgSend((id)__hourDateIntervalWithDayFormatter, "setBoundaryStyle:", 2);
    objc_msgSend((id)__hourDateIntervalWithDayFormatter, "setDateTemplate:", CFSTR("MMMdjj"));
    v0 = (void *)__hourDateIntervalWithDayFormatter;
  }
  return v0;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_hourOnlyDateIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__hourOnlyDateIntervalFormatter;
  if (!__hourOnlyDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__hourOnlyDateIntervalFormatter;
    __hourOnlyDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__hourOnlyDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__hourOnlyDateIntervalFormatter, "setBoundaryStyle:", 2);
    objc_msgSend((id)__hourOnlyDateIntervalFormatter, "setDateTemplate:", CFSTR("j"));
    v0 = (void *)__hourOnlyDateIntervalFormatter;
  }
  return v0;
}

id __75__NSDateIntervalFormatter_HealthUI__hk_hourMinuteOnlyDateIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__hourMinuteOnlyDateIntervalFormatter;
  if (!__hourMinuteOnlyDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__hourMinuteOnlyDateIntervalFormatter;
    __hourMinuteOnlyDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__hourMinuteOnlyDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__hourMinuteOnlyDateIntervalFormatter, "setBoundaryStyle:", 2);
    objc_msgSend((id)__hourMinuteOnlyDateIntervalFormatter, "setDateTemplate:", CFSTR("j:mm a"));
    v0 = (void *)__hourMinuteOnlyDateIntervalFormatter;
  }
  return v0;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_dateTimeDateIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__dateTimeDateIntervalFormatter;
  if (!__dateTimeDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__dateTimeDateIntervalFormatter;
    __dateTimeDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__dateTimeDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__dateTimeDateIntervalFormatter, "setDateTemplate:", CFSTR("MMM d y j:mm a"));
    v0 = (void *)__dateTimeDateIntervalFormatter;
  }
  return v0;
}

id __60__NSDateIntervalFormatter_HealthUI__hk_dayIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__dayDateIntervalFormatter;
  if (!__dayDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__dayDateIntervalFormatter;
    __dayDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__dayDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__dayDateIntervalFormatter, "setDateTemplate:", CFSTR("MMM d y"));
    v0 = (void *)__dayDateIntervalFormatter;
  }
  return v0;
}

id __62__NSDateIntervalFormatter_HealthUI__hk_monthIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__monthDateIntervalFormatter;
  if (!__monthDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__monthDateIntervalFormatter;
    __monthDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__monthDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__monthDateIntervalFormatter, "setDateTemplate:", CFSTR("MMM y"));
    v0 = (void *)__monthDateIntervalFormatter;
  }
  return v0;
}

id __61__NSDateIntervalFormatter_HealthUI__hk_yearIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__yearDateIntervalFormatter;
  if (!__yearDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__yearDateIntervalFormatter;
    __yearDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__yearDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__yearDateIntervalFormatter, "setDateTemplate:", CFSTR("y"));
    v0 = (void *)__yearDateIntervalFormatter;
  }
  return v0;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_monthDayYearIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__monthDayYearDateIntervalFormatter;
  if (!__monthDayYearDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__monthDayYearDateIntervalFormatter;
    __monthDayYearDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__monthDayYearDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__monthDayYearDateIntervalFormatter, "setDateTemplate:", CFSTR("MM/d/yy"));
    v0 = (void *)__monthDayYearDateIntervalFormatter;
  }
  return v0;
}

id __66__NSDateIntervalFormatter_HealthUI__hk_monthYearIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__monthYearDateIntervalFormatter;
  if (!__monthYearDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__monthYearDateIntervalFormatter;
    __monthYearDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__monthYearDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__monthYearDateIntervalFormatter, "setDateTemplate:", CFSTR("MM/yy"));
    v0 = (void *)__monthYearDateIntervalFormatter;
  }
  return v0;
}

id __75__NSDateIntervalFormatter_HealthUI__hk_mediumMonthDayDateIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__mediumMonthDayDateIntervalFormatter;
  if (!__mediumMonthDayDateIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__mediumMonthDayDateIntervalFormatter;
    __mediumMonthDayDateIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__mediumMonthDayDateIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__mediumMonthDayDateIntervalFormatter, "setDateTemplate:", CFSTR("MMMd"));
    v0 = (void *)__mediumMonthDayDateIntervalFormatter;
  }
  return v0;
}

id __72__NSDateIntervalFormatter_HealthUI__hk_mediumDateStyleIntervalFormatter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__mediumDateStyleIntervalFormatter;
  if (!__mediumDateStyleIntervalFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v2 = (void *)__mediumDateStyleIntervalFormatter;
    __mediumDateStyleIntervalFormatter = (uint64_t)v1;

    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableAutoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__mediumDateStyleIntervalFormatter, "setLocale:", v3);

    objc_msgSend((id)__mediumDateStyleIntervalFormatter, "setDateStyle:", 2);
    objc_msgSend((id)__mediumDateStyleIntervalFormatter, "setTimeStyle:", 0);
    v0 = (void *)__mediumDateStyleIntervalFormatter;
  }
  return v0;
}

@end
