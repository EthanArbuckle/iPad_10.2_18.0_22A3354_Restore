@implementation FigSecureStopManagerCopyDefaultRuntimeInstance

uint64_t __FigSecureStopManagerCopyDefaultRuntimeInstance_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = FigSecureStopManagerCreate(a1[6], (_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
