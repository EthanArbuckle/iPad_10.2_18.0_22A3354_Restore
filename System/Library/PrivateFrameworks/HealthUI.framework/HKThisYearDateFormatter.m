@implementation HKThisYearDateFormatter

id __HKThisYearDateFormatter_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v0 = (void *)__thisYearDateFormatter;
  if (!__thisYearDateFormatter)
  {
    _timeFormatString();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MMM d, %@"), v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", v2, 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v7 = (void *)__thisYearDateFormatter;
    __thisYearDateFormatter = (uint64_t)v6;

    objc_msgSend((id)__thisYearDateFormatter, "setDateFormat:", v5);
    v0 = (void *)__thisYearDateFormatter;
  }
  return v0;
}

@end
