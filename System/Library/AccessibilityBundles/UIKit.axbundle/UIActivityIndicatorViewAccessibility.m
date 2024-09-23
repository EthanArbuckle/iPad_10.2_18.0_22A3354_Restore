@implementation UIActivityIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIActivityIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return -[UIActivityIndicatorViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible", a2, self) & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 36;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIActivityIndicatorViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIActivityIndicatorViewAccessibility;
  return -[UIActivityIndicatorViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  id v3;
  char v4;
  objc_super v5;
  id location[2];
  UIActivityIndicatorViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorViewAccessibility;
  location[0] = -[UIActivityIndicatorViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v3 = (id)-[UIActivityIndicatorViewAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("isAnimating"));
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) != 0)
      v8 = accessibilityLocalizedString(CFSTR("activity.indicator.inprogress.label"));
    else
      v8 = accessibilityLocalizedString(CFSTR("activity.indicator.progresshalted.label"));
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  id v4;
  objc_super v5;
  id location[2];
  UIActivityIndicatorViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorViewAccessibility;
  location[0] = -[UIActivityIndicatorViewAccessibility accessibilityValue](&v5, sel_accessibilityValue);
  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else if (UIAccessibilityIsVoiceOverRunning())
  {
    v8 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (id)-[UIActivityIndicatorViewAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("isAnimating"));
    v8 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "BOOLValue") & 1);

  }
  objc_storeStrong(location, 0);
  return v8;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end
