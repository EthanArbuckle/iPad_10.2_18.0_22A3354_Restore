@implementation HMUDevice

+ (BOOL)isAccessory
{
  return +[HMUDevice isAudioAccessory](HMUDevice, "isAudioAccessory")
      || +[HMUDevice isAppleTV](HMUDevice, "isAppleTV");
}

+ (BOOL)isAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)isAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)isPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)isPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (int)deviceClass
{
  return MGGetSInt32Answer();
}

@end
