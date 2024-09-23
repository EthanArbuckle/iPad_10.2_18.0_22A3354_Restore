@implementation HMDExtendedTypeDateFormatter

uint64_t __HMDExtendedTypeDateFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)HMDExtendedTypeDateFormatter_formatter;
  HMDExtendedTypeDateFormatter_formatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HMDExtendedTypeDateFormatter_formatter, "setTimeZone:", v2);

  return objc_msgSend((id)HMDExtendedTypeDateFormatter_formatter, "setFormatOptions:", 3955);
}

@end
