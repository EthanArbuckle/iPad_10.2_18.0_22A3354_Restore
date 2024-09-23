@implementation INPriceRange

uint64_t __62__INPriceRange_AssistantCardService__acs_formattedRangeString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter;
  acs_formattedRangeString_minimumPriceRangeCurrencyFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter, "setLocale:", v2);

  objc_msgSend((id)acs_formattedRangeString_minimumPriceRangeCurrencyFormatter, "setNumberStyle:", 2);
  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v4 = (void *)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter;
  acs_formattedRangeString_maximumPriceRangeCurrencyFormatter = (uint64_t)v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter, "setLocale:", v5);

  return objc_msgSend((id)acs_formattedRangeString_maximumPriceRangeCurrencyFormatter, "setNumberStyle:", 2);
}

@end
