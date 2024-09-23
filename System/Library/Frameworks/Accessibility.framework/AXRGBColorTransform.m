@implementation AXRGBColorTransform

uint64_t __AXRGBColorTransform_block_invoke()
{
  uint64_t result;

  if (_AXSRGBColorSpace_onceToken != -1)
    dispatch_once(&_AXSRGBColorSpace_onceToken, &__block_literal_global);
  result = MEMORY[0x20BD0F394](_AXSRGBColorSpace_RGBColorSpace, 0);
  AXRGBColorTransform_ColorTransform = result;
  return result;
}

@end
