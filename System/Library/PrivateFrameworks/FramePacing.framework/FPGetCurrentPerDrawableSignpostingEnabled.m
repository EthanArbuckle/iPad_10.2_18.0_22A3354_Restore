@implementation FPGetCurrentPerDrawableSignpostingEnabled

uint64_t ___FPGetCurrentPerDrawableSignpostingEnabled_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gFPPerFrameSignpostingIsEnabled;
  return result;
}

@end
