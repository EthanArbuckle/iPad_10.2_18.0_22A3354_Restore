@implementation HKPriorYearsDateFormatterNoTime

uint64_t __HKPriorYearsDateFormatterNoTime_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)HKPriorYearsDateFormatterNoTime___dateFormatter;
  HKPriorYearsDateFormatterNoTime___dateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HKPriorYearsDateFormatterNoTime___dateFormatter, "setLocale:", v2);

  objc_msgSend((id)HKPriorYearsDateFormatterNoTime___dateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)HKPriorYearsDateFormatterNoTime___dateFormatter, "setTimeStyle:", 0);
}

@end
