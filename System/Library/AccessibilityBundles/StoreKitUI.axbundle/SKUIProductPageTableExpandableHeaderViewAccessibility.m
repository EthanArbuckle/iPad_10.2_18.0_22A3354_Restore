@implementation SKUIProductPageTableExpandableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIProductPageTableExpandableHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIProductPageTableExpandableHeaderView"), CFSTR("_actionLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIProductPageTableExpandableHeaderView"), CFSTR("_titleLabel"), "UILabel");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageTableExpandableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  -[SKUIProductPageTableExpandableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

@end
