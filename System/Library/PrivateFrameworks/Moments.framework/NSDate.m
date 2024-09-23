@implementation NSDate

uint64_t __37__NSDate_MOExtensions__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dateFormatter_dateFormatter, "setLocale:", v2);

  objc_msgSend((id)dateFormatter_dateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)dateFormatter_dateFormatter, "setTimeStyle:", 3);
}

void __49__NSDate_MOExtensions__dayNameFormatterInEnglish__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)dayNameFormatterInEnglish_dateFormatter;
  dayNameFormatterInEnglish_dateFormatter = v0;

  objc_msgSend((id)dayNameFormatterInEnglish_dateFormatter, "setDateFormat:", CFSTR("EEEE"));
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend((id)dayNameFormatterInEnglish_dateFormatter, "setLocale:", v2);

}

uint64_t __51__NSDate_MOExtensions__relativeBundleDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)relativeBundleDateFormatter_dateFormatter;
  relativeBundleDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setLocale:", v2);

  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setDateStyle:", 4);
  objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)relativeBundleDateFormatter_dateFormatter, "setFormattingContext:", 5);
}

void __41__NSDate_MOExtensions__monthDayFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_opt_new();
  v1 = (void *)monthDayFormatter_dateFormatter;
  monthDayFormatter_dateFormatter = v0;

  v2 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFormatFromTemplate:options:locale:", CFSTR("MM/dd"), 0, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)monthDayFormatter_dateFormatter, "setDateFormat:", v4);
}

@end
