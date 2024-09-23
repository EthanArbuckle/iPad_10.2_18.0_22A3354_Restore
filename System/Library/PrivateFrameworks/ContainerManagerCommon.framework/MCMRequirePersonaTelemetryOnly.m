@implementation MCMRequirePersonaTelemetryOnly

uint64_t __MCMRequirePersonaTelemetryOnly_block_invoke()
{
  uint64_t result;

  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
    result = _os_feature_enabled_impl();
  else
    result = 0;
  MCMRequirePersonaTelemetryOnly_result = result;
  return result;
}

@end
