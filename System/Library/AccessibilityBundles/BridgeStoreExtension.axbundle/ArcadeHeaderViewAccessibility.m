@implementation ArcadeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.ArcadeHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BridgeStoreExtension.ArcadeHeaderView"), CFSTR("AppStore.TitleHeaderView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("BridgeStoreExtension.TitleHeaderView"), CFSTR("accessoryView"), "Optional<UIView>");

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
