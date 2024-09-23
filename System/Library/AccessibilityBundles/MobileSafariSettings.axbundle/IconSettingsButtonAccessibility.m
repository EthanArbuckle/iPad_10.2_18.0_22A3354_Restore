@implementation IconSettingsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IconSettingsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)-[IconSettingsButtonAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 0, 0);
}

@end
