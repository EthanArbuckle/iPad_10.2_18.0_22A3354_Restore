@implementation CFNGetAutoRcvBufMax

uint64_t ____CFNGetAutoRcvBufMax_block_invoke()
{
  uint64_t result;
  BOOL v1;
  uint64_t v2;
  size_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = 0;
  result = sysctlbyname("hw.memsize", &v4, &v3, 0, 0);
  if ((_DWORD)result)
    v1 = 0;
  else
    v1 = v3 == 8;
  if (v1)
  {
    v2 = 0x200000;
    if (v4 > 0xC0000000)
      v2 = 0x400000;
    __CFNGetAutoRcvBufMax::value = v2;
  }
  return result;
}

@end
