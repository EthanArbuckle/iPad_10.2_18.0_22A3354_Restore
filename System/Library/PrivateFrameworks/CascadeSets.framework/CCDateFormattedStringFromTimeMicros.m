@implementation CCDateFormattedStringFromTimeMicros

uint64_t __CCDateFormattedStringFromTimeMicros_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)CCDateFormattedStringFromTimeMicros_formatter;
  CCDateFormattedStringFromTimeMicros_formatter = (uint64_t)v0;

  v2 = (void *)CCDateFormattedStringFromTimeMicros_formatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = objc_msgSend((id)CCDateFormattedStringFromTimeMicros_formatter, "formatOptions");
  return objc_msgSend((id)CCDateFormattedStringFromTimeMicros_formatter, "setFormatOptions:", v4 & 0xFFFFFFFFFFFFF37FLL | 0x880);
}

@end
