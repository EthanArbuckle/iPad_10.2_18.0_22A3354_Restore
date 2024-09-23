@implementation FigHapticEngineStart

uint64_t __FigHapticEngineStart_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = figHapticEngineStartOnActivityQueue(*(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
