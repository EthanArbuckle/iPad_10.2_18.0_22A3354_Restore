@implementation LargeLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.LargeLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupView"), CFSTR("accessibilityOrdinalLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupView"), CFSTR("accessibilityPrimaryTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupView"), CFSTR("accessibilitySecondaryTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupView"), CFSTR("accessibilityArtworkContainer"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeLockupViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[LargeLockupViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[LargeLockupViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityOrdinalLabel, accessibilityPrimaryTitleLabel, accessibilitySecondaryTitleLabel, accessibilitySubtitleLabel"));
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LargeLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPrimaryTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_opt_class();
    -[LargeLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySecondaryTitleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  MEMORY[0x234919BC8](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
