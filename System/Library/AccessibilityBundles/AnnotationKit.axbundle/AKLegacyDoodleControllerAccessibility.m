@implementation AKLegacyDoodleControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKLegacyDoodleController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKLegacyDoodleController"), CFSTR("inputViewWillStartDrawing:"), "v", "@", 0);
}

- (void)inputViewWillStartDrawing:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKLegacyDoodleControllerAccessibility;
  -[AKLegacyDoodleControllerAccessibility inputViewWillStartDrawing:](&v5, sel_inputViewWillStartDrawing_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("sketch.drawing.began"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end
