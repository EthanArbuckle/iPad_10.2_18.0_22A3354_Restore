@implementation GenerateDateFormatterMonthDateYear

id ___GenerateDateFormatterMonthDateYear_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)__monthDateYearFormatter;
  if (!__monthDateYearFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v2 = (void *)__monthDateYearFormatter;
    __monthDateYearFormatter = (uint64_t)v1;

    v3 = (void *)__monthDateYearFormatter;
    CPDateFormatStringForFormatType();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateFormat:", v4);

    v0 = (void *)__monthDateYearFormatter;
  }
  return v0;
}

@end
