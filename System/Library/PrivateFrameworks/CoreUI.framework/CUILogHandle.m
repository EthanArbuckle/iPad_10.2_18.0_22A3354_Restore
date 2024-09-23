@implementation CUILogHandle

os_log_t __CUILogHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.coreui", "framework");
  __handle = (uint64_t)result;
  return result;
}

@end
