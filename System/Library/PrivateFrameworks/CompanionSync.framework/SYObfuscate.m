@implementation SYObfuscate

uint64_t ___SYObfuscate_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    _SYObfuscate___shouldObfuscate = 1;
  return result;
}

@end
