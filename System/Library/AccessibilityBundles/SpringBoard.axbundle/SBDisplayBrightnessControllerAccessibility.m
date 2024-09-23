@implementation SBDisplayBrightnessControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDisplayBrightnessController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayBrightnessController"), CFSTR("_setBrightnessLevel:animated:"), "v", "f", "B", 0);
}

- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDisplayBrightnessControllerAccessibility;
  -[SBDisplayBrightnessControllerAccessibility _setBrightnessLevel:animated:](&v9, sel__setBrightnessLevel_animated_, a4);
  BKSDisplayBrightnessGetCurrent();
  v4 = *MEMORY[0x24BDF71E8];
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("brightness.format"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v8);

}

@end
