@implementation MCNoStyleNumberFormatter

void __MCNoStyleNumberFormatter_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)MCNoStyleNumberFormatter_formatter;
  MCNoStyleNumberFormatter_formatter = v0;

  objc_msgSend((id)MCNoStyleNumberFormatter_formatter, "setNumberStyle:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)MCNoStyleNumberFormatter_formatter, "setLocale:", v2);

}

@end
