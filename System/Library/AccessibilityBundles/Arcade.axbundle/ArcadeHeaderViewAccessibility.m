@implementation ArcadeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.ArcadeHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return 10;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ArcadeHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("accessoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

@end
