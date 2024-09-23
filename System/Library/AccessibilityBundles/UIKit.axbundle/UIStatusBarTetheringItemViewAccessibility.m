@implementation UIStatusBarTetheringItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarTetheringItemView");
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
  void *v3;
  id v4;
  id v5;
  unsigned int v6;

  v6 = -[UIStatusBarTetheringItemViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_tetheringConnectionCount"));
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = accessibilityLocalizedString(CFSTR("status.hotspot.connections"));
  v5 = (id)objc_msgSend(v3, "localizedStringWithFormat:", v6);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarTetheringItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarTetheringItemViewAccessibility;
  return -[UIStatusBarTetheringItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
