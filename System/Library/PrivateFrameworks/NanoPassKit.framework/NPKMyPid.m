@implementation NPKMyPid

uint64_t __NPKMyPid_block_invoke()
{
  uint64_t result;

  result = getpid();
  NPKMyPid_pid = result;
  return result;
}

@end
