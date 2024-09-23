@implementation MCMRequirePersona

uint64_t __MCMRequirePersona_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  MCMRequirePersona_result = result;
  return result;
}

@end
