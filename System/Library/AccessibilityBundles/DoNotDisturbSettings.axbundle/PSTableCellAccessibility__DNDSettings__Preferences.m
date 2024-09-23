@implementation PSTableCellAccessibility__DNDSettings__Preferences

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSTableCellAccessibility__DNDSettings__Preferences;
  v3 = -[PSTableCellAccessibility__DNDSettings__Preferences accessibilityTraits](&v7, sel_accessibilityTraits);
  -[PSTableCellAccessibility__DNDSettings__Preferences accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("DateRangePaneCell"));

  if (v5)
    return v3 & ~*MEMORY[0x24BDF73E8] | *MEMORY[0x24BDF73B0];
  return v3;
}

@end
