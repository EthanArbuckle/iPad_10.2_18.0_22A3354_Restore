@implementation AFDeviceSupportsZLL

void __AFDeviceSupportsZLL_block_invoke()
{
  AFDeviceSupportsZLL_deviceSupportsZLL = 0;
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  AFDeviceSupportsZLL_deviceSupportsZLL = AFIsHorseman_isHorseman;
  if (!AFIsHorseman_isHorseman)
    AFDeviceSupportsZLL_deviceSupportsZLL = MGGetBoolAnswer();
}

@end
