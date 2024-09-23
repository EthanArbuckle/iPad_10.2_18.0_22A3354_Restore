@implementation NSBundleResourceRequestLog

os_log_t ___NSBundleResourceRequestLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.foundation.nsbundleresourcerequest", "general");
  qword_1ECD056E8 = (uint64_t)result;
  return result;
}

@end
