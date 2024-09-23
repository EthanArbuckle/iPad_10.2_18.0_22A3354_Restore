@implementation UGCPOIEnrichmentModalHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCPOIEnrichmentModalHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCPOIEnrichmentModalHeaderView"), CFSTR("_leadingButton"), "MapsThemeButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCPOIEnrichmentModalHeaderView"), CFSTR("_poiIconView"), "UGCPOIEnrichmentHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCPOIEnrichmentModalHeaderView"), CFSTR("_trailingButton"), "MapsThemeButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id location;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentModalHeaderViewAccessibility;
  -[UGCPOIEnrichmentModalHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  location = 0;
  objc_msgSend(0, "_setAccessibilityElementsBlock:", &__block_literal_global_3);
  objc_destroyWeak(&location);
}

id __90__UGCPOIEnrichmentModalHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(0, "safeValueForKey:", CFSTR("_leadingButton"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "safeValueForKey:", CFSTR("_poiIconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "safeValueForKey:", CFSTR("_trailingButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "axArrayWithPossiblyNilArrays:", 3, v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
