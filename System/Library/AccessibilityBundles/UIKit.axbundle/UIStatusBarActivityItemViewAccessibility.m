@implementation UIStatusBarActivityItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarActivityItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  char v4;

  v3 = (id)-[UIStatusBarActivityItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_syncActivity"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return accessibilityLocalizedString(CFSTR("status.synching.inprogress"));
  else
    return accessibilityLocalizedString(CFSTR("status.network.connection.inprogress"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarActivityItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarActivityItemViewAccessibility;
  return -[UIStatusBarActivityItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
