@implementation ZL38

const char *___ZL38_LSCheckCurrentProcessSandboxEveryTimev_block_invoke()
{
  const char *result;

  result = getenv("LS_PROCESS_WILL_BE_SANDBOXED");
  if (result)
  {
    result = (const char *)atoi(result);
    _LSCheckCurrentProcessSandboxEveryTime(void)::result = (_DWORD)result != 0;
  }
  return result;
}

@end
