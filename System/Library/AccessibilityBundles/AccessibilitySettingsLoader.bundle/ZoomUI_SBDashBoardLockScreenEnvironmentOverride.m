@implementation ZoomUI_SBDashBoardLockScreenEnvironmentOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDashBoardLockScreenEnvironment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)finishUIUnlockFromSource:(int)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_SBDashBoardLockScreenEnvironmentOverride;
  -[ZoomUI_SBDashBoardLockScreenEnvironmentOverride finishUIUnlockFromSource:](&v4, sel_finishUIUnlockFromSource_, *(_QWORD *)&a3);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyZoomDeviceWasUnlocked");

}

@end
