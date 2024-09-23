@implementation BSSandboxCanGetMachTaskName

uint64_t __BSSandboxCanGetMachTaskName_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  byte_1ECD398D2 = (_DWORD)result == 0;
  return result;
}

@end
