@implementation PKReaderModeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKReaderModeHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKReaderModeHeaderView"), CFSTR("PKTableHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTableHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKTableHeaderView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKReaderModeHeaderView"), CFSTR("_configureForCurrentState"), "v", 0);

}

- (id)_axCurrentLabelText
{
  JUMPOUT(0x234918CC4);
}

- (void)_setAXCurrentLabelText:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_configureForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  UIAccessibilityNotifications v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKReaderModeHeaderViewAccessibility;
  -[PKReaderModeHeaderViewAccessibility _configureForCurrentState](&v13, sel__configureForCurrentState);
  objc_opt_class();
  -[PKReaderModeHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKReaderModeHeaderViewAccessibility _axCurrentLabelText](self, "_axCurrentLabelText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[PKReaderModeHeaderViewAccessibility _setAXCurrentLabelText:](self, "_setAXCurrentLabelText:", v5);
    objc_opt_class();
    -[PKReaderModeHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x24BDF71E8];
    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v10, v11);

  }
}

@end
