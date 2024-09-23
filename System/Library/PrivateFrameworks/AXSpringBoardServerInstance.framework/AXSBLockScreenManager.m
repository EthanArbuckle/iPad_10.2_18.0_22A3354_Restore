@implementation AXSBLockScreenManager

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBLockScreenManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSBLockScreenManager;
  -[AXSBLockScreenManager lockUIFromSource:withOptions:](&v4, sel_lockUIFromSource_withOptions_, *(_QWORD *)&a3, a4);
  objc_msgSend((id)SBServerHelper, "_accessibilityHandleHomeOrLockButtonPress");
}

- (void)_authenticationStateChanged:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSBLockScreenManager;
  -[AXSBLockScreenManager _authenticationStateChanged:](&v4, sel__authenticationStateChanged_, a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BED2700], 0, 0, 1u);
}

@end
