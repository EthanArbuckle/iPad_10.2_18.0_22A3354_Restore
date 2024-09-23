@implementation HKTimeFormatter

id __HKTimeFormatter_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v0 = (void *)__timeFormatter;
  if (!__timeFormatter)
  {
    _timeFormatString();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", v1, 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)__timeFormatter;
    __timeFormatter = (uint64_t)v5;

    objc_msgSend((id)__timeFormatter, "setDateFormat:", v4);
    v0 = (void *)__timeFormatter;
  }
  return v0;
}

@end
