@implementation MCUSEnglishNumberFormatter

uint64_t __MCUSEnglishNumberFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)MCUSEnglishNumberFormatter_formatter;
  MCUSEnglishNumberFormatter_formatter = (uint64_t)v0;

  v2 = (void *)MCUSEnglishNumberFormatter_formatter;
  MCUSEnglishLocale();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)MCUSEnglishNumberFormatter_formatter, "setNumberStyle:", 0);
}

@end
