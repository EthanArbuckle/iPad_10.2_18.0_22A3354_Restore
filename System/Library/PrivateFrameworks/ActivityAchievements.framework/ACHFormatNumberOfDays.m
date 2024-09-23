@implementation ACHFormatNumberOfDays

uint64_t __ACHFormatNumberOfDays_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)ACHFormatNumberOfDays__formatter;
  ACHFormatNumberOfDays__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatNumberOfDays__formatter, "setUnitsStyle:", 3);
  return objc_msgSend((id)ACHFormatNumberOfDays__formatter, "setAllowedUnits:", 16);
}

@end
