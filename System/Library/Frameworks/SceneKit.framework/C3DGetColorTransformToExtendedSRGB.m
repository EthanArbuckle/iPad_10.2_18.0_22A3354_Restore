@implementation C3DGetColorTransformToExtendedSRGB

uint64_t __C3DGetColorTransformToExtendedSRGB_block_invoke()
{
  uint64_t result;

  if (C3DColorSpaceExtendedSRGB_onceToken != -1)
    dispatch_once(&C3DColorSpaceExtendedSRGB_onceToken, &__block_literal_global_9);
  result = MEMORY[0x1DF0D39B0](C3DColorSpaceExtendedSRGB_kC3DColorSpaceExtendedSRGB, 0);
  C3DGetColorTransformToExtendedSRGB_colorTransform = result;
  return result;
}

@end
