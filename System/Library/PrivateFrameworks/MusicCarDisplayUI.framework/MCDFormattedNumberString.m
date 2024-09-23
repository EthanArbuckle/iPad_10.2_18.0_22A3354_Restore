@implementation MCDFormattedNumberString

uint64_t __MCDFormattedNumberString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)MCDFormattedNumberString_sNumberFormatter;
  MCDFormattedNumberString_sNumberFormatter = (uint64_t)v0;

  objc_msgSend((id)MCDFormattedNumberString_sNumberFormatter, "setNumberStyle:", 1);
  objc_msgSend((id)MCDFormattedNumberString_sNumberFormatter, "setUsesSignificantDigits:", 0);
  objc_msgSend((id)MCDFormattedNumberString_sNumberFormatter, "setMaximumFractionDigits:", 2);
  return objc_msgSend((id)MCDFormattedNumberString_sNumberFormatter, "setUsesGroupingSeparator:", 1);
}

@end
