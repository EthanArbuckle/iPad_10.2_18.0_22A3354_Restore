@implementation DRRequestPassesTailspinHysteresis

uint64_t ___DRRequestPassesTailspinHysteresis_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = mach_continuous_time();
  result = _doesPassHysteresis(gPreviousAcceptedTailspinRequestMCT, v2, *(double *)(a1 + 40));
  if ((_DWORD)result)
    gPreviousAcceptedTailspinRequestMCT = v2;
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
