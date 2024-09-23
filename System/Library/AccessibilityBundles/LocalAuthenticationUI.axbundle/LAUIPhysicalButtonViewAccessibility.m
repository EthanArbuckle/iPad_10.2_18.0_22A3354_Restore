@implementation LAUIPhysicalButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LAUIPhysicalButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LAUIPhysicalButtonView"), CFSTR("_setOnScreen:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LAUIPhysicalButtonView"), CFSTR("_instruction"), "NSString");

}

- (void)_setOnScreen:(BOOL)a3
{
  _BOOL4 v3;
  UIAccessibilityNotifications v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonViewAccessibility;
  -[LAUIPhysicalButtonViewAccessibility _setOnScreen:](&v9, sel__setOnScreen_);
  if (v3)
  {
    v5 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("face.id.authentication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUIPhysicalButtonViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_instruction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v5, v7);

  }
}

@end
