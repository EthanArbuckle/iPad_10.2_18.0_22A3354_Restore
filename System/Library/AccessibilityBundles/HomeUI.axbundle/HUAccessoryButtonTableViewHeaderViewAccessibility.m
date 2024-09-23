@implementation HUAccessoryButtonTableViewHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAccessoryButtonTableViewHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAccessoryButtonTableViewHeaderView"), CFSTR("accessoryButton"), "@", 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[HUAccessoryButtonTableViewHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
