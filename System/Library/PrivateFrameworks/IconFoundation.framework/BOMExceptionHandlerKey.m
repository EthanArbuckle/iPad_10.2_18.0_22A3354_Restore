@implementation BOMExceptionHandlerKey

uint64_t ____BOMExceptionHandlerKey_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&__BOMExceptionHandlerKey___key, 0);
  if ((_DWORD)result)
    return _CUILog();
  return result;
}

@end
