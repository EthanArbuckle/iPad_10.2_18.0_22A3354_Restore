@implementation HKLastUpdatedSecondaryValueDateFormatter

uint64_t __HKLastUpdatedSecondaryValueDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)HKLastUpdatedSecondaryValueDateFormatter___dateFormatter;
  HKLastUpdatedSecondaryValueDateFormatter___dateFormatter = (uint64_t)v0;

  objc_msgSend((id)HKLastUpdatedSecondaryValueDateFormatter___dateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)HKLastUpdatedSecondaryValueDateFormatter___dateFormatter, "setTimeStyle:", 0);
}

@end
