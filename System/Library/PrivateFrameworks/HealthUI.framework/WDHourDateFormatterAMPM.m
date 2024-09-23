@implementation WDHourDateFormatterAMPM

void ___WDHourDateFormatterAMPM_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_WDHourDateFormatterAMPM___dateFormatter;
  _WDHourDateFormatterAMPM___dateFormatter = (uint64_t)v0;

  v2 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", CFSTR("ha"), 0, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_WDHourDateFormatterAMPM___dateFormatter, "setDateFormat:", v4);
}

@end
