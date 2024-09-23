@implementation AFDictationRequiresRequestValidation

uint64_t __AFDictationRequiresRequestValidation_block_invoke()
{
  uint64_t result;

  if (AFIsIPad_onceToken != -1)
    dispatch_once(&AFIsIPad_onceToken, &__block_literal_global_138_40235);
  result = _os_feature_enabled_impl();
  AFDictationRequiresRequestValidation_requiresEntitlement = result;
  return result;
}

@end
