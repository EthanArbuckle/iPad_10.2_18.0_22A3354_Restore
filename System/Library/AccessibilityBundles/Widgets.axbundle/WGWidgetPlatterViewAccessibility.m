@implementation WGWidgetPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGWidgetPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WGWidgetPlatterView"), CFSTR("_headerContentView"), "WGPlatterHeaderContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetPlatterView"), CFSTR("contentView"), "@", 0);

}

- (id)accessibilityIdentifier
{
  return CFSTR("WGWidgetPlatterView");
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[WGWidgetPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerContentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
