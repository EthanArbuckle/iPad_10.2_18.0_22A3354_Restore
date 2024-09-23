@implementation SGUIDateFormatting

+ (id)allDayFormatter
{
  if (allDayFormatter_onceToken != -1)
    dispatch_once(&allDayFormatter_onceToken, &__block_literal_global_837);
  return (id)allDayFormatter_allDayFormatter;
}

+ (id)fullDayFormatter
{
  if (fullDayFormatter_onceToken != -1)
    dispatch_once(&fullDayFormatter_onceToken, &__block_literal_global_1);
  return (id)fullDayFormatter_fullDateFormatter;
}

+ (id)fullDayTimeFormatter
{
  if (fullDayTimeFormatter_onceToken != -1)
    dispatch_once(&fullDayTimeFormatter_onceToken, &__block_literal_global_2);
  return (id)fullDayTimeFormatter_fullDateFormatter;
}

+ (id)singleDayDateFormatter
{
  if (singleDayDateFormatter_onceToken != -1)
    dispatch_once(&singleDayDateFormatter_onceToken, &__block_literal_global_3);
  return (id)singleDayDateFormatter_formatter;
}

+ (id)singleDayTimeFormatter
{
  if (singleDayTimeFormatter_onceToken != -1)
    dispatch_once(&singleDayTimeFormatter_onceToken, &__block_literal_global_4);
  return (id)singleDayTimeFormatter_formatter;
}

+ (id)multiDayDateFormatter
{
  if (multiDayDateFormatter_onceToken != -1)
    dispatch_once(&multiDayDateFormatter_onceToken, &__block_literal_global_5);
  return (id)multiDayDateFormatter_formatter;
}

+ (id)mediumDateFormatter
{
  if (mediumDateFormatter_onceToken != -1)
    dispatch_once(&mediumDateFormatter_onceToken, &__block_literal_global_6);
  return (id)mediumDateFormatter_formatter;
}

+ (id)reminderDateFormatter
{
  if (reminderDateFormatter_onceToken != -1)
    dispatch_once(&reminderDateFormatter_onceToken, &__block_literal_global_7);
  return (id)reminderDateFormatter_reminderDateFormatter;
}

+ (id)reminderDateTimeFormatter
{
  if (reminderDateTimeFormatter_onceToken != -1)
    dispatch_once(&reminderDateTimeFormatter_onceToken, &__block_literal_global_8);
  return (id)reminderDateTimeFormatter_reminderDateFormatter;
}

+ (id)reminderAllDayDateFormatter
{
  if (reminderAllDayDateFormatter_onceToken != -1)
    dispatch_once(&reminderAllDayDateFormatter_onceToken, &__block_literal_global_9);
  return (id)reminderAllDayDateFormatter_reminderAllDayDateFormatter;
}

+ (id)birthdayFormatter
{
  __CFString *v2;
  id v3;
  _QWORD block[4];
  const __CFString *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SGUIDateFormatting_birthdayFormatter__block_invoke;
  block[3] = &unk_1E62D70D0;
  v6 = CFSTR("MMMMd");
  if (birthdayFormatter_onceToken == -1)
  {
    v2 = CFSTR("MMMMd");
  }
  else
  {
    dispatch_once(&birthdayFormatter_onceToken, block);
    v2 = (__CFString *)v6;
  }
  v3 = (id)birthdayFormatter_birthdayFormatter;

  return v3;
}

uint64_t __39__SGUIDateFormatting_birthdayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = (void *)birthdayFormatter_birthdayFormatter;
  birthdayFormatter_birthdayFormatter = v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)birthdayFormatter_birthdayFormatter, "setLocale:", v4);

  return objc_msgSend((id)birthdayFormatter_birthdayFormatter, "setLocalizedDateFormatFromTemplate:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__SGUIDateFormatting_reminderAllDayDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)reminderAllDayDateFormatter_reminderAllDayDateFormatter;
  reminderAllDayDateFormatter_reminderAllDayDateFormatter = v0;

  objc_msgSend((id)reminderAllDayDateFormatter_reminderAllDayDateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)reminderAllDayDateFormatter_reminderAllDayDateFormatter, "setDateStyle:", 1);
}

uint64_t __47__SGUIDateFormatting_reminderDateTimeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)reminderDateTimeFormatter_reminderDateFormatter;
  reminderDateTimeFormatter_reminderDateFormatter = v0;

  objc_msgSend((id)reminderDateTimeFormatter_reminderDateFormatter, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)reminderDateTimeFormatter_reminderDateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)reminderDateTimeFormatter_reminderDateFormatter, "setTimeStyle:", 1);
}

uint64_t __43__SGUIDateFormatting_reminderDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)reminderDateFormatter_reminderDateFormatter;
  reminderDateFormatter_reminderDateFormatter = v0;

  objc_msgSend((id)reminderDateFormatter_reminderDateFormatter, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)reminderDateFormatter_reminderDateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)reminderDateFormatter_reminderDateFormatter, "setTimeStyle:", 1);
}

uint64_t __41__SGUIDateFormatting_mediumDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)mediumDateFormatter_formatter;
  mediumDateFormatter_formatter = v0;

  objc_msgSend((id)mediumDateFormatter_formatter, "setDateStyle:", 2);
  return objc_msgSend((id)mediumDateFormatter_formatter, "setTimeStyle:", 0);
}

uint64_t __43__SGUIDateFormatting_multiDayDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)multiDayDateFormatter_formatter;
  multiDayDateFormatter_formatter = v0;

  objc_msgSend((id)multiDayDateFormatter_formatter, "setDateStyle:", 3);
  return objc_msgSend((id)multiDayDateFormatter_formatter, "setTimeStyle:", 1);
}

uint64_t __44__SGUIDateFormatting_singleDayTimeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)singleDayTimeFormatter_formatter;
  singleDayTimeFormatter_formatter = v0;

  objc_msgSend((id)singleDayTimeFormatter_formatter, "setDateStyle:", 0);
  return objc_msgSend((id)singleDayTimeFormatter_formatter, "setTimeStyle:", 1);
}

uint64_t __44__SGUIDateFormatting_singleDayDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)singleDayDateFormatter_formatter;
  singleDayDateFormatter_formatter = v0;

  objc_msgSend((id)singleDayDateFormatter_formatter, "setDateStyle:", 2);
  return objc_msgSend((id)singleDayDateFormatter_formatter, "setTimeStyle:", 0);
}

uint64_t __42__SGUIDateFormatting_fullDayTimeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fullDayTimeFormatter_fullDateFormatter;
  fullDayTimeFormatter_fullDateFormatter = v0;

  objc_msgSend((id)fullDayTimeFormatter_fullDateFormatter, "setDateStyle:", 0);
  return objc_msgSend((id)fullDayTimeFormatter_fullDateFormatter, "setTimeStyle:", 1);
}

uint64_t __38__SGUIDateFormatting_fullDayFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fullDayFormatter_fullDateFormatter;
  fullDayFormatter_fullDateFormatter = v0;

  objc_msgSend((id)fullDayFormatter_fullDateFormatter, "setDateStyle:", 3);
  return objc_msgSend((id)fullDayFormatter_fullDateFormatter, "setTimeStyle:", 1);
}

uint64_t __37__SGUIDateFormatting_allDayFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)allDayFormatter_allDayFormatter;
  allDayFormatter_allDayFormatter = v0;

  objc_msgSend((id)allDayFormatter_allDayFormatter, "setDateStyle:", 3);
  return objc_msgSend((id)allDayFormatter_allDayFormatter, "setTimeStyle:", 0);
}

@end
