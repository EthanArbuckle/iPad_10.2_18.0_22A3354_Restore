@implementation PercentNumberFormatter

uint64_t ___PercentNumberFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_PercentNumberFormatter___formatter;
  _PercentNumberFormatter___formatter = (uint64_t)v0;

  objc_msgSend((id)_PercentNumberFormatter___formatter, "setRoundingMode:", 2);
  objc_msgSend((id)_PercentNumberFormatter___formatter, "setNumberStyle:", 3);
  return objc_msgSend((id)_PercentNumberFormatter___formatter, "setMaximumFractionDigits:", 0);
}

@end
