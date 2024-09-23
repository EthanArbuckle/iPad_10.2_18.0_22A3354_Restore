@implementation DCSLog

os_log_t __DCSLog_block_invoke()
{
  uint64_t i;
  os_log_t result;

  for (i = 0; i != 5; ++i)
  {
    result = os_log_create("com.apple.DictionaryServices", off_1E8B57268[i]);
    DCSLog__LogObj[i] = (uint64_t)result;
  }
  return result;
}

@end
