@implementation INCurrencyAmount

uint64_t __76__INCurrencyAmount_AssistantCardService___acs_formattedStringIncludeSymbol___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_acs_formattedStringIncludeSymbol__sCurrencyFormatter;
  _acs_formattedStringIncludeSymbol__sCurrencyFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_acs_formattedStringIncludeSymbol__sCurrencyFormatter, "setLocale:", v2);

  return objc_msgSend((id)_acs_formattedStringIncludeSymbol__sCurrencyFormatter, "setNumberStyle:", 2);
}

@end
