@implementation DVTDeviceGlobalStatusIndicatorFactory

+ (id)deviceStatusIndicatorWithConfiguration:(id)a3 stoppedByUserBlock:(id)a4
{
  id v5;
  id v6;
  DVTiOSDeviceGlobalStatusIndicator *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DVTiOSDeviceGlobalStatusIndicator initWithConfiguration:stoppedByUserBlock:]([DVTiOSDeviceGlobalStatusIndicator alloc], "initWithConfiguration:stoppedByUserBlock:", v6, v5);

  return v7;
}

@end
