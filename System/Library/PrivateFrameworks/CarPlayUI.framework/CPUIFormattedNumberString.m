@implementation CPUIFormattedNumberString

uint64_t __CPUIFormattedNumberString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)CPUIFormattedNumberString_sNumberFormatter;
  CPUIFormattedNumberString_sNumberFormatter = (uint64_t)v0;

  objc_msgSend((id)CPUIFormattedNumberString_sNumberFormatter, "setNumberStyle:", 1);
  objc_msgSend((id)CPUIFormattedNumberString_sNumberFormatter, "setUsesSignificantDigits:", 0);
  objc_msgSend((id)CPUIFormattedNumberString_sNumberFormatter, "setMaximumFractionDigits:", 2);
  return objc_msgSend((id)CPUIFormattedNumberString_sNumberFormatter, "setUsesGroupingSeparator:", 1);
}

@end
