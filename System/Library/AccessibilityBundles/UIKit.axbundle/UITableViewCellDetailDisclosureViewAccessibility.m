@implementation UITableViewCellDetailDisclosureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellDetailDisclosureView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UITableViewCellDetailDisclosureViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v5 = (id)objc_msgSend(v6[0], "safeValueForKey:", CFSTR("_accessibilityTextElementText"));
  v3 = accessibilityLocalizedString(CFSTR("more.info.button"));
  v4 = (id)__UIAXStringForVariables();

  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

- (id)accessibilityIdentification
{
  return CFSTR("UITableCellViewDisclosure");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UITableViewCellDetailDisclosureViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellDetailDisclosureViewAccessibility;
  return -[UITableViewCellDetailDisclosureViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
}

@end
