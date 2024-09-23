@implementation objc_LockscreenStatus

+ (BOOL)isDeviceUnlocked
{
  return sub_100026C5C(a1, a2) & 1;
}

- (_TtC17StoreKitUIService21objc_LockscreenStatus)init
{
  return (_TtC17StoreKitUIService21objc_LockscreenStatus *)sub_100026C60();
}

@end
