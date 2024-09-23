@implementation MBGetMBSwiftLog

os_log_t __MBGetMBSwiftLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mobilebackup", "MBSwift");
  MBGetMBSwiftLog_log = (uint64_t)result;
  return result;
}

@end
