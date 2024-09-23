@implementation BOMExceptionMessageString

uint64_t ____BOMExceptionMessageString_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&__BOMExceptionMessageString___key, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  if ((_DWORD)result)
    return _CUILog();
  return result;
}

@end
