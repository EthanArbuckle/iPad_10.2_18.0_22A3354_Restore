@implementation GenerateDateFormatterLongMonthDate

id ___GenerateDateFormatterLongMonthDate_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)__longMonthDateFormatter;
  if (!__longMonthDateFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__longMonthDateFormatter;
    __longMonthDateFormatter = (uint64_t)v1;

    v3 = (void *)__longMonthDateFormatter;
    CPDateFormatStringForFormatType();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v4);

    v0 = (void *)__longMonthDateFormatter;
  }
  return v0;
}

@end
