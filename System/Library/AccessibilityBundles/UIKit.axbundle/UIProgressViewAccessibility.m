@implementation UIProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIProgressView"), CFSTR("_setProgress:"), "v", "f", 0);
  objc_storeStrong(v4, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 35;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIProgressViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIProgressViewAccessibility;
  return -[UIProgressViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIProgressViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return (-[UIProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") & 1) != 0;
  v4 = (id)-[UIProgressViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (id)accessibilityLabel
{
  id v2;
  BOOL v4;

  v2 = (id)-[UIProgressViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = v2 == 0;

  if (v4)
    return accessibilityLocalizedString(CFSTR("progress.text"));
  else
    return (id)-[UIProgressViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
}

- (id)accessibilityValue
{
  id v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v10;

  v2 = (id)-[UIProgressViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v8 = v2 == 0;

  if (!v8)
    return (id)-[UIProgressViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v7 = accessibilityLocalizedString(CFSTR("percent.value.formatter"));
  v6 = (id)-[UIProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progress"));
  objc_msgSend(v6, "floatValue");
  v5 = (id)AXFormatFloatWithPercentage();
  v10 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);

  return v10;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  CGRect v5;

  -[UIProgressViewAccessibility bounds](self, "bounds", 0, 0, 0, 0, a2);
  v5.origin.y = v2 - 10.0;
  v5.size.height = v3 + 20.0;
  return UIAccessibilityConvertFrameToScreenCoordinates(v5, (UIView *)self);
}

@end
