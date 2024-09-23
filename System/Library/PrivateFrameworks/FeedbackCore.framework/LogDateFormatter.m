@implementation LogDateFormatter

uint64_t __LogDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)LogDateFormatter_dateFormatter;
  LogDateFormatter_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)LogDateFormatter_dateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss'.'SSSSSSXX"));
}

@end
