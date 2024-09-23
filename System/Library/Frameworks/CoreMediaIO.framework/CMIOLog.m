@implementation CMIOLog

os_log_t __CMIOLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.cmio", (const char *)&unk_2331115FA);
  CMIOLog::cmioLog = (uint64_t)result;
  return result;
}

@end
