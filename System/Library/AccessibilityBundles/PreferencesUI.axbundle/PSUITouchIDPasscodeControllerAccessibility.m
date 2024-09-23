@implementation PSUITouchIDPasscodeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSUITouchIDPasscodeController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSUITouchIDPasscodeController"), CFSTR("highlightFingerprintSpecifier:"), "v", "@", 0);
}

- (void)highlightFingerprintSpecifier:(id)a3
{
  id v3;
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUITouchIDPasscodeControllerAccessibility;
  v3 = a3;
  -[PSUITouchIDPasscodeControllerAccessibility highlightFingerprintSpecifier:](&v6, sel_highlightFingerprintSpecifier_, v3);
  v4 = *MEMORY[0x24BDF71E8];
  objc_msgSend(v3, "name", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(v4, v5);
}

@end
