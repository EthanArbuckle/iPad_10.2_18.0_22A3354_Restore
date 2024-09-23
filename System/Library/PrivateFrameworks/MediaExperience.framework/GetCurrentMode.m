@implementation GetCurrentMode

double __fsmcontroller_GetCurrentMode_block_invoke(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = fsm_getCurrentMode((__n128 *)*(_QWORD *)(a1 + 32), (__n128 *)*(_QWORD *)(a1 + 40), 0).n128_u64[0];
  return result;
}

@end
