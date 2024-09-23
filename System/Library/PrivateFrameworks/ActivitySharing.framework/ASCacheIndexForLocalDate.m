@implementation ASCacheIndexForLocalDate

void __ASCacheIndexForLocalDate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCacheIndexForLocalDate_currentCalendar;
  ASCacheIndexForLocalDate_currentCalendar = v0;

}

@end
