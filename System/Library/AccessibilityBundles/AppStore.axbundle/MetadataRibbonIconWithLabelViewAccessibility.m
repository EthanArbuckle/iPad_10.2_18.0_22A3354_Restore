@implementation MetadataRibbonIconWithLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.MetadataRibbonIconWithLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonIconWithLabelView"), CFSTR("accessibilityArtworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonIconWithLabelView"), CFSTR("accessibilityUILabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[MetadataRibbonIconWithLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetadataRibbonIconWithLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityUILabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
