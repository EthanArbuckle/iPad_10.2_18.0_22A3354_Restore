@implementation CFNRuntimeIssuesLogHandle

os_log_t ____CFNRuntimeIssuesLogHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.runtime-issues", "CFNetwork");
  __CFNRuntimeIssuesLogHandle::logger = (uint64_t)result;
  return result;
}

@end
