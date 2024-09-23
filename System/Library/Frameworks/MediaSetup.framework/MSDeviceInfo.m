@implementation MSDeviceInfo

+ (BOOL)isDeviceiPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (BOOL)isDeviceiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)isDeviceAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)isDeviceAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)deviceSupportsMultipleUsers
{
  if ((objc_msgSend((id)objc_opt_class(), "isDeviceAppleTV") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "isDeviceAudioAccessory");
}

+ (BOOL)deviceCanManageMultiUser
{
  if ((objc_msgSend((id)objc_opt_class(), "deviceSupportsMultipleUsers") & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "isDeviceiPhone") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend((id)objc_opt_class(), "isDeviceiPad");
  }
}

@end
