@implementation DDMLEnhancementEnabled

uint64_t __DDMLEnhancementEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  DDMLEnhancementEnabled__isDDMLEnabled = result;
  return result;
}

@end
