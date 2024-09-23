@implementation NSRuntimeIssuesLog

os_log_t ___NSRuntimeIssuesLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.runtime-issues", "Foundation");
  qword_1ECD09F98 = (uint64_t)result;
  return result;
}

@end
