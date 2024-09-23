@implementation C3DGetColorTransformToITUR

uint64_t __C3DGetColorTransformToITUR_709_block_invoke()
{
  uint64_t result;

  if (C3DColorSpaceITUR_709_onceToken != -1)
    dispatch_once(&C3DColorSpaceITUR_709_onceToken, &__block_literal_global_17);
  result = MEMORY[0x1DF0D39B0](C3DColorSpaceITUR_709_kC3DColorSpaceITUR_709, 0);
  C3DGetColorTransformToITUR_709_colorTransform = result;
  return result;
}

@end
