@implementation GenerateDateFormatterMMDDTime

id ___GenerateDateFormatterMMDDTime_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = (void *)__MMDDTimeFormatter;
  if (!__MMDDTimeFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__MMDDTimeFormatter;
    __MMDDTimeFormatter = (uint64_t)v1;

    v3 = (void *)__MMDDTimeFormatter;
    v4 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("M/d j:mm a"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v6);

    v0 = (void *)__MMDDTimeFormatter;
  }
  return v0;
}

@end
