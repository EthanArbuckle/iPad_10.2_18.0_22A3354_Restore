@implementation C3DGetColorTransformToLinearSRGB

uint64_t __C3DGetColorTransformToLinearSRGB_block_invoke()
{
  uint64_t result;

  if (C3DColorSpaceLinearSRGB_onceToken != -1)
    dispatch_once(&C3DColorSpaceLinearSRGB_onceToken, &__block_literal_global_3);
  result = MEMORY[0x1DF0D39B0](C3DColorSpaceLinearSRGB_kC3DColorSpaceLinearSRGB, 0);
  C3DGetColorTransformToLinearSRGB_colorTransform = result;
  return result;
}

@end
