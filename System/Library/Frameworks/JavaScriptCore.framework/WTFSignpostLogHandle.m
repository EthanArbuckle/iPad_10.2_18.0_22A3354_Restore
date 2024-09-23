@implementation WTFSignpostLogHandle

os_log_t __WTFSignpostLogHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.WebKit", "Signposts");
  WTFSignpostLogHandle::handle = (uint64_t)result;
  return result;
}

@end
