@implementation GenerateDateFormatterYearShort

id ___GenerateDateFormatterYearShort_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = (void *)__yearShortFormatter;
  if (!__yearShortFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__yearShortFormatter;
    __yearShortFormatter = (uint64_t)v1;

    v3 = (void *)__yearShortFormatter;
    v4 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFormatFromTemplate:options:locale:", CFSTR("yy"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v6);

    v0 = (void *)__yearShortFormatter;
  }
  return v0;
}

@end
