@implementation _DKPlatform

+ (id)deviceUUID
{
  if (deviceUUID_onceToken != -1)
    dispatch_once(&deviceUUID_onceToken, &__block_literal_global_81);
  return (id)deviceUUID_deviceUUID_0;
}

@end
