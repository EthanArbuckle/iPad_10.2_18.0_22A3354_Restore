@implementation GenerateDateFormatterDayHourMinute

id ___GenerateDateFormatterDayHourMinute_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = (void *)__dayHourMinuteFormatter;
  if (!__dayHourMinuteFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__dayHourMinuteFormatter;
    __dayHourMinuteFormatter = (uint64_t)v1;

    v3 = (void *)__dayHourMinuteFormatter;
    v4 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("ccc j:mm a"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v6);

    v0 = (void *)__dayHourMinuteFormatter;
  }
  return v0;
}

@end
