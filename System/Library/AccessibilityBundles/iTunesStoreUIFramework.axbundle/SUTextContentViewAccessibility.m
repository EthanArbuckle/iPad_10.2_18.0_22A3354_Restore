@implementation SUTextContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTextContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTextContentView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUTextContentView"), CFSTR("_placeholderLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTextContentView"), CFSTR("placeholder"), "@", 0);

}

- (id)_accessibilityPlaceholderValue:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[SUTextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v6, "isHidden") & 1) != 0 || (objc_msgSend(v6, "alpha"), v8 <= 0.01))
  {

    if (!a3)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
LABEL_8:

  return v10;
}

- (id)accessibilityPlaceholderValue
{
  return -[SUTextContentViewAccessibility _accessibilityPlaceholderValue:](self, "_accessibilityPlaceholderValue:", 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUTextContentViewAccessibility;
  -[SUTextContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SUTextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUTextContentViewAccessibility;
  -[SUTextContentViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SUTextContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityValue
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[SUTextContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v7.receiver = self;
  v7.super_class = (Class)SUTextContentViewAccessibility;
  -[SUTextContentViewAccessibility accessibilityValue](&v7, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[SUTextContentViewAccessibility _accessibilityPlaceholderValue:](self, "_accessibilityPlaceholderValue:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
