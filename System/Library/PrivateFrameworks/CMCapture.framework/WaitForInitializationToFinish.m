@implementation WaitForInitializationToFinish

uint64_t __WaitForInitializationToFinish_block_invoke(uint64_t result)
{
  _DWORD *v1;

  v1 = *(_DWORD **)(result + 32);
  if (*v1 != 2)
    *v1 = 1;
  return result;
}

uint64_t __WaitForInitializationToFinish_block_invoke_0(uint64_t result)
{
  _DWORD *v1;

  v1 = *(_DWORD **)(result + 32);
  if (*v1 != 2)
    *v1 = 1;
  return result;
}

@end
