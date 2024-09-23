@implementation FPExecutableNameForProcessIdentifier

uint64_t __FPExecutableNameForProcessIdentifier_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  FPExecutableNameForProcessIdentifier_pidResolutionAllowed = (_DWORD)result == 0;
  return result;
}

@end
