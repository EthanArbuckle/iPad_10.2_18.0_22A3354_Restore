@implementation NSLocale

void __38__NSLocale_Whitespace__usesWhitespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("zh"), CFSTR("ja"), CFSTR("th"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)usesWhitespace_nonWhitespaceLanguages;
  usesWhitespace_nonWhitespaceLanguages = v0;

}

@end
