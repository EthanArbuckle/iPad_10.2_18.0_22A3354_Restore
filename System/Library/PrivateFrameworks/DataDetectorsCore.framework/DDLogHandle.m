@implementation DDLogHandle

os_log_t __DDLogHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.DataDetectorsCore", "Data Detectors Engine");
  DDLogHandle_error_log_handle = (uint64_t)result;
  return result;
}

@end
