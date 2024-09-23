@implementation PSGPreBuddyCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSGPreBuddyCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (id)accessibilityLabel
{
  return (id)-[PSGPreBuddyCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 0, 0);
}

@end
