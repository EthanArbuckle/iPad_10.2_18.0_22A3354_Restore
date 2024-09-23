@implementation C3DGetColorTransformToExtendedLinearSRGB

uint64_t __C3DGetColorTransformToExtendedLinearSRGB_block_invoke()
{
  uint64_t result;

  if (C3DColorSpaceExtendedLinearSRGB_onceToken != -1)
    dispatch_once(&C3DColorSpaceExtendedLinearSRGB_onceToken, &__block_literal_global_11);
  result = MEMORY[0x1DF0D39B0](C3DColorSpaceExtendedLinearSRGB_kC3DColorSpaceExtendedLinearSRGB, 0);
  C3DGetColorTransformToExtendedLinearSRGB_colorTransform = result;
  return result;
}

@end
