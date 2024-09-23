@implementation OBTrayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBTrayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBTrayButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("setEnabled:"), "v", "B", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OBTrayButtonAccessibility;
  -[OBTrayButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsActivityIndicator");

  if (v5)
  {
    accessibilityLocalizedString(CFSTR("in.progress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBTrayButtonAccessibility;
  -[OBTrayButtonAccessibility setEnabled:](&v3, sel_setEnabled_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
