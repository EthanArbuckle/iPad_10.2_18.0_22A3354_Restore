@implementation HKActiveEnergyIntegerNumberFormatter

uint64_t __HKActiveEnergyIntegerNumberFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)HKActiveEnergyIntegerNumberFormatter___integerNumberFormatter;
  HKActiveEnergyIntegerNumberFormatter___integerNumberFormatter = (uint64_t)v0;

  objc_msgSend((id)HKActiveEnergyIntegerNumberFormatter___integerNumberFormatter, "setNumberStyle:", 1);
  objc_msgSend((id)HKActiveEnergyIntegerNumberFormatter___integerNumberFormatter, "setRoundingMode:", 2);
  return objc_msgSend((id)HKActiveEnergyIntegerNumberFormatter___integerNumberFormatter, "setMaximumFractionDigits:", 0);
}

@end
