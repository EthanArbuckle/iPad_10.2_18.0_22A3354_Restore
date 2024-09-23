@implementation PSSpecifierAccessibility__ScreenTimeUI__Preferences

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSpecifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsExpandableSTUICell
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetIsExpandableSTUICell:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_accessibilityIsExpandedSTUICell
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetIsExpandedSTUICell:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

@end
