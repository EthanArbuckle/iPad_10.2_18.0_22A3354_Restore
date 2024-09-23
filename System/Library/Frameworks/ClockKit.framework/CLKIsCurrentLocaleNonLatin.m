@implementation CLKIsCurrentLocaleNonLatin

void __CLKIsCurrentLocaleNonLatin_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("zh"), CFSTR("ja"), CFSTR("ko"), CFSTR("hi"), CFSTR("th"), CFSTR("ar"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKIsCurrentLocaleNonLatin__nonLatinSet;
  CLKIsCurrentLocaleNonLatin__nonLatinSet = v0;

}

@end
