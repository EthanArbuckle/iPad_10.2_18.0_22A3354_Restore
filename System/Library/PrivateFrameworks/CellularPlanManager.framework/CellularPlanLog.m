@implementation CellularPlanLog

os_log_t __CellularPlanLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreTelephony", "cp.fw");
  CellularPlanLog_logger = (uint64_t)result;
  return result;
}

@end
