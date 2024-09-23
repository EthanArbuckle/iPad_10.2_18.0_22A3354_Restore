@implementation NTKEnableAODVibrancy

uint64_t __NTKEnableAODVibrancy_block_invoke()
{
  char v0;
  uint64_t result;

  v0 = MGGetBoolAnswer();
  if (CLKInternalBuild() && (v0 & 1) == 0)
    v0 = _os_feature_enabled_impl();
  result = _os_feature_enabled_impl();
  NTKEnableAODVibrancy_enableAODVibrancy = v0 & result;
  return result;
}

@end
