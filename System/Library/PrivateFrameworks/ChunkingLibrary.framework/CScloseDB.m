@implementation CScloseDB

os_log_t __CScloseDB_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.chunkinglibrary", "default");
  CK_DEFAULT_LOG_INTERNAL = (uint64_t)result;
  return result;
}

@end
