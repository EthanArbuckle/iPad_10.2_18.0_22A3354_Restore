@implementation EXSandboxExtension

uint64_t __32___EXSandboxExtension_sandboxed__block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  sandboxed__sandboxed = (_DWORD)result != 0;
  return result;
}

@end
