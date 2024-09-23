@implementation MBGetDefaultLog

os_log_t __MBGetDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mobilebackup", "Default");
  MBGetDefaultLog_log = (uint64_t)result;
  return result;
}

@end
