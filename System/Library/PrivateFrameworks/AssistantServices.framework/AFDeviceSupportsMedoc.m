@implementation AFDeviceSupportsMedoc

uint64_t __AFDeviceSupportsMedoc_block_invoke()
{
  unsigned int v0;
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v0 = +[AFFeatureFlags isMedocFeatureEnabled](AFFeatureFlags, "isMedocFeatureEnabled");
  v1 = AFDeviceSupportsSiriUOD();
  v2 = +[AFFeatureFlags isMedocFeatureEnabledForHybridMode](AFFeatureFlags, "isMedocFeatureEnabledForHybridMode");
  v3 = AFShouldRunAsrOnServerForUOD();
  result = AFDeviceSupportsMedocHelper(v0, v1, v2, v3);
  AFDeviceSupportsMedoc_supportsMedoc = result;
  return result;
}

@end
