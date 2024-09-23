@implementation CLKIsCurrentLocaleCJK

void __CLKIsCurrentLocaleCJK_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("zh"), CFSTR("ja"), CFSTR("ko"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKIsCurrentLocaleCJK__cjkSet;
  CLKIsCurrentLocaleCJK__cjkSet = v0;

}

@end
