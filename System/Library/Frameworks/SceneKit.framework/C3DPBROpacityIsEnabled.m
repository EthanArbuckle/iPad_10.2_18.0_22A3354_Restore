@implementation C3DPBROpacityIsEnabled

uint64_t __C3DPBROpacityIsEnabled_block_invoke()
{
  uint64_t result;

  result = C3DWasLinkedBeforeMajorOSYear2023();
  C3DPBROpacityIsEnabled_usePBROpacity = result ^ 1;
  return result;
}

@end
