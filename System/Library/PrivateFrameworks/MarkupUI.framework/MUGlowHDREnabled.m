@implementation MUGlowHDREnabled

uint64_t __MUGlowHDREnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  MUGlowHDREnabled__glowHDREnabled = result;
  return result;
}

@end
