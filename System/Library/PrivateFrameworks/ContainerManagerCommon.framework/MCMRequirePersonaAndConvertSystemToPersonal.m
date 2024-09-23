@implementation MCMRequirePersonaAndConvertSystemToPersonal

uint64_t __MCMRequirePersonaAndConvertSystemToPersonal_block_invoke()
{
  uint64_t result;

  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
    result = _os_feature_enabled_impl();
  else
    result = 0;
  MCMRequirePersonaAndConvertSystemToPersonal_result = result;
  return result;
}

@end
