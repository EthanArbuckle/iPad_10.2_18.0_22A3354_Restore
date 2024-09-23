@implementation NSNumberFormatter

uint64_t __55__NSNumberFormatter_HealthKit__hk_wholeNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)hk_wholeNumberFormatter__formatter;
  hk_wholeNumberFormatter__formatter = (uint64_t)v0;

  objc_msgSend((id)hk_wholeNumberFormatter__formatter, "setNumberStyle:", 0);
  objc_msgSend((id)hk_wholeNumberFormatter__formatter, "setRoundingMode:", 6);
  return objc_msgSend((id)hk_wholeNumberFormatter__formatter, "setMaximumFractionDigits:", 0);
}

uint64_t __57__NSNumberFormatter_HealthKit__hk_percentNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)hk_percentNumberFormatter__formatter;
  hk_percentNumberFormatter__formatter = (uint64_t)v0;

  return objc_msgSend((id)hk_percentNumberFormatter__formatter, "setNumberStyle:", 3);
}

uint64_t __64__NSNumberFormatter_HealthKit__hk_percentDecimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)hk_percentDecimalNumberFormatter__formatter;
  hk_percentDecimalNumberFormatter__formatter = (uint64_t)v0;

  objc_msgSend((id)hk_percentDecimalNumberFormatter__formatter, "setNumberStyle:", 1);
  objc_msgSend((id)hk_percentDecimalNumberFormatter__formatter, "setMaximumFractionDigits:", 0);
  return objc_msgSend((id)hk_percentDecimalNumberFormatter__formatter, "setMultiplier:", &unk_1E3892578);
}

@end
