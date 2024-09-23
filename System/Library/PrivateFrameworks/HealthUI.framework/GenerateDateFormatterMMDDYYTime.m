@implementation GenerateDateFormatterMMDDYYTime

id ___GenerateDateFormatterMMDDYYTime_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = (void *)__MMDDYYTimeFormatter;
  if (!__MMDDYYTimeFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__MMDDYYTimeFormatter;
    __MMDDYYTimeFormatter = (uint64_t)v1;

    v3 = (void *)__MMDDYYTimeFormatter;
    v4 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("M/d/yy j:mm a"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v6);

    v0 = (void *)__MMDDYYTimeFormatter;
  }
  return v0;
}

@end
