@implementation PBADataRecoveryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBADataRecoveryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBADataRecoveryViewController"), CFSTR("_firstPasscode"), "NSData");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADataRecoveryViewController"), CFSTR("_pushPasscodeView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADataRecoveryViewController"), CFSTR("passcodeEntryViewControllerEntryCompleted:passcode:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADataRecoveryViewController"), CFSTR("_homeButtonPressed:"), "v", "@", 0);

}

- (void)_pushPasscodeView
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBADataRecoveryViewControllerAccessibility;
  -[PBADataRecoveryViewControllerAccessibility _pushPasscodeView](&v4, sel__pushPasscodeView);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("enter.passcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIAccessibilityNotifications v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[PBADataRecoveryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_firstPasscode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)PBADataRecoveryViewControllerAccessibility;
  -[PBADataRecoveryViewControllerAccessibility passcodeEntryViewControllerEntryCompleted:passcode:](&v11, sel_passcodeEntryViewControllerEntryCompleted_passcode_, v7, v6);

  if (!v8)
  {
    v9 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("verify.passcode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v10);

  }
}

@end
