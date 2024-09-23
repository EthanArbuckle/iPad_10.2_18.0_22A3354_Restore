@implementation ICFDefaultLog

os_log_t __ICFDefaultLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.calls.incomingcallfilter", "Default");
  ICFDefaultLog_ICFDefaultLog = (uint64_t)result;
  return result;
}

@end
