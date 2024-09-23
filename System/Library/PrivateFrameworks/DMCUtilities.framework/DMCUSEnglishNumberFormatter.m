@implementation DMCUSEnglishNumberFormatter

uint64_t __DMCUSEnglishNumberFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)DMCUSEnglishNumberFormatter_formatter;
  DMCUSEnglishNumberFormatter_formatter = (uint64_t)v0;

  v2 = (void *)DMCUSEnglishNumberFormatter_formatter;
  DMCUSEnglishLocale();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)DMCUSEnglishNumberFormatter_formatter, "setNumberStyle:", 0);
}

@end
