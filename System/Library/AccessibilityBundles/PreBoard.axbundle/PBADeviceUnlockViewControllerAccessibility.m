@implementation PBADeviceUnlockViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBADeviceUnlockViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADeviceUnlockViewController"), CFSTR("deviceUnlocked:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADeviceUnlockViewController"), CFSTR("_homeButtonPressed:"), "v", "@", 0);

}

- (void)deviceUnlocked:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBADeviceUnlockViewControllerAccessibility;
  -[PBADeviceUnlockViewControllerAccessibility deviceUnlocked:](&v5, sel_deviceUnlocked_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("upgrade.announcement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end
