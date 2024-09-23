@implementation MBGetSQLLog

os_log_t __MBGetSQLLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mobilebackup", "SQL");
  MBGetSQLLog_log = (uint64_t)result;
  return result;
}

@end
