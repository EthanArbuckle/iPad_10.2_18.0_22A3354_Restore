@implementation ACHFormatDuration

uint64_t __ACHFormatDuration_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)ACHFormatDuration__formatter;
  ACHFormatDuration__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatDuration__formatter, "setUnitsStyle:", 0);
  objc_msgSend((id)ACHFormatDuration__formatter, "setAllowedUnits:", 224);
  return objc_msgSend((id)ACHFormatDuration__formatter, "setZeroFormattingBehavior:", 0x10000);
}

@end
