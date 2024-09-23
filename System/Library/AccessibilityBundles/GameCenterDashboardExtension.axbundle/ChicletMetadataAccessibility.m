@implementation ChicletMetadataAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterDashboardExtension.ChicletMetadata");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletMetadata"), CFSTR("accessibilityChicletRank"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletMetadata"), CFSTR("accessibilityChicletCaption"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletMetadata"), CFSTR("accessibilityChicletSubtitle"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_opt_class();
  -[ChicletMetadataAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityChicletRank"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    v5 = CFSTR("accessibilityChicletCaption, accessibilityChicletRank, accessibilityChicletSubtitle");
  else
    v5 = CFSTR("accessibilityChicletCaption, accessibilityChicletSubtitle");
  -[ChicletMetadataAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
