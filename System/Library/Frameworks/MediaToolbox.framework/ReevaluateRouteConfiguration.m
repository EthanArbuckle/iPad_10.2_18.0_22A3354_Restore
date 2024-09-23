@implementation ReevaluateRouteConfiguration

uint64_t __playerairplay_ReevaluateRouteConfiguration_block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  char v4;

  result = pap_AirPlayState(*(const void **)(a1 + 40));
  if ((_DWORD)result)
    v3 = (_DWORD)result == 10;
  else
    v3 = 1;
  v4 = !v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

@end
