@implementation C3DGetColorTransformToSRGB

uint64_t __C3DGetColorTransformToSRGB_block_invoke()
{
  uint64_t result;

  if (C3DColorSpaceSRGB_onceToken != -1)
    dispatch_once(&C3DColorSpaceSRGB_onceToken, &__block_literal_global_4);
  result = MEMORY[0x1DF0D39B0](C3DColorSpaceSRGB_kC3DColorSpaceSRGB, 0);
  C3DGetColorTransformToSRGB_colorTransform = result;
  return result;
}

@end
