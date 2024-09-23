@implementation CODeviceClass

+ (BOOL)isAudioAccessory
{
  return objc_msgSend(a1, "deviceClass") == 7;
}

+ (BOOL)isPad
{
  return objc_msgSend(a1, "deviceClass") == 3;
}

+ (BOOL)isPhone
{
  return objc_msgSend(a1, "deviceClass") == 1;
}

+ (BOOL)isAppleTV
{
  return objc_msgSend(a1, "deviceClass") == 4;
}

+ (int)deviceClass
{
  if (deviceClass_onceToken != -1)
    dispatch_once(&deviceClass_onceToken, &__block_literal_global_7);
  return deviceClass_result;
}

uint64_t __28__CODeviceClass_deviceClass__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceClass_result = result;
  return result;
}

@end
