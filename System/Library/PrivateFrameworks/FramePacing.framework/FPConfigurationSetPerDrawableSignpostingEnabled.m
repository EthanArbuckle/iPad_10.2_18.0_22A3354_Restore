@implementation FPConfigurationSetPerDrawableSignpostingEnabled

uint64_t ___FPConfigurationSetPerDrawableSignpostingEnabled_block_invoke(uint64_t result)
{
  gFPPerFrameSignpostingIsEnabled = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gFPPerFrameSignpostingIsEnabled;
  return result;
}

@end
