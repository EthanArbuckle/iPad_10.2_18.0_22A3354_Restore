@implementation BSSandboxCanGetProcessInfo

uint64_t __BSSandboxCanGetProcessInfo_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  byte_1ECD398D1 = (_DWORD)result == 0;
  return result;
}

@end
