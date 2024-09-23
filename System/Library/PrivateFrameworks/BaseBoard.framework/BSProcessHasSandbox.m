@implementation BSProcessHasSandbox

uint64_t __BSProcessHasSandbox_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  _MergedGlobals_15 = (_DWORD)result != 0;
  return result;
}

@end
