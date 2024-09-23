@implementation MetadataRibbonBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.MetadataRibbonBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("BridgeStoreExtension.MetadataRibbonBarView"), CFSTR("dividerLabel"), "DynamicTypeLabel");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MetadataRibbonBarViewAccessibility;
  -[MetadataRibbonBarViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[MetadataRibbonBarViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("dividerLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
