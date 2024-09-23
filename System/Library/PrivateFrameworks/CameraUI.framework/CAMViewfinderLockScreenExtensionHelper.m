@implementation CAMViewfinderLockScreenExtensionHelper

+ (void)executeUnlockOneUpAction:(unint64_t)a3 on:(id)a4
{
  id v6;

  v6 = a4;
  _s8CameraUI35ViewfinderLockScreenExtensionHelperC24executeUnlockOneUpAction_2onySo014PXUnlockDeviceL4TypeV_So05PUOneK14ViewControllerCSgtFZ_0((id)a3, a4);

}

+ (void)notifyCompleteTransition
{
  sub_1DB979AA4();
  sub_1DB979A98();
  sub_1DB979A8C();
  swift_release();
}

- (CAMViewfinderLockScreenExtensionHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CAMViewfinderLockScreenExtensionHelper init](&v3, sel_init);
}

@end
