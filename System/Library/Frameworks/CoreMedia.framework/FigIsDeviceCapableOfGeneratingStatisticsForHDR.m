@implementation FigIsDeviceCapableOfGeneratingStatisticsForHDR

void __FigIsDeviceCapableOfGeneratingStatisticsForHDR_block_invoke()
{
  CelestialGetModelSpecificName();
  if (FigIsHDRAllowedOnDevice_onceTokenIsHDRAllowedOnDevice != -1)
    dispatch_once(&FigIsHDRAllowedOnDevice_onceTokenIsHDRAllowedOnDevice, &__block_literal_global_23);
  if (!FigIsHDRAllowedOnDevice_sIsHDRAllowedOnDevice)
    FigIsDeviceCapableOfGeneratingStatisticsForHDR_sDeviceCapableOfGeneratingStatisticsForHDR = 1;
}

@end
